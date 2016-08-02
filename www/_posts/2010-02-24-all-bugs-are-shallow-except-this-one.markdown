---
author: Ian
comments: true
date: 2010-02-24 09:49:51
layout: post
slug: all-bugs-are-shallow-except-this-one
title: All Bugs Are Shallow... Except This One
wordpress_id: 2768
categories:
- Software
tags:
- ACPI
- Apple
- Bugs
- GNOME
- Hardware
- KDE
- Linux
- Mac OS
- Microsoft
- openSUSE
- Power Management
- Rant
- Resume
- Software
- Suspend
- Ubuntu
- Windows
- x86
---

In his essay ["The Cathedral and the Bazaar"](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/), [Eric S. Raymond](http://en.wikipedia.org/wiki/Eric_S._Raymond) coins the phrase "given enough eyeballs, all bugs are shallow" -- meaning that with enough testers and enough programmers, it is possible to diagnose and fix any software bug.

So why can't my computer suspend and resume properly?

The concept of 'suspend' -- or 'sleep', or 'standby' -- mode, whereby the computer dumps its internal state to RAM then enters a low-power state with its processor and other hardware turned off, is not new.  The [ACPI](http://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface) standard has been kicking around for 14 years now, a very long time compared to the life cycle of an operating system.  These days, with laptop use on the rise, it's a very common thing for users to want to do.  And yet resuming from suspend is still hit-and-miss.

Why do I find it more reliable in Ubuntu than openSUSE for the same base kernel?  Why does GNOME fare better than KDE?  Why does my WiFi sometimes not come back?  Why, with Microsoft's million- if not billion-dollar operating system budgets, with Intel and AMD and nVidia's decades' of driver experience, is suspend and resume still frequently an issue even on Windows?

Only Apple, with its closed hardware / software ecosystem, seems to have cracked it.

I'd hate to think of that as the only way to a bug-free existence -- I'm very fond of the idea of an open ecosystem where I can run whatever software I want on whatever hardware I want.  But I'm worried.  Is the range of (IBM-compatible, ACPI-supporting) hardware out there just too diverse and too widely different in its support for suspend-and-resume?  Is it just infeasible for software to perfectly implement it on all devices?

Has hardware created the one software bug that, for any reasonable number of eyeballs, _isn't shallow?_
