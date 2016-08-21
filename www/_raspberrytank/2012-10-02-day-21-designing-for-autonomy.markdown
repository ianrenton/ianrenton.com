---
author: Ian
comments: true
date: 2012-10-02 21:11:40
layout: post
slug: tank-day-21-designing-for-autonomy
title: 'Tank Day 21: Designing for Autonomy'
wordpress_id: 13216
categories:
- Projects
- Raspberry Tank
tags:
- Hardware
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
---

At the end of [day 20](../tank-day-20-to-youtube-once-more/) of the build diary, we had a fully working tank that could be remotely controlled over a web interface that also featured streaming video from the on-board webcam. Phase 1 of the Raspberry Tank development was finally complete!

So naturally, of course, it's time for phase 2: making the tank fully autonomous. This will require a few additions to the build.

## Hardware

The tank currently has no idea what direction it is facing. This isn't a problem for a remotely controlled vehicle, as we assume the operator can work this out from the video they see. However, it would be helpful for an autonomous tank to be able to figure this out.

We also currently have no way of telling which way the turret is facing compared to the tank. The operator can't even get a visual cue here as the hull of the tank is not visible in the video stream. They can drive the tank forwards and watch the video to get some idea of which way the turret is pointing, though this is fairly disorienting. So, the autonomous tank should probably detect where its turret is pointing, too.

My first attempt at doing this will be to add two three-axis magnetometers to the tank -- one on the hull and one on the turret, as shown (sans wiring) below.

[![Magnetometer Locations](//files.ianrenton.com/sites/raspberrytank/tank2-600x318.png)](//files.ianrenton.com/sites/raspberrytank/tank2.png)<br/>
_Magnetometer Locations (Magnetometer boards shown in red)_

It would also be a good idea to prevent the tank crashing into things. For this reason, I will also mount an ultrasound rangefinder to the front of the tank, as shown below.

[![Front of Tank, showing Rangefinder](//files.ianrenton.com/sites/raspberrytank/tank1-600x318.png)](//files.ianrenton.com/sites/raspberrytank/tank1.png)<br/>
_Front of Tank, showing Rangefinder_

This will act as an override on whatever other activity the tank is conducting, to prevent damage to the vehicle. It would be nice to fit a similar device to the rear, although until now I have left the rear of the tank completely open to allow access to the Raspberry Pi's USB and Ethernet sockets.

## Software

The new hardware could use a variety of methods of communicating with the Raspberry Pi, but perhaps the simplest and easiest is [I2C](https://en.wikipedia.org/wiki/I%C2%B2C). This would allow me to chain the new hardware together, and hang it all off just four pins of the Pi's GPIO header.

Unfortunately, there is a disadvantage -- the [Raspbian ](http://raspbian.org)operating system that I use does not include an I2C kernel module. Luckily I shouldn't have to compile one myself, as the folks at [AdaFruit](http://adafruit.com/) have already done the job, baking their modules into another RasPi-targeted operating system called [Occidentalis](http://learn.adafruit.com/adafruit-raspberry-pi-educational-linux-distro/overview). While this does mean another re-flash of the SD card and another re-install of all the tank-related software, I've got [that process](../tank-day-19-the-move-to-raspbian/) pretty streamlined now.

I am hoping to avoid some of the low-level coding of the autonomy system by basing it around the open source [ROS (Robot Operating System)](http://www.ros.org/wiki/) framework.  The wiki already has a [guide to building and running ROS on the Raspberry Pi](http://www.ros.org/wiki/ROSberryPi/Setting%20up%20ROS%20on%20RaspberryPi), though the author of the page does note that some of ROS's high-level functions may be too much for the Pi's CPU to handle. If ROS proves to be too bloated for the Pi, I will simply drop back to implementing the functionality in C without the middleware.

That wiki page also notes that there is currently no ROS node capable of interfacing with the Pi's GPIO pins, so whether I use ROS or not, I will still have to write some GPIO / I2C code myself.

ROS also provides easy integration with [OpenCV](http://opencv.willowgarage.com/wiki/), the popular machine vision software.  Implementing proper machine vision in the tank would be wonderful, as I'd love to have it able to follow a target (or even a person) around, though this may well be beyond the Pi's processing capability.

## What Shall We Do With an Autonomous Tank?

At the moment, I'm really not sure.

  * The **Robotics 101 behaviour** of "go forward until you nearly hit something, then turn and repeat" seems like as good a place as any to start, though it's not particularly exciting.
  * **Target following** would be great, but as mentioned above, this may be beyond the capabilities of the Raspberry Pi hardware.
  * You can now buy magnetometer chips that also include an accelerometer and a gyroscope. This can form the beginnings of an **inertial navigation system**. My parent company has a really good one of these, which probably took a team of people much smarter than me a very long time to get right. For us mere mortals, inertial navigation is difficult, as [Katy Levinson](https://twitter.com/katylevinson) will now drunkenly explain:

  <iframe width="560" height="315" src="http://www.youtube-nocookie.com/embed/Drk3Dz3_yLE?start=1286" frameborder="0" allowfullscreen></iframe>

  * **GPS-based behaviours** could be possible if we added a GPS receiver. This would remove the problem of relying on inertial navigation, and the tank could conduct all kinds of interesting missions. However, it only works outdoors, and despite being a tracked vehicle, the Raspberry Tank definitely prefers operating in dry and carpeted places.
  * **Beacon-based navigation** similar to that used by [Roombas](http://www.irobot.com/en/us/robots/home/roomba.aspx) is a possibility, though that requires even more additional hardware, and means that the tank's environment must be carefully set up before it can be used.
  * If we had a nice way of determining position, we could combine that with the rangefinder to make the tank **map its surroundings**. Over to Ms Levinson again for an explanation of why that's also pretty hard (but by no means impossible):

  <iframe width="560" height="315" src="http://www.youtube-nocookie.com/embed/gFW0schumkE?start=415" frameborder="0" allowfullscreen></iframe>

So, what do you think? Is there anything you'd like to see an autonomous Raspberry Tank do? Any input or output devices you'd like to see integrated? Let me know, and I'll see what we can do!
