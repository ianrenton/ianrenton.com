---
author: Ian
comments: true
date: 2010-09-09 23:25:48
layout: post
slug: a-thousand-words-finishing-touches
title: 'a thousand words: Finishing Touches'
wordpress_id: 11276
categories:
- Internet
- Projects
- Software
- UX and Design
- Writing
tags:
- AThousandWords
- Code
- Development
- Fiction
- Internet
- Project
- Software
- Test
- Web
---

The vast majority of user-reported bugs and requested features on ["a thousand words"](http://athousandwords.org.uk) have now been sorted out.  As requested by my co-conspirator Eric, we now have an 'adult content' filter based on a date of birth field in users' profiles, and a 'report' button to bring problematic stories and pictures to the attention of the moderators.  There's also a DeviantArt-style "request critique" option to let users know what kind of comments you're looking for.

Timestamps have been fixed, "no stars yet" ratings introduced, and text field policies such as "mustn't be empty" have been added across the site.  A few rendering issues in IE have been sorted out, so it now looks much the same across all platforms.

The biggest change is unfortunately something most of you will never see -- the moderator console.  Picture submissions and reported stories/pictures now sit in queues that can be dealt with by moderators.  An item entering a queue triggers an e-mail to all mods, who are invited to review it and make changes as appropriate.  Once changes are made, the affected users are then e-mailed to let them know what happened (and in the case of reported items, to give them a chance to challenge it).

There's one major feature request that's not yet been implemented: file uploads.  Once in the system this would allow users to submit pictures from their hard drives rather than from the web by URL, and would allow moderators to copy URL-linked pictures to the site to avoid hotlinking.  (At present we don't hotlink, but we do therefore have to copy pictures to the site manually using FTP.)  It could also allow users to use a non-[Gravatar](http://gravatar.com) picture for their profile.

Depending on how things go, that may or may not be ready by tomorrow night.  On Saturday morning I jet off to sunny Saudi Arabia, so any changes not made by then are going to remain unmade for a while.  From that point it's in Eric's capable hands as to whether she wants to release the site or not.  Even if the site does advance to release status, I'm still taking bug reports (they'll sit in my inbox until I get back), so keep on letting me know what's broken and what you'd like to see added!
