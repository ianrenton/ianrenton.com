---
comments: true
layout: post
title: "Part 1: Prototype"
slug: part-1-prototype
date: 2025-01-25 00:00:00
---

My starting point for this project was the work done on the [Big Mouth Phatt Bass](/projects/big-mouth-phatt-bass), my previous fishy project. The microcontroller, motor driver and the fish itself were unchanged; the only real difference is replacing the MP3 player board with an audio amplifier, so that instead of the music coming from a dedicated player, it comes direct from the ESP32. This then allowed me to write software that took a Bluetooth audio input, sent it to the I2S amplifier for playback, and triggered fish movement based on the content of that audio.

I chose the common MAX98357A audio amplifier, [originally from Adafruit](https://learn.adafruit.com/adafruit-max98357-i2s-class-d-mono-amp/overview) though I expect mine was a clone. This is well documented online, and the use of the I2S digital standard for audio meant I didn't have to worry about audio synthesis on the ESP32 or current draw from its pins.

I jumped into some breadboard prototyping, but since the motor control aspect was already well understood, I did not bother with that and only tested the audio amplifier. I set up the breadboard like this:

![Fritzing diagram of breadboard wired up](/img/projects/bluetooth-bass/fritzing-audio.png){: .center}
<br/>

With reference to [this helpful guide](https://github.com/tierneytim/btAudio), I coded up the ESP32 to behave as a Bluetooth A2DP receiver, which would play the audio it received via I2S using three pins: 18 for WS (left/right channel select), 19 for BCLK (bit clock) and 21 for data.

![Billy bass connected to breadboard with ESP32 and audio amp](/img/projects/bluetooth-bass/audio-test.jpg){: .center}
<br/>

With the fish's speaker pins connected, this allowed me to play audio from my phone.

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/bluetooth-bass/speaker-test.webm" type="video/webm"></video></center>

The next step was to trigger motor movement based on the audio. Now the caveat here is that the ESP32's capability in this regard is very limited. Between the Bluetooth audio reception, the I2S output, and an FFT to detect audio, the device's program memory is 90% full and I had to split processing across both cores. About all I could manage was to stick the head out and flap the mouth in time to *any* audio. This means that while the effect is good for voice assistant responses, it's not great for music.

What I originally wanted to achieve was a fish that did this only for the *vocals* of a song, and otherwise flapped its tail to the beat. Feel free to play around with FFT bins and levels if you like, but I suspect this is not achievable with the chosen hardware&mdash;detecting vocals in music is a very difficult job. As a future upgrade I may instead use a Raspberry Pi Zero 2W, running [webrtcvad](https://github.com/wiseman/py-webrtcvad) or similar software. The rest of the hardware could be adapted to the Pi Zero as well, for example a [HiFiBerry DAC](https://thepihut.com/products/hifiberry-dac-zero) and [motor driver HAT](https://thepihut.com/products/motor-driver-hat-for-raspberry-pi-i2c).