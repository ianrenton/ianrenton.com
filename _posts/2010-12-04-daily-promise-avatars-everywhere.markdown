---
author: Ian
comments: true
date: 2010-12-04 13:35:52
layout: post
slug: daily-promise-avatars-everywhere
title: 'Daily Promise: Avatars Everywhere!'
wordpress_id: 11350
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

After a couple of days and one frantic family-free morning, _Daily Promise_ is getting near completion.  Here's what's new since last time.

_(This is post number 3 in my series on the development of _Daily Promise_.  The others are here: [Design Sketches](http://ianrenton.com/blog/daily-promise-design-sketches), [Coming Together](http://ianrenton.com/blog/daily-promise-coming-together/).)_

### Friends Page

[![Daily Promise: Friends](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-friends-300x201.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-friends.png)Here's the Friends page - again, almost no deviation from the original design sketch.  The friends page pulls in the list of people that you follow on Twitter, matches it up against Daily Promise's user list, and if any match, they're your Daily Promise friends!  They're simply displayed in alphabetical order, along with a summary of their performance.  Invisible users (see later) don't appear, even to their friends.

### Nicer User Pages

[![Daily Promise: User Page](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-userpage-300x93.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-userpage.png)Clicking on one of your friends takes you through to their 'view' page (minus any editing functionality).  It also shows you their Twitter bio, and how long they've been using Daily Promise.

### Top Users Widget

[![Daily Promise: Top Users Widget](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-topusers.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-topusers.png)There's now a "top users this week" widget on the home page, showing the performance of the top 5 users.  This resets at midnight on Monday morning.

### Spam your Friends!

[![Daily Promise: Tweet Box](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-tweet-300x78.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-tweet.png)Twitter integration now includes boxes suggesting Tweets you might like to make after each significant activity.  Just as promised in the "How does it work" graphic, Daily Promise never posts to your Twitter account without you deliberately clicking a "Tweet" button each and every time.  Do no evil!

### Behind the Scenes

A lot of other stuff has changed in the last few days that isn't immediately obvious to users:

	
  * **Authentication fixed** -- users using the alternative login weren't able to do Twitter things. That's sorted.

	
  * **Account visibility** -- your account can now be set to invisible, meaning it won't appear anywhere -- top users, friends lists, etc.  New accounts are given a prompt to set their visibility before starting to add promises.

	
  * **Account deletion simplified** -- you now only have one, nuclear, option for account deletion.  It erases all traces of you having used the site.  Do no evil! :)

	
  * **Removed promises no longer shown in the history table** -- 'cos no-one likes to be reminded.

	
  * **Fill in data for yesterday** -- when creating a promise, users can opt to enter data for yesterday, giving them something to fill in straight away.

	
  * **History table scrolls** -- narrow displays can't fit the whole history table in, so now it scrolls (in reasonably modern browsers).

	
  * **Time zones implemented** -- we pull the timezone you have set in Twitter, so Daily Promise will roll over to a new day at your local midnight.

	
  * **Crontastic!** -- we now update stats and things from an hourly timed cron, to avoid extra loading on user-requested pages.

### Next Steps

This all brings me to the slightly worrying conclusion that _Daily Promise_ is damn near finished.  So, where do we go from here?  I'll have a few more days of bug-fixing and implementing features that people request, and then it's difficult decision time:

This has been a fun project for the last week or so -- does it deserve a domain and advertising, or shall I let it quietly die?
