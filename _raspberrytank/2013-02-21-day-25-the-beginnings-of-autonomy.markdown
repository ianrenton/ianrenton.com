---
comments: true
date: 2013-02-21 21:54:23
layout: post
slug: tank-day-25-the-beginnings-of-autonomy
title: 'Tank Day 25: The Beginnings of Autonomy'
tags:
- Autonomy
- Behaviours
- Build
- Build Diary
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Sensors
- Software
- Tank
- Test
- Video
- Vimeo
- YouTube
---

The sensors are working, remote control is working -- all that remains is to combine them and provide the Raspberry Tank with its first autonomous capability.

To begin with, I implemented a very simple behaviour, as follows:
	
  1. Drive forwards until the range to an obstacle in front of the tank is less than one metre
  2. Shoot whatever is in front of the tank
  3. Reverse slightly and turn to the right
  4. Start driving forwards again, and repeat.

A fourth thread was implemented in the C code, which reads the sensor data and issues commands in the same format as the JavaScript on the web interface. The web interface was then updated to include a toggle for the state of autonomy on the vehicle. In truth, autonomy runs all the time -- what this new flag does is instruct the tank's control code to listen either to autonomy or to the web client. Of course, the web client retains overall control so that you can turn autonomy back _off_ again!

As always, you can [download the public domain source code from my GitHub](https://github.com/ianrenton/raspberrytank).

In the video below, the tank is having its sensors and autonomous behaviour tested on the bench:

<center><video width="640" controls><source src="https://video.ianrenton.com/raspberrytank/simpleautonomytest.mp4" type="video/mp4"></video></center>

And below, it's first venture into autonomously navigating the world.

<center><video width="640" controls><source src="https://video.ianrenton.com/raspberrytank/tankvscupboard.mp4" type="video/mp4"></video></center>

Well, that didn't go quite according to plan. But it is progress! Next time on the Raspberry Tank Build Diary, we'll tweak the parameters that autonomy uses and see if we can get a better result!
