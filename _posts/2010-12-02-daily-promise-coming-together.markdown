---
author: Ian
comments: true
date: 2010-12-02 23:35:30
layout: post
slug: daily-promise-coming-together
title: 'Daily Promise: Coming Together'
wordpress_id: 11344
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

Despite the lack of response to my [earlier post](http://ianrenton.com/blog/daily-promise-design-sketches), in which I floated my design concepts for "Daily Promise", boredom won out in the end and I started coding anyway.

It's now coming together, and all bar the Twitter-integrated social aspects are largely complete.  Here's how it's developed:

### Home Page

[![Daily Promise: Home](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-home-300x166.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-home.png)The social side -- top users, etc. -- still isn't implemented, but there's a reasonable-looking homepage in there.  The main body is taken up with a short description and a big graphic explaining how the site works.  Side-bar widgets provide the Twitter login and alternative login (bypassing `twitter.com`).  The site now has a proper name, _Daily Promise_, and with it a logo and style that is reflected throughout.

### Set Up Goals ("Manage")

[![Daily Promise: Manage](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-manage-300x181.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-manage.png)The "Manage" page has remained almost exactly faithful to the design.  New promises can be created, old ones deactivated and deactivated ones can be activated again.  A Tweet box appears for the user to announce their new promise, if desired.

### Daily Performance ("Enter")

[![Daily Promise: Enter](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-entry-300x120.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-entry.png)Again, there's not a lot of difference here between the design and the reality.  Each promise has a yes/no choice, and after completing a day's entries, Tweet boxes appear for the user to let their friends know about their successes and failures.  "Winning streaks" aren't yet implemented.

### Performance Log ("View")

[![Daily Promise: View](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-view-300x160.png)](https://files.ianrenton.com/sites/blog/2010/12/dailypromise-view.png)There's no ability to scroll through your history yet, but the default display shows 4 weeks (which scroll if necessary).  Just as in the design drawings, the history table is followed by a text summary of how the user is doing.

The "View" page also, with a few additions, becomes a user's profile page, which is accessible to other users.

### Configuration

Here you can set your password for the alternative login, and delete your account.  It's exactly as dull as it sounds.

### Friends

That's my big job for the next few days!  It doesn't exist yet, but it's now my top priority.
