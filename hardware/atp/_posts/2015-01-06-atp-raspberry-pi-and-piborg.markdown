---
layout: post
title: "ATP: Raspberry Pi and PiBorg"
date: 2015-01-06 21:01
comments: true
---

With the All-Terrain Pi, I decided to be lazy. Rather than building my own board to interface the Raspberry Pi with the motors, perhaps with an ATmega and an H-bridge chip, I copped out and let the wonderful people at [PiBorg](https://www.piborg.org/) do the job for me (and much more neatly, too).

![Raspberry Pi, PicoBorg Reverse and BattBorg boards](/hardware/atp/20.jpg){: .center}

I'm using their [PicoBorg Reverse](https://www.piborg.org/picoborgrev) motor controller, which neatly sits on top of the Pi and provides bi-directional control of two DC motors via the I2C bus. The smaller board on top is their [BattBorg](https://www.piborg.org/battborg). It's just a DC-DC converter to supply 5V to the Pi from a higher voltage supply such as the All Terrain Pi's 6&times;1.5V batteries, but it's designed to neatly fit on top of the PicoBorg board.

![BattBorg fitted to PicoBorg](/hardware/atp/21.jpg){: .center}

Here's all three boards together:

![Three boards together](/hardware/atp/22.jpg){: .center}

Six pins from the Raspberry Pi's GPIO header connect it to the PicoBorg, supplying 5V, 3.3V and ground, plus the SDA/SCL lines for I2C. When the Pi is powered via USB (as shown below), 5V is supplied from Pi to PicoBorg, and when the setup is powered from batteries via the BattBorg, the 5V supply will be supplied *to* the Pi allowing everything to be powered from one voltage input.

This is how it all looks connected up to KVM & WiFi, ready for configuration:

![All-Terrain Pi electronics stack connected to KVM and WiFi](/hardware/atp/23.jpg){: .center}

And here's where (for lack of anywhere better) the electronics stack will sit on the vehicle:

![All-Terrain Pi electronics stack located on vehicle](/hardware/atp/24.jpg){: .center}

It was tempting to use a Raspberry Pi A+ for this vehicle and see if the electronics stack could be fitted at the rear where the old control board is located. However, unlike the tank and quadcopter that run in an "embedded" fashion with no graphics support, I wanted the All-Terrain Pi to be more approachable for kids &mdash; one of the goals is to have the vehicle's motion controllable from the [Scratch](http://scratch.mit.edu/) programming environment that comes preinstalled with Raspbian. This necessitates running an X server on the Pi, which the Model A+ with its 256MB RAM will find a struggle.
