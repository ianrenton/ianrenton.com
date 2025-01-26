---
comments: true
layout: post
title: Quick Start Guide
date: 2024-05-02 00:00:00
redirect_from:
  - /projects/big-mouth-phatt-bass/start
  - /projects/big-mouth-phatt-bass/start/
---

Looking to recreate the Big Mouth Phatt Bass for yourself? You've come to the right place.

The development process is exhaustively documented on other pages, which you might still find helpful to reference, but I changed components several times over the course of the build. So if you just want to skip to the end and build the finished product, this is what to do. I strongly recommend you read *all* of this page and understand what's involved before buying parts. If you get stuck, shoot me an email and I will see if I can help!

1. Buy everything on the [Bill of Materials](/projects/big-mouth-phatt-bass/bill-of-materials). This includes a 15th Anniversary Edition Billy Bass, three small PCB-based components, and some connectors. You'll also need to get a custom motherboard PCB manufactured using these [PCB Gerber Files](/files/projects/big-mouth-phatt-bass/phattbass-gerbers.zip). Companies like JLC PCB and PCBway will do this cheaply provided you don't mind a shipping delay.
2. Ensure you also have a small cross-head screwdriver, a multimeter, a soldering iron, solder, and some electrical tape. If you haven't soldered before, I recommend getting some perfboard and some bits of wire to practice with in advance. A "helping hands" type device with clips and a magnifier may be helpful. For experienced solderers, there's nothing tricky here&mdash;it's all through-hole.
3. Disassemble your Billy Bass and remove the original control board. If you've bought the right one, this should be fully connectorised, so an easy job, but do unplug the connectors carefully.

    ![The insides of a Billy Bass](/img/projects/big-mouth-phatt-bass/1.jpg){: .center}
    <br/>

4. Next, solder the new components to the replacement motherboard. The arrangement should be as per the photo below. Take extra care to make sure the JST connectors are the right way around; all notches should be on the side *away* from the edge.

    ![Three main components and four JST connectors on a PCB motherboard](/img/projects/big-mouth-phatt-bass/24.jpg){: .center}

    You only need to solder the pins that connect to something&mdash;this is all of the pins on the motor driver board and all-but-one of the JST connectors, but the ESP32 Devkit and MP3 player pins are not fully utilised, so you can save some time. Use the PCB drawing for a reference, this is the *front* of the board where the components sit:

    ![PCB design](/img/projects/big-mouth-phatt-bass/pcbdesign.png){: .center}
    
    And this is how it will look to you when you are soldering to the *back* of the board:

    ![PCB design](/img/projects/big-mouth-phatt-bass/pcbdesign-back.png){: .center}
    <br/>

5. Once you have finished soldering, use a multimeter in continuity mode to buzz through from pin to pin and check the solder joints are good. For example, the GND pin on the ESP32 Devkit should be connected to the left-most pin of the 6-pin connector, and so on.
6. Connect the four required JST connectors from the fish into your board. Looking top-down, the button goes in the left 2-pin connector, and the LDR goes in the right one. The 4-pin and 6-pin connectors should be obvious. The piezo buzzer isn't used by this project, and can be left disconnected.

    ![A Billy Bass opened up with a bunch of wires from it leading to a PCB.](/img/projects/big-mouth-phatt-bass/main.jpg){: .center}
    <br/>

7. Plug your microSD card into a computer. Download the [SD Card Files ZIP](/files/projects/big-mouth-phatt-bass/sdcard.zip), unzip it and copy the files to the root of the SD card. Eject the SD card and insert it into the MP3 player board.
8. On a computer, install [Python](https://www.python.org/), [VS Code](https://code.visualstudio.com/) and the [Platform.io](https://platformio.org/) plugin.
9. Clone or download the [Phatt Bass ESP32 Source Code](https://github.com/ianrenton/big-mouth-phatt-bass) from Github, and open it in Platform.io. The appropriate ESP32 library should be installed automatically.
10. Connect the computer to the ESP32 Devkit, and upload the program using Platform.io. There are guides online to help you with this. You will probably need to select which device represents the ESP32; for me it was `/dev/ttyUSB1` but yours may be different, or e.g. `COM1`, `COM2` etc. on Windows. (If you get stuck writing to the device on Linux, you may need to add yourself to a group that can access serial devices, e.g. `sudo useradd -aG dialout $USER` for Debian & derivatives, or `sudo useradd -aG uucp $USER` for Arch & derivatives.)

    ![Uploading code using Platform.io](/img/projects/big-mouth-phatt-bass/platformio.png){: .center}

11. Once the upload is complete, the ESP32 will restart. The fish speaker should now say something along the lines of "Track One, Phatt Bass".
12. Hold the front of the fish securely, and press the button. The song should play and the fish movements should be as per the video. If not, check your wiring, SD card and code&mdash;and let me know if you're stuck!
13. Finally, you should be able to put the fish back together. The PCB will need to go at an angle and you may want to use some electrical tape to ensure the board doesn't touch any metal components inside the fish.

    ![Rear of the PCB held in place inside the fish enclosure](/img/projects/big-mouth-phatt-bass/26.jpg){: .center}

    You can then screw the rear of the fish back on, and you're done!

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/phattbass/phattbass-back-together.webm" type="video/webm"></video></center>

Note that if you have issues where the Big Mouth Phatt Bass resets itself as soon as motors start moving, it could be a supply voltage issue. I usually just keep mine connected via USB to get around this issue as I'm often reprogramming it anyway, but it probably means you just need to replace the batteries. There are some other possible solutions if you have this issue a lot&mdash;see [A Note on Board Restarts](/projects/big-mouth-phatt-bass/a-note-on-board-restarts).
