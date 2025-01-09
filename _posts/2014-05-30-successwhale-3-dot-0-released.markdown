---
layout: post
title: "SuccessWhale 3.0 Released"
date: 2014-05-30 18:33
comments: true
categories: 
- Software
- Projects
- Internet
tags:
- SuccessWhale
- Release
---

It turns out that [my previous post about SuccessWhale](/blog/state-of-the-whale-address/), bemoaning how it had stagnated and become more trouble than it was worth, was just enough venting to kick me up the arse and get me going again. And so, not long later, I am proud to announce the release of [SuccessWhale version 3](https://successwhale.com).

![SuccessWhale 3.0 Screenshot](/img/blog/2014/05/successwhale-screenshot.png)

As promised, it is a complete rewrite from the ground up, transforming a ugly mash of PHP, HTML and JavaScript into a neatly separated JavaScript client and Ruby API. In terms of the user experience, not a lot has changed &mdash; a lot of work has been done just to keep things the way they are. But the best bits about SuccessWhale v3 are where it goes from here.

The API now builds on modern tools and libraries, meaning that Twitter and Facebook's "breaking changes" will result in fewer problems and quicker fixes for SuccessWhale. The separation between GUI and API also means that bugs can be found and fixed more easily, without the risk of GUI tweaks breaking the back-end or vice versa.

Plus, it means that SuccessWhale's abilities are open to other clients. Our API is freely usable by anyone, meaning that you can create your own desktop, mobile or web app using SuccessWhale without having to delve into and run your own back-end code. Already we have a native Android app supporting SuccessWhale &mdash; [OnoSendai](http://onosendai.mobi).

SuccessWhale remains free and open source ([Web app source](https://github.com/ianrenton/SuccessWhale) [API source](https://github.com/ianrenton/SuccessWhale-api/) and [BSD-licenced](http://opensource.org/licenses/BSD-2-Clause), so you can take it, modify it, use it in your own projects, and generally do whatever you like with it. If you do write another SuccessWhale API client or remix it for your own needs, please let me know &mdash; I'd love to see!

As always, **SuccessWhale is available for free on the web at [www.successwhale.com](https://successwhale.com)**.

If you're new to SuccessWhale, you can find out more about it on the [About page](https://successwhale.com/about), and experienced users should check out the [What's New page](https://successwhale.com/whatsnew).

I'd like to take this opportunity to thank [my wife](http://ericthegirl.onlydreaming.net) for putting up with many long nights in front of my laptop, and my good friend, alpha tester and OnoSendai author [haku](http://haku.me/) for filing more bugs than I could possibly imagine.

I hope you all enjoy using SuccessWhale as much as I enjoyed writing it!
