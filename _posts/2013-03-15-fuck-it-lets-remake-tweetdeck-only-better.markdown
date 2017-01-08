---
author: Ian
comments: true
date: 2013-03-15 22:42:44
layout: post
slug: fuck-it-lets-remake-tweetdeck-only-better
title: Fuck it, Let's Remake TweetDeck. Only Better.
wordpress_id: 13513
categories:
- Internet
- Software
- Projects
tags:
- API
- Facebook
- LinkedIn
- OnoSendai
- SuccessWhale
- TweetDeck
- Twitter
---

It's no secret that, since [the launch of version 2.0](http://blog.ianrenton.com/announcing-successwhale-version-2-0/) back in July of 2011, my [SuccessWhale](https://successwhale.com) social network client has stagnated somewhat. It had reached that point at which it did everything that I needed it to do, and so my enthusiasm for updating it kind of disappeared.

![](https://files.ianrenton.com/sites/blog/2013/03/successwhale2.png){: .center}

> SuccessWhale 2.0

Well, no longer. [Twitter discontinued TweetDeck](http://blog.ianrenton.com/alas-poor-tweetdeck/), the only Android client that merged Twitter notifications and Facebook feeds without sucking. At the same time it discontinued TweetDeck's desktop client, and removed Facebook support from the web-based client.

That _really sucks_.

And that's where SuccessWhale comes in.

I'm no longer content with the ways in which I interact with Twitter and Facebook, particularly on mobile devices, so we're going to fix it.

SuccessWhale began as a "my first PHP application" kind of affair, and right now it still is. [The code behind it](https://github.com/ianrenton/successwhale) is an ugly mash of [model, view and controller](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) without a decent structure. SuccessWhale version 3 will be rebuilt from the ground up with proper design principles behind it.

It begins with [a proper API](https://github.com/ianrenton/successwhale-api), which I'm coding up right now using the [Sinatra](http://www.sinatrarb.com/) framework in Ruby. Once complete, the web-based front end will be rewritten too, as a strict user of the API using client-side templating in JavaScript. It will be a responsive design, displaying the user's preferred number of feed columns in landscape mode and reverting to a single swipe-able column in portrait mode for mobile phones.

Even better, [haku](https://github.com/haku) is making an Android client called [OnoSendai](https://github.com/haku/Onosendai) which will feature the combined feed columns that are SuccessWhale's major feature. We will bring TweetDeck's feature set back to Android with a lot more besides, offering the users the ability to mix together the feeds in their social network client like never before.

And to prevent our software going the way of TweetDeck -- being bought up and eventually scrapped -- SuccessWhale and OnoSendai are open source software. A version of SuccessWhale's API, operating on the main database at [successwhale.com](https://successwhale.com), will be open for anyone to use and build clients for. SuccessWhale is released under the [BSD 2-clause licence](https://github.com/ianrenton/successwhale-api/blob/master/LICENSE.md) and OnoSendai under the [Apache 2.0 licence](http://www.apache.org/licenses/LICENSE-2.0.txt), meaning that even if we were to be bought out, anyone on the web could simply grab our source code and run their own SuccessWhale.

We're bringing TweetDeck's features back to Android and to the web. We're making SuccessWhale an application to be proud of. We're free, we're open, and we're Twitter-proof.
