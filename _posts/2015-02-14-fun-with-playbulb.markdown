---
layout: post
title: "Fun with Playbulb"
date: 2015-02-14 10:47
comments: true
categories: 
- Hardware
- Software
- Projects
---

[Playbulbs](http://www.playbulb.com/en/index.html) are colour LED lights sold by a company called Mipow. They come with an iOS and Android app that can set their colour and various patterns via Bluetooth. There's no security on them whatsoever, so any nearby device can connect and change their colour. That seems pretty bad &mdash; especially when you consider that as well as the small "candle" style lights we have, they also sell [room lighting versions](http://www.playbulb.com/en/playbulb-color.html#meet-playbulb-color) that play music and can probably flash fast enough to trigger photosensitive epilepsy. Controlled by your neighbours!

![Playbulb Candle](/blog/2015/playbulb.jpg){: .center}

Despite the security problem, this does have one advantage: it's easy to get any other device controlling the Playbulb, not just a phone with their official app. Anything with a Bluetooth 4.0 Low Energy transceiver can easily control the Playbulb using tools like those provided by [BlueZ](http://www.bluez.org/) under Linux, and the protocol is [somewhat understood](https://pdominique.wordpress.com/2015/01/02/hacking-playbulb-candles/). This means it's pretty easy to control a Playbulb programatically using the language of your choice.

Here's a demonstration I knocked up this morning: [mailcheck](https://github.com/ianrenton/playbulb-tools/blob/master/mailcheck/mailcheck.py). This python script checks an IMAP mailbox at a defined interval, and will set the Playbulb colour to red if there are no unread messages, or green (with a brief flash) when you have unread mail. It was inspired by similar "ambient electronic devices" such as [Nabaztag](https://en.wikipedia.org/wiki/Nabaztag). Here it is in action:

<center><video width="640" controls><source src="https://video.ianrenton.com/playbulb/mailboxcheck.mp4" type="video/mp4"></video></center>

It's BSD-licenced open source, so if you have a Playbulb you want to have some fun with, please take my code and use it for your own ends!
