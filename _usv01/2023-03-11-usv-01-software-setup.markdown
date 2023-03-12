---
layout: post
title: "USV-01 Software Setup"
date: 2023-03-11 10:49
comments: true
categories:
---

## Initial Setup

The initial setup for the board was to download the latest "flasher" Debian image, load it onto an SD card, and boot the Beaglebone from it. This will automatically flash the on-board eMMC with the image from the SD card, which can then be removed. [Instructions are here.](https://beagleboard.org/static/librobotcontrol/flashing.html)

The Beaglebone Blue hosts its own WiFi access point by default, which is what I want for the USV. It's a bit of a faff to switch modes between that and having it join my own LAN, so for the times I've needed it to be connected to the internet (e.g. for package updates) I've used the USB interface to a computer, bridging the two connections, and running the following commands on the Beaglebone:

```bash
sudo /sbin/route add default gw 192.168.7.1
sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf
```

Once installed, `sudo dpkg-reconfigure librobotcontrol` ensures the librobotcontrol package (for connection to the MPU and servos) is set up, and `rc_test_drivers` should indicate that everything is OK.

For the servo test script, you'll need to be running version 1.0.5 or above of `librobotcontrol`. I had 1.0.4 installed as part of the base image, so I needed to update via `apt` to get it working.

## Setting time from GPS

Since the boat won't normally have an internet connection, and doesn't have a BIOS battery, it would be nice to set it up to automatically set its clock when it gets a GPS fix.

To do that, I installed the `gpsd` and `ntp` packages. I then configured `/etc/default/gpsd` as follows, using `/dev/ttyS2` which is the GPS port on the Beaglebone Blue:

```
DEVICES="/dev/ttyS2"
GPSD_OPTIONS="-n"
```

And to `/etc/ntp.conf` I added:

```
server 127.127.28.0 minpoll 4 maxpoll 4
fudge 127.127.28.0 time1 0.0 refid GPS
```

After restarting both services, and ensuring the GPS has a clear view of the sky, `ntpq -p` should show the local GPS in use as a time source, like so (note the asterisk next to the "GPS" line):

```
   remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*SHM(0)          .GPS.            0 l    9   16  177    0.000   20.575  11.972
 0.debian.pool.n .POOL.          16 p    -   64    0    0.000    0.000   0.002
 1.debian.pool.n .POOL.          16 p    -   64    0    0.000    0.000   0.002
 2.debian.pool.n .POOL.          16 p    -   64    0    0.000    0.000   0.002
 3.debian.pool.n .POOL.          16 p    -   64    0    0.000    0.000   0.002
```

## Receiving GPS Data

The GPS data is now coming in via the serial port, and being consumed by `gpsd`. This can be checked with the `cgps` command, which provides a visual output like so:

```
┌───────────────────────────────────────────┐┌─────────────────────────────────┐
│    Time:       2023-03-11T16:37:24.000Z   ││PRN:   Elev:  Azim:  SNR:  Used: │
│    Latitude:    (REDACTED) N              ││   8    34    282    35      Y   │
│    Longitude:    (REDACTED) W             ││  10    32    140    38      Y   │
│    Altitude:   124.672 ft                 ││  16    72    200    35      Y   │
│    Speed:      0.02 mph                   ││  18    39    056    37      Y   │
│    Heading:    0.0 deg (true)             ││  23    42    098    42      Y   │
│    Climb:      0.00 ft/min                ││  26    37    164    30      Y   │
│    Status:     3D FIX (8 secs)            ││  27    70    293    32      Y   │
│    Longitude Err:   +/- 37 ft             ││  15    05    051    00      N   │
│    Latitude Err:    +/- 46 ft             ││  21    04    232    17      N   │
│    Altitude Err:    +/- 187 ft            ││                                 │
│    Course Err:      n/a                   ││                                 │
│    Speed Err:       +/- 63 mph            ││                                 │
│    Time offset:     0.378                 ││                                 │
│    Grid Square:     IO90bs                ││                                 │
└───────────────────────────────────────────┘└─────────────────────────────────┘
```

This is great for setting the clock, but what about other software on the Beaglebone that's going to want to know where the boat is? I wanted to distribute the data in the traditional way, as NMEA-0183 format messages, and chose to use UDP for ease of implementation on the client end.

I had originally written some C code to do this direct from the serial port ([Beaglebone Blue GPS UDP Sender](https://github.com/ianrenton/beaglebone-blue-gps-udp-sender))&mdash;but with the port tied up by `gpsd`, that wasn't possible.

Luckily, there is a pre-built utility designed to work with `gpsd` that can do this for us&mdash;[gps2udp](https://gpsd.gitlab.io/gpsd/gps2udp.html). It will connect to the local `gpsd`, and broadcast the NMEA messages to UDP ports. It's available in the `gpsd-clients` package.

I set this up as a `systemd` service by creating `/etc/systemd/system/gps2udp.service` as follows:

```
[Unit]
Description=gps2udp
Requires=systemd-modules-load.service

[Service]
User=root
ExecStart=gps2udp -n -u 127.0.0.1:2011 -u 127.0.0.1:2012
Restart=always

[Install]
WantedBy=multi-user.target
```

And then set it up to run automatically as follows:

```bash
sudo systemctl daemon-reload
sudo systemctl enable gps2udp.service
sudo systemctl start gps2udp.service
```

Testing it by listening with `ncat -ul 2011` shows the messages we expect, as shown below. (The example shows messages before a fix is acquired; if your GPS has successfully acquired a fix you will see more data here.)

```
$GPRMC,,V,,,,,,,,,,N*53
$GPVTG,,,,,,,,,N*30
$GPGGA,,,,,,0,00,99.99,,,,,,*48
$GPGSA,A,1,,,,,,,,,,,,,99.99,99.99,99.99*30
```

## Receiving Heading Data

Since the GPS was set up to distribute NMEA-0183 format messages to local applications via UDP, I also wanted to use the heading data from the magnetometer in the same way. I created a simple C program to do that: [Beaglebone Blue Heading NMEA UDP Sender](https://github.com/ianrenton/beaglebone-blue-heading-nmea-udp-sender).

`sudo make install` builds it and sets it up to run automatically in the background.

Again, testing it by listening with `ncat -ul 2021` shows the messages we expect, as shown below.

```
$GPHDT,277.9,T*24
$GPHDT,275.1,T*2E
$GPHDT,279.9,T*2A
$GPHDT,275.9,T*26
```

Note that the talker ID used by this code is "GP", so the message will be "GPHDT". This is for compatibility with `gpsd`, which will ignore other talker IDs such as "HE" for a heading sensor. The setup to bring this data into `gpsd` is covered below.

## Combining the Two

To avoid programs needing two different ports for GPS and heading data, I decided to use `gpsd` to combine them. I updated `/etc/default/gpsd` to tell it to listen for UDP messages on port 2021 as well as the serial port:

```
DEVICES="/dev/ttyS2 udp://0.0.0.0:2021"
```

The output from `gps2udp` found by listening on port 2011 then had messages from both sources included:

```
$GPHDT,318.2,T*3D
$GPHDT,319.1,T*3F
$GPRMC,152539,V,(REDACTED),N,(REDACTED),W,0.0000,0.000,120323,,*28
$GPGSA,A,1,,,,,,,,,,,,,,,,*32
$GPHDT,318.1,T*3E
$GPHDT,317.7,T*37
```

## Controlling the Motors

Just like getting MPU data, controlling the servo outputs is done in C using `librobotcontrol`. I wanted to expose this control to all sorts of programs on board, so as with the code above, I made a simple C program which accepts UDP packets and uses them to issue demands to the throttle ESC and rudder servo.

*(Completed soon, watch this space!)*

## Control System

With the ability to receive position and heading data, and control the propeller and rudder, all that's left is to tie the two together with a control system that will allow the USV to follow a mission autonomously.

Unfortunately, that's the point this guide stops.

As with my other hobby autonomous systems, I'm going to stop short of publishing any code that contains real control logic&mdash;even though I'm doing this in my spare time, that's getting much too close to the "day job" with all its concerns about intellectual property. If you're recreating this build for yourself, there are a number of open source software frameworks that should work fine on this platform, such as [ROS](https://www.ros.org/) and [MOOS-IvP](https://oceanai.mit.edu/moos-ivp/pmwiki/pmwiki.php?n=Main.HomePage), and in finest academic tradition, implementing them is left as an exercise for the reader.