---
comments: true
date: 2012-09-23 15:23:38
layout: post
slug: tank-day-19-the-move-to-raspbian
title: 'Tank Day 19: The Move to Raspbian'
tags:
- Debian
- Linux
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Raspbian
---

The [Rasbpian](http://www.raspbian.org/) Linux distribution was recently released, offering a significant performance boost for Raspberry Pis by using an architecture that supports hard floating-point calculations on the Pi's ARM processor.

Raspbian is based on Debian Wheezy, so very few changes were required to port the Raspberry Tank system to Raspbian. The steps followed were roughly:

## Step 1: Back up the files

With the steps in the Raspberry Tank Build Diary followed exactly, the only significantly modified files and directories were:
    
    /home/pi/* # Remember to copy recursive!
    /var/www/*
    /etc/init.d/rt_http
    /etc/init.d/webcam
    /etc/network/interfaces

These directories/files were copied to an ext3-formatted memory stick (to ensure that permissions were preserved, which would not be the case on a FAT-formatted stick).

Various files were also modified during the installation of the WiFi dongle drivers, but as Raspbian includes the drivers for our device anyway, we don't need to worry about these.

## Step 2: Install Raspbian

The Raspbian 2012-08-16 image was downloaded on another computer and `dd`ed onto the Pi's SD card.  The newly Raspbian'd Pi was booted with a keyboard and monitor attached, as the network connection would not necessarily be set up. (I forgot to make a note of Raspbian's default network settings.)

The Raspbian setup utility was used to expand the normally 2GB image to fill the rest of my 8GB SD card.

## Step 3: Restore the files

The backed up files and directories were restored from the memory stick to their previous locations. The init scripts then needed to be re-added to the default run level with the following commands:
    
    sudo update-rc.d webcam defaults 
    sudo update-rc.d rt_http defaults

## Step 4: Restore the Programs and Libraries

The `lighttpd` web server was still missing from the Rasbpian build, along with a couple of libraries required to compile `rt_http` and `mjpg_streamer`.  The Raspbian system was updated, and these installed, using the following commands:
    
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install lighttpd libjpeg8-dev libpthreads-dev

## Step 5: Recompile rt_http

Because the Raspbian system uses the `armhf` architecture rather than `armel`, we need to re-compile the two programs that we compiled from source under the `armel` Debian system -- `rt_http` and `mjpg_streamer`.

The easy one is `rt_http`, which was compiled without issues by executing:
    
    cd /home/pi/rt_http
    make

## Step 6: Recompile mjpg_streamer

Recompiling `mjpg_streamer` was a little more difficult. `mjpg_streamer`'s `make` script expects to see Video4Linux version 1, which is no longer installable in Raspbian's version of Debian. Video4Linux 2 is available, but `mjpg_streamer` has not yet been updated to support it.

I did a quick hack to make `mjpg_streamer` think that V4L 1 was installed:
    
    sudo ln -sf /usr/include/linux/videodev2.h /usr/include/linux/videodev.h

This makes a symlink from the location of a V4L 1 header file, pointing at the equivalent V4L 2 header. The majority of `mjpg_streamer` is actually compatible with V4L 2, so this allows most of it to compile. The only remaining issue is with a plugin, `input_gspcav1`, that thankfully is not necessary for the Logitech C200 webcam. References to this plugin were removed from `Makefile`, resulting in a file that looks like [this](/hardware/raspberry-tank/Makefile.txt). After the modification, `make clean all` successfully built the program.

One restart later, with the WiFi dongle and webcam attached, and the Raspberry Tank was back in working order!
