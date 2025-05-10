---
layout: post
title: "52 Week Ham Radio Challenge Roundup: Weeks 17-20"
description: Repeaters, antenna simulation and the return of the RTTY!
date: 2025-05-18 00:00 +0000
image: /img/blog/2025/05/mmana-3-small.png
slug: 52-week-ham-radio-challenge-roundup-weeks-17-20
tags:
  - ham-radio
  - radio
  - amateur-radio
  - challenge
  - 52-week-ham-radio-challenge
---

If you've read [the first post in this series](/blog/52-week-ham-radio-challenge-roundup-weeks-1-4/) or are playing along yourself, you'll be aware of the [52 Week Ham Radio Challenge](https://hamchallenge.org/). If not, hit up that link for the details!

This post covers the challenges from weeks 17-20, which were:

<ol start="17">
  <li><a href="#week17">Which VHF/UHF repeater is closest to your location?</a></li>
  <li><a href="#week18">Make a QSO in one digital voice mode.</a></li>
  <li><a href="#week19">Simulate an antenna!</a></li>
  <li><a href="#week20">Decode the RTTY transmission of DWD on 10101 kHz</a></li>
</ol>

### Week 17 (21-27 Apr): Which VHF/UHF repeater is closest to your location? {#week17}

This week's challenge was to find out about your closest repeater. Per Repeaterbook, that's GB3PB around 4 miles away from my home. I receive it and it receives me just fine, but like most repeaters there's rarely much activity. (I'd be the change I want to see in the world, but honestly VHF repeaters don't interest me that much. I did give a quick "M0TRT listening" but got no reply.) There's also local gateways MB7IPD and M0IDL within a couple of miles.

A very low-effort half-success.

### Week 18 (28 Apr - 4 May): Make a QSO in one digital voice mode. {#week18}

This week I skipped out on completely. I have no equipment for DMR, D-Star, C4FM etc. and unfortunately I wasn't going to rush out and buy any just for this week of the challenge!

### Week 19 (5-11 May): Simulate an antenna! {#week19}

Antenna modelling is a new one for me. I picked the popular [MMANA-GAL](http://gal-ana.de/basicmm/en/) software and gave it a try.

As with a lot of amateur radio (and professional radio) software, the design stabilised somewhere around the late 90s, and given the typical user base, very little hand-holding is available for new users. Luckily it does come with a large number of examples which can be very useful once you figure out what they are.

I started modelling my 40m inverted-V dipole by loading an existing inverted-V design and tweaking the lengths to match mine. Thankfully the output was a reasonably low SWR and a good all-round far-field radiation pattern, much like I was expecting.

![MMANA-GAL screenshot showing a diagram of an inverted-V antenna](/img/blog/2025/05/mmana-1.png)

![MMANA-GAL screenshot showing the radiation pattern of an inverted-V antenna](/img/blog/2025/05/mmana-2.png)

I then moved onto the [JPC-12](/blog/pac-12-clone-antenna-review/), a vertical with ground radials, on 20m. I split my radial ribbon into three parts, and try to space them out evenly when deploying the antenna. I managed to model a vertical and some radials, though at this point my lack of MMANA-GAL expertise let me down, and I couldn't find a way to model the coil that sits part-way up the vertical.

![MMANA-GAL screenshot showing a diagram of a vertical antenna](/img/blog/2025/05/mmana-3.png)

On the basis that the coil is there to effectively extend the electrical length of the vertical, I simply modelled it as a longer vertical than it actually is in practice. I got a nice radiation pattern, though I don't have the knowledge to judge whether it's accurate.

![MMANA-GAL screenshot showing the radiation pattern of a vertical antenna](/img/blog/2025/05/mmana-4.png)

To be honest I'm not sure antenna modelling is for me, at this early point in my ham radio journey. I've [built one antenna](/projects/radioshack/2e0uxv-random-shit-i-found-in-my-shed-antenna/), but firmly by following measurements calculated for me automatically. Maybe I'll revisit this in a few years' (or decades') time, when I have more time and more space for experimenting with antenna designs.

### Week 20 (12-18 May): Decode the RTTY transmission of DWD on 10101 kHz {#week20}

TODO

That's all for this round-up, see you in mid-June for the results of weeks 21 to 24!