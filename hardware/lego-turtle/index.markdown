---
comments: true
layout: page
title: Lego Turtle
slug: lego-turtle
redirect-from:
  - /legoturtle
---

For ages I've had an old Lego Mindstorms robot sat on my desk. It's based on the RCX 2.0 module, which is now so old that programming it isn't supported on any modern operating system. Rather than let it go to waste, I have swapped the RCX 2.0 for an Arduino, turned the robot into a ["Turtle"](https://en.wikipedia.org/wiki/Turtle_%28robot%29) that the user can program by sending [Logo](https://en.wikipedia.org/wiki/Logo_programming_language) programs to it via UART.

![](/hardware/lego-turtle/legoturtle.png){: .center}

## Videos

<iframe src="//player.vimeo.com/video/88391233" width="600" height="338" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <iframe src="//player.vimeo.com/video/88480999" width="600" height="338" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

## UART Programming

![UART Programming](/hardware/lego-turtle/logo-uart-screen.png)

## Schematics

I have uploaded the <a href="/hardware/lego-turtle/legoturtle_schem.png">schematic</a>, <a href="/hardware/lego-turtle/legoturtle_bb.png">physical layout</a>, and the <a href="http://fritzing.org">Fritzing</a> <a href="/hardware/lego-turtle/legoturtle.fzz">source file</a> from which they were all generated.

<a href="/hardware/legoturtle/legoturtle_schem.png" style="padding:0; background-color: white;"><img src="/hardware/lego-turtle/legoturtle_schem.png" width="320px"/></a> <a href="/lego-turtle/legoturtle_bb.png" style="padding:0; background-color: white;"><img src="/hardware/lego-turtle/legoturtle_bb.png" width="320px"/></a>

## Software

Source code for the Lego Turtle's microcontroller can be found in the <a href="https://github.com/ianrenton/legoturtle">Lego Turtle repository</a> on GitHub. So far the following programs exist:

* ***legoturtle-flippers*** &mdash; Simple navigation program based on two drive motors and two "flippers" to sense collisions.
* ***legoturtle-logo*** &mdash; Control program with a Logo interpreter, so that the robot can be programmed with simple Logo commands that are written at compile time. Kind of redundant really as Logo is no easier than writing the Arduino code itself, but this is a stepping stone to the version that will receive the Logo program over UART.<br/>Only the very basic Logo movement commands are supported: "fd x" (forward x centimetres), "bk x" (backwards x centimetres), "lt x" (left turn x degrees) and "rt x" (right turn x degrees). The distances and angles are all timed rather than measured, so will not be exact.
* ***legoturtle-logo-uart*** &mdash;Control program with a Logo interpreter that accepts a logo program via UART on startup, then will run it when a flipper is pushed. Text prompts are provided to guide the user through programming.<br/>An issue exists with using the Arduino's USB port as the UART, because when first connected to a PC this way (or when RESET is pushed while connected), the PC treats it as an Arduino to program rather than a serial device. This means that when connected this way, you will have to flash the Arduino with its code immediately before sending it a Logo program. This can probably be avoided by connecting to the Arduino via its "proper" UART on DIO pins 0 and 1.

## More Detail

* [Build Photos](./lego-turtle-build-photos)
* [Lego Mindstorms RCX Internals](./lego-mindstorms-rcx-internals)
