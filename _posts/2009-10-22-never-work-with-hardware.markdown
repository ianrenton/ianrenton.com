---
author: Ian
comments: true
date: 2009-10-22 09:21:25
layout: post
slug: never-work-with-hardware
title: Never Work With Hardware
wordpress_id: 2154
categories:
- Software
tags:
- Electronics
- Geeky
- Hardware
- Rant
- Software
- Work
---

Beware, techie ranting ahead.

I have learned one important lesson over the last three weeks: Never, ever work with hardware.

We have this board - I shan't say exactly what it does for obvious reasons, but suffice to say that it generates signals and sends them, and sometimes receives signals and processes them.  And, three weeks ago, it started crashing.  Randomly.  Sometimes after a few seconds, sometimes after a few hours, but it would always crash.  Yeah, *that* kind of bug.  Also, the development environment features what I will call "quantum breakpoints".  These are just like normal breakpoints, where you can stop your code at some point and examine the state of variables, only _they change things in tiny imperceptible ways_, and usually when you start the program again from a certain breakpoint it just _won't work_.

So, I wrote most of the code for the main signal-processing chip on this board, so I got to try and sort this bug out.  Thanks to the lovely combo above, it took me about a week to narrow down the bug to a certain bit of processing code.  To make matters even harder, it turns out that this is not a bit of code that I wrote.  So I call in the guy who wrote that code, and we spend nearly another week tracing through _his_ code.  By this point we've also discovered that there are several different ways in which the crash happens, in some of which the chip's Program Counter is not even pointing at a memory location that even exists, let alone actual code.

We start wondering if it's a memory addressing issue, so we write all kinds of test programs, all of which work flawlessly.  So we call in the FPGA guy, whose chip also accesses the same memory, and he has at the problem for several days, also getting nowhere.  With all of us plus electronics guys and other people who have used the same chips before, we've now got half the project team sitting in a lab flailing wildly at what most be the _most obscure software bug in the world_.

Until someone checks the power line to the chip.  And it's about 10 milliVolts too low.  Ten milliVolts!  Turns out the signal processing function that made it crash didn't have any software bugs at all.  It just happened to tax the processor quite a bit, so it drew more current, so the voltage dropped a tiny bit - not enough to _stop_ the processor, but just enough to make it corrupt its own internal memory and crash horribly.

THREE BLOODY WEEKS chasing a _software_ bug and... the voltage supply to the chip is slightly too low.

So, er....  ARGHARGH PROPRIETARY HARDWARE.  From now on I'm only dealing with things with x86 chips in them, and operating systems.  In fact, even OS-native code can go hang.  Virtual machines.  No, wait, fuck it, interpreted code.  Is there a language where I can run interpreted code _in_ a virtual machine?  I have the sudden urge to stay as far away from hardware as possible.
