---
title: The Open Source Disadvantage
layout: post
date: 2016-10-28 07:10
categories:
- Internet
tags:
- RSS
- Reader
- Open Source
---

Three years ago, Google shut down its popular RSS reader web application. The decision angered many users, and I penned [a long rant](/blog/google-reader-vs-do-no-evil/) about how horrible proprietary services are as they can be taken away from the users at any time without their consent.

I found the [News app for OwnCloud](https://github.com/owncloud/news), installed in on my own server and never looked back.

Until today.

Updating the version of OwnCloud on my server, to get the latest security patches, has broken the News app permanently.

It turns out that some time ago [the OwnCloud development team split acrimoniously](https://owncloud.org/blog/owncloud-statement-concerning-the-formation-of-nextcloud-by-frank-karlitschek/) and started a rival fork called "NextCloud". The maintainer of the News app jumped ship, [leaving OwnCloud News unmaintained](https://github.com/owncloud/news/issues/1011#issuecomment-239491614) until it eventually broke.

It looks like I now have three options:

1. Take over development of an abandoned project, which I am (in terms of both time and experience) ill-equipped to deal with
2. Migrate from OwnCloud to NextCloud, a [complex process](https://help.nextcloud.com/t/migrating-from-owncloud-to-nextcloud/551/67) which also involves changing the software I use for file, contacts and calendar synchronisation
3. Use a proprietary service like [Feedly](https://feedly.com/) instead.

As you might imagine, I picked option 3. I was up and running again within five minutes.

It's enough of a frustrating experience to have me considering the reverse of a post I made years back, considering [which proprietary services I should stop using](/blog/could-i-live-without/) in favour of doing my own thing. Since then I started running my own mail server, as well as OwnCloud, to meet my online needs; I [migrated all my websites from Heroku to my own server](/blog/preparing-to-leave-heroku/) as well. I learnt a lot&mdash;that fighting spam is hard, SPF is hard, maintaining SSL certificates is hard, few clients support CalDav and CardDav properly, and so on.

It's been an experience, certainly&mdash;mostly a good one, or at least an interesting one. But I do wonder, over the years, how much frustration and wasted time I've had that could have been saved by dropping my ideological preference for open source software and "DIY", and accepting that even if they can shut down unexpectedly, some proprietary services are just *so much easier*.
