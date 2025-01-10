---
comments: true
date: 2011-01-25 13:41:38
layout: post
slug: autonomous-quadrocopter-what-and-why
title: 'Autonomous Quadrocopter: What and Why?'
tags:
- Autonomous
- Autonomy
- AUV
- Code
- Copter
- DIY
- Drone
- Electronics
- Hackery
- Project
- Quadrocopter
- Vehicle
---

It's now been two years since I last did any work involving autonomous vehicles, and I'm kind of disappointed by the lack of that kind of work.  Writing software for big data acquisition systems is all well and good, but it lacks a certain something -- I just don't get attached to them in the way that I do to vehicles such as [this one](http://www.janes.com/articles/Janes-Underwater-Security-Systems-and-Technology/FAST-United-Kingdom.html).

One could probably argue that developing an odd fondness for robot boats is a bad thing, but unfortunately that appears to be the way my brain is wired.  So, onwards!

Since no autonomous vehicle work seems likely to come my way professionally at the moment, the urge is rising to build one in my spare time.  This presents a problem, in the form of a lack of time and money.

I'm unlikely to stumble upon a free RIB, jetski or minisub that I could hack about with, and have nowhere to store one anyway, so those are probably out.  Cars would be the next obvious choice, but if we _had_ a car to start with, the family may object to me covering it in sensors and filling the boot with computer equipment.

I think we need to think smaller, and my co-conspirator [@aefaradien](http://www.twitter.com/aefaradien) suggested a quadrocopter.

Our first challenge is to specify the parts we want to use, which is the first point at which my expertise starts to become less useful.  The natural approach for me at this point is to spend about £20,000 on a [cRIO](http://www.ni.com/compactrio) and a bunch of PC104 boards and wire them all up in a big case -- not only don't we have anything like that amount of money, weight is now also an issue.

For the CPU of the device, we considered a cheap Android phone, as this would give us GPS, a gyroscope, WiFi and a camera without spending too much money.  However, we would still need to use a separate motor driver board for the propellers, and getting a phone to talk to it could be tricky.  [@aefaradien](http://www.twitter.com/aefaradien) raised the issue of reliability, too -- a crashed phone means a crashed vehicle.  Even with a watchdog timer to reset the phone (potentially yet another board), Android's boot time is going to leave our precious 'copter in a ditch somewhere.

An [Arduino](http://www.arduino.com) is looking like a much more appropriate solution, especially as they come with digital and analogue I/O baked in, and readily available "shields" that could drive the motors.  However, that leaves us sourcing our own gyroscope, GPS and camera, as well as figuring out how to remotely control the vehicle.

Our notes are available at [sparktank.net](http://sparktank.net/w/index.php?title=Polycopters), and more bloggery will occur as the project progresses.
