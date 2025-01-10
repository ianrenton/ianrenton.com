---
comments: true
date: 2012-09-21 16:46:39
layout: post
slug: tank-day-18-hubs-and-clicks
title: 'Tank Day 18: Hubs and Clicks'
tags:
- Power Supply
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- USB
---

On [day 17](../tank-day-17-what-s-missing/), we identified two major issues with the Raspberry Tank's setup -- the Raspberry Pi's inability to power both the WiFi dongle and the camera via its USB ports, and that the "press and hold" web interface causes problems in mobile browsers (its main target).

Today, we fix both of those.

## Integrating a USB Hub

In order to supply the two power-hungry USB devices (and potentially others), we decided to integrate a USB hub into the tank.  To power the hub from the tank's internal battery, a [Recom R-78B5.0-1.5 switching DC/DC](http://uk.rs-online.com/web/p/products/6727155/?cm_mmc=UK-PPC-0212-_-03_Supplier_M-Z-_-Recom_DC_DC_Converters-_-R-78B5.0-1.5) was chosen. This is a slight variation on the part used to supply the Pi itself, differing only that it can supply 1.5A at 5V rather than only 1A.

This was connected up to the power pins of a [D-Link DUB-H4 powered USB hub](http://www.amazon.co.uk/D-Link-DUB-H4-USB-2-0-4-Port/dp/B00006B7DA/ref=sr_1_1?ie=UTF8&qid=1348241939&sr=8-1), chosen due to its convenient size for fitting inside the tank. (Its footprint is roughly identical to the smoker unit that was removed from the back.)

Originally, a smaller bus-powered hub was tried, with its host cable split to take its power from the DC/DC and its data from the Pi.  However, this did not work, and [I was duly schooled by Stack Exchange](http://electronics.stackexchange.com/questions/38335/drawing-100ma-common-ground-for-a-bus-powered-usb-hub). I then switched to the properly externally powered DUB-H4.

Inside the tank, the Raspberry Pi now sits quite neatly on top of the USB hub.  The electrical schematic now looks like this:

[![Raspberry Tank Schematic (Day 18)](/hardware/raspberry-tank/raspberry-tank-schematic-342x500.png)](/hardware/raspberry-tank/raspberry-tank-schematic-2.png)<br/>
_Raspberry Tank Schematic (Day 18)_

_You can download that as an SVG file here: [Raspberry Tank Schematic (Day 18)](/hardware/raspberry-tank/raspberry-tank-schematic-2.svg)_

## Modifying the Web GUI

By comparison, the quick hack to make the web GUI usable from mobile devices was very easy indeed - I simply removed the `onmouseup()` JavaScript from each button.  This means that when the user touches a button, the tank now performs that action until another button (such as STOP) is touched.  Although not an ideal way of exercising fine control over the tank, this at least means that the tank can carry out commands for more than the one second or so that mobile browsers take to open their "right click" window.

[You can see and download the new web UI code on GitHub.](https://github.com/ianrenton/raspberrytank/tree/master/web-ui)

Next time on the Raspberry Tank Build Diary, the tank will make the jump to [Rasbpian](http://www.raspbian.org/)!
