---
comments: true
layout: post
title: "Track 11: The Future is Fishy"
slug: track-11-the-future-is-fishy
date: 2024-04-05 17:14:00
layout: post
---

There's not a lot left to do here apart from the ever-elusive goal of getting the electronics back inside the fish enclosure. This will involve a custom PCB, designed to minimise the footprint of the electronics:

![PCB design](/projects/big-mouth-phatt-bass/pcbdesign.png){: .center}

![PCB 3D model](/projects/big-mouth-phatt-bass/3dmodel.png){: .center}

I'm not yet certain whether I will go ahead with this stage or not. It may still prove too large&mdash;careful measurement is required before committing to getting a PCB manufactured.

As an alternative, it may prove possible to split it into two PCBs, one either side of the enclosure, with suitably connectorised cable between.

If even that fails, the only real option is to do a "full" PCB design with the ESP32, motor driver and MP3 chip all on a single board of my design&mdash;but this is well beyond my current skill level.

If I do design a PCB that will fit, and I go ahead with fitting the electronics inside the fish enclosure, there are a few remaining challenges to address:

* Making the LED visible.
  * For this I plan on replacing the LDR on the front (which we rarely use) with a status indicator LED driven from the ESP32
  * As an alternative, the SD card could be loaded with an additional set of text-to-speech generated files that announce track numbers and modes.
* Bringing the micro USB connector from the ESP32 to the outside
* Allowing easier access to the SD card.

But I will, finally, be *done* with this damn fish!