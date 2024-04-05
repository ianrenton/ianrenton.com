---
comments: true
layout: post
title: "Track 10: Movin' On Up"
slug: track-10-movin-on-up
date: 2024-04-01 12:55:00
layout: post
---

<div class="notes"><p><strong>Note</strong></p><p>This part of the build is still a work in progress, and the design presented is untested. If you are following along at home, you may wish to pause here until this part of the guide is completed.</p></div>

## Hardware Upgrades

There were a few weaknesses with the build as it stood at the end of the previous step:

* The new electronics don't fit inside the fish enclosure. (I'm not sure they ever will without some fancy PCB design, but we can get closer.)
* The solderless breadboard is quite fragile, particularly the JST XH connectors which have quite short legs and regularly fall out.
* The L298N motor driver drops up to 1.4V between the supply voltage and what actually gets sent to the motors, which means the head in particular doesn't stand out as far as it could.
* The 5V output from the L298N sometimes browns out the ESP32 under heavy motor load, so that the program stops running.
* It's quite fiddly to remove the SD card around the wiring.

The next stage was to upgrade the design to rectify these problems.

I made the following decisions:

* Replacing the solderless breadboard with perfboard, to improve robustness.
* Keeping the JST XH connectors for integration with the fish, all located at one end of the board.
* Swapping the L298N motor driver for a TB6612, to reduce the volt drop when driving the motors and allow integration onto the board with other components.
* Taking the 3-cell (4.5V) level from the batteries to drive the electronics, leaving the 4-cell (6V) level for the motors, similar to what the original board does.
* Ensuring the SD card ejects to the edge of the board for easy access.

My first step was to redesign the layout of the electronics around perfboard rather than the typical solderless breadboard layout. I used [Veroroute](https://sourceforge.net/projects/veroroute/) for this. After a while of moving components around, I settled on the following layout to meet the above requirements:

![Veroroute design](/projects/big-mouth-phatt-bass/veroroute.png){: .center}

The design was made to fit within the bounds of a common 30x26 hole perfboard sheet. JST connectors are located at the top in a neat row; a TB6612 motor driver is used, 4.5V from the batteries is used to power the electronics, and the SD card ejects to the right-hand side.

In order to neatly line up the motor driver board with the ESP32, I have made a minor change to the schematic. To allow space for the TB6612's "standby" pin, control of the mouth motor has moved from pins D27/D26/D25 to D26/D25/D33.

The schematic for the new board is as follows:

<div class="breakout-full-width"><center><a href="/projects/big-mouth-phatt-bass/schematic-perfboard.png">
<img src="/projects/big-mouth-phatt-bass/schematic-perfboard.png" alt="Schematic"/></a>
</center></div>

**TODO: Build photos**

## Software Upgrades

The major software upgrade I wanted to make was supporting multiple songs, without having to re-flash different versions of the code.

To do this, I defined a new interaction, a long press of the button. This is used to change the track that will play when the button is short-pressed.

The code then includes all the lip-sync functions, and the SD card contains all the songs, both in the same order. The LED is used to indicate the number of the track that will play.

This is unfortunately incompatible with "sensor mode", as reaching for the button to do a long press will almost certainly trigger playback based on the change in light level caused by the operator's hand. "Sensor mode" therefore is set up only to play *Phatt Bass*, while in "normal mode" each of the loaded songs can be selected.

Finally on the software front, I have switched from the Arduino IDE to the [Platform.io IDE](https://platformio.org/) inside Visual Studio Code. This allows for better code completion, syntax highlighting, and other "proper IDE" features. I am still using the Arduino-ESP32 toolkit on the device to provide the familiar `setup()` and `loop()` methods etc., rather than moving to the underlying ESP-IDF toolkit.

The source code is now getting large enough that it's difficult to keep including it on web pages, so I have moved it to Github. You can access it here:

[https://github.com/ianrenton/big-mouth-phatt-bass](https://github.com/ianrenton/big-mouth-phatt-bass)