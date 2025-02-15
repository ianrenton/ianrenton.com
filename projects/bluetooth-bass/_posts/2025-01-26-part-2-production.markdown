---
comments: true
layout: post
title: "Part 2: Production"
slug: bluetooth-bass-part-2-production
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

![PCB fully populated](/img/projects/bluetooth-bass/pcb-complete.jpg){: .center}
<br/>

The board was fitted back into the case as before, producing the finished article.

![PCB connected up inside the fish](/img/projects/bluetooth-bass/pcb-in-fish.jpg){: .center}
<br/>

As you can see in the video below, it currently responds to *all* audio, giving it a slightly annoying reaction to the Google Assistant prompt noise. In future I may see if I can mask this out while still responding promptly to other noises.

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/bluetooth-bass/assistant.webm" type="video/webm"></video></center>

However, this doesn't affect its utility as a Sat Nav voice output. The standard Android and iOS voice assistants are decently funny when coming out of a Billy Bass, but of course we can crank it up a notch&mdash;Waze has a number of comedy options, including my Billy Bass favourite, Elvis.

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/bluetooth-bass/satnav.webm" type="video/webm"></video></center>