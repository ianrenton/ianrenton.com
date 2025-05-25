---
layout: post
title: "52 Week Ham Radio Challenge Roundup: Weeks 21-24"
description: "The Challenge gets Challeng-ier: GNU Radio, SPICE and Software"
date: 2025-06-15 00:00 +0000
image: /img/blog/2025/06/amplifier-small.png
slug: 52-week-ham-radio-challenge-roundup-weeks-21-24
tags:
  - ham-radio
  - radio
  - amateur-radio
  - challenge
  - 52-week-ham-radio-challenge
---

If you've read [the first post in this series](/blog/52-week-ham-radio-challenge-roundup-weeks-1-4/) or are playing along yourself, you'll be aware of the [52 Week Ham Radio Challenge](https://hamchallenge.org/). If not, hit up that link for the details!

This post covers the challenges from weeks 21-24, which were:

<ol start="21">
  <li><a href="#week21">Create a GNU Radio flowgraph!</a></li>
  <li><a href="#week22">Simulate an electric circuit!</a></li>
  <li><a href="#week23">How many language can you hear on the radio this week?</a></li>
  <li><a href="#week24">Make a contribution to an Open Source ham radio software package.</a></li>
</ol>

### Week 21 (19-25 May): Create a GNU Radio flowgraph! {#week21}

Week 21's challenge was to create a GNU Radio flowgraph, and like almost everyone, I chose the GUI-based GNU Radio Companion software to do this with.

I was aware of GNU Radio but had never really dived into it before. I started off by following an online tutorial to create a broadcast FM receiver using an RTL-SDR.

![A GNU Radio Companion flowgraph](/img/blog/2025/06/gnuradio2.png){: .center}
*GNU Radio flowgraph for an FM receiver*

However, this builds heavily on the "WBFM Receive" module which seems to be doing a lot of the hard work for me. I decided I'd try to implement an SSB receiver, which doesn't come built-in and surprisingly there don't seem to be a lot of online tutorials for.

Here's where things started to unravel, with quite a few cases where I pointed SDR++ at a signal (e.g. the ever-reliable FT8 on 14074kHz or DDK9 RTTY on 10100kHz) and got the waterfall plot I expected, when I couldn't recreate that in GNU Radio. Then when I went back to SDR++ in frustration, the signal wasn't there either, and AGC/manual gain controls also didn't seem to have any effect.

![A screenshot of GNU Radio Companion, showing a flowgraph and a waterfall display](/img/blog/2025/06/gnuradio.png){: .center}
*GNU Radio Companion showing a flowgraph and a waterfall display*

I'm starting to doubt not only my (obviously lacking) GNU Radio skills, but also my RTL-SDR itself. Perhaps this one is best shelved for another day.

### Week 22 (26 May - 1 Jun): Simulate an electric circuit! {#week22}

For week 22, the challenge was to simulate an electric circuit. I started off using the recommended web-based tool, [CircuitLab](https://www.circuitlab.com/), but quickly found that it had a strict time limit before forcing you to create an account, and not saving your previous work. Since I knew that KiCad also had some built-in circuit simulation capability using SPICE, and no associated limitations, I decided to use that instead.  It also seemed a more useful skill to learn, to do this with KiCad rather than CircuitLab.

I set out to make a simple common emitter amplifier circuit. Drawing the schematic wasn't a problem, but I did have to [read up on the simulation capability](https://www.kicad.org/discover/spice/) as that aspect was new to me.

Initially I was getting roughly Vout=Vin, a sure sign that the circuit wasn't working as I expected. So, I added various test points to the circuit to track down the source of the problem. It turned out to be zero voltage on the Vcc rail&mdash;while I had used a SPICE symbol for the sine wave input, I had just used a standard voltage point for Vcc, and this was not recognised as anything by the simulator. I switched this for a SPICE VDC source, and it all worked as expected.

![A common emitter amp circuit in KiCad, along with a simulation window showing a sine wave input and output with gain around -5.](/img/blog/2025/06/amplifier.png){: .center}
*Common Emitter amplifier schematic and simulation in KiCad*

Most of my [previous KiCad experience](https://ianrenton.com/projects/big-mouth-phatt-bass/) has been simply connecting ICs together, so I'm still a long way off being able to design and simulate analog circuitry with confidence. However, it's great to know the functionality is there and it really did help me figure out a problem with the schematic, so this week's challenge has definitly got me thinking that some proper circuit design could be in my future.

### Week 23 (2-8 Jun): How many language can you hear on the radio this week? {#week23}

### Week 24 (9-15 Jun): Make a contribution to an Open Source ham radio software package. {#week24}

That's all for this round-up, see you in mid-July for the results of weeks 25 to 28!