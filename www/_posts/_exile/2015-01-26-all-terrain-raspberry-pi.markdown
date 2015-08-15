---
layout: post
title: "All-Terrain Raspberry Pi!"
date: 2015-01-26 20:51
comments: true
categories: 
- Projects
- Hardware
- Software
tags:
- Raspberry Pi
- Robot
- Robots
- All-Terrain Pi
---

Another year, another childrens' toy with a Raspberry Pi needlessly attached to it.

Over the past few weeks, I've been taking one of my son's old broken RC toys and turning it into something a bit more fun &mdash; by strapping a computer to it, naturally.

The result is the "All-Terrain Pi", a robot which can be controlled by smartphone as if it were a racing game, or by using the kid-friendly [Scratch](http://scratch.mit.edu/) programming language.

Here's a video of the smartphone interface. It all runs in the web browser, with no need to install an app on the phone. Full-screen (ish) video streams from the robot's on-board camera, while speed and turning are controlled using touch and tilt controls implemented in Javascript.

<center><iframe src="//player.vimeo.com/video/116594321" width="600" height="338" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></center>

Programming in Scratch is possible too, recreating the 80s/90s Logo "Turtle" experience for a new generation. As with the smartphone interface there's a Python program behind the scenes controlling the motor driver board, but this time it receives commands via Scratch's ["Remote Sensors Protocol"](http://wiki.scratch.mit.edu/wiki/Remote_Sensors_Protocol).

<center><iframe src="//player.vimeo.com/video/117524704" width="600" height="338" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></center>

It didn't take long for my son to get into controlling the robot, both with the game-like smartphone interface and using Scratch, which he has some experience with from school. (They start programming young now!)  We took it to last weekend's [Constructorium hackerspace](http://constructorium.org) event at the library, where it was a big hit &mdash; by the end of the afternoon, he was teaching the grown-ups!

{% img center Programming the All-Terrain Pi in Scratch http://files.ianrenton.com/sites/atp/53.jpg %}

"Proud" is an understatement.

I've finished all the things I set out to achieve with this robot, in a total of only 20 hours or so. Thanks to a pre-made [motor driver board](https://www.piborg.org/picoborgrev) and a [Raspberry Pi camera fork of mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer), some of the hardest bits of the project turned out to be very easy, so I'm very grateful to everyone whose work I've built upon to create this robot.

I'm hoping we might be allowed to take the robot into school and maybe hold a competition for the kids to write a program to steer it around an obstacle course; or something similar &mdash; to make programming more exciting by taking it off the computer screen and into the real world. If the teachers don't let us do that, we might hook it up to the internet and have it controlled using redstone circuits on [my son's Minecraft server](http://joseph.renton.es).

You can find a step-by-step guide to how I built the robot on the [All-Terrain Pi page](http://robots.ianrenton.com/atp) and [all the code](https://github.com/ianrenton/All-Terrain-Pi) is open source!