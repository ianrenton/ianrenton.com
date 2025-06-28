---
layout: post
title: "52 Week Ham Radio Challenge Roundup: Weeks 25-28"
description: 
date: 2025-07-13 00:00 +0000
image: /img/blog/2025/06/solar2-small.png
slug: 52-week-ham-radio-challenge-roundup-weeks-25-28
tags:
  - ham-radio
  - radio
  - amateur-radio
  - challenge
  - 52-week-ham-radio-challenge
---

If you've read [the first post in this series](/blog/52-week-ham-radio-challenge-roundup-weeks-1-4/) or are playing along yourself, you'll be aware of the [52 Week Ham Radio Challenge](https://hamchallenge.org/). If not, hit up that link for the details!

This post covers the challenges from weeks 25-28, which were:

<ol start="25">
  <li><a href="#week25">Locate local noise sources in your shack/flat/house.</a></li>
  <li><a href="#week26">Observe the solar data such as sunspot number, flux, K and A values over the week.</a></li>
  <li><a href="#week27">Listen to the June 2025 SAQ transmission.</a></li>
  <li><a href="#week28">Receive a station on 6m via sporadic E</a></li>
</ol>

### Week 25 (16-22 Jun): Locate local noise sources in your shack/flat/house. {#week25}

### Week 26 (23-29 Jun): Observe the solar data such as sunspot number, flux, K and A values over the week. {#week26}

Unlike [previous "data gathering" challenges](/blog/52-week-ham-radio-challenge-roundup-weeks-13-16/#week15) where the data has been limited by the time I could spend in front of a radio, I wanted a complete data set for this one. Conveniently, on the [OARC](https://www.oarc.uk/) Discord server we have a bot which posts those common propagation report images from [HamQSL.com](https://www.hamqsl.com/) every 6 hours.

![Propagation report image](/img/blog/2025/06/solar.png){: .center}
*These ones.*

It was then a simple matter to go back through the week, extracting the data from the images the Discord bot posted into a spreadsheet.

The challenge also asks "Did you notice any correlation between the values and the band conditions?" Well, I've only been on the radio a couple of times this week and the conditions weren't great. But rather then rely on just a few subjective data points, I decided to turn the HamQSL propagation data into an estimate of "band goodness" at each point in time. On the right-hand side of the image, it lists day and night HF conditions on four groups of bands. I totaled these up, taking "poor" as 0, "fair" as 1, and "good" as 2 to produce my highly scientific "band goodness" value, which is plotted alongside the other values below.

![Chart of changing values over the course of the week](/img/blog/2025/06/solar2.png){: .center}
*Space Weather values, 21-28 June 2025*

As shown in the chart, solar flux index (SFI) and sunspot number (SN) stayed relatively constant over the week. The planetary K-index and A-index stayed low, and "Band goodness" (or propagation conditions) remained good until around Thursday, whereupon Earth passing through a "coronal hole stream" caused a spike in K-index and A-index, and a corresponding dip in HF propagation conditions.

### "Week" 27 (29 Jun): Listen to the June 2025 SAQ transmission. {#week27}

I will admit, I didn't manage to cobble together a functioning receiver in time for this one. At a transmitted frequency of only 17.2 kHz, normal radio receivers aren't suitable for the job, and it's recommended to build a frequency converter to move the signal into an HF band. There's also the "very amateur" suggestion to connect an antenna directly to a PC sound card, but unfortunately I discovered too late that I didn't have a spare TRS connector to make this happen.

Instead I used the University of Twente WebSDR to listen in, [as recommended here](https://alexander.n.se/en/the-radio-station-saq-grimeton/lyssna-pa-saq/). I listened to the 0900 UTC transmission.

### Week 28 (7-13 Jul): Receive a station on 6m via sporadic E {#week28}

That's all for this round-up, see you in mid-August for the results of weeks 29 to 32!