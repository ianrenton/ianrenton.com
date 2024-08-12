---
layout: post
title: "A Combined ADS-B and AIS Map: The Hacky Way"
date: 2024-08-12 10:56 +0100
image: /blog/2024/ais2adsb-small2.png
slug: a-combined-adsb-and-ais-map-the-hacky-way
description: "Just because you can, doesn't mean you should."
tags:
  - radio
  - tracking
  - adsb
  - ais
  - software
---

The [Online Amateur Radio Community](https://oarc.uk) runs [an instance](https://adsb.oarc.uk/) of [tar1090](https://github.com/wiedehopf/tar1090) to aggregate ADS-B and MLAT data received by its members. While not *strictly* "amateur radio", it's adjacent enough that it generally sits in the area of ~50 contributors at any one time, and gives us pretty good coverage of most of the UK along with parts of France, Germany and Sweden.

The question was raised on the Discord group a few weeks back of whether there are enough people able to feed AIS data to make it worth doing anything with. The end result was no, not really&mdash;not enough folks are near enough to the coast. However, between myself and Mark 2M0IIG who runs the server side, we decided to have a quick go to see what was possible.

So can we get ships appearing in a `tar1090` map?

The answer is, as I'm sure you're expecting: "Yes, but..."

<div class="breakout-full-width"><center><img src="/blog/2024/ais2adsb.png" alt="tar1090 map showing aircraft and ships" style="width:100%"/></center></div>

As you might imagine, there are some limitations to doing it this way. After all, displaying ships and aircraft simultaneously with the appropriate fields and persistence was exactly what I developed [Plane/Sailing](/hardware/planesailing) for. But without going to the extent of running that on the server side, what did we achieve?

On the client side, we found a useful utility called [ais2adsb](https://github.com/jvde-github/ais2adsb) which does most of the work for us. This was designed for the more useful job of sending SAR aircraft data to `tar1090` for when it is broadcasting AIS but not ADS-B. I applied some quick hacks to it to:

* [Provide an option to send ships but *not* SAR aircraft](https://github.com/jvde-github/ais2adsb/pull/13)
* [Report ships as properly on the ground rather than zero altitude](https://github.com/jvde-github/ais2adsb/pull/14)
* [Provide ship callsigns if known](https://github.com/jvde-github/ais2adsb/commit/9a98fee6ef22c9ce70af9f58783cefd3f5363e5f)

Along with the last change, I also had to remove the colon character from the standard ID form of `V:nnnnnn` where "n" are the last 6 digits of the MMSI.

That last sentence sounded pretty icky, and it is. Ships at sea are typically referred to by their name, with MMSI and callsign rarely used apart from Mayday calls and occasionally calls to the Coastguard. But `ais2adsb` is talking to `tar1090` in SBS ("BaseStation") format, and the receiving end only allows for 8 characters (and no colons!). MMSIs are a no-go (at least without extra strange encoding on the client and decoding on the server) as they are typically 9 digits. We settled on `Vnnnnnnn` (using the last 7 digits of the MMSI) if the callsign isn't known yet, and using the vessel callsign if it's known.

There's no free text field supported in SBS either, so sadly the web UI has no way to discover and display the name of the vessel.

On the server side, Mark edited the SVG file providing the graphics for `tar1090`'s web map to include a ship graphic. `ais2adsb` invents a ICAO hex for each ship in the `0xF00000` to `0xFFFFFF` range, which is normally reserved, and the server was modified to use that symbol when a hex in that range was received, and set a type of "BOAT" for it.

The end result is a combined display where vessels are displayed in grey and shown accordingly in the track list.

There are not enough OARC members with a view of the sea to make it worth taking this too much further, but in case we do, my hit list would include:

* A "top down" ship graphic that could be rotated with the vessel course over ground
* Separate persistence times, so that ship tracks would be dropped more slowly than aircraft tracks.
* Some way of getting vessel names to the web UI, if possible

But at some point we should probably stop before we end up re-inventing Plane/Sailing again!
