---
layout: post
title: "ATP: Control Board Test"
date: 2014-12-11 21:33
comments: true
categories: 
---

The control board in the toy is very simple, having no integrated circuits. It receives the control signal in the 27MHz band and translates it into bi-directional control of the two DC motors &mdash; one main drive motor and one turn motor.

![](/hardware/atp/4.jpg){: .center}

The underside of the board has plenty of opportunities to stick a multimeter in and figure out what's going on.

![](/hardware/atp/3.jpg){: .center}

The red and blue wires only connect to the battery pack, providing the control board with +9v and 0v respectively.

The other four wires connect to the motors, two to each. Black and grey control the main drive motor, while green and orange control the turn motor. Both operate using a simple differential voltage to produce the bi-directional rotation, although it looks like the turn motor is fed a slightly lower voltage than the drive motor.

![](/hardware/atp/17.jpg){: .center}

This is where the All-Terrain Pi is now: a stripped down vehicle with electronics exposed, and a complete set of voltages recorded that will allow us to remove the control board and replace it with our own electronics.

![](/hardware/atp/18.jpg){: .center}

Here's a bonus shot of the ATP hanging out with the Lego Turtle!

![](/hardware/atp/19.jpg){: .center}