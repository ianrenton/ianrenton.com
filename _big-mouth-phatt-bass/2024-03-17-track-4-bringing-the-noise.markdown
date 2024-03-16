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

I used example code from [this page](http://digitaltown.co.uk/components17dfminiplayer.php), replacing `Serial3` with `Serial2` in their examples, to prove that the ESP32 was communicating properly with the MP3-TF-16P:

![A photo of a screen showing a serial monitor window with some debug information, and the project in the background](/projects/big-mouth-phatt-bass/11.jpg){: .center}

I then loaded a single test MP3 onto the SD card. After some playing, and with reference to both the previous link and [the serial interface details for the board](https://cahamo.delphidabbler.com/resources/dfplayer-mini), I settled on the following code to set the volume level, and play a 30-second clip of that MP3.

```c
void setup() {
  // Set up serial comms to MP3-TF-16P
  Serial2.begin(9600);
  while (!Serial2);
  changeVolume(20);
  playTrack(1);
  delay(30000);
  stop();
}

void loop() {
}

// Play a specific track number
void playTrack(int tracknum) {
  sendCommandToMP3Player(0x03, tracknum);
}

// Stop the music
void stop() {
  sendCommandToMP3Player(0x16, 0);
}

// Set volume to specific value
void changeVolume(int thevolume) {
  sendCommandToMP3Player(0x06, thevolume);
}

// Send a command to the MP3-TF-16P. Some commands support one or two bytes of data
void sendCommandToMP3Player(byte command, int dataBytes) {
  byte commandData[10];
  byte q;
  int checkSum;
  commandData[0] = 0x7E; //Start of new command
  commandData[1] = 0xFF; //Version information
  commandData[2] = 0x06; //Data length (not including parity) or the start and version
  commandData[3] = command; //The command
  commandData[4] = 0x01; //1 = feedback
  commandData[5] = highByte(dataBytes); //High byte of the data
  commandData[6] = lowByte(dataBytes); //low byte of the data
  checkSum = -(commandData[1] + commandData[2] + commandData[3] + commandData[4] + commandData[5] + commandData[6]);
  commandData[7] = highByte(checkSum); //High byte of the checkSum
  commandData[8] = lowByte(checkSum); //low byte of the checkSum
  commandData[9] = 0xEF; //End bit
  for (q = 0; q < 10; q++) {
    Serial2.write(commandData[q]);
  }
  delay(100);
}
```

Now we can play music, it's time to decide what to play!