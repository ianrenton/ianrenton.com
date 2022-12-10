---
layout: post
title: A New Home Server Setup
date: 2022-12-10 11:21 +0000
tags:
  - homeserver
  - homelab
  - hardware
  - software
image: /blog/2022/homeservers-small.jpg
---

In a move that feels almost heretical, given my history with the devices, I am moving away from using Raspberry Pi computers for my various "home server" projects. This has been driven in particular by a desire to tidy up the area of desk used for [Plane/Sailing](/hardware/planesailing) by powering all three RTL-SDR dongles straight from a PC, without the added hassle of a powered USB hub. Inspired by videos and posts I've seen online, I have switched out my Pis for Lenovo M93p Tiny desktop computers.

![Two Lenovo M93p Tiny PCs](/blog/2022/homeservers.jpg){: .center}
*My new home server setup, consisting of two Lenovo M93p Tiny PCs*

These units are approximately 20 x 20 x 3cm in size, so still pretty small, a little over 3x the size of a Pi in a case. However, being computers designed for office work with Core i-series processors, they're quite a bit more powerful. Plane/Sailing runs on one with a 5th gen Core i5 and 12GB RAM, while the other is a 4th gen Core i3 with 8GB.

The best thing about these is that they're cheap and available. With a bit of luck they can be bought for around £40 on eBay, a similar cost to a Raspberry Pi 4, or maybe even less once you factor in a case and storage. And, unlike Pis with their current lead time problems, refurbished ex-office machines like this are readily available in large quantities.

The only real disadvantage is power consumption&mdash;I don't have a mains current meter but some quick calculation shows probably around £6 a month to run these, compared to £3 for the Pis they are replacing.

Having migrated Plane/Sailing over to "innsmouth", I'm now setting up "miskatonic" to handle Adguard, OpenVPN, Home Assistant and NextCloud duties for the LAN. I'm also going to finally join this decade and figure out how Docker works, along with other general experimentation.

Overall, I'm very happy with the new setup and would definitely recommend these computers to anyone looking to set up a small home server!