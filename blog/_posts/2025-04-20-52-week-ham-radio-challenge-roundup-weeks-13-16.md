---
layout: post
title: "52 Week Ham Radio Challenge Roundup: Weeks 13-16"
description: "Giant Wooden Ants On The Air"
date: 2025-04-20 01:00 +0000
image: /img/blog/2025/04/hamchallenge-1-small.jpg
slug: 52-week-ham-radio-challenge-roundup-weeks-13-16
tags:
  - ham-radio
  - radio
  - amateur-radio
  - challenge
  - 52-week-ham-radio-challenge
---

If you've read [the first post in this series](/blog/52-week-ham-radio-challenge-roundup-weeks-1-4/) or are playing along yourself, you'll be aware of the [52 Week Ham Radio Challenge](https://hamchallenge.org/). If not, hit up that link for the details!

This post covers the challenges from weeks 13-16, which were:

<ol start="13">
  <li><a href="#week13">Make a QSO from an unusual location and post a picture!</a></li>
  <li><a href="#week14">Implement and describe a backup solution for your ham radio log.</a></li>
  <li><a href="#week15">Monitor a transmission and take notes of the field strength</a></li>
  <li><a href="#week16">Make a contact with a xOTA station.</a></li>
</ol>

### Week 13 (24-30 Mar): Make a QSO from an unusual location and post a picture! {#week13}

Since starting my "stuff on the air" adventures last year, my standards for an unusual location for amateur radio have risen dramatically. The top of a hill or miles out into the heath no longer seem that unusual. There are places I could access via work that would be pretty unusual, but none I could think of that wouldn't give away where I work on the internet, and in any case the paperwork would be an unnecessary challenge.

So with the week nearly up, I hadn't thought of an unusual location, much less headed there.

However, on a small scale, inspiration hit. My local POTA to-do list included [Pinecliff Gardens](/blog/pota-activation-report-pinecliff-gardens/), which does have a number of large wooden play sculptures. PIcking a time that kids would still be in school, I headed out, and activated the park from the back of a giant wooden ant.

![Me sat on a large wooden ant sculpture in a park. I have a rucksack in front of me and a microphone in my hand. A vertical antenna is in the trees in the distance.](/img/blog/2025/03/pinecliff-3.jpg){: .center}
*POTA activation from my mighty ant steed*

Bet no-one's done that before!

### Week 14 (31 Mar-6 Apr): Implement and describe a backup solution for your ham radio log. {#week14}

An easy week to qualify for. I log using [Wavelog](https://www.wavelog.org/), a web-based logging system. I run my instance on a VPS hosted by [Hetzner](https://www.hetzner.com/), which provides automated daily backups and manual snapshots any time I want them.

Wavelog automatically uploads to QRZ.com, eQSL, LOTW and Clublog, so even if I were to lose my Wavelog instance, I could always reconstruct the bulk of the log from exports of those services.

### Week 15 (7-13 Apr): Monitor a transmission and take notes of the field strength {#week15}

The detail for this one says:

> Monitor a beacon or transmitter that's transmitting continuously, such as the DWD RTTY transmission on 10100.8 kHz, and take notes of the field strength over the course of a week.

I had no idea there was an RTTY beacon that just transmits *continuously* without stopping, that's pretty cool. Unfortunately I didn't have anything set up to continuously monitor the signal strength of this beacon, so all I managed for this week was to manually tune in and monitor it at hourly intervals, whenever I was available.

It turns out, that wasn't very often. Between work, eating, sleeping and various activities at the weekend, I only managed 33 sample points across the whole week. This is what my observations looked like:

![A very sparse graph of results](/img/blog/2025/04/hamchallenge-2.png){: .center}
*Measured Receive Power of DWD RTTY Beacon at IO90bs*

I have converted my eyeball S-meter observations into dB relative to "S1" to give a consistent unit of measurement that is always positive. As you may expect, received signal strength is low at night and rises during the daytime towards the evening. However, the data is extremely sparse, and difficult to relate to any external factors such as the state of the ionosphere across the days.

It's "technically" a success for Ham Challenge Week 15, but only barely. If it were a proper experiment I wouldn't be happy with those results&mdash;luckily I am an engineer not a scientist these days, so drawing conclusions based on intuition and extremely sparse data is par for the course!

If I were to revisit this challenge week later in the year, I would do some proper preparation for it. With a Raspberry Pi and an HF-capable SDR, I could rig up some software to monitor the beacon continuously, dumping a rolling average of received signal strength to file. This would allow for a complete data set to any resolution I chose, without relying on the need to set a reminder and run to my radio every so often, and without the inaccuracy introduced by eyeballing the S-meter on my radio.

### Week 16 (14-20 Apr): Make a contact with a xOTA station. {#week16}

The weekend of the 19th and 20th of April was the POTA Support Your Parks Spring event, so naturally I was out, and park-to-parks were easy to come by.

On the Saturday afternoon, I [headed out to Ballard Down](/blog/pota-wwff-activation-report-ballard-down) and amongst 54 QSOs got these 14 park-to-parks in the log.

![Map showing markers for various POTA & WWFF stations worked](/img/blog/2025/04/hamchallenge-3.png){: .center}
*Park-to-park QSO map for Ballard Down*

That's all for this round-up, see you in mid-May for the results of weeks 17 to 20!