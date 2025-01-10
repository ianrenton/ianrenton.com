---
author: Ian
comments: true
date: 2011-11-08 21:42:01
layout: post
slug: howto-linux-and-synaptics-touchpads-for-little-fingers
title: 'HOWTO: Linux (and Synaptics Touchpads) for Little Fingers'
wordpress_id: 11838
categories:
- Guides
tags:
- Guide
- HOWTO
- Kids
- Linux
- Synaptics
---

I'm not sure if this problem exists with many Linux distros on all laptops with Synaptics touchpads, or just Ubuntu on my Macbook 3,1, but as shipped it has a minor issue that has probably never reared its head for 99% of users: the touchpad only registers presses from adult-sized fingers.

Although my kid has long since figured out how to say "screw that" and reboot into Mac OS, I figured I should have a crack at fixing the problem.

The sensitivity of the touchpad is defined by two values, "FingerHigh" and "FingerLow".  These define the amount of contact between finger and touchpad that is required to register a click.  There are two values, High and Low, to introduce some hysteresis -- to stop a touch at just the right heaviness from repeatedly oscillating between touching and not-touching.  By default, these are set to 35 (FingerHigh) and 29 (FingerLow) -- perfect for grown-up fingers, but too high (too heavy a press) for three- and four-year-olds to comfortably use.

You can check the current values with `synclient`, for example:
   
    synclient | grep -e 'FingerHigh|FingerLow'

You can also use `synclient` to experiment with different values.  For the case of my son, I found that he was happy with **FingerHigh set to 16** and **FingerLow set to 10**.
    
    synclient FingerLow=10 && synclient FingerHigh=16

This allows a much smaller finger to register as a touch -- you can probably test it yourself with the edge of your little finger.  It won't register a touch at all with 35/29, but will at 16/10.

`synclient` is a convenient way to play around with the various options the Synaptics driver offers, but if you're happy with your changes, you'll probably want to make them permanent for all users rather than running them at login for each account.

Ubuntu, along with several other distros, has effectively deprecated the use of xorg.conf in favour of device-specific scripts inside `/usr/share/X11/xorg.conf.d`.  You may or may not have this directory, and if you do, you may or may not already have a file inside it called `50-synaptics.conf`.  Create the directory if necessary, then open the file (substituting `gedit` for your editor of choice):
    
    sudo mkdir /usr/share/X11/xorg.conf.d
    sudo gedit /usr/share/X11/xorg.conf.d/50-synaptics.conf

Edit the file to include Option lines that set your desired FingerHigh and FingerLow values.  Mine looks like this:
    
    Section "InputClass"
            Identifier "touchpad catchall"
            Driver "synaptics"
            MatchIsTouchpad "on"
            MatchDevicePath "/dev/input/event*"
            Option "FingerLow" "10"
            Option "FingerHigh" "16"
    EndSection

Save the file, and when you restart, your new settings will apply everywhere in X.
