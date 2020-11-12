---
author: Ian
comments: true
date: 2012-07-19 22:03:29
layout: post
slug: tank-day-17-whats-missing
title: 'Tank Day 17: What''s Missing'
wordpress_id: 13068
categories:
- Projects
- Raspberry Tank
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
---

At the end of Day 16, I mentioned that there a couple of issues preventing me from putting the Raspberry Pi back in the tank and driving it around via the web interface.  They are:

  * **Power consumption.**  Although the Pi can just about cope with supplying power to the WiFi dongle, the addition of the webcam tips it over the edge.  Although my wall-socket USB supply can push enough power for the Pi, dongle and camera, the switching DCDC that I use internally cannot.  Many users on the Raspberry Pi forums have mentioned the need for an externally powered USB hub, so to be honest I was surprised that I got this far without one.
  * **Smartphone browser press-and-hold.** The tank's web interface, with its "press and hold" control buttons, has one very important flaw -- "press and hold" is a mobile browser's equivalent of a right click.  The user can't actually hold a button down for more than half a second without being presented with a menu by the browser itself.

These issues will be addressed over the next few days on the Raspberry Tank Build Diary.

There are also some more improvements to make in the future (excluding the development of the autonomy software and associated sensors).  They are:
	
  * **Audio output.**  The Pi has a "line out" audio output, which is not powerful enough to directly drive the tank's speaker.  Adding an audio amplifier circuit would allow the Pi to make noise, including text-to-speech.
  * **Video recording.** We can currently stream video from the tank to the web interface, but it would be good if the tank could simultaneously save video to its own storage or an attached memory stick.
  * **Raspbian Linux.**  A new Linux distro has been released that offers substantial performance improvements as it has been tailored specifically for the Raspberry Pi.  Although performance is satisfactory at the moment, we may need to upgrade at some point in the future.
  * **Dual mode WiFi.**  If the tank cannot see a wireless network that it knows, I would like it to start its own that users can connect to using their phones/tablets.
  * **An App of its own.**  Writing a dedicated Android or iOS app for the tank would allow me to get over the web interface's "click and hold" problem, and would also allow for multiple simultaneous controls (e.g. turn left & turret right) via multi-touch.

[![Mostly Assembled Tank](/hardware/raspberry-tank/IMG_20120712_145425-600x358.jpg)](/hardware/raspberry-tank/IMG_20120712_145425.jpg)

And finally, the road to autonomy:
	
  * **GPS.**  GPS is certainly an option, and it's easy to integrate.  However, GPS accuracy is around 10-20m which is itself a significant journey for the tank, so this kind of large-scale outdoor autonomy may be out of the question.
  * **Indoor mapping.**  Ultrasound rangefinders could be added to the vehicle to allow it to map its surroundings.  They would have to be combined with an inertial navigation system consisting of a solid state magnetometer, accelerometer and gyroscope.  These can be purchased as a single device with many protocol options.  I2C is supported by the Raspberry Pi's GPIO, so this seems a logical choice.
  * **Machine vision.** If the Pi's processing power is up to the job, machine vision can be used to allow behaviours such as following a laser pointer dot.  Target recognition (facial recognition?) may also be possible.
  * Plus whatever else the internet can think of for me to do with this thing! :)

