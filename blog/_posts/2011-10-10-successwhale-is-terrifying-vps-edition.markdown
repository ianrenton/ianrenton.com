---
comments: true
date: 2011-10-10 12:26:55
layout: post
slug: successwhale-is-terrifying-vps-edition
title: 'SuccessWhale is Terrifying: VPS Edition'
tags:
- Hosting
- Internet
- Software
- SuccessWhale
- VPS
- Web
---

Just under two years ago, my [SuccessWhale](https://successwhale.com) Twitter client was gaining new users at a steady rate and, as I [noticed with alarm](/blog/successwhale-is-terrifying), was about to blow through my then-limited bandwidth allowance.

I've since relocated all my web stuff to [Dreamhost](http://www.dreamhost.com), taking advantage of their unlimited bandwidth offering to plow through 10 GB and more a month.  But now I'm coming up against the last remaining limit of my shared hosting - memory usage.

Both [Westminster Hubble](http://www.westminsterhubble.com), which constantly crawls MPs' social networks and RSS feeds, and an increasingly complex SuccessWhale, churn through a ton of memory.  I don't have a nice scary graph for this one, but at peak times, I'd estimate that my web server _kills over half my PHP processes_ due to excess memory use.  That means Only Dreaming basically goes down, while SuccessWhale throws errors around if it even loads at all.

It looks like I'm left taking the expensive plunge of moving my hosting to a VPS rather than a shared solution, which is a jump I'm nervous to make, especially since none of my web properties make me any money.  Most worrying of all is that VPS prices tend to vary by available memory, and I don't actually _know_ how much memory all my stuff would take up if it were allowed free rein.  And nor do I have any way of finding out, bar jumping ship to a VPS and taking advantage of free trial weeks.

So, dear lazyweb, do you have any experience with this sort of thing?  And can anyone reccommend a good (cheap!) VPS host that fulfils the following criteria:

  * [LAMP stack](http://en.wikipedia.org/wiki/LAMP_(software_bundle)) with "P" being both PHP and Python (or *BSD instead of Linux)

  * Full shell access

  * Unlimited (or at least 100 GB) bandwidth

  * Unlimited (or at least 10 GB) disk space

  * At least 20 MySQL databases

  * IMAP mailboxes & mail forwarding

I've been recommended [linode](http://www.linode.com) by a friend which seems great for tinkering, though the price scales up rapidly with RAM use and I'm not sure I want to deal with the hassle of setting up Apache, MySQL etc. by myself.  And there's Dreamhost's own offering, which would be virtually zero-hassle to switch to, but probably isn't the cheapest around.

So, citizens of the interweb, I seek your advice!
