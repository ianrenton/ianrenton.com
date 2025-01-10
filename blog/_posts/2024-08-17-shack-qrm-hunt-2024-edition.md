---
layout: post
title: "The Great Shack QRM Hunt (2024 Edition)"
date: 2024-08-17 14:53 +0100
image: /img/blog/2024/qrm-s2-small.jpg
slug: shack-qrm-hunt-2024-edition
description: "Peace is restored, at least on the 20-metre band."
tags:
  - ham-radio
  - radio
  - amateur-radio
  - qrm
---

A year or so ago, being unhappy with the large amount of noise I saw when playing radio from home (particularly on the 40-metre band), I went on a hunt for the causes. I turned off everything I could, bar the radio and its power supply, jumped around the band and found: no difference at all.

I blamed the neighbour's solar panel inverters, not something I could really do much about, and settled in for a life of disappointing FT8.

Over time, if anything, the problem seemed to be getting *worse*. This year, I've wanted to join some of the weekly OARC nets on 40m but found myself totally thwarted by S9+20 background noise. Even the FT8 was getting worse, with reliable S7 noise on 20m as well.

Now that I've taken up POTA and know how nice S0-1 background noise is, I wanted to have another go at the home situation to see if anything could be done. The POTA activities mean I now have a big 12V battery, a mobile HF radio and another antenna, so I could switch things around and see if radio, power supply or antenna were causing the issues. They weren't&mdash;battery, FT-891 and 40m dipole showed exactly the same noise levels as 12V mains PSU, FT-840 and end-fed random wire. So far, so good: at least it wasn't a fault with my radio equipment.

Another try at turning everything in the house off, however, left me at S5 noise on 40m (not great, but maybe usable) and immediately down to S1-2 on 20m!

<br/>
![Yaesu FT-840 signal meter showing S2](/img/blog/2024/qrm-s2.jpg){: .center}
*Finally, a radio that can hear things*

I scanned around the band&mdash;I could hear people again! I could do SSB!

I gradually turned the rest of the house back on again. 40m noise slowly rose to around S6-7, which I'm not too happy about, but maybe Winter evenings might improve things a little. On 20m, noise stayed blissfully low, until I turned on: this thing.

<br/>
![A cheap Chinese power supply](/img/blog/2024/qrm-supply.jpg){: .center}
*The culprit*

This is the power supply for one of my "Home Lab" Mini PCs. It was an aftermarket eBay purchase, Chinese import, and CE marking provided only on a dubious sticker on the side.

Weirdly, the *other* Mini PC which has a genuine Lenovo charger was a little noisy too, putting me up to S3-4. But the dodgy one, even with the PC off and no current draw on the DC side, put me straight up to S6 on 20m and S9 on 40m; with the PC on it was back to S7 and S9+20 respectively.

Powering the radio from the mains-sourced PSU or from battery made no difference, so I can only assume the noise was either picked up directly inside the radios, or more likely coupled onto the braid of the coax going close by it.

So, this thing goes in the bin.

The PC with the less-bad supply has been relocated to a different room, where it continues providing various home-lab staples such as Home Assistant, AdGuard and the NAS drive. The remaining issue, then, is [Plane/Sailing](/projects/planesailing). This used RTL-SDR dongles connected to the Mini PCs, which required them to be on the desk near to the rest of my radio gear. I'm not sure yet what to do about that. Since even the legitimate Lenovo PSU wasn't totally noise-free, I'm reluctant to just buy a new replacement PSU and swap that in, even though that would be the simple solution.

I am hoping to take advantage of the lessons learned in [Plane/Sailing Portable](https://ianrenton.com/projects/planesailing-portable) and run the three RTL-SDRs from three Pi Zeros, but first I need to see if this approach works&mdash;and make sure it doesn't cause just as much noise as its predecessor.

But for now, I might pick up my HF set mic and actually... call someone.

And hear their reply.
