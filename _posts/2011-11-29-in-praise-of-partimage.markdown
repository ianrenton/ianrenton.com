---
author: Ian
comments: true
date: 2011-11-29 23:01:54
layout: post
slug: in-praise-of-partimage
title: In Praise of Partimage
wordpress_id: 11879
categories:
- Software
tags:
- Backup
- Free Software
- Ghost
- Open Source
- RAID
- Software
- Symantec
---

For weeks now, I've been attempting to wrangle [Symantec Ghost](http://www.symantec.com/business/ghost-solution-suite), the corporate cousin of [Norton Ghost](http://us.norton.com/ghost), to back up and restore the contents of a partition on a RAID.  I've fought with device drivers, manually built [Windows PE](http://en.wikipedia.org/wiki/Windows_Preinstallation_Environment) images using [WAIK](http://www.microsoft.com/download/en/details.aspx?id=10333) with Symantec's outdated instructions, fought off continual pestering from a probably well-meaning call centre operative, and significantly contributed to the drinks coaster industry.

[![Pile of Useless Boot CDs](/blog/2011/11/IMG-20111128-00136-300x225.jpg)](/blog/2011/11/IMG-20111128-00136.jpg)

In desperation, I wondered if a simple `dd` from a Linux LiveCD would do the job, and the helpful folk at the UNIX/Linux Stack Exchange [pointed me](http://unix.stackexchange.com/questions/25528/is-creating-a-sparse-image-using-dd-appropriate-for-backup-restore-from-a-raid) at various [partimage](http://www.partimage.org/Main_Page)-based backup/recovery distros such as [Clonezilla](http://clonezilla.org/) and [PING](http://ping.windowsdream.com/).

Surprise surprise... they worked out of the box with no hassle whatsoever.

[![PartImage Running Successfully](/blog/2011/11/IMG-20111128-00133-300x225.jpg)](/blog/2011/11/IMG-20111128-00133.jpg)

Now they may have a few issues -- PING, for example, has a particularly odd interpretation of the function of the "Cancel" button on occasion -- but they do the job, for free, in minutes, compared to the hundreds of pounds and weeks of my time I unsuccessfully put into trying to use their commercial equivalent.

The slow, steady rise of open source software has never given us ["The Year of Linux on the Desktop"](http://en.wikipedia.org/wiki/Desktop_Linux#Year_of_Desktop_Linux), but it has vastly increased the number of times that I think "there must be _some_ advantage to this commercial program that justifies its cost" before quickly realising that no, there really isn't.
