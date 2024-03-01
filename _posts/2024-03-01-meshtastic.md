---
layout: post
title: Meshtastic!
date: 2024-03-01 16:06 +0000
image: /blog/2024/meshtastic-small.jpg
tags:
  - meshtastic
  - mesh
  - radio
  - project
---

[Meshtastic](https://meshtastic.org) really seems to be taking off at the moment&mdash;certainly at work, and it seems in the wider world as well.

If you've not heard of it before, it's software designed to run on [cheap LoRa radio boards like these](https://www.aliexpress.com/item/32882205132.html), and provide an "off-grid" messaging and tracking capability. It fills roughly the same niche as APRS for the Ham Radio crowd, but it's low-power enough that it's licence-free, so more people can join in.

Making up for the low power is a large bandwidth, slow symbol rate and some impressive signal processing. So while we may be restricted to sending status data and short text messages, they go a lot further than 40mW of 868MHz has any right to. Much like Ham radio digimodes, decodes of signals 20dB below the noise floor are not uncommon.

A friend from work 3D printed me a [muziWORKSlab case](https://www.etsy.com/uk/listing/1653262584/h1-case-for-heltec-v3-running-meshtastic) and a couple of [IKB3D Bender cases](https://ikb3d.co.uk/products/bender-heltec-v3-lora-meshtastic-battery-case-print-download) for my Heltec v3 nodes&mdash;how cute are these!? The upright one is only a couple of inches tall.

![Two Meshtastic nodes in cases sat on a desk](/blog/2024/meshtastic.jpg){: .center}

I've got one upstairs at home and one in my car as a mobile node, temporarily displacing Plane/Sailing Portable there. Based on [self-reported node maps](https://map.mpowered247.com/) there's not a lot of activity in East Dorset, just small clusters in Dorchester and Christchurch. As the first Meshtastic node owner in Bournemouth, I'm only rarely getting signals in from anywhere else, but hopefully there'll be more nodes nearby soon. As Kevin Costner didn't say in *Field of Dreams*, "if you build it (mesh network infrastructure), they will come".

![A map of east Dorset showing the locations of Meshtastic nodes](/blog/2024/meshtastic-map.png){: .center}

Until then, much like with my other passive monitoring radio projects, I'm just here to see what I can pick up, and hoping for some unusual propagation.
