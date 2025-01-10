---
layout: post
title: "USV-01 Electronics Box (version 1)"
date: 2016-06-04 10:00
comments: true
---

There are quite a few electronic items to fit inside the USV, and it would be nice to mount them in a single place rather than trying to fit them in all around the boat. To this end, I purchased a cheap plastic case for the Pi which requires some simple modifications to fit version 1 of the USV's electronics.

![The box](/hardware/usv-01/box1.jpg){: .center}

Naturally it only comes with holes in the case for the Pi's normal connectors. Some extra holes will need to be made to accomodate the servo board. Other components may be fitted internally if there is space, or if not, then externally on top of the box. Also shown here is the CP2102 USB to UART adapter that I will be using to [receive data from the GPS](../usv-01-gps-test).

![Marked up for modification](/hardware/usv-01/box2.jpg){: .center}

Fifteen minutes of attempting to use basic tools later, the box has cut-outs in the right places for the electronics that will be going inside:

![Box with cut-outs](/hardware/usv-01/box3.jpg){: .center}

It also has some screw holes to fix the GPS and heading unit to the top:

![Box with GPS on top](/hardware/usv-01/box4.jpg){: .center}

Like so:

![Box with GPS and CP2101 fitted](/hardware/usv-01/box5.jpg){: .center}

There's a space for the Pololu servo multiplexer board next to it:

![Box with servo multiplexer fitted](/hardware/usv-01/box6.jpg){: .center}

A short USB cable allows the CP2101 board to connect to the Pi's USB ports. This increases the space envelope significantly due to the large bend radius of the cables, although it should still fit inside the boat. A future version will aim to make this arrangement neater, possibly by making my own USB cables rather than using COTS parts.

A second USB cable of the same type is added to allow more flexibility in positioning the WiFi antenna inside the boat.

![Box with USB cables attached](/hardware/usv-01/box7.jpg){: .center}
