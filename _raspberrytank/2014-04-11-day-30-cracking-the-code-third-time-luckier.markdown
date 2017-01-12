---
layout: post
title: "Tank Day 30: Cracking the Code, Third Time Luckier"
date: 2014-04-11 23:04
comments: true
categories:
- Software
tags:
- Heng Long
- Opcodes
- Hacking
---

Background
----------

For a long time &mdash; since [Day 12](../tank-day-12-cracking-the-code-redux/) in fact &mdash; the Raspberry Pi has been driving the tank using a set of binary codes. These codes were reverse engineered by looking at the signal that the original TK board produced when driven with the proper remote control unit.

The codes are 32 bits long, always beginning with `11111110` (`0xfe`), and always ending with `00`. I was storing each complete code as a constant, which made the program pretty inflexible about the things it could ask the tank to do &mdash; it could only pick one of the set that was originally recorded.

[RC Tanks Australia](http://www.rctanksaustralia.com/) forum member [ancvi_pIII](http://www.rctanksaustralia.com/forum/memberlist.php?mode=viewprofile&u=299) [figured out long ago](http://www.rctanksaustralia.com/forum/viewtopic.php?p=1397#p1397) that the last four bits before the `00` were a checksum, and since both [TheTesla](https://github.com/TheTesla/raspberrytank/commit/59f2e20f6923b1be4c1ccd5c44e034ad246dbcae) and [Alexandre Lugand](https://github.com/alexandrelugand/RaspiTank/blob/master/RaspiTank/Command.cpp) went and posted code which calculates exactly that checksum, I figured it was long overdue for me to incorporate proper CRC generation into my own code.


Today's Work
------------

With the 8 header bits, 4 checksum bits and 2 footer bits being calculated automatically, [the 32-bit control codes were reduced to 18 bits of real information](https://github.com/ianrenton/raspberrytank/commit/27b01897f63922ebfe15e289b774796528ced334), of which only 17 are used.

Looking at the bit patterns for my codes, you see this:

![Codes from day 12 with header, checksum and footer removed](/raspberrytank/day-30-codes-before.png){: .center}

Immediately, there are some odd things noticeable about this arrangement.

Bits 16, 5, 4, 3 & 2 are high a lot of the time (`0x1003c`) &mdash; and look a lot like the bits set high in the "neutral" code. So this looks like the "base state" when no control is being applied. But what about my "idle" code, which is used interchangeably with "neutral"? It seems to do the same thing, but looks very different. "Fire" is an odd-looking code too &mdash; perhaps that explains why the firing has been broken for a while?

I decided to investigate. Now that the checksums were calculated automatically, I was free to play around setting whatever bits I liked, taking that `0x1003c` as the base to work from. Some of my results are below. As you can see, the controls for the ignition and turret-related codes are all very simple &mdash; setting a single bit high on top of the base code makes each of these functions happen. Control of the main motors (forward, backward, left and right) however, is a lot more complex.

![Day 30 opcode investigation](/raspberrytank/day-30-codes-after.png){: .center}

So, you can add (binary &) the following bits to the base opcode to produce the following effects:

* Bit 0 (`0x0001`): Machine gun LED
* Bit 1 (`0x0002`): Ignition
* Bit 7 (`0x0080`): Fire
* Bit 8 (`0x0100`): Turret Elevate
* Bit 9 (`0x0200`): Turret Left
* Bit 10 (`0x0400`): Turret Right
* Bit 11 (`0x0800`): Simulated Recoil
* Bit 12 (`0x1000`): Machine gun sound effect

I did not fare so well at figuring out the other bits:

* Bit 6 (`0x0040`) looks like the left/right selector when turning the tank. Bits 2-5 seem to be related to the speed of the turn. All high (the normal state) corresponds to no turning at all, but I can't work out how each bit affects the speed.
* Bit 16 (`0x10000`), the other bit that's switched on in the normal state, acts like a "NOT drive forwards". When set low, the tank immediately drives forward at a speed that seems to be set in some way by bits 13-15. When set high, the tank is normally stationary, but a combination of bits 13-15 appear to set a reverse speed. (However, to further complicate things, 16 set low but 14 set high also produces a reverse.)

Unfortunately, there also seem to be a few "invalid" opcodes, which has made investigation difficult. Hitting one of these seems to break the RX-18 controller, requring a power cycle of the tank. There are also a number of opcodes that seem to get the tank stuck in a particular mode until the opposite is entered &mdash; e.g. the tank can be commanded to reverse, but sending the "idle" opcode doesn't stop it, only sending a "forward" opcode will stop the reversing.


Current State
-------------

We're part-way there. We have a set of opcodes that control the main motors roughly how we want, but we don't really understand why. On top of that, we know which bits in an opcode control the other functions, and these ones we fully understand.

The **rt_http** software has been updated to reflect this. We now use a set of "base opcodes" &mdash; fully populated opcodes for Idle, Forward, Reverse, Left and Right that "just work" although we don't know why. In addition, we have a set of "delta opcodes" &mdash; the individual bits that we understand the function of. It's not the nicest solution in the world, but it does mean we're part way towards a nicer control scheme.

Because the motor controls are still using the old "base opcode" idea, we still don't have fine control over speed or the ability to say "reverse *and* turn left". But the functions represented by the "delta opcodes" can now be added on top of a base opcode in any combination, so we *can* say "reverse *and* elevate turret *and* shoot".

Here's the base and delta opcodes as currently implemented:

```
// BASE OPCODES
const int IDLE =         0x1003c;
const int FORWARD =      0x0803c;
const int REVERSE =      0x1803c; // Must be cancelled by a "forward", idle is not enough
const int LEFT =         0x10010; // Slower than I would like
const int RIGHT =        0x10064;

// DELTA OPCODES
const int MG_LED =       0x0001;
const int IGNITION =     0x0002;
const int FIRE =         0x0080;
const int TURRET_ELEV =  0x0100;
const int TURRET_LEFT =  0x0200;
const int TURRET_RIGHT = 0x0400;
const int RECOIL =       0x0800;
const int MG_SOUND =     0x1000;
```

As you can see from the comments, there are still a couple of issues that should get ironed out as the opcode investigation continues. Namely, the "left" code produces quite a slow turn, and the "reverse" code can't seem to be cancelled out by sending the "idle" code, only by briefly sending a "forward" code.

The latest code at this point in the Build Diary is stored [here on Github](https://github.com/ianrenton/raspberrytank/tree/1dd588826808c8be1d53a0ddfdc6faf181bde119).

Video
-----

Here's a video of the tank on the target range at the end of day 30, showing off remote ignition control, multiple simultaneous commands, and the newly fixed gun!

<center><iframe src="//player.vimeo.com/video/91786149" width="600" height="337" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe></center>


Bonus Content!
--------------

Alongside my work on figuring out the opcodes, I have made a number of other enhancements to the code:

* The **rt_http** code now includes [a bash script to restart it if it crashes](https://github.com/ianrenton/raspberrytank/blob/master/rt_http/rt_http.sh). This doesn't happen a lot, but it's handy not to have to SSH in and fiddle to get it up and running again.

* You can now [control the "ignition" signal from the web interfaces](https://github.com/ianrenton/raspberrytank/commit/d3f3d7cc5d88b537260ad2077ec20dc7ed714ba9) &mdash; useful if a restart of `rt_http` causes the tank to be up and running but with the ignition off. I still have no idea why Heng Long chose to have a fake ignition, and make using it compulsory.

* I started on a [Python port of rt_http](https://github.com/ianrenton/raspberrytank/blob/c22c9abd466328b43b5425593e47c3abd430e3ea/rt_py/rt.py), but as yet it doesn't work. My suspicion is that Python's `time.sleep()` just isn't accurate enough compared to C's `usleep()`, which may make the Python port a non-starter. I need to get a scope on the GPIO output to prove it though.
