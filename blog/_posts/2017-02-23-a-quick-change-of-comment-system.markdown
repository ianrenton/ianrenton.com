---
title: A Quick Change of Comment System
layout: post
date: 2017-02-23 21:19
tags:
- Disqus
- Privacy
- HashOver
- Commenting
---

One of the reasons why I've recently been [simplifying the number of things I run on the web](/blog/planning-the-wind-down/) is the difficulty of it all&mdash;not that I'm incapable of running mail servers and Minecraft servers and a dozen websites, but that I can achieve 99% of the benefit with only 10% of the effort by using other services instead.

One of those changes I made was to ditch the [Juvia comments system](https://github.com/phusion/juvia) for my blog and replace it with the 3rd-party [Disqus](https://disqus.com). Juvia is unmaintained&mdash;in fact, despite being a Ruby on Rails beginner, several of the most recent commits on the project are mine&mdash;and having to fight with Passenger and Rails and RVM every time the server felt like updating a package took its toll.

Disqus was a dubious choice though, and it has a pretty bad reputation for its privacy policy. In fact, when I shared [yesterday's post about ditching Facebook for privacy reasons](/blog/farewell-to-facebook/), one of the first things a friend said to me is that she would have liked to have commented on the post, but didn't trust Disqus. Since moving to Disqus, I've also seen a noticeable drop in comment frequency, so it's clear that many others also feel the same way.

Though it has simplified my life, Disqus was clearly the wrong choice.

So, I'm moving back to a self-hosted comment system for my blog. I don't fancy another trip around Ruby Version Hell, so I haven't moved back to Juvia&mdash;instead I've settled on a much simpler PHP-based commenting system known as [HashOver](http://tildehash.com/?page=hashover). Being PHP it runs just about anywhere with minimal hassle, and uses files rather than a database for storage. I've tweaked it to look just like the old Juvia comment section, and you can see it in action below.

One up-side of all this is that I'm now getting pretty adept at migrating comments from one system to another, despite there being no official support for most migrations. I [fixed Juvia's "import from Wordpress" function](https://github.com/phusion/juvia/pull/29) a few years ago, and I wrote a script to dump Juvia's comments into [Disqus' special WXR format](https://help.disqus.com/customer/portal/articles/472150). HashOver doesn't support automated import from anything, so here we go again: I wrote a program to convert Disqus' export format into a HashOver file structure. It's imaginatively called ["Disqus to HashOver"](https://github.com/ianrenton/disqus-to-hashover), and it's free to use if you ever need to do the same migration yourself.

Happy commenting!
