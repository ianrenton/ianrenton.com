---
layout: software
title: "All-Terrain Pi Software"
comments: true
githublink: https://github.com/ianrenton/all-terrain-pi/
---

This repository contains software for the "All-Terrain Pi" robot. More information is available at [https://ianrenton.com/hardware/atp](https://ianrenton.com/hardware/atp).

The repository is a mixture of my own control software and various configuration changes I have made to get things working. It's laid out like the filesystem on the Raspberry Pi that powers the robot. If you're interested in the control code, look in `/home/pi/atp`.

Other stuff in this repo e.g. PicoBorg libraries and mjpeg-streamer code are owned by other people and have different licence terms.

To run all this stuff you'll need some dependencies. ws4py, CherryPy and the Python I2C libraries are required for the main control code. mjpg-streamer has its usual dependencies. If anyone wants it, I'll do a proper set of step-by-step install instructions.

![All-Terrain Pi](http://files.ianrenton.com/sites/atp/44.jpg)
