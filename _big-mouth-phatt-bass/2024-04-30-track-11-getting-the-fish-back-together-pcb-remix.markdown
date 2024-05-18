---
comments: true
layout: post
title: "Track 11: Getting the Fish Back Together (PCB Remix)"
slug: track-11-getting-the-fish-back-together-pcb-remix
date: 2024-04-30 00:00:00
layout: post
---

So far, the prototyping of the electronics has all used solderless breadboard. While convenient, it's also quite fragile&mdash;in particular the legs of the JST XH connectors are short and prone to falling out. And as previously discussed, there's no way the chunky breadboard and mess of wiring is ever going to fit back inside the fish enclosure.

We need to step things up a notch.

## Not Quite Perf-ect

My next step was to replace the solderless breadboard with soldered perfboard. This made the whole thing much less fragile, although unfortunately not quite compact enough to fit it back inside the fish enclosure.

I imposed the design constraints that I wanted all the connectors at one end of the board, plus easy access to the SD card and USB socket.

I used [Veroroute](https://sourceforge.net/projects/veroroute/) to design the perfboard layout, and after a while of moving components around, I settled on the following to meet the requirements:

![Veroroute design](/projects/big-mouth-phatt-bass/veroroute.png){: .center}

The design was made to fit within the bounds of a common 30x26 hole perfboard sheet. JST connectors are located at the top in a neat row; the micro-USB socket is to the left and the SD card ejects to the right-hand side.

In order to neatly line up the motor driver board with the ESP32, I made a minor change to the schematic. To allow space for the TB6612's "standby" pin, I temporarily moved control of the mouth motor from pins D27/D26/D25 to D26/D25/D33, and bumped the LDR from D33 to D15. (Note that this change was reverted in the PCB version, below, which is back to the original pin layout.)

The schematic for the perfboard is as follows:

<div class="breakout-full-width"><center><a href="/projects/big-mouth-phatt-bass/schematic-perfboard.png">
<img src="/projects/big-mouth-phatt-bass/schematic-perfboard.png" alt="Schematic"/></a>
</center></div>

## This One Goes to 11

That's all well and good&mdash;the unit it a lot less fragile now, but my rubbish perfboard solder tracks are now on show to the world, and there's still an ugly board hanging out of the back of the fish, because it's still too big to fit back inside.

To take it to the next level, it's time for a step I never thought *this* of all projects would involve: PCB design.

I wanted to keep the same components and rough board layout, while minimising the overall footprint as much as possible. A single board with all key components on it is beyond my skill level, but I can at least design a motherboard that fits the three daughter boards we already use.

I began with a new schematic which only contained the board components rather than showing the external fish electronics, and added naming and classifying of the nets. At this stage I also reverted to the original pin allocations on the ESP32 from the solderless breadboard stage, as I had no need to make concessions for the perfboard.

<div class="breakout-full-width"><center><a href="/projects/big-mouth-phatt-bass/schematic-pcb.png">
<img src="/projects/big-mouth-phatt-bass/schematic-pcb.png" alt="Schematic"/></a>
</center></div>

I then progressed to the PCB design view in Kicad, laying out the board to be as compact as possible given the components required. I couldn't quite manage zero vias, but in the end needed one. So close!

![PCB design](/projects/big-mouth-phatt-bass/pcbdesign.png){: .center}

![PCB 3D model](/projects/big-mouth-phatt-bass/3dmodel.png){: .center}

You can [download the Gerber files here](/projects/big-mouth-phatt-bass/phattbass-gerbers.zip).

I had the board manufactured by [JLC PCB](https://jlcpcb.com/) for the princely sum of two dollars. If you're following this guide, they can make one for you too&mdash;and if you're in the UK, MOQ was 5 so I have four spare boards, and will send you one for free if you like.

![PCB removed from packet](/projects/big-mouth-phatt-bass/23.jpg){: .center}

All that's left on the hardware side was to fit the parts and solder it up.

![Three main components and four JST connectors on a PCB motherboard](/projects/big-mouth-phatt-bass/24.jpg){: .center}

My soldering skills are trash so I'm not sure if I found it a challenge to solder just because of that, or because the pads were quite small. It was also a minor challenge to get the ESP32 Devkit lined up well enough that the pins went in. If I were to remake the project I might consider increasing the hole and pad sizes around the legs of the main components.

The PCB only *just* fits in the enclosure, at a slightly dodgy angle, and with the connector/component side towards the front of the fish. My soldering is therefore unfortunately on show during my a last check that the dimensions are right.

![Rear of the PCB held in place inside the fish enclosure](/projects/big-mouth-phatt-bass/26.jpg){: .center}

But at long last, we can *finally* put the fish back together. No more fragile breadboard hanging out of the back!

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/phattbass/phattbass-back-together.webm" type="video/webm"></video></center>
