---
author: Ian
comments: true
date: 2010-08-28 22:54:52
layout: post
slug: a-thousand-words-first-sketches
title: 'a thousand words: First Sketches'
wordpress_id: 11265
categories:
- Internet
- Projects
- Software
- UX and Design
- Writing
tags:
- Announcement
- AThousandWords
- Code
- Development
- Eric
- Fiction
- Internet
- Project
- Software
- Stories
- Web
---

With the main browsing UI for [a thousand words](http://athousandwords.org.uk) up and running, it's time to bore the world with more pointless trivia before moving on.  Today: design sketches!

Pretty much every software project I undertake these days begins with a sketch of the user interface and an initial structure for the database.  Labouring under the cruel 'no whiteboard' conditions at home (maybe I should get one?), I drew these out on paper.  Passing the UI sketch over to Eric after about 5 minutes' work, she described it as "awesome".  I think that's the first time that's ever happened; the general response at work is along the lines of "but where are you going to put giant-ugly-element-X that I've just thought of and wasn't in the spec?".  So that was that, and I've coded it up pretty much as it was on paper.

The database hasn't changed much from the original design yet, but it will have to soon -- as designed, the vote ('stars') system doesn't record each user's vote on each story, so it can't support users changing their vote.  Sometime during development I'll have to devote a few hours to figure out the best way of handling it, though that probably comes down to a few minutes as someone on [Stack Overflow](http://www.stackoverflow.com) has inevitably asked about it already.

[![a thousand words UI Sketch](/img/blog/2010/08/1kw-mainui-217x300.jpg)](/blog/2010/08/1kw-mainui.jpg)
[![a thousand words Database Design](/img/blog/2010/08/1kw-db-217x300.jpg)](/blog/2010/08/1kw-db.jpg)

Next up on a thousand words is coding the first few forms that will allow users to register and log in, submit photos and submit stories.  That should be done within the next few days, and will allow me to play with actually changing the contents of the database, rather than just showing views of it.
