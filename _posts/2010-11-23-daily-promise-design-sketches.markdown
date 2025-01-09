---
author: Ian
comments: true
date: 2010-11-23 15:09:39
layout: post
slug: daily-promise-design-sketches
title: 'Daily Promise: Design Sketches'
wordpress_id: 11333
categories:
- Projects
- Software
- UX and Design
tags:
- Code
- Concept
- Daily Promise
- Design
- Health
- Notes
- Programming
- Prototype
- Sketch
- Software
- Web
---

Current flavour of the month of some of the geek crowd, ["Health Month"](http://www.healthmonth.com), is a social network of sorts on which users compete to achieve certain health-related goals.  Each month, each member sets a number of goals for themselves to achieve.  Its core mechanic is health points -- you start with 10, lose one every time you fail to meet a goal, and players who perform well can heal you.

I'm enjoying my use of the site with three goals this month, but I'd like to step it up and set lots.  Unfortunately, having more than three goals costs money.  (Not that I think the site's owners don't have a right to charge, but it can be a deterrent to users such as myself.)  It also currently only allows two "custom" rules per month -- beyond that, you have to stick with the pre-defined ones.

Another social health site is [Tweet What You Eat](http://www.tweetwhatyoueat.com), on which users tweet their food intake and have the site, or the community, calculate statistics such as their calorie intake.

Over my lunch hour, I've come up with some sketches for a site that sits somewhere between the two.  It takes _Health Month_'s goals mechanic, opens it up and removes some of the social aspects that in my opinion _Health Month_ doesn't implement all that well.  It also drifts closer to _Tweet What You Eat_, in that rather than being its own service it piggybacks of Twitter for its social side.

At the moment this is just a fun concept I'm toying with -- I don't really have the time to make it at the moment, I doubt the space between _Health Month_ and _Tweet What You Eat_ is wide enough to make a new site popular, and I feel a little guilty about thanking _Health Month_ for the enjoyment I've had by becoming its competitor.

In the notes below it's dubbed _healthi.ly_, though as that domain is parked, it's come to be known as "Daily Promise" instead.

### Home Page

[![Daily Promise Home Page](/img/blog/2010/11/healthily-front-229x300.jpg)](/blog/2010/11/healthily-front.jpg)The home page would largely be a "log in / register" affair, possibly also showcasing successful and popular users in a side-bar (not shown).  Big banner text explains the rough concept, with a "read more" link to a full "About" page.  On the registration side, we make it clear exactly what _Daily Promise_ does and doesn't do with access to your Twitter account.

### Set Up Goals

[![Daily Promise Goals Page](/img/blog/2010/11/healthily-setup-228x300.jpg)](/blog/2010/11/healthily-setup.jpg)The main setup page is where you set your goals.  Users can set any (reasonable) number of goals, they can drop and resurrect old ones, and add new ones, at any time.  Performance against all the goals is tracked and visible on this page.  Adding new goals and dropping old ones can be tweeted, but as with every tweet opportunity, the user is presented with an @Anywhere box that they can freely edit and can choose not to tweet as easily as they can choose _to_ tweet.  The tweet links to the list of goals on their profile.

### Daily Performance

[![Daily Promise Daily Performance Page](/img/blog/2010/11/healthily-daily-236x300.jpg)](/blog/2010/11/healthily-daily.jpg)Once goals are set, the user logs in each day (and can fill in past gaps) with whether or not they have met each goal.  Each day's entry presents some brief statistics, and you get more stats on the week after filling in Sunday's performance.  Very good or very bad performance suggests a Tweet that a user might like to make.  The tweet links to their performance log on their profile.

### Performance Log

[![Daily Promise Performance Log](/img/blog/2010/11/healthily-log-232x300.jpg)](/blog/2010/11/healthily-log.jpg)This is a user's main screen.  It displays a chart of passes and fails for the last month or so as green (pass), red (fail) or grey (goal not active) squares.  Below the chart, more detailed stats are presented, as well as an encouraging text summary of how the user is doing.

### Settings

Most of the core settings such as username, display name, avatar and bio are handled by Twitter.  _Daily Promise_'s settings probably boil down to privacy (stop me being searchable, delete my account, etc.) and removing annoyances (always tweet on condition x, never tweet on condition y, etc. -- all of which have an "ask me" setting by default).

### Friends

[![Daily Promise Friends Page](/img/blog/2010/11/healthily-friends-232x300.jpg)](/blog/2010/11/healthily-friends.jpg)The user's "following" list from Twitter is used to generate their list of _Daily Promise_ friends.  Avatars, usernames and _Daily Promise_ performance summaries are displayed here.  Clicking through to a user's profile shows the "performance log" page, topped with name / avatar / bio / etc.

  

So, and interesting idea, or an appalling one?  Would you use this?  Should I get off my arse and code?  Should I have finished the last six things I started before prototyping something new?  Your thoughts are, as always, appreciated.
