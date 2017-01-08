---
layout: post
title: "Vivarium Automation: Requirements and Component Spec"
date: 2015-07-18 12:31
comments: true
categories:
- Projects
- Hardware
tags:
- Gecko
- Vivarium
- Automation
- Raspberry Pi
- Sensors
---

It's a little over a month until we are getting our first pet - a [crested gecko](https://en.wikipedia.org/wiki/Crested_gecko). Joseph has decided that if it's female it will be called "Scarlet", and Eric has decided that if it's male it will be called "Rimbaud" after the surrealist poet, partially because it is also a homonym of "Rambo". I almost hope we get a female as it will be easier to explain.

In the mean time, we are getting our vivarium set up ready for our pet. We have just about everything we need, but managing the environment is a manual process &mdash; turning the lights on in the morning and off in the evening; maintaining heat and humidity.

![Vivarium](https://files.ianrenton.com/sites/blog/2015/vivarium.jpg){: .center}

> Vivarium shown here with simulated occupant.

This is crying out to be an electronics project, so I'm going to make it one! In this post I've laid out my initial requirements and listed some suggested components. I'll probably do one or two more covering the actual hardware build and software when the components arrive.

## Requirements

My requirements for the automated vivarium system are that it must:

1. Automatically turn the 12V DC LED light panel on and off at a defined schedule
2. Monitor temperature and humidity inside the vivarium
3. Automatically control the 240V AC 10W heat mat to keep the temperature within defined bounds
4. Send email alerts if temperature and humidity exceed the defined bounds
5. Take regular photos of the inside of the vivarium
6. Regularly post photo, temperature, humidity and status information to another computer for display on a website
7. Fit in a 450x80mm space next to the vivarium (except components that must go inside)
8. Be powered from a household 240V AC supply
9. Not expose 240V AC to the probing fingers of children.

## Initial Design

The requirements to operate the lights at specific times of day (requiring a proper clock), to send emails, to use a camera and to send files to a computer all push the design towards one including a "proper" small form factor computer rather than a basic microcontroller. Due to my familiarity with the hardware I have chosen a Raspberry Pi for this system. The Model A should be sufficient for the system's limited requirements.

The Raspberry Pi's official camera modules are easy to use and have good performance due to dedicated processing on the Pi's GPU. I have chosen the "NoIR" camera, which lacks the IR filter of the standard camera, to improve visibility of the gecko at night. No IR illuminator is proposed as this may interfere with the lizard's sense of time or temperature regulation.

The proposed AM2315 thermometer and hygrometer module is comparatively expensive, but comes inside a tough enclosure with a wall mount and uses the standard I2C protocol, compared to the proprietary bit-banging protocols of the cheap sensors.

Relays will be used to switch the lights and heat mat power on and off. A breadboard will be mounted to a Raspberry Pi case to keep the hardware neat while allowing for easy extension in future.

## Component List

Here's my list of the components, along with links to buy them. All but one are available on Amazon in the UK; the thermometer/hygrometer seems to be an Adafruit special and will have to be imported from the US.

| **Component**         | **Choice**                | **Price / GBP**&nbsp;&nbsp;&nbsp;   | **Link**                                                                                                                                                               |
|-------------------|-----------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Computer          | Raspberry Pi Model A+ | 18.00         | [Amazon UK](https://www.amazon.co.uk/Raspberry-Pi-Model-Plus-Motherboard/dp/B00Q8MM4PI/ref=sr_1_1?ie=UTF8&qid=1437214626&sr=8-1)           |
| Wifi Dongle       | Ralink RT5370         | 4.71          | [Amazon UK](https://www.amazon.co.uk/USB-Wifi-Adapter-Raspberry-Pi/dp/B00EZOQFHO/ref=sr_1_7?ie=UTF8&qid=1437212416&sr=8-7)                         |
| GPIO Breakout     | Pi Cobbler            | 10.00         | [Amazon UK](https://www.amazon.co.uk/Adafruit-Cobbler-Breakout-Kit-Raspberry/dp/B0093K6QQ0/ref=sr_1_2?ie=UTF8&qid=1437212508&sr=8-2)       |
| SD Card           | Kingston 8GB          | 4.00          | [Amazon UK](https://www.amazon.co.uk/Kingston-Technology-microSDHC-Class-adapter/dp/B004S1PNE0/ref=sr_1_3?ie=UTF8&qid=1437213057&sr=8-3)            |
| Breadboard        | BB400                 | 1.15          | [Amazon UK](https://www.amazon.co.uk/BB400-Solderless-Plug-BreadBoard-tie-points-White/dp/B0040Z1ERO/ref=pd_bxgy_23_img_z)                                               |
| Jumpers           | Generic               | 1.07          | [Amazon UK](https://www.amazon.co.uk/Conductor-Female-Jumper-Color-Ribbon-Male-20cm/dp/B00ATMHU52/ref=pd_sim_23_6?ie=UTF8&refRID=0NRJATBTKFQ2DDHFQ73D)                   |
| Power Supply      | Generic               | 6.00          | [Amazon UK](https://www.amazon.co.uk/NorthPada-Supply-Charger-2000mA-Raspberry/dp/B00MTX9GD8/ref=sr_1_1?ie=UTF8&qid=1437213151&sr=8-1) |
| Case              | Model A Case          | 4.49          | [Amazon UK](https://www.amazon.co.uk/Case-Raspberry-Model-Plus-Colour/dp/B00PR2RX7Y/ref=pd_bxgy_147_img_y)                                                               |
| Temp/Humid Sensorr | AM2315                | 19.97         | [Adafruit](https://www.adafruit.com/products/1293)                                                                                                                      |
| Camera            | Raspberry Pi NoIR     | 19.13         | [Amazon UK](https://www.amazon.co.uk/Raspberry-Pi-NoIR-Camera-Module/dp/B00G9AZ79O/ref=sr_1_2?ie=UTF8&qid=1437211577&sr=8-2)                |
| Suction cups      | Generic               | 3.57          | [Amazon UK](https://www.amazon.co.uk/47mm-Clear-Plastic-Suction-Clamp/dp/B0058MWRL0/ref=sr_1_12?ie=UTF8&qid=1437211683&sr=8-12)                    |
| Relay Board       | Facilla 2-channel     | 1.13          | [Amazon UK](https://www.amazon.co.uk/FACILLA-2-Channel-Module-Arduino-Electronic/dp/B009P04ZKC/ref=sr_1_2?ie=UTF8&qid=1437212056&sr=8-2)     |
| Enclosure for mains relay&nbsp;&nbsp;&nbsp;       | Generic black ABS 150x80x50&nbsp;&nbsp;&nbsp;      | 5.90          | [Amazon UK](https://www.amazon.co.uk/gp/product/B00IFG33FA/ref=oh_aui_detailpage_o07_s00?ie=UTF8&psc=1)     |
| Enclosure glands       | Generic M12x1.5     | 1.59          | [Amazon UK](https://www.amazon.co.uk/gp/product/B00B0Q7DTO/ref=oh_aui_detailpage_o06_s00?ie=UTF8&psc=1)     |
|                   | **Total:**            | **100.71**         |      |

Stay tuned for build photos, schematics and source code once all the components arrive!

*Update: It turns out the heat mat was bought with its own dedicated thermostat. With this in mind I've decided to ditch the timed control of the lights and use a standard mains plug timer instead. This will be easier for people to override if necessary, rather than depending on whatever software interface I provide.*

*Since the system is therefore not controlling anything I can ditch the relay board and the requirement to use a proper glanded enclosure to protect the 240V AC switching relay. It will still take photos, monitor temperature and humidity, display them on the web, and email on important events.*
