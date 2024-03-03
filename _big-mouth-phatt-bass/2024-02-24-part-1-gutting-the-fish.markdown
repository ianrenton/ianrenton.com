---
comments: true
layout: post
title: "Part 1: Gutting the Fish"
slug: part-1-gutting-the-fish
date: 2024-02-24 00:00:00
layout: post
---

Naturally, the first step to modifying this thing is to take it apart and figure out what's in there. So without further ado, let's gut some fish!

![The insides of a Billy Bass](/projects/big-mouth-phatt-bass/1.jpg)

The back is easily taken off after removing six cross-head screws. Inside, it's... surprisingly nice! I hadn't read up too much on Billy Bass hacking at this point in the project, so I was kind of expecting wires soldered onto a board of the cheapest possible components&mdash;it turns out that *was* what the original Billy Bass was like, but the newer versions such as this 15th Anniversary edition have a nice neat connectorised board.

Here's the close-ups of the two halves:

![The insides of a Billy Bass (front section)](/projects/big-mouth-phatt-bass/3.jpg)

![The insides of a Billy Bass (rear section)](/projects/big-mouth-phatt-bass/2.jpg)

Some further close-ups of the PCB&mdash;enhance!

<div class="breakout-full-width"><center>
<img src="/projects/big-mouth-phatt-bass/4.jpg" alt="PCB (front, connected)"/> 
<img src="/projects/big-mouth-phatt-bass/5.jpg" alt="PCB (rear, connected)"/><br/>
<img src="/projects/big-mouth-phatt-bass/6.jpg" alt="PCB (front, disconnected)"/> 
<img src="/projects/big-mouth-phatt-bass/7.jpg" alt="PCB (rear, disconnected)"/>
</center></div>

A quick trace through of the wires reveals this as the wiring diagram for the Big Mouth Billy Bass 15th Anniversary edition:

<div class="breakout-full-width"><center>
<img src="/projects/big-mouth-phatt-bass/wd-old.png" alt="Wiring diagram"/>
</center></div>

As for the schematic for the PCB itself, a full schematic is stymied by covering the main chip in epoxy, although [James Bulpin](https://automateeverythingsite.wordpress.com/2016/11/20/hacking-big-mouth-billy-bass-part-13/) has helpfully provided a partial schematic for the motor driver section of the board, as his project retains this section of the PCB to drive the motors from lower-power Arduino analogue outputs.

Since the internals of the fish are neatly connectorised in this version, I decided to retain this for my build so that it could be modified without cutting any wires, and could be reverted back to its former "glory" if desired. With that in mind, I purchased some JST XH sockets for my prototyping breadboard. In the next part, I'll get that connected up and start controlling the fish's motors!
