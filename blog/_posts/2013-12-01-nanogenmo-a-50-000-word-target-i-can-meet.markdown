---
layout: post
title: "NaNoGenMo: A 50,000 Word Target I can Meet"
date: 2013-12-01 20:56
comments: true

- Software
- Writing
- Language
tags:
- NaNoWriMo
- NaNoGenMo
- Novel
- Generation
- Script
- Ruby
---

One of the ways in which a number of my friends spend November is participating in [National Novel Writing Month](http://nanowrimo.org/), or "NaNoWriMo". This is its 15th year, in which some 300,000 amateur novelists signed up to write their hearts out over the course of 30 days.

It's ten years since I first came across the idea, and in all ten of those years I have professed myself too busy to dedicate that much time to churning out [my sub-standard fiction](http://fiction.ianrenton.com).

This year, though, I discovered a similar project I couldn't help but have a go at&mdash;[NaNoGenMo](https://github.com/dariusk/NaNoGenMo), National Novel *Generation* Month. The idea is simple&mdash;instead of spending November writing a novel, spend November writing a script that can write novels for you.

A lot of NaNoWriMo novels are fanfiction of highly variable quality, so in homage to that, [my NaNoGenMo script](https://github.com/ianrenton/NaNoGenMo) uses exactly that as its source material: specifically, a user-selected category or search on [FanFiction.net](http://fanfiction.net). It will scrape the stories it finds for sentences, store them all locally, then set to work mashing them together in various gramatically-reasonable ways until the 50,000-word goal has been reached.

![Thumbnail of example NaNoGenMo output](/img/blog/2013/11/nanogenmo-thumb.png){: .right}

During the course of writing the script I tested it mostly with Doctor Who fanfiction, some of which is not particularly bad. But then I discovered that FanFiction.net has categories for *cross-overs*, where authors borrow characters from two of their favourite 'universes'. These are generally, shall we say, *less* well written.

So, if you'd like a glimpse into a world where [Bayesian poisoning](http://en.wikipedia.org/wiki/Bayesian_poisoning) spammers hawk not Viagra but My Little Pony / Sonic the Hedgehog fanfiction written by 12-year-olds, look no further than the [example output](http://ianrenton.github.io/NaNoGenMo/example.html) that my NaNoGenMo script generates.

If you're up for some more bizarre fiction written by haiku-spouting drunken Markov chains, check out the [list of NaNoGenMo competitors](https://github.com/dariusk/NaNoGenMo/issues), quite a few of whom seem to have taken my code to new and stranger heights!
