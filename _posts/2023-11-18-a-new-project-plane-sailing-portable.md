---
layout: post
title: A New Project&#58; Plane/Sailing Portable
date: 2023-11-18 09:41 +0000
image: /blog/2023/plane-sailing-portable-bits-small.jpg
tags:
  - radio
  - hamradio
  - amateurradio
  - planesailing
  - project
  - electronics
  - raspberrypi
  - tracking
  - ais
  - aprs
  - adsb
  - sdr
---

As I lamented a few years back while first putting the [Plane/Sailing](/hardware/planesailing/) system together, my location down in a "dip" [prevents me having line of sight](/hardware/planesailing/antenna-and-receiver/) to any AIS-equipped vessels or APRS transponders. While AIS coverage is surprisingly workable, APRS tends to only get a few packets in if someone is working mobile locally, or when the [E-layer occasionally works its magic](https://en.wikipedia.org/wiki/Sporadic_E_propagation).

I don't have the space (or the family or neighbours' good will) to be building antenna towers, certainly not to the 20 metres height I would need for line of sight to the sea.

But what if my home wasn't the *only* Plane/Sailing receiver?

I often work by the sea, what if I could pick up AIS signals there? When I travel, could I be a mobile APRS iGate? And a discussion on the [OARC](https://www.oarc.uk/) Discord server about extending [our flight tracker](https://adsb.oarc.uk/) coverage made me think too&mdash;I have family abroad, what about installing a receiver there?

All of these thoughts got me wondering, what's the *smallest* receiver I could make with off-the-shelf parts?

SDR dongles and Raspberry Pi Zeroes are about the same footprint, could I make a small neat stack of parts in that size that could function as an extra, portable input to the Plane/Sailing System?

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle](/blog/2023/plane-sailing-portable-bits.jpg){: .center}

*A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle, nearly ready to be assembled.*

I'm in the process of doing some initial design and buying some parts, ready to see what can be achieved. Of course, the whole thing will be documented here as a build guide when I am done, in case you would like to recreate the project for yourself!