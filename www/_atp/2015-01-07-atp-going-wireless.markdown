---
layout: post
title: "ATP: Going Wireless"
date: 2015-01-07 21:24
comments: true
categories: 
---

We have a set of boards capable of controlling the vehicle &mdash; all that's left to get the electronics stack wired up to the vehicle and cut the cables tethering the Pi to other things.

{% img center Original control board //files.ianrenton.com/sites/atp/25.jpg %}

First of all, the original control board has to go. The six wires that join it to the battery and motors were cut, leaving stubs in case we need to restore the original functionality.

{% img center Original control board with snipped cables //files.ianrenton.com/sites/atp/26.jpg %}

{% img center Trailing wires //files.ianrenton.com/sites/atp/27.jpg %}

Now we have something to connect up to.  The electronics stack has no neat place to sit on top of the vehicle, but the area on top of the battery enclosure is the closest there is to a flat area. This is part of the section of the vehicle that tilts when turning (which is roughly 80% of the chassis), so it must be firmly attached. Three cable ties do the job during testing, until a better mount can be designed.

{% img center Electronics stack tied to chassis //files.ianrenton.com/sites/atp/28.jpg %}

With a stable location for the electronics stack, the somewhat fragile cables can now be connected to the PicoBorg control board. Red and blue connect to the battery, black and grey to the main drive motor, and orange and green to the tilt/turn motor.

{% img center Connections on PicoBorg //files.ianrenton.com/sites/atp/30.jpg %}

We're now capable of controlling the robot's motors from the Pi, although as we still require power, keyboard, mouse and monitor plugged into the Pi, it can't be driven around just yet.

{% img center Electronics stack connected to robot //files.ianrenton.com/sites/atp/31.jpg %}

Using the simple Python GUI supplied with the PicoBorg libraries, we can test the motors in turn to ensure each one works as expected &mdash; with the robot lifted off the ground when testing the drive motor.

{% img center PicoBorg test GUI in use //files.ianrenton.com/sites/atp/32.jpg %}

{% img center //files.ianrenton.com/sites/atp/33.jpg %}

There are a few more wires to cut. Firstly, attaching a WiFi adapter and configuring it to run as an access point allows remote access to the Pi via SSH.

{% img center All-Terrain Pi with WiFi dongle fitted //files.ianrenton.com/sites/atp/35.jpg %}

The USB power cable is now the only connection tying the robot to the wall. The BattBorg allows us to cut that cord too and provide 5V power supply to the Raspberry Pi from the vehicle's batteries.

{% img center Attaching the BattBorg to the PicoBorg //files.ianrenton.com/sites/atp/36.jpg %}

{% img center Attaching the BattBorg to the electronics stack //files.ianrenton.com/sites/atp/37.jpg %}

This now allows the All-Terrain Pi robot to be powered up without connection to anything else &mdash; it's finally mobile.

{% img center All-Terrain Pi powered up independently //files.ianrenton.com/sites/atp/38.jpg %}

Now we're free to roam!

{% img center Freely roaming All-Terrain Pi //files.ianrenton.com/sites/atp/39.jpg %}

Here's a video of its first run using the PicoBorg example GUI:

<iframe src="//player.vimeo.com/video/116202120" width="600" height="337" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
