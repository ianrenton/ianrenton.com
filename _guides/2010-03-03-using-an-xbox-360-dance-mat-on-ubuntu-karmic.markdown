---
author: Ian
comments: true
date: 2010-03-03 11:36:14
layout: post
slug: using-an-xbox-360-dance-mat-on-ubuntu-karmic
title: 'HOWTO: Use an XBox 360 Dance Mat on Ubuntu Karmic'
wordpress_id: 2780
categories:
- Guides
tags:
- Console Hackery
- Dance Mat
- Dancing Stage
- DDR
- Driver
- Drivers
- Guide
- Help
- HOWTO
- Joystick
- Kernel
- Linux
- Support
- Ubuntu
- USB
- Xbox 360
---

Normal XBox 360 wired controllers are supported out of the box on Ubuntu Karmic (9.10).  However, it seems that dance mats such as the one that comes bundled with Dancing Stage Universe behave a little differently.  Here's how I got mine to work.

This HOWTO is in the public domain.  You are free to re-post it wherever and however you like, though a link back [here](./) would be appreciated.

Be warned, this is not for the faint of heart -- we will be spending most of our time in a terminal window, and we'll be compiling drivers ourselves.  Read the instructions carefully, and follow what I did line by line.  If you have problems, leave a comment and I'll see if I can help you out.  _Running commands as the root user is potentially dangerous; I am not responsible if your computer is damaged by incorrectly following these instructions._

First of all, check that you have the same device as I do.  If not, proceed only with caution!  To find out, plug your dance mat into a USB port, open up a terminal window and run


    lsusb


You should see a line which looks like:


    Bus 002 Device 002: ID 12ab:0004 Honey Bee Electronic International Ltd.


Your 'Bus' and 'Device' numbers will probably be different, but the rest of the line should be the same.

The `xpad` driver, which is already baked into the kernel, does not work for these dance mats.  We will have to instead install [xboxdrv](http://pingus.seul.org/~grumbel/xboxdrv/), which does support dance mats.

The first thing we need to do is download the source code for xboxdrv.  Their website provides downloads of various versions (at time of writing, the latest was [0.4.10](http://pingus.seul.org/~grumbel/xboxdrv/xboxdrv-linux-0.4.10.tar.bz2)), but I chose to grab the very latest code from their `git` repository.  To do that, first install `git` if you don't already have it:


    sudo apt-get install git-core


Then find a space to download `xboxdrv` to -- I just chose my home directory, which should be the location you're at when you first run the terminal anyway.  Download their latest source using git, then go into the downloaded directory:

    
    git clone git://github.com/Grumbel/xboxdrv.git
    cd xboxdrv


Now you'll need to compile the driver from the source code you've just downloaded.  These following instructions are largely from the `README` file included with `xboxdrv`.  You'll need a bunch of things installed so that you can compile the code.  To make sure you have everything, run:


    sudo apt-get install g++ libboost1.40-dev libboost-thread1.40-dev scons libusb-dev libx11-dev x11proto-core-dev python-dbus


Now compile by simply running:


    scons


Make a cup of tea, this will take a few minutes.

Assuming you don't see any errors, you now have a driver that will support the dance mat.  However, this is a 'user-space' driver, which means we don't actually bake it into the kernel -- instead, we need to make sure that the kernel supports user-space input drivers, then we run `xboxdrv` as if it were a normal application.

First of all, though, we should check it's actually working.  To start with, we'll remove the `xpad` driver from the kernel, and add the user-space driver support.  _Note that if you have any other joysticks, removing xpad could stop them working.  I'm not sure if there's any way around this at the moment._  Run the following commands:


    sudo rmmod xpad
    sudo modprobe uinput
    sudo modprobe joydev


Now we can run `xboxdrv` and check it's working.  Type:


    sudo ./xboxdrv


You should see something like the following:


    xboxdrv 0.4.8
    Copyright (C) 2008 Ingo Ruhnke
    License GPLv3+: GNU GPL version 3 or later
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

    USB Device:        002:002
    Controller:        "DDR Universe 2 Mat" (idVendor: 0x12ab, idProduct: 0x0004)
    Controller Type:   Xbox360
    Deadzone:          0
    Trigger Deadzone:  0
    Rumble Debug:      off
    Rumble Speed:      left: -1 right: -1
    LED Status:        auto
    Square Axis:       no
    ButtonMap:         none
    AxisMap:           none
    RelativeAxisMap:   none
    AutoFireMap:       none
    RumbleGain:        255
    ForceFeedback:     disabled

    Starting with uinput... Error: /dev/input/uinput: No such file or directory
    done

    Your Xbox/Xbox360 controller should now be available as:
      /dev/input/js0
      /dev/input/event7

    Press Ctrl-c to quit

    X1:     0 Y1:     0  X2:     0 Y2:     0  du:0 dd:0 dl:0 dr:0  back:0 guide:0 start:0
    TL:0 TR:0  A:0 B:0 X:0 Y:0  LB:0 RB:0  LT:  0 RT:  0


(You can ignore the "`Error: /dev/input/uinput: No such file or directory`" line if it appears on your screen, it doesn't seem to affect `xboxdrv` at all.)

Press some of the pads on your dance mat.  You should see extra lines appearing at the end indicating the buttons that have been pressed.  The arrows on the mat match up to D-pad directions, so for example if you press Down, you should see `dd:1` on the line that appears.

Once you're satisfied that it's working, hit Ctrl+C to quit.

Before we're finished, we need to make those changes to the kernel modules permanent.  To do this, run:


    sudo -i
    echo "blacklist xpad" >> /etc/modprobe.d/blacklist.conf
    echo "uinput" >> /etc/modules
    echo "joydev" >> /etc/modules
    exit


You can now reboot if you want to, and all your kernel module changes will stick.

There's one more step.  At the moment before using your dance mat, you'll still have to run `xboxdrv` manually.  We can fix this with an 'init script' that will run `xboxdrv` automatically on startup.

First, let's put `xboxdrv` somewhere sensible on your filesystem, rather than in your home directory:


    sudo mkdir /usr/local/bin/xboxdrv
    sudo cp xboxdrv /usr/local/bin/xboxdrv/xboxdrv
    sudo cp tools/xboxdrv-daemon.py /usr/local/bin/xboxdrv/xboxdrv-daemon.py


Now we'll set up the init script.  The script itself is a few dozen lines, so rather than pasting it here, here's a download link instead: [xboxdrv init script](http://files.ianrenton.com/xboxdrv).  Download this, then copy it to `/etc/init.d`.  That requires root access, so from your terminal, run the following to download the above file and put it in the right place:


    cd ~
    wget http://files.ianrenton.com/xboxdrv
    sudo mv xboxdrv /etc/init.d/xboxdrv


Now we have to make sure that's executable and that it runs on startup:


    sudo chmod +x /etc/init.d/xboxdrv
    sudo update-rc.d xboxdrv start 51 S .


(don't forget the dot on the end!)

Aaaand at long last, you should be done.  Reboot, and your dance mat should work properly with no extra configuration.  If you're using StepMania, remember to map the mat's controls before playing.  If you've not drunk that cup of tea yet, it's probably cold!

_If you're looking for a similar guide for OpenSuSE, I've just discovered [this post](http://forums.opensuse.org/hardware/415316-my-xbox-360-controller-controls-mouse.html#post1992693) which is similar to the post you're reading, but with OpenSuSE-specific init script instructions._
