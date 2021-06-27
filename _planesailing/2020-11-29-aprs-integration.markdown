---
comments: true
layout: post
title: 'Future Plans: ARPS Integration'
slug: aprs-integration
date: 2020-11-29 00:00:01
layout: post
---

<div class="warning"><p>This is an old page that relates to the original "version 1" of Plane/Sailing. APRS tracking has now been integrated&mdash;see the <a href="/hardware/planesailing/plane-sailing-v2-changes">list of changes in version 2</a>!</p></div>

With the project initially being to extend my older ADS-B aircraft tracker into a combined tracker for AIS-equipped ships as well, a possible next step is to additionally support tracking of land-based contacts using APRS. At the moment I'm not rushing to integrate this&mdash;I think I've spent enough money on radios this year&mdash;but the screenshot below shows the level of tracking that should be achievable.

The data here was collected using my HackRF, which I use with my PC rather than the RTL-SDR dongles which stay attached to the Raspberry Pis for use by Plane/Sailing. I used [SDRSharp](https://airspy.com/download/) to demodulate the APRS frequency, passed audio via [VB-CABLE](https://vb-audio.com/Cable/) to the [Direwolf](https://github.com/wb2osz/direwolf) APRS decoder, then displayed the data in [ARPSISCE32](http://aprsisce.wikidot.com/).

[![APRS data displayed on a PC](/hardware/planesailing/aprs.png)](/hardware/planesailing/aprs.png)