---
layout: post
title: "The End of the Road for SuccessWhale's Facebook Support?"
date: 2015-03-07 17:16
comments: true
categories: 
- Software
- Projects
- Internet
tags:
- SuccessWhale
- API
- Facebook
- Sad times
---

My [SuccessWhale](https://successwhale.com) application has long supported both Twitter and Facebook social networks, despite both networks' relatively developer-hostile stances. The worst offender by far was Twitter, with it's [100,000 user limit](http://www.theverge.com/2012/11/11/3631108/tweetro-user-token-limit-api) that has deliberately crippled many third-party clients in order to drive users to the official website and app, which make money for Twitter through adverts. While I was never under any delusion that SuccessWhale would be popular enough to reach 100,000 users, it's not a nice thing to have hanging over your head as a developer.

Facebook's permissions policy, [as I have ranted about before](http://blog.ianrenton.com/from-hells-heart-i-stab-at-thee-thou-facebook-privacy-model), also makes it difficult for third-party clients to deliver a useful service for their users. With the new [requirement that apps migrate to API v2](https://developers.facebook.com/blog/post/2015/02/26/login-migration/?ref=hp), they are adding the extra hassle of requiring all apps be reviewed by Facebook staff. This isn't a problem itself &mdash; SuccessWhale has been through the somewhat scary process of manual review before when it was [added to the Firefox Marketplace](https://marketplace.firefox.com/app/successwhale).

But Facebook has now snuck something extra into the notes for some of its permissions, each of which must now be manually approved as part of the review process. Into pretty much all the permissions that are fundamental for SuccessWhale, such as `read_stream`:

![Facebook dialog for read_stream permission](/img/blog/2015/fbperms.png){: .center}

Yep, this permission will be denied, as a matter of policy, to apps running on Android, iOS, web, desktop, and more.

So predictably, SuccessWhale failed its manual review and has been denied approval to use Facebook API v2.0 or above. As far as I can tell at this point, that means on May 1st all Facebook features of SuccessWhale will cease to function. Facebook, ever the proponent of [the walled garden](http://www.extremetech.com/computing/181332-aol-2-0-how-facebook-is-bringing-back-the-walled-garden-internet-ecosystem) path down which [Twitter has ventured as well](http://www.theverge.com/2012/7/9/3135406/twitter-api-open-closed-facebook-walled-garden), has struck another blow for increasing their profits and user lock-in at the expense of the open web that SuccessWhale depends on.

It's a sad time for the web; the "web 2.0" of mashups and free access to data is slipping away with it. And though Facebook's change does not kill off SuccessWhale and its kin outright, the future does not look rosy for us developers that believe users should be free to access a service in a way they prefer.
