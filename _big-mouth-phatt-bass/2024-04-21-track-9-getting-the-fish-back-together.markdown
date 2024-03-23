---
comments: true
layout: post
title: "Track 9: Getting the Fish Back Together"
slug: track-9-getting-the-fish-back-together
date: 2024-03-17 00:00:00
layout: post
---

Plug-in breadboards are convenient for prototyping, but there's no chance that this mess is ever going to fit back inside the Billy Bass enclosure:

![A breadboard and a mess of wiring connected to two halves of a Billy Bass](/projects/big-mouth-phatt-bass/13.jpg){: .center}

As a temporary measure, I decided to extend the JST connectorised cables out of the rear of the enclosure, then mount the breadboard between the legs of the stand.

I had a couple of JST XH cable extenders handy from previous projects, where they were used for extending the balance port of LiPo batteries. I ordered a couple more to make up the set&mdash;overall, we need two 2-wire cables, one 4-wire and one 6-wire. I drilled a hole in the rear of the fish, since the cables wouldn't quite fit comfortably through the existing wall-mounting holes, then passed the cables through.

![Inside rear of Billy Bass with four short cable extenders passing through a hole](/projects/big-mouth-phatt-bass/14.jpg){: .center}

These cables could then be connected up inside:

![Two halves of an open Billy Bass with existing cabling attached to cable extenders](/projects/big-mouth-phatt-bass/15.jpg){: .center}

The fish could then be reassembled as it originally was.

![Outside rear of Billy Bass with four short cable extenders passing through a hole](/projects/big-mouth-phatt-bass/16.jpg){: .center}

The breadboard is then a "convenient" fit between the legs of the stand:

![Rear view of Billy Bass with a messy breadboard underneath it](/projects/big-mouth-phatt-bass/17.jpg){: .center}

"Convenient" is in quotes there because this arrangement does make it difficult to access the switch and impossible to change the batteries. However, when necessary it can be slid sideways and removed from its normal position.

This setup is probably good enough for now. Although the electonics are still messy and fragile, they are hidden from the front view, plus it's kind of nice that they're visible from behind to show off the components used. Most importantly, this was several days' work for a 30-second comedy video, so it's probably time to stop!

In future, I may redesign the electronics so that they fit inside the fish enclosure. My plan is to swap the breadboard for a smaller section of perfboard mounting the ESP32 and MP3 boards, located in one side of the enclosure, then the L298M motor driver located on the other side. But it will be a squeeze, if it even proves possible at all with my current choice of components. I'll update this page in future with any progress.
