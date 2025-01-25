---
comments: true
layout: post
title: Quick Start Guide
date: 2025-01-27 00:00:00
---

The build guide includes various prototyping and design steps, plus builds on the previous Big Mouth Phatt Bass project, so it could be a bit confusing to follow. If you just want to skip to the end and build the finished product, this is what to do.

1. Buy everything on the [Bill of Materials](/projects/bluetooth-bass/bill-of-materials). This includes a 15th Anniversary Edition Billy Bass, three small PCB-based components, and some connectors. You'll also need to get a custom motherboard PCB manufactured using these [PCB Gerber Files](/files/projects/bluetooth-bass/luetooth-bass-gerbers.zip). Companies like JLC PCB and PCBway will do this cheaply provided you don't mind a shipping delay. Give me a shout if you get stuck with this step.
2. Ensure you also have a small cross-head screwdriver, a multimeter, a soldering iron, solder, and some electrical tape. If you haven't soldered before, I recommend getting some perfboard and some bits of wire to practice with in advance. A "helping hands" type device with clips and a magnifier may be helpful. For experienced solderers, there's nothing tricky here&mdash;it's all through-hole.
3. Disassemble your Billy Bass and remove the original control board. If you've bought the right one, this should be fully connectorised, so an easy job, but do unplug the connectors carefully.

    ![The insides of a Billy Bass](/img/projects/big-mouth-phatt-bass/1.jpg){: .center}
    <br/>

4. While your ESP32 Devkit almost certainly came with pins attached, your motor driver and audio amplifier board may not have done, and therefore need the headers they came with soldering on. The audio amp is designed to output to a small screw terminal block on the top of the device; to fit into the motherboard PCB you should *not* fit this part, and instead solder on two normal PCB header pins, the same as used for the seven pins on the other side of the board. Note that the pitch spacing is different though, so you will need to use two individual pins cut from the extra strip you ordered.
5. Next, solder the new components to the replacement motherboard. The arrangement should be as per the photo below. Take extra care to make sure the JST connectors are the right way around; all notches should be on the side *away* from the edge.

    ![Three main components and four JST connectors on a PCB motherboard](/img/projects/big-mouth-phatt-bass/24.jpg){: .center}
    <br/>

    **TODO: Update Photo**

    You only need to solder the pins that connect to something&mdash;this is all of the pins on the motor driver board and all-but-one of the JST connectors and audio amplifier pins, but the ESP32 Devkit pins are only about half fully utilised, so you can save some time. Use the PCB drawing for a reference, this is top down:

    ![PCB design](/img/projects/bluetooth-bass/pcb-top.png){: .center}
    <br/>

    And this is how it will look when you're soldering to the bottom:

    ![PCB design](/img/projects/bluetooth-bass/pcb-bottom.png){: .center}
    <br/>

6. Once you have finished soldering, use a multimeter in continuity mode to buzz through from pin to pin and check the solder joints are good. For example, the GND pin on the ESP32 Devkit should be connected to the left-most pin of the 6-pin connector, and so on.
7. Connect the four required JST connectors from the fish into your board. Looking top-down, the button goes in the left 2-pin connector, and the LDR goes in the right one. (The code doesn't actually use these, but they can be connected for future development.) The 4-pin and 6-pin connectors should be obvious. The piezo buzzer isn't used by this project, and can be left disconnected.

    ![A Billy Bass opened up with a bunch of wires from it leading to a PCB.](/img/projects/big-mouth-phatt-bass/main.jpg){: .center}
    <br/>

    **TODO: Update Photo**

8. On a computer, install [Python](https://www.python.org/), [VS Code](https://code.visualstudio.com/) and the [Platform.io](https://platformio.org/) plugin.
9. Clone or download the [Bluetooth Bass ESP32 Source Code](https://github.com/ianrenton/bluetooth-bass) from Github, and open it in Platform.io. The appropriate ESP32 library should be installed automatically.
10. Connect the computer to the ESP32 Devkit, and upload the program using Platform.io. (If this doesn't work on Linux, you may need to add yourself to a group that can access serial devices, e.g. `sudo useradd -aG dialout $USER` or `sudo useradd -aG uucp $USER`. You may also need to set which device is the serial adapter for your board, in my case it was `/dev/ttyUSB1`.)

    ![Uploading code using Platform.io](/img/projects/bluetooth-bass/vscode.png){: .center}
    <br/>

11. Once the upload is complete, the ESP32 will restart. You can now test it. Grab your phone and connect to the new Bluetooth device called "Billy Bass". Hold the front of the fish securely, then play some audio from your phone, either music or using the voice assistant for example. You should hear the audio and see the fish move! If not, check your wiring, SD card and code&mdash;and let me know if you're stuck!
12. Finally, you should be able to put the fish back together. The PCB will need to go at an angle and you may want to use some electrical tape to ensure the board doesn't touch any metal components inside the fish.

    ![Rear of the PCB held in place inside the fish enclosure](/img/projects/big-mouth-phatt-bass/26.jpg){: .center}
    <br/>

    You can then screw the rear of the fish back on, and you're done!