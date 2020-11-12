---
author: Ian
comments: true
date: 2012-07-05 22:19:50
layout: post
slug: tank-day-14-video-streaming
title: 'Tank Day 14: Video Streaming'
wordpress_id: 13037
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
- Video
- Vimeo
- YouTube
---

Today's job on the Raspberry Tank build diary: getting that webcam up and running.  Despite a few annoying diversions, this was remarkably easy!

### Step 1: Get the Drivers

The Debian image that was originally offered on the Raspberry Pi website was great, but it was missing a few things in the name of keeping it lightweight -- including, unfortunately, the `uvcvideo` driver that is required to talk to the [Logitech C200 webcam](http://www.amazon.co.uk/gp/product/B002CNIQYA/ref=oh_details_o00_s00_i00) I chose for the tank.  (It was the cheapest option at the time on the [list of confirmed working devices](http://elinux.org/RPi_VerifiedPeripherals#Working_USB_Webcams).)

After a while (okay, actually quite a long while) of trying to build my own version of the [uvcvideo driver](http://www.ideasonboard.org/uvc/) on the Raspberry Pi, I noticed that the Raspberry Pi team had added the driver to newer builds of the kernel.  Rather than download and flash a whole new OS image to my SD card, I took advantage of [Hexxeh](http://hexxeh.net/)'s `rpi-update` utility which handles updates automatically.  This doesn't come as part of the Raspberry Pi builds (yet?), so it has to be downloaded separately.  ([Instructions are here.](https://github.com/Hexxeh/rpi-update/blob/master/README.md))  After exposing my Pi to the internet for the first time, rpi-update found and installed a new kernel for me.  I rebooted and had a working webcam device at `/dev/video0`!

...but broken WiFi.

### Step 2: Fix the WiFi

Unfortunately, the WiFi drivers that we downloaded and installed back on [Day 10](../tank-day-10-wireless-enabled/) were specific to the version of the kernel that came with the default Debian image -- and didn't work at all with the new one.

Luckily, the maintainer of the WiFi driver build had a new version available within a few hours, so repeating the instructions from day 10 resulted in downloading a new, working driver.  However, there were a few issues along the way -- notably that the downloaded "8192cu-latest.tar.gz" had to be renamed "8192cu.tar.gz" for the build script to find it, and that running the script for the second time adds duplicate entries in `/etc/network/interfaces` which must be removed for the configuration to be valid.  I also found that I had to reboot to get the WiFi dongle working this time -- it did not start working immediately during the install process as it had done first time around.

### Step 3: Stream the Video

[![Raspberry Tank with (Semi-Working) Webcam Image](/hardware/raspberry-tank/IMG_20120703_134145-300x225.jpg)](/hardware/raspberry-tank/IMG_20120703_134145.jpg)

With both webcam and WiFi working, we could finally look at the camera imagery.  I took the advice of [Miklós](http://balubati.atw.hu/blog) from [Day 13](../tank-day-13-lucky-for-us/)'s comment thread, and used [mjpg-streamer](https://sourceforge.net/projects/mjpg-streamer/) for this.

`mjpg-streamer` doesn't provide pre-built binaries for the Raspberry Pi's ARM architecture, so I had to build my own.  Fortunately, this was pretty easy.  The [source code](http://sourceforge.net/projects/mjpg-streamer/files/mjpg-streamer/Sourcecode/) is available on SourceForge -- this was downloaded and unpacked on the Raspberry Pi.  To build, `mjpg-streamer` requires the development libraries for `libjpeg`.  I downloaded `libjpeg8-dev` for ARM manually from the Debian package repositories, but it could equally be downloaded using `apt-get` from an internet-connected Pi.  With that installed, building `mjpg-streamer` was as simple as running `make clean all` in the directory to which it was unpacked.

With that done, `mjpg-streamer` could be run by issuing the following commands (as root):

    export LD_LIBRARY_PATH=.
    ./mjpg_streamer -o "output_http.so -w ./www"

This runs a simple built-in web server on port 8080, to which we could connect and stream video:

<center><iframe src="//player.vimeo.com/video/78955496" width="500" height="266" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></center>

### Step 4: Automate It

Once we had a working webcam and streaming software, we needed to make it run on boot-up.  This is achieved fairly simply on Debian by creating an "init script" in the right location and linking it appropriately.  My script looks like this (bear in mind that if you're recreating this build, your path to `mjpg_streamer` may be different to mine):

    #! /bin/sh
    # /etc/init.d/webcam

    # Carry out specific functions when asked to by the system
    case "$1" in
      start)
        echo "Starting webcam script"
        export LD_LIBRARY_PATH=/home/pi/webcam/mjpg-streamer-r63
        /home/pi/webcam/mjpg-streamer-r63/mjpg_streamer -o "output_http.so -w /home/pi/webcam/mjpg-streamer-r63/www" &
        ;;
      stop)
        echo "Stopping webcam script"
        killall mjpg_streamer
        ;;
      *)
        echo "Usage: /etc/init.d/webcam {start|stop}"
        exit 1
        ;;
    esac

    exit 0


This file was placed in `/etc/init.d/`.  It was then made executable and set to run on startup by executing the following commands (as root):

    chmod 755 /etc/init.d/webcam
    update-rc.d webcam defaults

One restart later, we had a Raspberry Pi that would stream its video by default from a known URL.

Now that this has been achieved, we can embark on the next step of the build -- embedding the webcam video on a webpage that also allows for proper remote control of the vehicle.  Follow our first steps towards that goal here on the Raspberry Tank Build Diary!
