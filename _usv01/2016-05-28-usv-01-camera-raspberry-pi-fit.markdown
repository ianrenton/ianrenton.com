---
layout: post
title: "USV-01 Camera & Raspberry Pi Fit"
date: 2016-05-28 16:22
comments: true
categories: 
---

In addition to the standard RC receiver [fitted previously](../usv-01-rc-electronics-fit), the USV will also need to be fitted with a set of hardware for autonomous control and remote monitoring.

For test purposes, a GoPro clone was initially fitted. Because we may want to remove this in future, for example to fit a Raspberry Pi camera instead, a mounting bracket was fixed to the hull using strong adhesive tape rather than a through-hull screw mount.

![GoPro Mount](/hardware/usv-01/gopromount.jpg){: .center}

The camera is then affixed to this when in use. The camera was fitted quite far forward in order to maintain a good centre of gravity. In testing, these boats tend to pitch up significantly when travelling at speed, so keeping the centre of gravity as far forward as possible will help keep the boat stable.

![GoPro fitted](/hardware/usv-01/goprofitted.jpg){: .center}

The USV now looks rather top-heavy, although the camera is light for its size, and the majority of the boat's mass still belongs to the batteries and motor that sit on or below the water line.

![Top heavy](/hardware/usv-01/goprotopheavy.jpg){: .center}

The Raspberry Pi was then prepared for testing. You may notice that this is an old Raspberry Pi Model B rather than the Raspberry Pi 3 specified in the [schematics](../usv-01-schematics), and that the servo control board is a model that attaches to the GPIO header rather than USB. For this test, old parts borrowed from my [Quadcopter](../quadcopter) have been used, as the full set of USV-01 parts have not been purchased yet. Still, the functionality is the same and can properly de-risk the integration of the real hardware at a later date.

![Raspberry Pi and Servo board](/hardware/usv-01/rpi.jpg){: .center}

This servo board has one advantage over the USB version, in that it can back-power the Raspberry Pi directly from the ESC BEC, so the only wiring required is direct to the throttle ESC and rudder servo.

![Raspberry Pi attached to servo leads](/hardware/usv-01/piontop.jpg){: .center}

Fitting the Pi is a bit of a squeeze, not helped by the large WiFi antenna required to get a decent range. Again, this is the 2.4GHz antenna from the quadcopter, and the final version will seek to replace this with a 5GHz version so as not to conflict with the 2.4GHz RC signal&mdash;provided a 5GHz device can meet the power and range requirements.

![Raspberry Pi fitted inside USV](/hardware/usv-01/pifitted.jpg){: .center}

Since I've borrowed the Pi from the quadcopter, it works straight away with no extra setup&mdash;Access Point settings etc. were pre-configured. If you're following along at home, I have [instructions for this when I did it for the tank](../tank-day-22-i-occidentally-a-whole-access-point/). It was thus very simple to power up, connect to the WiFi, SSH in and send some UART commands to test the motors.

<center><video width="640" controls><source src="https://video.ianrenton.com/usv01/sshcontrol.mp4" type="video/mp4"></video></center>
