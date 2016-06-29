---
author: Ian
comments: true
date: 2012-06-29 06:02:11
layout: post
slug: tank-day-13-lucky-for-us
title: 'Tank Day 13: Lucky for Us'
wordpress_id: 13027
categories:
- Projects
- Raspberry Tank
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
- Video
- Vimeo
- YouTube
- First Day Out
---

Day 13, as it turned out, was our lucky day -- the Raspberry Tank's first day out!

### Step 1: Enable the New Codes

The new codes that were discovered on [day 12](../tank-day-12-cracking-the-code-redux/) were programmed into the SSH control software. As well as the forward (W), backward (S), left (A) and right (D) commands that the software could previously send, I also added the ability to command turret left (Q), turret right (E), turret elevation (Z) and fire (X).

[You can download this version of the code from GitHub here.](https://github.com/ianrenton/raspberrytank/blob/e311504642266d153ee434c85f91724a37403476/rt_ssh.c)

### Step 2: Reattach the Upper Chassis

With the codes in place to operate the turret and firing mechanisms, the upper chassis was reattached to the tank. Firstly, the back panel was removed (below left) -- this remained off to allow easier access to the Raspberry Pi. Secondly, the 8-way cable was reconnected to the upper chassis daughter board to allow the control signals to get there from the RX-18 (below right).

[![Removing the Back Panel](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_083433-300x225.jpg)](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_083433.jpg) [![Reconnecting the Cable](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_121141-300x225.jpg)](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_121141.jpg)

The upper chassis could then be screwed back on.  From the rear, the tank now looks like the photo below left, and from the front (posing with its remote control device), below right.

A webcam has been added to the chassis in these pictures, though it is not yet integrated into the system.  (Keep checking the build diary!)

[![Rebuilt Tank from Rear](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_121728-300x225.jpg)](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_121728.jpg) [![Rebuilt Tank from Front](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_124407-225x300.jpg)](//files.ianrenton.com/sites/raspberrytank/IMG_20120627_124407.jpg)

### Step 3: Fifteen Minutes of Internet Fame

Here's the video of the Raspberry Tank's first day out!

<center><iframe src="//player.vimeo.com/video/78955492" width="500" height="375" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></center>
