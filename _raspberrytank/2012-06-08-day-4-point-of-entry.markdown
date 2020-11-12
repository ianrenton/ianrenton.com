---
author: Ian
comments: true
date: 2012-06-08 13:38:16
layout: post
slug: tank-day-4-point-of-entry
title: 'Tank Day 4: Point of Entry'
wordpress_id: 12894
categories:
- Projects
- Raspberry Tank
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
---

On [Day 3 of the Raspberry Tank build diary](../tank-day-3-the-sundering/), we took the tank to pieces and stripped it down to the bare minimum required to have a remote control capability: the receiver board, main control board, motors and battery.  Today, we examine the possibilities for adding the Raspberry Pi to the vehicle.

### Schematics, Simplified

As shipped, the Heng Long Tiger I tank that this build is based around (the Smoke & Sound model with an RX-18 controller) has the following electrical schematic:

[![Heng Long Tiger I Tank Circuit Diagram](/hardware/raspberry-tank/tank-schematic-424x500.png)](/hardware/raspberry-tank/tank-schematic.png)

_You can download that as an SVG file here: [Heng Long Tiger I Tank Schematic](/hardware/raspberry-tank/tank-schematic.svg)_

The colours of the wires shown are those on the tank I am using -- they may vary between models, as I have seen some photos with different cable colours.  Custom kits to upgrade tanks from an RX-13/14 controller to an RX-18 are also available and may come with different wire colours.  When in doubt, trust the markings on the boards and in the schematic above.  Case in point, the double-take that ensued when I looked at the connection between the RF receiver board (TK-YL101-3) and the main board:

[![Edge of TK-YL101-3 Board](/hardware/raspberry-tank/IMAG0040-e1339156628987-300x179.jpg)](/hardware/raspberry-tank/IMAG0040-e1339156628987.jpg)

Yep, that really is green for VCC, red for Ground and black for data.

During day 3, the upper half of the chassis was removed, along with the smoke and sound components from the lower half.  The following schematic shows what we are now left with.  (Day 3 did not explicitly mention unplugging the volume control and the smoke switch from the RX-18 -- ports CN4 and CN11.  However, as they are useless without a speaker and smoker unit anyway, they have been left off this diagram.)

[![Reduced Circuit after day 3](/hardware/raspberry-tank/after-day-3-524x500.png)](/hardware/raspberry-tank/after-day-3.png)

### Choices, Choices

Other similar projects such as [this one on Hack A Day](http://hackaday.com/2011/08/16/autonomous-tank-will-track-you-down-cover-you-in-welts/) have chosen to replace all the electronics inside the tank in favour of Arduino devices with motor control add-on boards.  We could take this approach and remove both the RX-18 and TK-YL101-3, replacing them with the Raspberry Pi to do the high-level control and the Arduino to do the low-level control.

However, it would be nice if we could keep the RX-18 -- it's already set up for us with the appropriate control circuitry for all the motors in the tank, and as a bonus it even provides a 4.5V output that may be capable of powering the Raspberry Pi itself.

Will this be possible?  Maybe.

The RF receiver board has only a single data line connecting it to the RX-18 -- the one oddly coloured black in the photo above.  If we can hijack this connection, and have the Raspberry Pi pretend to be the RF receiver, then we can keep the RX-18 intact.

To do this, we will need to reverse engineer the protocol used for communication between the two -- and see if the Raspberry Pi is capable of recreating it.  And that's exactly what we'll do next time, on Day 5 of the Raspberry Tank build diary!

#### Credit where it's Due

I used partial schematics and annotated photos [from spiraltron on the RCGroups forum](http://www.rcgroups.com/forums/showthread.php?t=790102), [from Phyrephish on the RC Tanks Australia forum](http://www.rctanksaustralia.com/forum/viewtopic.php?f=82&t=19) and [from David's Battle Circuit website](http://darkith.dyndns.org/~darkith/html/rx18.shtml) to ensure that the circuit diagrams I presented in this post were correct.
