---
comments: true
date: 2012-06-14 21:14:01
layout: post
slug: tank-day-7-bridging-the-gap
title: 'Tank Day 7: Bridging the Gap'
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
---

[Yesterday](../tank-day-6-gpio-funtimes/), we finished up with a Raspberry Pi which could output the appropriate command signal on one of its GPIO ports, but we had concerns about the output voltage level. At 3.3 volts, this is lower than the 4V input that the main controller board is used to seeing from the TK-YL101-3 board that we intend to replace.

Following the general theme of advice on the [Raspberry Pi forums](http://www.raspberrypi.org/phpBB3), I decided to add a transistor circuit between the Pi and the tank to prevent excess current draw from the GPIO pin, which can damage the device. While doing so, it costs nothing to bump that 3.3V output up to the expected 4V -- so we did. Rather than using the 4.5V output from the RX-18, we decided to use the 7.2V power line that previously powered the TK board. This meant that we could use just the three wires that connect the RX and TK boards, rather than taking power from somewhere else.

This is the circuit we designed (100% of the credit going to my colleague Daryl, as I appear to have forgotten everything I learned in A-level electronics):

[![GPIO 4V Driver Board](/hardware/raspberry-tank/converter-board-300x129.png)](/hardware/raspberry-tank/converter-board.png)

The 2N3904 transistor has a high enough slew rate and hfe that we can choose a relatively high value for the resistor between the GPIO pin and the transistor -- in this case, 10K. This really cuts down on the current being drawn from the GPIO pin, protecting the Raspberry Pi. On the other side of the transistor, a potential divider created with the 310R and 390R resistors creates a 4V level from the 7.2V power line.

Without further ado, I built the circuit on a scavenged bit of stripboard:

[![Built Circuit (Upper)](/hardware/raspberry-tank/IMAG0061-300x179.jpg)](/hardware/raspberry-tank/IMAG0061.jpg) [![Built Circuit (Lower)](/hardware/raspberry-tank/IMAG0062-300x179.jpg)](/hardware/raspberry-tank/IMAG0062.jpg)

Believe it or not, that's probably my best-ever solder job.  There's a reason why they don't let me near surface mount kit.

Now we have a circuit that will generate a 4V output from a 3.3V input, while drawing minimal current from that input. However, the astute among you may have noticed one slight issue with the circuit -- when we apply a 3.3V input, the transistor turns on and connects our output point to ground, while when we apply no input, the transistor is disabled and our output returns to 4V.  In other words, the output is upside-down!

[![Upside-down Signal](/hardware/raspberry-tank/IMAG0066-300x179.jpg)](/hardware/raspberry-tank/IMAG0066.jpg)

Rather than find a comparable PNP transistor and re-jig the circuit, we elected to manage this in code, simply by switching the "GPIO_CLR" and "GPIO_SET" pointers around.  In [the new version of the code](https://github.com/ianrenton/raspberrytank/tree/7756f03f1f53c6f46fb5518e55cb3d37313e0cc1), setting a bit in the GPIO_SET memory area actually outputs a _low_ signal on the pin, but the interface circuit ends up with this being a _high_ input to the RX-18.

The signal is back the right way up again, and at the right voltage.  There's nothing left to do but put Pi and tank together and see what happens!  Find out next time on the Raspberry Tank build diary! :)
