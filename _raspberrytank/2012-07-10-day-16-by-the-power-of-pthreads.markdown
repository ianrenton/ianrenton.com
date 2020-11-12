---
author: Ian
comments: true
date: 2012-07-10 22:10:15
layout: post
slug: tank-day-16-by-the-power-of-pthreads
title: 'Tank Day 16: By the Power of pthreads!'
wordpress_id: 13052
categories:
- Projects
- Raspberry Tank
- Software
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
---

[Day 15 of the Raspberry Tank build diary](../tank-day-15-web-interface-prototyping/) saw me on my home turf of UI prototyping, and I promised that today I'd show you how I put together the Javascript that powers the web-based user interface.  Well, I did a little better than that -- not only is the Web UI up and running, it's communicating with a new version of the tank control software too, so now almost -- almost! -- have a fully web-enabled tank.

[![Raspberry Tank HTTP Interfaces](/hardware/raspberry-tank/http_interfaces-600x225.png)](/hardware/raspberry-tank/http_interfaces.png)

### Step 1: The HTML

The HTML behind the tank's web interface is pretty simple -- just a big `div` for the webcam video and a 3-by-3 table of buttons for the control side.

### Step 2: The Javascript

The webcam video is received as a rapidly-updating set of JPEG images using Javascript code that is part of the `mjpg-streamer` package.  Although `mjpg-streamer` provides a mode that will deliver a live image without needing to constantly poll with JavaScript, this does not work on all browsers.

Each control button on the Web UI has an `onmousedown` and an `onmouseup` event that toggles a state internal to the Javascript.  So, for example, the Javascript contains an internal variable that denotes whether the user has asked the tank to move forwards or not.  Touching the "forwards" button sets this true, and releasing the button sets it false.  Any time a change occurs, the complete set of command states are sent to an HTTP server on port 3000 as a GET request, where the back-end component of the software is waiting to receive it.

[You can see and download all the web UI code on GitHub.](https://github.com/ianrenton/raspberrytank/tree/master/web-ui)

### Step 3: The C

The [early control code](/hardware/tank-day-10-wireless-enabled/) for the Raspberry Tank relied on keypresses to control the tank's main functions.  Now that we have a web interface, we need to modify the code to make it accept commands from the Web UI.

The Web UI's JavaScript can only send HTTP requests rather than raw packets to something on the back end, so the easiest way to get control into our C program was simply to embed an HTTP server into it.  This was achieved very simply by using a great, tiny server called [mongoose](https://code.google.com/p/mongoose/).

Mongoose's single C file was included in the build, and the code modified to include a Mongoose server spawned with pthreads, which wrote the command string it received from the Web UI to an internal variable.  In the other, "old" section of code, the decision-making logic was changed so that rather than expecting keystrokes, it read that internal variable and issued control commands based on it.

[You can see and download all the back-end code on GitHub too.](https://github.com/ianrenton/raspberrytank/tree/master/rt_http)

### And so...

...now the Raspberry Tank can be controlled remotely from a web interface, complete with streaming video.

[![Web UI on Tank](/hardware/raspberry-tank/IMG_20120709_124816-300x225.jpg)](/hardware/raspberry-tank/IMG_20120709_124816.jpg) [![Close-up of Web UI](/hardware/raspberry-tank/IMG_20120709_124826-225x300.jpg)](/hardware/raspberry-tank/IMG_20120709_124826.jpg)

You may notice in these photos that the Pi is not currently inside the tank.  There are a couple more issues that need to be addressed before full integration can occur, and these will be explained on day 17 of the Raspberry Tank Build Diary!
