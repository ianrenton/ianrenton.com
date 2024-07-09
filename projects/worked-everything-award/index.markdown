---
comments: true
layout: page
title: The “Worked Everything, Everywhere, All at Once” Award
stub: worked-everything-award
image: /projects/worked-everything-award/headline.png
date: 2024-07-09 00:00:00
---

After I had uploaded my log for [my first SOTA activation](/blog/my-first-easiest-and-last-sota/), it was pointed out to me that as part of Cranborne Chase, my location also qualified for POTA as well. I submitted my logs there too, and since then, I have been somewhat [nerd sniped](https://xkcd.com/356/) by the question of how far I could take the concept of qualifying for multiple programmes without moving.

Ignoring the fact that staying in one spot while activating lots of things isn't really in the spirit of the outdoor radio awards programmes, and the hassle it would be to call out a dozen or more IDs on the air... where could I sit to best game the system and rack up tons of imaginary ham radio points?

<div class="breakout-full-width"><center><br/><img src="/projects/worked-everything-award/headline-wide.png" alt="Map of outdoor ham radio award locations on the south coast of England" style="width:100%"/></center><p><center><em>Visualisations courtesy of <a href="https://kwirk.github.io/pota-gb-map/">UK Portable Ham Map</a>, used with many thanks.</em></center></p></div>

## Background

As well as "playing radio" in homes and garages, the world of amateur radio offers plenty of more adventurous opportunities for those willing and able to head outdoors. There are a variety of awards programmes for outdoor radio, from Summits on the Air's seasoned hikers and climbers looking to rack up points on the most difficult peaks, to far-flung Islands on the Air, to those such as the English Castles Awards celebrating local cultural landmarks.

The idea behind them all is to take portable ham radio kit, anything from a small handheld radio to a big power station and huge beam antenna, set it up somewhere away from home, and "activate" the landmark by making contacts with other ham radio operators, using whatever frequencies or modes you like, and while enjoying the great outdoors.

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

Some of these programmes (1, 6, 7 & 8) have a fairly simple concept, geospatially&mdash;the entity, such as a summit, is a single location, and you must be within a certain distance of it, typically a few hundred metres. These are therefore simple circles, which could overlap with others in the same programme, or different programmes. As you will see in the code, this data is online and easily retrieved.

Summits on the Air (1) also imposes a requirement to be within a certain altitude of the peak, though this has been ignored here to simplify the analysis.

The others are more difficult to deal with. POTA and WWFF (2 & 5) do provide geospatial references online, but only as points in the general area of the park or other site, not as a polygon defining the area that qualifies. In the UK we do have some great online resources providing the polygons for various Areas of Natural Beauty, Sites of Special Scientific Interest and so on, but there is no one-to-one mapping or even necessarily a name in common with POTA and WWFF spots.

Beaches on the Air (4) again provides approximate point locations rather than polygons, but no API to retrieve them, and the list is deliberately non-exhaustive&mdash;any beach will do, if you activate one that's not in the system already it will be added.

Finally, IOTA (3) is fully old-school and provides a PDF containing the *names* of qualifying islands.

## Methodology

In order to find overlapping regions, we first must define them. I decided that attempting to define proper polygon shapes for POTA, WWFF and IOTA entities was beyond the scope of this activity (and my attention span). I therefore sought to automate analysis of overlapping entities only for the the awards programmes that use simple circles: SOTA, Castles, Lighthouses and Bunkers.

Once I identified regions of high concentration of these entities, I then manually inspected them to identify overlapping POTA/WWFF entities, nearby beaches, and whether they are on a qualifying island.

For IOTA, "Great Britain" and "Ireland" technically qualify as islands, but for this study I have dismissed them as not particularly interesting, and I have only considered smaller islands.

I have only considered entities within the UK for the study.

I began a cursory analysis using the [UK Portable Ham Map](https://kwirk.github.io/pota-gb-map/) by Steve M1SDH. (This has been an invaluable tool for visualisation during this project, so many thanks to Steve and the other contributors. Thanks also to Rich M7GET for suggesting I begin simply by turning on all the layers in this tool, and seeing what stands out.)

A number of dense groups immediately stood out, largely bunkers and castles. This appeared to validate my choice to concentrate on these programmes, and it appeared that clusters of defensive structures, particularly coastal defences, were likely to be the best candidates for overlapping areas.

![Map of "on the air" entities around Portsmouth Harbour](/projects/worked-everything-award/portsmouth.png){: .center}
*Map of "on the air" entities around Portsmouth Harbour*

I then wrote a Python script to download publicly available data from the four key programmes, count overlapping circles, and identify the ones with the greatest number of overlaps.

## The Code

I designed the code to conduct the download and calculation tasks optionally, using a cache file if a fresh download and calculation is not required. This saved time, web server activity, and local CPU activity when all that I wanted to do was play with data already calculated.

**TODO**

## Results

Once the circles with the greatest number of overlaps were identified, I then went back to the UK Portable Ham Map to identify the specific region of overlap. I then manually determined whether the area qualified for POTA or WWFF, whether it was sited on an "interesting" island, and whether it contained a beach. I also looked closely around the area of greatest intersection, in case you could for example drop one bunker to gain a POTA and Beach. Again, this was only done manually for the top few identified areas, so is subject to human error.

Nearby Portland was second on the list........

**TODO Portland**

**TODO Portland? screenshot**

**TODO Specific location - plan to visit**

However, by far and away the winner is Plymouth.

![Map of "on the air" entities around Plymouth Sound](/projects/worked-everything-award/plymouth.png){: .center}
*Map of "on the air" entities around Plymouth Sound*

[Drake's Island](https://drakes-island.com/) in Plymouth Sound is the former charge of Sir Francis Drake, current activity holiday destination, and home to *ten* qualifying English Castles.

Drake's Island is private, but luckily we don't need to go there to reach our [pole of ham radio accessibility](https://en.wikipedia.org/wiki/Pole_of_inaccessibility)&mdash;that's actually on the mainland. Combined with the surrounding structures to the north and west, there is a thin sliver of land and sea along Admiralty Road that qualifies for a huge *eighteen* castles, the Plymouth Marine National Park POTA area, *and* as luck would have it, it even has a beach.

**TODO update if necessary**

**TODO Zoomed in picture, highlighed section over bing world imagery**

**TODO table of all overlaps**

Now, time to plan that activation. And ask the Royal Navy very nicely not to have me arrested for putting up a suspicious shortwave antenna right next to a naval base.

<div class="breakout-full-width"><center><br/><img src="/projects/worked-everything-award/portsmouth-photo.png" alt="Street View photo looking towards Drake's Island" style="width:100%"/></center><p><center><em>View of the beach looking towards Drake's Island. Photo from Google Maps.</em></center></p></div>

Looks like it might be best visited at low tide. Or Maritime Mobile, for extra kudos.

![Hobbits 'second breakfast' meme. Text reads 'We have one expensive hobby, yes. But what about second expensive hobby?'](/projects/worked-everything-award/secondhobby.png){: .center}

## Bonus Results: Variety Show

Although Admiralty Road in Plymouth is a stand-out winner for activating 20 entities at the same time, it must be noted that with 18 of them being "castles", there's not much variety. What if we looked for that, instead of sheer numbers?

The code above logs the whole list of overlapping entities within each candidate, including their type, so we can use this with some additional logic to find more interesting combinations.

As you might expect, there are no summit-lighthouses or summit-beaches, but are there any castle-bunker-lighthouse-park-beaches on interesting islands?

**TODO**

## Future Work

Many of the chosen programmes are worldwide, although I have taken only UK data from them. Some of the others are specific to England, ruling out the many castles and lighthouses in the rest of the UK, let alone the world. If I return to this work in the future, my key goal is to expand the data set beyond its current England-centric nature.
