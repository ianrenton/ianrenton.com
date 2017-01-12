---
layout: post
title: "ATP: Disassembly"
date: 2014-12-11 21:33
comments: true
categories: 
---

The "All-Terrain Pi" started life as a quad bike-style children's remote control toy.

![](/atp/1.jpg){: .center}

It's held together by a lot of screws, but they're all easily removed. Four hold the top half of the chassis to the bottom half.

![](/atp/2.jpg){: .center}

The top half is largely cosmetic, but it does contain the 27MHz receiver, main control board and power switch.

![](/atp/3.jpg){: .center}

The control board is very basic, with no ICs and some dubious component placing.

![](/atp/4.jpg){: .center}

The rest of the upper chassis can be removed easily, leaving the control board behind.

![](/atp/5.jpg){: .center}

The battery pack is also easy to take in and out.

![](/atp/6.jpg){: .center}

It's a pretty nice self-contained unit.

![](/atp/7.jpg){: .center}

The rear wheels are driven by a standard DC motor with a simple gearbox. The plastic cover is easily removed from one side, though seems stuck to the other.

![](/atp/8.jpg){: .center}

Inside the gearbox:

![](/atp/9.jpg){: .center}

The steering arrangement is unusual. The wheels aren't turned as in a normal car; instead, the entire rear wheel assembly (drive motor and all) is rotated from side to side. This gives the impression of the toy sliding through turns. A thick plastic pin sticks into the drive motor enclosure and turns it from side to side:

![](/atp/10.jpg){: .center}

![](/atp/11.jpg){: .center}

Getting access to the turn motor requires removing the suspension:

![](/atp/12.jpg){: .center}

The motor assembly can be separated from the front of the chassis:

![](/atp/13.jpg){: .center}

![](/atp/14.jpg){: .center}

![](/atp/15.jpg){: .center}

The turn motor arrangement is strange. I was hoping for a servo motor, but instead a DC motor is used with a gearbox and a clutch. The gearbox slows down the rotation, while the clutch disengages the motor once the vehicle has turned by the maximum allowed angle.

This is a pretty inefficient design as the motor turns constantly even when there is no change in turn angle, but it allows the manufacturer to use cheaper parts.

![](/atp/16.jpg){: .center}