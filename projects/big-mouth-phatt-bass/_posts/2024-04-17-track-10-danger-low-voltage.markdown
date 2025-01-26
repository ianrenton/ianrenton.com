---
comments: true
layout: post
title: "Track 10: Danger! Low Voltage!"
slug: track-10-danger-low-voltage
date: 2024-04-17 17:14:00
layout: post
---

One of the problems you may have noticed in previous videos is how far the fish head sticks out&mdash;not very far at all! I think it's probably only 10-20 degrees, enough that the original Chop Suey video is funny, but nowhere near as far as an unmodified Billy Bass.

Applying the full 6V supply to the head/tail motor makes it stick out properly:

![Billy Bass with its head stuck out, breadboard and various clutter in the background](/img/projects/big-mouth-phatt-bass/21.jpg){: .center}

So what's going on?

The L298N motor driver is the culprit here. It uses a [Darlington Pair](https://en.wikipedia.org/wiki/Darlington_transistor) transistor approach which ends up dropping ~1.4V between the supply and what's actually sent to the motors, which in the Billy Bass significantly reduces their motion.

It actually has another problem as well in terms of the current it can supply. We are using it not only to drive the motors but also to provide a 5V output for the other electronics, but under heavy load, it often drops the 5V output low enough that the ESP32 board browns out, stopping the program.

There must be a better way, and there is. And it's smaller and costs less, leading me to wonder why I ever went for the L298N in the first place! I guess it was a common enough hobby motor driver that many folks recommended it.

The replacement I'm using is a TB6612FNG (specifically a [cheap AliExpress knock-off](https://www.aliexpress.com/item/1005005756666126.html)). The product name amusingly includes "Better than L298N", so I am for sure not the first person to be in this situation! Its design allows the full drive voltage to get through to the motors, so the effect of the fish movement is much improved:

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/phattbass/phattbass3.webm" type="video/webm"></video></center>

It doesn't have its own regulator to produce 5V for the other boards, but we never really needed that anyway. Back at the start of the guide, we identified wires from the battery compartment that provided a potential difference across three cells rather than the full four&mdash;i.e. 4.5 Volts rather than the full six. 4.5V is within the supply range for the ESP32 Devkit and the MP3 player, so I chose to just use that instead.

(However, note that this new design still sometimes has ESP32 brown-out issues. See [A Note on Board Restarts](/projects/big-mouth-phatt-bass/a-note-on-board-restarts).)

Finally, the TB6612 is just smaller and comes with standard PCB header pins underneath, making the whole thing much easier to slap on the breadboard.

![Billy Bass with breadboard behind it showing the new set of components](/img/projects/big-mouth-phatt-bass/22.jpg){: .center}

The components are now as small as they're reasonably going to get, which leads neatly onto the next stage&mdash;one final push to get the components back inside the fish, and improve robustness at the same time.

## Bonus Software Updates

Over the past couple of weeks I have also made a few changes to the software. The major upgrade I wanted to make was supporting multiple songs, without having to re-flash different versions of the code.

To do this, I defined a new interaction, a long press of the button. This is used to change the track that will play when the button is short-pressed.

The code then includes all the lip-sync functions, and the SD card contains all the songs, both in the same order. The LED is used to indicate the number of the track that will play.

This is unfortunately incompatible with "sensor mode", as reaching for the button to do a long press will almost certainly trigger playback based on the change in light level caused by the operator's hand. "Sensor mode" therefore is set up only to play *Phatt Bass*, while in "normal mode" each of the loaded songs can be selected.

Finally on the software front, I have switched from the Arduino IDE to the [Platform.io IDE](https://platformio.org/) inside Visual Studio Code. This allows for better code completion, syntax highlighting, and other "proper IDE" features. I am still using the Arduino-ESP32 toolkit on the device to provide the familiar `setup()` and `loop()` methods etc., rather than moving to the underlying ESP-IDF toolkit.

The source code is now getting large enough that it's difficult to keep including it on web pages, so I have moved it to Github. You can access it here:

[https://github.com/ianrenton/big-mouth-phatt-bass](https://github.com/ianrenton/big-mouth-phatt-bass)

