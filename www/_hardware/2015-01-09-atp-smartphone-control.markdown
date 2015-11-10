---
layout: post
title: "ATP: Smartphone Control"
date: 2015-01-09 19:20
comments: true
categories: 
---

I've created a [GitHub repository for the All-Terrain Pi code](https://github.com/ianrenton/All-Terrain-Pi) and configuration files. This currently includes the early work on the control code for the vehicle.

Previous tests have used PicoBorg's example GUI for motor control, which demonstrates that the motor control is working, but isn't a satisfactory way of driving the vehicle.

The intention is to allow users to drive the All-Terrain Pi as if it were a racing game on their mobile device. The screen will be taken up with a feed from the on-board camera. Touching the screen causes the vehicle to drive forward (right side of screen) and backwards (left side), while tilting the device causes the vehicle to turn.

On the front end, I have implemented this as a web application to avoid the need for native apps. The touch and tilt controls are compatible with all major smartphone browsers. The Javascript built into the web application sends commands to the main control code via websockets, allowing quick and responsive control. (It's much nicer than driving the Raspberry Tank!)

The main control code is implemented in Python, and not only listens to websocket connections but serves the web application page as well, avoiding the need for a general-purpose web server such as Apache on the vehicle. Commands sent over websockets are converted into demands on the motors using the PicoBorg library. Web serving and websocket support use the ws4py and CherryPy libraries.

{% img center All-Terrain Pi control GUI //files.ianrenton.com/sites/atp/46.jpg %}

The user interface isn't much to look at yet as video streaming is not yet working, but the control works well and is very responsive (<100ms response time). It's a lot of fun to drive around!