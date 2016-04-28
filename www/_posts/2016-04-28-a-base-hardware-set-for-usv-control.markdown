---
layout: post
title: "A Base Hardware Set for USV Control"
date: 2016-04-28T20:54:29+01:00
categories:
- Projects
- Hardware
tags:
- boat
- USV
- Raspberry Pi
- Motor control
---

Here's a thing that I don't have, wouldn't have time to use, and really shouldn't buy. But a thing that I really want anyway. It can do 40 knots.

{% img center http://files.ianrenton.com/sites/blog/2016/boat.jpg %}

While I haven't quite talked myself into buying it yet, I have been thinking about the hardware to make it autonomous, and whether I should develop a simple, standard set of hardware for the job.

Although an Ardupilot would work pretty well, I don't find it it particularly intuitive to use, and for obvious reasons I'd rather use the autonomous navigation software that my team and I have spent the last eight years writing&mdash;and that means a real PC. We've had it running on a Raspberry Pi Model B, although it's a bit on the slow side, so the new Raspberry Pi 3 is the logical successor. It has built-in WiFi, but with such a tiny antenna that users [report a very limited range](https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=139021), so a separate WiFi adapter will be needed as well.

Control of the throttle ESC and rudder servo are via PWM signals in vehicles like this, and the Pi cannot properly generate by itself. When our graduates at work built a similar boat a couple of years ago, they used an Arduino Mega for PWM control, but that's probably overkill&mdash;for [my quadcopter](/hardware/quadcopter/) I used [this servo control board](http://electronics.chroma.se/rpisbv3.php) that fits neatly on top of the GPIO connector.

{% img right http://files.ianrenton.com/sites/blog/2016/usbsbv1.jpg %}

What I'd also like to do is optionally pass through the PWM from an RC receiver to the boat, so I can easily swap between remote and autonomous modes. The board above has a 3.3v-5v buffer chip on the PWM channels which renders it output-only, but the [USB equivalent](http://electronics.chroma.se/usbsb.php) has no such buffer and could be used for input and output.

Handily, moving the servo control from the Pi's built-in UART to USB frees up that UART for receiving GPS data, with I2C used for the equally important heading sensor. I'm using the [CJMCU uBlox 6M GPS & HMC5883L Compass module](http://www.goodluckbuy.com/cjmcu-108-apm-2-6-flight-controller-gps-6m-hmc5883l-compass-module-for-multi-rotors.html) scrounged from my quad.

The two smaller boards should mount on top of the Pi using spacers and mounting holes in the boards, resulting in a neat self-contained unit capable of autonomous control and remote access via WiFi. The architecture looks something like this:

{% img center http://files.ianrenton.com/sites/blog/2016/usv-arch.png %}

That's enough to get started with, and if it works well, it can be used as a standard platform on which to build additional features. The first expansion is likely to be a camera for remote FPV control similar to the [All-Terrain Pi](/hardware/atp/), and hopefully the Raspberry Pi 3 is also powerful enough for some simple machine vision processing to drive Autonomy's collision avoidance algorithms.
