---
comments: true
layout: post
title: "Part 2: Production"
slug: part-2-production
date: 2025-01-26 00:00:00
---

With the prototyping stage having proven that the ESP32 was a suitably performant Bluetooth A2DP audio receiver, and that the MAX98357A audio amplifier could drive the fish's speaker, the next stage was to productionise it. The same approach was taken with this project as with the Phatt Bass, starting with adapting the Kicad schematic:

[![Schematic](/img/projects/bluetooth-bass/schematic.png){: .center}](/files/projects/bluetooth-bass/schematic.pdf)
<br/>

This was then turned into an updated PCB layout:

![PCB design](/img/projects/bluetooth-bass/pcb-top.png){: .center}
<br/>

As before, I chose JLCPCB to manufacture these, at the cost of $2 for 5 boards so long as you don't mind a two-week lead time with China Post.

The board was then relatively simple to solder up, as before. The only modification of note that I had to make was to remove the screw terminal header from the MAX98357A and replace it with downward-facing header pins so that it connected into the motherboard.

**TODO: Photo**

The board was fitted back into the case as before, producing the finished article.

**TODO: Photo**

**TODO: Video**