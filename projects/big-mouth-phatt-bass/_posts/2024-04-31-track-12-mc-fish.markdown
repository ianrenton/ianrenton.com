---
comments: true
layout: post
title: "Track 12: MC Fish"
slug: track-12-mc-fish
date: 2024-04-31 00:00:00
last_update: 2024-05-18 00:00:00 
layout: post
---

Thanks to the new PCB, the electronics are fully enclosed. However, we have added a couple of new limitations.

Firstly, the ESP32 Devkit's on-board LED was used to indicate the starting mode and which track number was selected. That's now no longer visible.

I did think about replacing the rarely-used LDR on the front of the unit with an LED, but in the end I decided I'd rather keep the functionality. Instead, I took advantage of the MP3 player's ability to manage multiple folders. In one, I put the music MP3s themselves; in the other I put a set of "announcer" voices that play at startup (to indicate the mode) and on a long button press (to indicate the track). I generated these using the `gtts` library for Python, which provides a command-line interface to Google's text-to-speech service, like this:

```bash
gtts-cli "Track 1. Fat Bass." -o 001.mp3
```

The code was then [updated](https://github.com/ianrenton/big-mouth-phatt-bass/commit/737693a2ed3358079e9a240b01f7f0f896ba39de) to use this approach instead of the LED flash.

When using folders, rather than playing "global" MP3 files, the files can no longer have descriptive names and must be named specifically `XX/YYY.mp3` where `XX` is a zero-padded folder number, and `YYY` is a zero-padded track number. So for example, I have `01/001.mp3` as the Phatt Bass *song*, and `02/001.mp3` as the announcer voice that says "Track 1". I also added a special announcer track as `02/099.mp3` to say "sensor mode enabled" at startup if in that mode.

[Click here to download the contents of the SD card that go with the code.](/files/projects/big-mouth-phatt-bass/sdcard.zip)

The other limitation is that if I want to reprogram the device or add new songs, I'd need access to the ESP32 Devkit micro-USB socket and SD card, which requires taking the unit apart. As a quick and dirty solution, since we already have a hole drilled in the back, I chose to fit a USB cable through it to make the ESP32 accessible from the outside. This has the extra advantage that (with a high enough current available), a USB port or power bank can be used to power the whole thing, rather than relying on the quickly draining AA batteries. Surprisingly, the motor control is still good with only this 5V USB supply, and the 6V seems almost unnecessary. In fact there can be a bit of a disadvantage to powering only off the 6V batteries if they are not at full capacity, see [A Note on Board Restarts](/projects/big-mouth-phatt-bass/a-note-on-board-restarts).

I did also experiment with a microSD card "extender" to bring that out as well, but struggled to get it working. In future I may improve this to mount an SD card extender internally but accessible through a dedicated slot on the outside (if I can get one working), and fit a bulkhead mounted microUSB socket. I can't un-drill my hole, but it would provide a neater solution for anyone following the guide in future.

And that's about it! Nothing left to do but think of more silly things for a Billy Bass to sing and lip-sync to.

![Billy Bass and a pile of electronics gear. The magnifying glass of the "helping hand" is magnifying the eye of the fish.](/img/projects/big-mouth-phatt-bass/27.jpg){: .center}

## The Future is Fishy

A future project re-using the fish may take advantage of the ESP32's Bluetooth receiver and replace the MP3 player with an audio amplifier. With some code to automatically detect and react to audio, rather than our current scripted lip-syncing, I may repurpose the Billy Bass as a Google Assistant speaker or car sat-nav.
