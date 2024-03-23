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

"Convenient" is in quotes there because this arrangement does make it difficult to access the switch and impossible to change the batteries. However, when necessary it can be slid sideways and removed from its location.

This setup is probably good enough for now. It's hidden from the front view, and is at least somewhat visible to show off the components used to modify it. But it's still messy and still very fragile.

In future, I hope to redesign the electronics so that they fit inside the fish enclosure. But it will be a squeeze, if it even proves possible at all with my current choice of components. My current plan is to swap the breadboard for a smaller section of perfboard mounting the ESP32 and MP3 boards, located in one side of the enclosure, then the L298M motor driver located on the other side. I'll update this page in future with my progress.
