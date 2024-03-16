---
comments: true
layout: post
title: "Track 4: Bringing the Noise"
slug: track-4-bringing-the-noise
date: 2024-03-17 00:00:00
layout: post
---

The next step in building the *Phatt Bass* was audio output. While there *are* [approaches to playing audio directly from an ESP32 chip](https://www.hackster.io/electronicsworkshop111/esp-32-based-audio-player-6a6bee), they are rather hacky, involving opening a .wav file in a hex editor and copying the raw hex into your program. Given that, even with that approach, we still need an audio amplifier board, I chose instead to use an [MP3-TF-16P](https://www.aliexpress.com/i/1005004349864122.html). This has an SD card slot from which it can play MP3s directly, taking play/pause/etc. commands via external button pushes or serial commands. It has its own on-board amplifier, so it's really a full implementation of an MP3 player in one tiny $1 board.

<div class="notes"><p>Note if following along at home, that this board is pin-identical to the DFmini Player, which you may be able to find more easily where you are. However, there <a href="http://digitaltown.co.uk/components17dfminiplayer.php">are some differences in behaviour</a> to be aware of.</p></div>

The speaker in a Billy Bass is a standard 8Ω model, so it can be driven directly from the output of the MP3-TF-16P. The board takes 5V input, which we have available.

I chose to use a serial interface with the ESP32 board to issue it commands. Its serial interface uses 3V3 levels, which luckily matches what's used on the ESP32. You may see [online guides adding a resistor](https://www.instructables.com/Tutorial-of-MP3-TF-16P/) or a level converter here when working with an Arduino's 5V serial levels; [this is not needed](https://forum.arduino.cc/t/esp32-and-dfplayer-mini-mp3-player/1008766/10) for ESP32.

After connecting up the new board to power, speakers and to Serial 2 on the ESP32, we now have the following:

[![Wiring diagram](/projects/big-mouth-phatt-bass/fritzing-motors-audio_schem.png){: .center}](/projects/big-mouth-phatt-bass/fritzing-motors-audio_schem.png)

[![Breadboard layout diagram](/projects/big-mouth-phatt-bass/fritzing-motors-audio_bb.png){: .center}](/projects/big-mouth-phatt-bass/fritzing-motors-audio_bb.png)

![A breadboard and a mess of wiring connected to two halves of a Billy Bass](/projects/big-mouth-phatt-bass/10.jpg){: .center}


TODO - control commands, audio output
