---
layout: post
title: "Whatever Happened to the Generic PC?"
date: 2013-11-29 21:57
comments: true
categories: 
- Hardware
- Software
tags:
- Hardware
- Software
- PC
- Boot loaders
- DRM
- Needlessly complicated bullshit
---

It doesn't seem that long ago, perhaps only five or ten years, that you could buy or build your own computer and do whatever you liked with it. If you bought it, it would probably come with an operating system, but if you didn't like it you could download another one and use that instead.

Nowadays... not so much.

My main computer is a [Late 2007, 13-inch Macbook](https://support.apple.com/kb/sp12). You can install another operating system on it&mdash;so long as you keep the original OS to apply firmware updates. And you repartition the hard disk using Apple's tools. And you install a [custom boot loader](http://refit.sourceforge.net/). Oh, and even the custom boot loader can't boot from USB.

My other computer is a [Samsung Series 3 Chromebook](http://www.samsung.com/uk/consumer/pc-peripherals/chrome-devices/chrome-devices/XE303C12-A01UK). You can install another operating system on it&mdash;[in a chroot](https://github.com/dnschneid/crouton), because you have to use Google's kernel to get proper hardware support. You can try your luck with a proper dedicated install of another OS, but your hardware will be badly supported. Your choice of other OS is a [two-year-old version of Ubuntu](http://chromeos-cr48.blogspot.co.uk/2012/10/arm-chrubuntu-1204-alpha-1-now.html), or a [current version of Arch Linux](http://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook) for which [no-one knows how to build Firefox](http://archlinuxarm.org/forum/viewtopic.php?f=5&t=5761). It boots from USB when it feels like it. The rest of the time, it beeps and restarts with no error messages.

![Linux on a Chromebook (image from muycomputer.com)](/blog/2013/11/chromebook.jpg){: .right}

And these days our phones are computers too. The more capable they become, the more like a real computer, the more we resent their limitations.

I have a [Droid Razr Maxx](http://www.gsmarena.com/motorola_droid_razr_maxx-4417.php). You can install another operating system on it&mdash;so long as it's [pretty similar to the one it started with](http://forum.xda-developers.com/droid-razr/development). And it's compatible with the built-in kernel, which you can't replace because it has to be signed. So you have to [kexec](https://en.wikipedia.org/wiki/Kexec) your own kernel on top.

All I really want from a computer is a bunch of POSIX utilities, a tiling window manager, a copy of Firefox and a package manager, preferably APT-based. Ten years ago that didn't seem too tall an order. But with the computers we have today, I can and have struggled for *days* to achieve that&mdash;before giving up.

Whatever happened to the generic PCs of years gone by? Computers were always supposed to get smaller and cheaper, but why did they also get less useful; less free?
