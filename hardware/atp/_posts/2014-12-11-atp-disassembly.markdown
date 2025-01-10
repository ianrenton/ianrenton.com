---
layout: post
title: "ATP: Disassembly"
date: 2014-12-11 21:33
comments: true

---

The "All-Terrain Pi" started life as a quad bike-style children's remote control toy.

![](/hardware/atp/1.jpg){: .center}

It's held together by a lot of screws, but they're all easily removed. Four hold the top half of the chassis to the bottom half.

![](/hardware/atp/2.jpg){: .center}

The top half is largely cosmetic, but it does contain the 27MHz receiver, main control board and power switch.

![](/hardware/atp/3.jpg){: .center}

The control board is very basic, with no ICs and some dubious component placing.

![](/hardware/atp/4.jpg){: .center}

The rest of the upper chassis can be removed easily, leaving the control board behind.

![](/hardware/atp/5.jpg){: .center}

The battery pack is also easy to take in and out.

![](/hardware/atp/6.jpg){: .center}

It's a pretty nice self-contained unit.

![](/hardware/atp/7.jpg){: .center}

The rear wheels are driven by a standard DC motor with a simple gearbox. The plastic cover is easily removed from one side, though seems stuck to the other.

![](/hardware/atp/8.jpg){: .center}

Inside the gearbox:

![](/hardware/atp/9.jpg){: .center}

The steering arrangement is unusual. The wheels aren't turned as in a normal car; instead, the entire rear wheel assembly (drive motor and all) is rotated from side to side. This gives the impression of the toy sliding through turns. A thick plastic pin sticks into the drive motor enclosure and turns it from side to side:

![](/hardware/atp/10.jpg){: .center}

![](/hardware/atp/11.jpg){: .center}

Getting access to the turn motor requires removing the suspension:

![](/hardware/atp/12.jpg){: .center}

The motor assembly can be separated from the front of the chassis:

![](/hardware/atp/13.jpg){: .center}

![](/hardware/atp/14.jpg){: .center}

![](/hardware/atp/15.jpg){: .center}

The turn motor arrangement is strange. I was hoping for a servo motor, but instead a DC motor is used with a gearbox and a clutch. The gearbox slows down the rotation, while the clutch disengages the motor once the vehicle has turned by the maximum allowed angle.

This is a pretty inefficient design as the motor turns constantly even when there is no change in turn angle, but it allows the manufacturer to use cheaper parts.

![](/hardware/atp/16.jpg){: .center}
