---
comments: false
layout: page
slug: index
title: Gecko Cam
---

The "Gecko Cam" is the instrumentation and automation setup for our pet gecko Rimbaud's vivarium.

At the moment, there is very little automation involved. Initially I had intended to automate a heat mat and a misting system to regulate the temperature and humidity in the vivarium. As it currently stands these parameters are monitored but not controlled.

The setup is based around a Raspberry Pi Model A+, along with a NoIR camera and AM2315 thermometer & hygrometer. Sensor data is recorded every 15 minutes, and used to generate graphs and send emails if either temperature or humidity goes out of pre-set limits. It is connected to the internet and will also upload the graphs and a photo to a web server.

![](/geckocam/geckocam.jpg){: .center}

The AM2315 sensor uses the I2C protocol, which was chosen over the cheaper thermometer and hygrometer sensors that bit-bang their output. The connection to the Pi is currently made via a breadboard for testing; this will be made into a proper connector for the Pi's GPIO pins in due course.

![](/geckocam/geckocam-breakout.jpg){: .center}

You can see the output of the system, published on the web at [rimbaud.renton.es](http://rimbaud.renton.es). Software can be downloaded from [the project GitHub page](http://github.com/ianrenton/geckocam), which also explains more about the software side of the setup.
