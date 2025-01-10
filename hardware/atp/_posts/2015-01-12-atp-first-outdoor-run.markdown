---
layout: post
title: "ATP: First Outdoor Run"
date: 2015-01-12 21:58
comments: true

---

With the [smartphone control interface](../atp-smartphone-control) and [streaming video](../atp-video-streaming) working well, all that remains is to give the All-Terrain Pi its first run outdoors!

<center><video width="640" controls><source src="https://video.ianrenton.com/atp/firstoutdoor.mp4" type="video/mp4"></video></center>

The interface is very responsive, with ~100ms lag in control and ~500ms lag in the video, which runs at 320x240 @ 10fps. These are much better figures than the Raspberry Tank's interface (~1 second lag on each, 2fps) thanks to the use of WebSockets and the Raspberry Pi camera module for mjpg_streamer.

The main challenges to controlling the vehicle are its lack of proportional steering (the DC motor + clutch system means that steering is either left, centre or right with nothing in between) and the light weight of the chassis that causes it to bounce around a lot on uneven terrain.

But those issues aside, the All-Terrain Pi is pretty much done! It's a lot of fun to drive and has definitely reached the point of being "kid friendly".

It's been somewhere between 10 and 15 hours' of work for me, but many thanks are owed to the other people whose hard work I have benefitted from:

* The [Raspberry Pi](http://www.raspberrypi.org) team, for the PC and camera
* The [PiBorg](https://www.piborg.org/) team, for the motor driver and voltage regulator boards
* The [MJPG-Streamer](http://sourceforge.net/projects/mjpg-streamer/) team and [jacksonliam](https://github.com/jacksonliam) for the video streaming software
* [Tom Gallacher](http://tomg.co/gyrojs) for the gyro.js library
* The developers of [CherryPy](http://www.cherrypy.org/) and [ws4py](https://ws4py.readthedocs.org/en/latest/)
* The [Raspbian](http://www.raspbian.org/) and [Debian](http://www.debian.org/) maintainers
* and doubtless many others I've forgotten!
