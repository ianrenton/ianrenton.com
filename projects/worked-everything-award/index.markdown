---
comments: true
layout: page
title: The “Worked Everything, Everywhere, All at Once” Award
slug: worked-everything-award
description: Scamming my way to Imaginary Ham Radio Points using a hacky GeoPandas script.
image: /img/projects/worked-everything-award/headline.png
date: 2024-07-09 00:00:00
---

After I had uploaded my log for [my first SOTA activation](/blog/my-first-easiest-and-last-sota/), it was pointed out to me that as part of Cranborne Chase, my location also qualified for POTA as well. I submitted my logs there too, and since then, I have been somewhat [nerd sniped](https://xkcd.com/356/) by the question of how far I could take the concept of qualifying for multiple programmes simultaneously.

Ignoring the fact that staying in one spot while activating lots of things isn't really in the spirit of the outdoor radio awards programmes, and the hassle it would be to call out a dozen or more IDs on the air... where could I sit to best game the system and rack up tons of imaginary ham radio points?

Just interested in the result? [Click here to skip to the end!](#summary)

Everyone else: buckle up, we're about to get friendly with some GeoPandas.

<div class="breakout-full-width"><center><img src="/img/projects/worked-everything-award/headline-wide.png" alt="Map of outdoor ham radio award locations on the south coast of England" style="width:100%"/></center><p><center><em>Visualisations courtesy of <a href="https://kwirk.github.io/pota-gb-map/">UK Portable Ham Map</a>.</em></center></p></div>

## Background

As well as "playing radio" in homes and garages, the world of amateur radio offers plenty of more adventurous opportunities for those willing and able to head outdoors. There are a variety of awards programmes for outdoor radio, from Summits on the Air's seasoned hikers and climbers looking to rack up points on the most difficult peaks, to far-flung Islands on the Air, to those such as the English Castles Awards celebrating local cultural landmarks.

The idea behind them all is to take portable ham radio kit, anything from a small handheld radio to a big power station and huge beam antenna, set it up somewhere away from home, and "activate" the landmark by making contacts with other ham radio operators, while enjoying the great outdoors.

Sounds great, so now I'm going to ruin it by taking it to a ridiculous extreme.

## Data Sets

To find the location at which we could "activate" the most things at the same time, I have used geospatial data (in some form) from many of the most popular outdoor radio awards programmes:

1. [Summits on the Air (SOTA)](https://www.sota.org.uk/)
2. [Parks on the Air (POTA)](https://parksontheair.com/)
3. [Islands on the Air (IOTA)](https://www.iota-world.org/)
4. [Beaches on the Air](https://www.beachesontheair.com/)
5. [World Wide Flora & Fauna (WWFF)](https://wwff.co/)
6. [English Castles Awards](https://englishcastlesawards.uk/)
7. [English Lighthouses Awards](https://englishlighthouseawards.uk/)
8. [UK Bunkers on the Air](https://bunkersontheair.org/site/)

Some of these programmes (6, 7 & 8) have a fairly simple concept, geospatially&mdash;the entity, such as a lighthouse, is a single location, and you must be within a 1km radius. These are therefore simple circles, which could overlap with others in the same programme, or different programmes.

A kilometer seems rather generous! While the English Castles Awards rules do provide good reasoning related to land access and inclusivity, they also specifically endorse multiple simultaneous activations, which they may soon come to regret.

![Highlighted excerpt from the ECA rules, stating "This rule is useful for many reasons! It enables multiple reference activations should the activator be within 1km of more than one reference."](/img/projects/worked-everything-award/eca-rules.png){: .center}

Summits on the Air (1) imposes a requirement to be within 25m *altitude* of the peak. To avoid the kind of terrain analysis which is totally overboard for a joke on the internet, a 1-in-4 incline has been assumed, giving a horizontal range of 100m.

The others are more difficult to deal with. POTA and WWFF (2 & 5) do provide geospatial references online, but only as points in the general area of the park or other site, not as a polygon defining the area that qualifies. In the UK we do have some great online resources providing the polygons for various Areas of Natural Beauty, Sites of Special Scientific Interest and so on, but there is no one-to-one mapping or even necessarily a name in common with POTA and WWFF spots.

Beaches on the Air (4) again provides approximate point locations rather than polygons, but no API to retrieve them, and the list is deliberately non-exhaustive&mdash;any beach will do, if you activate one that's not in the system already it will be added.

Finally, IOTA (3) is fully old-school and provides a PDF containing the *names* of qualifying islands.

## Methodology

In order to find overlapping regions, we first must define them. I decided that attempting to define proper polygon shapes for POTA, WWFF, IOTA entities and beaches was beyond the scope of this activity (and my attention span). I therefore sought to automate analysis of overlapping entities only for the the awards programmes that are being modelled as simple circles: SOTA, Castles, Lighthouses and Bunkers.

Once the output of the code allowed identification of precise regions of high concentration of these entities, I then manually inspected them to identify overlapping POTA/WWFF entities, nearby beaches, and whether they are on a qualifying island.

For IOTA, "Great Britain" and "Ireland" technically qualify as islands, but for this study I have dismissed them as not particularly interesting, and I have only considered smaller islands.

I have only considered entities within the UK for the study, and note that the Castle and Lighthouse data used are only for England.

I began a cursory analysis using the [UK Portable Ham Map](https://kwirk.github.io/pota-gb-map/). A number of dense groups immediately stood out, largely bunkers and castles. This appeared to validate my choice to concentrate on these programmes, and it appeared that clusters of defensive structures, particularly coastal defences, were likely to be the best candidates for overlapping areas.

![Map of "on the air" entities around Portsmouth Harbour](/img/projects/worked-everything-award/portsmouth.png){: .center}
*Map of "on the air" entities around Portsmouth Harbour*

I then wrote a Python script to download publicly available data from the four key programmes, count overlapping circles, and identify the ones with the greatest number of overlaps.

## The Code

The code for this project was written using Python and principally relying on the GeoPandas library.

It was designed to optionally conduct the major functional blocks, using cache files if a fresh download and calculation was not required. This saved time, web server activity, and local CPU activity when debugging the later stages of processing.

After the data was downloaded, normalised into a data structure, and cached, the work of analysing overlaps began. This was decidedly non-trivial. Determining an overlap between two circles is easy&mdash;is the distance between their centres less than the sum of their radii? But from that point on it gets more complex, for example:

* Fairly obviously: if A intersects B and B intersects C, this says nothing about whether A intersects C
* Less obviously: if A intersects B, B intersects C, *and* A intersects C, that *still* doesn't necessarily mean there is a point inside all three circles.
* Calculating the union of circles is hard, and requires transforming them into polygons as the shapes get cut down and stop being circles anymore. The more lines you split the circle into, the more accurate the result, but the longer it takes to process. There is no perfection, only approximation.

Once the overlapping regions were calculated (with a little help from [Stack Overflow](https://gis.stackexchange.com/a/432265)), the code then iterated through the overlap polygons, building up a list of the entities within range, and finally output its findings.

[The code is available here.](https://github.com/ianrenton/weeaaoa/blob/main/main.py)

If you would like to see the output, I checked that into source control as well to avoid everyone having to run the code in order to play with the data. [You can find it here.](https://github.com/ianrenton/weeaaoa/blob/main/output.json) The format is JSON; each entry contains a set of WGS84 lat/lon points that define the polygon, and the list of entities that could be activated from within that polygon.

## Results

Once the circles with the greatest number of overlaps were identified, I then went back to the UK Portable Ham Map to identify the specific region of overlap. I then manually determined whether the area qualified for POTA or WWFF, whether it was sited on an "interesting" island, and whether it contained a beach. I also looked closely around the area of greatest intersection, in case you could for example drop one bunker to gain a POTA and Beach. Again, this was only done manually for the top few identified areas, so is subject to human error.

South Coast naval bases dominate the top of the list of interesting clusters, as the initial visual inspection showed.

Second-equal are Dartmouth and Portland. Dartmouth features an overlapping region of nine castles and two lighthouses, while Portland tops out at eight castles and two bunkers but also qualifies as a POTA park, so both offer a grand total of 11 simultaneous activation opportunities.

<a name="portland"></a>Portland is pretty close to me, so at some point in the near future I might have a go at activating from up here&mdash;probably the section *outside* the prison.

![Polygon defining the high scoring region of Portland](/img/projects/worked-everything-award/portland-poly.png){: .center}
*The top scoring section on Portland. Visualisation using [Keene State College Polyline Tool](https://www.keene.edu/campus/maps/tool/).*

However, first place in this competition beats them by a long shot.

Take a look at Plymouth.

![Map of "on the air" entities around Plymouth Sound](/img/projects/worked-everything-award/plymouth.png){: .center}
*Map of "on the air" entities around Plymouth Sound*

[Drake's Island](https://drakes-island.com/) in Plymouth Sound is the former charge of Sir Francis Drake, current activity holiday destination, and home to *ten* qualifying English Castles all by itself.

Drake's Island is private, but luckily we don't need to go there to reach our ideal point-scoring position&mdash;that's actually on the mainland. Combined with the surrounding structures to the north and west, there is a thin sliver of land and sea just east of Devil's Point that qualifies for a huge *19* castles, the South West Coast Path for POTA, and as luck would have it, also a small rocky beach.

![Polygon defining the top scoring region](/img/projects/worked-everything-award/plymouth-poly.png){: .center}
*The region of Plymouth with 19 overlapping castles*

Sit on the beach anywhere in that region and, you can activate all of these:

| Programme | Reference | Name |
| ---- | ------- | ------ |
| POTA | GB-1265 | South West Coast Path National Scenic Trail |
| BOTA | N/A     | Beach near Devil's Point (unlisted) |
| ECA  | G-03371 | Plymouth Blockhouse, Devils Point (Artillery Fort) |
| ECA  | G-03372 | Plymouth Blockhouse, Eastern Kings Point (Artillery Fort) |
| ECA  | G-03373 | Plymouth Blockhouse, Firestone Bay (Artillery Fort) |
| ECA  | G-03375 | Plymouth Drakes Island (Tudor Artillery Tower) |
| ECA  | G-03381 | Stonehouse Town Defences (Artillery Fort, Urban Defence) |
| ECA  | G-03458 | Mount Edgcumbe Blockhouse (Artillery Fort) |
| ECA  | G-03986 | New Bastian (Defensive Wall) |
| ECA  | G-03990 | Garden Battery |
| ECA  | G-03998 | Admiralty House (Mount Wise) |
| ECA  | G-03999 | Hamoaze House |
| ECA  | G-04000 | Plymouth Drakes Island Sea Wall |
| ECA  | G-04001 | Plymouth Drakes Island Fortified Gatehouse |
| ECA  | G-04002 | Plymouth Drakes Island Firing Platform |
| ECA  | G-04003 | Plymouth Drakes Island Emplacement and Magazine No1 |
| ECA  | G-04004 | Plymouth Drakes Island Emplacement and Magazine No2 |
| ECA  | G-04005 | Plymouth Drakes Island Gun Battery |
| ECA  | G-04006 | Plymouth Drakes Island Gun Emplacements |
| ECA  | G-04007 | Plymouth Drakes Island WWII Gun Emplacements |
| ECA  | G-04008 | Plymouth Drakes Island WWII Parapets |

The area is very close to qualifying for a second POTA, the Plymouth Marine National Park. However, close inspection of the polygons shows that the marine park is only on the seaward side of the low water mark, and so doesn't quite overlap with the South West Coast Path.

![Polygons for the South West Coast Path and Plymouth Marine National Park, not quite intersecting](/img/projects/worked-everything-award/plymouth-pota-intersect.png){: .center}

Now, time to plan that activation. And ask the Royal Navy very nicely not to have me arrested for putting up a suspicious shortwave antenna right next to a naval base.

<div class="breakout-full-width"><center><img src="/img/projects/worked-everything-award/plymouth-photo.png" alt="Street View photo looking towards Drake's Island" style="width:100%"/></center><p><center><em>View of the beach and Firestone Bay, looking towards Drake's Island. Photo from Google Maps.</em></center></p></div>

## Bonus Results: Variety Show

Although Devil's Point in Plymouth is a stand-out winner for activating 21 entities at the same time, it must be noted that with 19 of them being "castles", there's not much variety. What if we looked for that, instead of sheer numbers?

The code above logs the whole list of overlapping entities within each candidate, including their type, so we can use this with some additional logic to find more interesting combinations. However, it can only get us so far, because only four data sources are used in the automated analysis. And looking at the results, there are no overlaps of all four of the processed types. To find overlapping activations involving parks, WWFF, beaches or islands then, we must largely revert to manual checking.

So how far *can* we go with simultaneously activating in multiple programmes?

It turns out that combinations of **four** qualifying programmes are fairly common, as parks and WWFF locations often go together, as do beaches and coastal defences such as bunkers and castles. There are hundreds of these around the UK, so they are not particularly interesting.

**Fives** are much rarer. So far I have found four locations that I believe qualify:

* [Newhaven](https://kwirk.github.io/pota-gb-map/?x=545083.17817&y=99885.7327&z=10.6176&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA) features a castle, bunker, lighthouse, park and beach with overlaps
* [Berry Head](https://kwirk.github.io/pota-gb-map/?x=294571.51644&y=56263.37732&z=10.38765&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA) qualifies as a castle, bunker, lighthouse, park and WWFF location
* [Crow Point near Barnstaple](https://kwirk.github.io/pota-gb-map/?x=246861.38279&y=132288.25285&z=10.31337&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA) has a bunker, lighthouse, park, WWFF location and beach
* And on [Lundy](https://kwirk.github.io/pota-gb-map/?x=214206.69586&y=144054.33451&z=9.90524&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA), the south end of the island features a castle, lighthouse, park and WWFF location, plus it's on an "interesting" island for IOTA.

There are doubtless more to discover!

But what if we wanted... more.

![Scene from "Spinal Tap" subtitled "these go to 11"](/img/projects/worked-everything-award/goes-to-11.webp){: .center}

So far I have found four **sixes**. At this level, islands seem to be the only way to qualify.

* [The Scilly Isles](https://kwirk.github.io/pota-gb-map/?x=89797.50982&y=10607.37786&z=9.13476&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA), [Lindisfarne](https://kwirk.github.io/pota-gb-map/?x=411944.14953&y=641217.77742&z=9.28785&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA) and nearby [Inner Farne Island](https://kwirk.github.io/pota-gb-map/?x=421724.19411&y=635860.90568&z=10.70791&layers=OSMG+CPK+NNR+RSPB+BOTA+ELA+ECA+WWFF+POTA+SOTA) all provide an overlapping castle, lighthouse, park, WWFF location and beach, whilst being on an "interesting" IOTA island
* And on the [Isle of Wight, east of Sandown](https://kwirk.github.io/pota-gb-map/?x=461642.46063&y=85480.9621&z=10.06629&layers=OSMG+BOTA+ELA+ECA+WWFF+POTA+SOTA+NSA+AONB+SAC) you can simultaneously activate a bunker, castle, park, WWFF location and beach, plus possibly getting some IOTA interest too.

![Map of Sandown showing overlapping qualifying regions](/img/projects/worked-everything-award/iow.png){: .center}

There are no sevens as far as I am aware, and as eights rely on the unlikely existence of a summit-beach, they are likely impossible.

## Summary {#summary}

It looks like, if you're going for interest, there are four places around the British coast where you could simultaneously take part in POTA, WWFF, IOTA, Beaches on the Air, English Castles Awards, plus one of English Lighthouses or Bunkers on the Air. But you'll need a ferry to get there, unless you're lucky enough to live in one of these places already&mdash;you'll need to head to the Isle of Wight, Scilly, Lindisfarne or Inner Farne.

The trip might take a while, but so will uploading your logs to all of that lot.

Meanwhile, if you're more interested in sheer numbers than an interesting variety, a sliver of rocky beach near Devil's Point in Plymouth will net you a whopping *21* simultaneous activations, 19 of them qualifying English Castles.

Have fun reading all those references out on the air!

## Future Work

Many of the chosen programmes are worldwide, although I have taken only UK data from them. Some of the others are specific to England, ruling out the many castles and lighthouses in the rest of the UK, let alone the world. If I return to this work in the future, my key goal is to expand the data set beyond its current England-centric nature.

## Thanks To...

This silly project wouldn't have been possible without the more sensible and useful endeavours of many others. Particular thanks go to:

* Steve, M1SDH for creating the [UK Portable Ham Map](https://kwirk.github.io/pota-gb-map/), and the [others who have contributed to it](https://github.com/kwirk/pota-gb-map?tab=readme-ov-file#thanks). Without it, this project would have been much harder, and the visualisations much less pretty.
* Rich, M7GET for suggesting I begin simply by turning on all the layers in the tool, and seeing what stands out. (It turns out that approach was so effective that I almost needn't have bothered writing the code...)
* Mark, 2M0IIG for organising the OARC SOTA day 2024 and giving me the "outdoor radio" bug.
* Many other members of the [Online Amateur Radio Community (OARC)](https://www.oarc.uk/), for putting up with my bullshit.
* Stack Exchange member [cosinecubed](https://gis.stackexchange.com/users/206349/cosinecubed), for the one [GeoPandas "calculate overlap" function](https://gis.stackexchange.com/a/432265) that actually worked for me.
* Keene State College for their [Polyline Tool](https://www.keene.edu/campus/maps/tool/), a weirdly nerdy thing to have sitting publicly under `/campus/maps` but appreciated nonetheless!
* Plus the many tireless organisers and volunteers behind the awards programmes themselves.
