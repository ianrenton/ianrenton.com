---
comments: true
layout: post
title: 'ARPS Receiver Setup'
slug: aprs-receiver
---

<div class="notes"><p>APRS Integration into Plane/Sailing is a work in progress. This page will be updated as the project progresses.</p></div>

With the project initially being to extend my older ADS-B aircraft tracker into a combined tracker for AIS-equipped ships as well, the next step is to additionally support tracking of land-based contacts using APRS. The screenshot below shows the level of tracking that should be achievable, but that was on a good day&mdash;APRS reception at my location seems quite intermittent, and the slow rate of packet reception some days means that integration into Plane/Sailing is a slow process.

The data here was collected using my HackRF, which I use with my PC rather than the RTL-SDR dongles which stay attached to the Raspberry Pi for use by Plane/Sailing. I used [SDRSharp](https://airspy.com/download/) to demodulate the APRS frequency, passed audio via [VB-CABLE](https://vb-audio.com/Cable/) to the [Direwolf](https://github.com/wb2osz/direwolf) APRS decoder, then displayed the data in [ARPSISCE32](http://aprsisce.wikidot.com/).

[![APRS data displayed on a PC](/hardware/planesailing/aprs.png)](/hardware/planesailing/aprs.png)