---
layout: post
title: "ATP: Starting from Scratch"
date: 2015-01-22 17:42
comments: true
categories: 
---

The smartphone control interface for the All-Terrain Pi is more-or-less finished, so to round off the list of things I wanted to do with it, the only thing left is to get it controlled via the [Scratch](http://scratch.mit.edu/) programming environment.

Scratch is a great introduction to programming for kids, and the colourful drag-and-drop blocks are easy to get to grips with. Unfortunately, by default it doesn't have the ability to talk to I2C devices like the motor control board on the All-Terrain Pi. However, it does have a (just-about documented) ["Remote Sensors Protocol"](http://wiki.scratch.mit.edu/wiki/Remote_Sensors_Protocol) that allows Scratch variables to be written and read via a TCP socket.

{% img center Scratch with the Remote Sensor interface enabled http://files.ianrenton.com/sites/atp/50.png %}

A [new Python script](https://github.com/ianrenton/All-Terrain-Pi/blob/master/home/pi/atp/scratchrx.py) connects up to a running copy of Scratch, and listens for variables called "speed" and "turn" being set to numeric values. When it sees them, it sends the appropriate control messages to the motors.

The All-Terrain Pi still starts up in smartphone control mode, so in order to switch over we need to:

* Stop the previous Python script
* Start a copy of Scratch
* Start the new Python script (which includes a 30 second delay to ensure that Scratch is ready and accepting connections).

I've also knocked up [a quick script](https://github.com/ianrenton/All-Terrain-Pi/blob/master/home/pi/scratchmode) to achieve this, which after a quick edit to `/usr/bin/scratch` can also be used remotely via X forwarding. Switching from "smartphone-controlled mode" to "Scratch mode" is now as simple as grabbing a laptop and running `ssh -X pi@192.168.0.1 /home/pi/scratchmode`

Here you can see the X-forwarded Scratch environment in the foreground, with debug information being printed by the Python script in the background:

{% img center Controlling the All-Terrain Pi from Scratch http://files.ianrenton.com/sites/atp/51.png %}

Last of all, a quick video demo of a Scratch program driving the robot. The Scratch code you see in the video can also be found in my Github repository.

<center><iframe src="//player.vimeo.com/video/117524704" width="600" height="338" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></center>