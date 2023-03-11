---
layout: post
title: "USV-01 Software Setup"
date: 2023-03-11 10:49
comments: true
categories:
---

As with my other hobby autonomous systems, I'm going to stop short of publishing any code that contains real control logic&mdash;even though I'm doing this in my spare time, that's getting much too close to the "day job" with all its concerns about intellectual property. If you're recreating this build for yourself, there are a number of open source software frameworks that should work fine on this platform, such as [ROS](https://www.ros.org/) and [MOOS-IvP](https://oceanai.mit.edu/moos-ivp/pmwiki/pmwiki.php?n=Main.HomePage), and in finest academic tradition, implementing them is left as an exercise for the reader.

## Initial Setup

The initial setup for the board was to download the latest "flasher" Debian image, load it onto an SD card, and boot the Beaglebone from it. This will automatically flash the on-board eMMC with the image from the SD card, which can then be removed. [Instructions are here.](https://beagleboard.org/static/librobotcontrol/flashing.html)

The Beaglebone Blue hosts its own WiFi access point by default, which is what I want for the USV. It's a bit of a faff to switch modes between that and having it join my own LAN, so for the times I've needed it to be connected to the internet (e.g. for package updates) I've used the USB interface to a computer for that.

Once installed, `sudo dpkg-reconfigure librobotcontrol` ensures the librobotcontrol package (for connection to the MPU and servos) is set up, and `rc_test_drivers` should indicate that everything is OK.

## Receiving Data

For my purposes, I wanted to be able to receive the incoming GPS data in two different places, so I created a simple C program to receive this data from the serial port and send it out as UDP: [Beaglebone Blue GPS UDP Sender](https://github.com/ianrenton/beaglebone-blue-gps-udp-sender).

In a similar way, I also wanted to use the heading data from the magnetometer in two different applications, and in NMEA-0183 format to match what's coming from the GPS. I created a similar program for that too: [Beaglebone Blue Heading NMEA UDP Sender](https://github.com/ianrenton/beaglebone-blue-heading-nmea-udp-sender).

## Controlling the Motors

Coming soon...