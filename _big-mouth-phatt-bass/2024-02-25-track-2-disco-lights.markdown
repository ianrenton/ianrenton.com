---
comments: true
layout: post
title: "Track 2: Disco Lights"
slug: track-2-disco-lights
date: 2024-02-25 00:00:00
layout: post
---

I decided that a single board computer such as a Raspberry Pi (even the Nano models) was overkill for the job of driving a couple of motors and playing an MP3, so for the first time in [a while](/hardware/lego-turtle/) I'm back playing with microcontrollers. In this case I decided to try out the ESP32.

This was my first time playing with ESP32 boards, so I decided to use the Arduino IDE to program it.

As well as installing the IDE itself, I needed `pyserial` installed (which was not installed by default), and I needed to add myself to the correct group for accesing serial devices.

On Manjaro that looks like:

```bash
sudo pamac install arduino python-pyserial
sudo useradd -aG uucp $USER
```

(Some other Linux distros use `dialout` in place of `uucp`, so check the instructions for yours. There's plenty of instructions out there for Windows and Mac too.)

Within the Arduino IDE, I had to set up an Additional Board Manager URL, then open the Board Manager and install the `esp32` data, [following instructions here](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html).

(image)

After selecting the board and the serial port, I flashed a quick demo program to toggle the on-board LED and prove the device was working:

```cpp
#define LED 2

void setup() {
  pinMode(LED,OUTPUT);
}

void loop() {
  delay(500);
  digitalWrite(LED,HIGH);
  delay(500);
  digitalWrite(LED,LOW);
}
```

So far, so good. The next job I attempted was getting control over the fish's motors so I could start flapping it around.
