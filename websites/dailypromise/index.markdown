---
layout: post
title: "Daily Promise"
date: 2017-01-13 21:59
comments: true
categories:
- Internet
- Software
tags:
- dailypromise
- web apps
- webapps
- web
- software
- website
---

"Daily Promise" was a simple web application built on the Twitter API that allows users to make "promises", then fill in whether they've kept them on a day-to-day basis, and compete to be the best. I developed it to "scratch an itch", though in the years since it was active many other solutions have appeared to fill the same use case, largely phone apps. Only around a dozen people ever used the site, and hit has now been discontinued.

![Daily Promise intro](/websites/dailypromise/screenshot.png){: .center}

> The Daily Promise intro page

![Daily Promise scoreboard](/blog/2010/12/dailypromise-topusers.png){: .right}
The main interface to the site was a simple chart display, with red or green squares depending on whether you'd kept each promise on each day. The Twitter API was used as the user account system on the site, and it pulled in the list of your Twitter friends who also used Daily Promise so that you automatically competed against your friends to keep the most promises.

![Daily Promise chart](/blog/2010/12/dailypromise-userpage.png){: .center}

> The Daily Promise chart

The code was open source from the start and can be [downloaded from GitHub](https://github.com/ianrenton/DailyPromise). I wrote this code a long time ago, and the quality of it is pretty bad, but it is functional. The site never really took off, and changes to the Twitter API have since broken the login mechanism, which is Twitter OAuth based.

Development
-----------

The development of the site was detailed in a series of blog posts:

1. [Daily Promise: Design Sketches](https://ianrenton.com/blog/daily-promise-design-sketches)
2. [Daily Promise: Coming Together](https://ianrenton.com/blog/daily-promise-coming-together)
3. [Daily Promise: Avatars Everywhere!](https://ianrenton.com/blog/daily-promise-avatars-everywhere)
4. [Announcing: Daily Promise!](https://ianrenton.com/blog/announcing-daily-promise/)
