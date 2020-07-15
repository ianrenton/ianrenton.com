---
layout: post
title: "ATP: Tweaking the Software"
date: 2015-01-13 20:35
comments: true
categories: 
---

Since [yesterday's run outdoors](../atp-first-outdoor-run), I've made a few final tweaks to the code to improve a few things. [Here's the commit](https://github.com/ianrenton/All-Terrain-Pi/commit/968027f04b5a368f59ca82b1f87124efac1d438d) if you're interested.

The changes made were:

* **Watchdog timer** &mdash; Previously, if comms was lost between phone and robot, the robot would continue its last received instruction indefinitely, even if that was "drive forwards". The Python code now includes a "watchdog" timer that will disable the motors if no instructions have been received for a second. The web interface now also displays "No Comms with Vehicle" if it hasn't received anything from the vehicle within a second.
* **Improved responsiveness** &mdash; Polling the accelerometer is now done every 100ms rather than 250ms to improve the responsiveness of turning. The device can also be turned slightly further before it complains that it is no longer horizontal.
* **Widescreen video** &mdash; The video resolution is now set to 400x240 (increased from 320x240) to fit better on the widescreen display in most smartphones.
* **Remote shutdown** &mdash; Visiting the special "http://192.168.0.1/s" URL now shuts down the Raspberry Pi. This isn't linked from the standard interface to avoid accidental shutdowns, but visiting it allows for a controlled shutdown without having to SSH into the Pi.
* **Port 80** &mdash; To make discovering the web interface easier, it now runs on port 80 instead of port 9000. (This requires the script to be run as root.)
