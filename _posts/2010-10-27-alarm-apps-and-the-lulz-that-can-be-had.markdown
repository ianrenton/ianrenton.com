---
author: Ian
comments: true
date: 2010-10-27 12:29:42
layout: post
slug: alarm-apps-and-the-lulz-that-can-be-had
title: Alarm Apps, and the Lulz that can be had
wordpress_id: 11311
categories:
- Internet
- Software
tags:
- Alarm
- AlarmRoulette
- Android
- Application
- ChatRoulette
- Development
- Horrifying
- Internet
- Lulz
- Software
---

I am in the middle of creating an Android app that's a kind of super alarm clock.  (God forbid I should have less than six projects on the go at once.)  In the run-up to your chosen alarm time, it pulls down various feeds from the internet so that it can wake you with news, weather and traffic information.  A typical wake-up message might be:

> Good morning _Ian_!  It's _6:15am on Wednesday the 27th of October_.  The weather today will be _foreboding mist_, with highs of _10_ degrees and a wind speed of _14_ miles per hour.
In the news today: _Nick Clegg has been revealed to be a ficticious creation of the Guardian newspaper.  A man has shot a large deer, and apparently this is news._  And, _The dead are rising, everybody stay indoors._
Latest traffic updates: _A338 Bournemouth - One lane closed northbound due to an earlier accident.  A35 Bere Regis - Subject to roadblocks due to high zombie threat, find alternative routes._

There's just one problem, as pointed out by [@TheHiddenPaw](http://www.twitter.com/TheHiddenPaw) -- that all of that text is going to get read out by the Android text-to-speech engine, and thus you'll wake up to the sound of the news being read by a Dalek.

Ideally we'd like the voice to sound human, but that's all-but impossible with current text-to-speech technology.  And short of a news source providing freely-accessible audio streams with time-based metadata (BBC News karaoke anyone?), there's no sensible way of chopping up actual news, weather and travel reports to push out as an alarm.

If you're a fan of sensible software and sane ideas, you might want to stop reading now, because my thoughts then diverged somewhat.

First of those thoughts was "hey, I wonder if you could pay someone on [Mechanical Turk](http://www.mturk.com/mturk/welcome) to read it for you?".  Now that costs money, so it would be the world's first alarm clock with subscription fees.  On the other hand it would probably be the world's first alarm clock which had its functionality outsourced to India.  Maybe that's the future, or something.

The next thought was "since it's only a few pence they'd lose out on, there's not really any way to avoid people recording completely fake stuff, or recording complete silence so you oversleep."

My third and final thought was "oh boy, lulz can be had here", after which I was declared legally brain-dead for actually thinking the word 'lulz'.

What if we embrace people's ability to record whatever the hell they like, and keep a whole database of whatever audio we get, and pick from it randomly as an alarm tone?

This is AlarmRoulette.

(Thanks to [@HolyHaddock](http://www.twitter.com/HolyHaddock) for the name that sums it up perfectly.)

Through your phone or on the web, anyone can anonymously record 30 seconds of whatever audio they feel like recording.  Then, every morning, a random clip gets chosen by each user's phone to be used as an alarm.

The possibilities are endless, and endlessly horrifying.  One morning you could get woken by some soothing Mozart, and the next by Aphex Twin.  On Wednesday you could hear an inspiring and encouraging message about how wonderful you are, and on Thursday you could get woken up by someone giving a running commentary of 2 Girls 1 Cup.

I can't decide if this is the best, or the worst, thing ever.  Maybe it's both.
