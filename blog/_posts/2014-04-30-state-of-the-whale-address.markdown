---
layout: post
title: "State of the Whale Address"
date: 2014-04-30 20:46
comments: true

- Software
- Projects
- Internet
tags:
- SuccessWhale
- Facebook
- Twitter
- Rant
- Update
---

It's no secret that the current state of my SuccessWhale social network client is not a good one. It currently exists in three forms:

* [The main server](https://successwhale.com) runs SuccessWhale version 2.0.3. It's not been updated in nearly a year, and the only changes within the last three years have been playing catch-up with the changing Twitter and Facebook APIs. It probably has some broken features by now, because I don't regularly test it out.
* [The test server](http://test.successwhale.com) runs SuccessWhale version 2.1.2 with debug flags enabled. The 2.1 branch includes things like mixed feeds and LinkedIn support, and is "beta-ish". Some people use it anyway. LinkedIn support is broken and will never be fixed.
* [The dev server](http://dev.successwhale.com) runs SuccessWhale version 3.0.0-dev, a complete rewrite of the whole thing that has stalled in a half-finished state. It's just about usable provided you're willing to drop back to the test server to fiddle with any settings (they use the same database). It's buggy, and as far as I know used only by me.

![SuccessWhale 3 interface](/img/blog/2014/successwhale-3.png){: .center}

> SuccessWhale v3.0 web interface

Very occasionally, I get the motivation to do something about SuccessWhale. It feels bad to leave it in its current "limbo" state where there isn't really a version that works and is properly maintained. *I* use SuccessWhale every day, so at least there's the [dogfooding](http://blog.codinghorror.com/the-ultimate-dogfooding-story/) aspect, but "it works well enough for me" is far from "it's something other people would want to use". And my friend [Alex](http://haku.me/) produces the excellent [OnoSendai](http://onosendai.mobi) Android client that uses SuccessWhale, so I have some sort of responsibility to him to keep SuccessWhale going.

But there's a hell of a lot of reasons why I would rather not.

* **Free time is nice.** [I started SuccessWhale five years ago](http://blog.ianrenton.com/announcing-successwhale), when I still had the energy to keep big projects going. Now, with less free time in the evenings and more responsibilities in my day job, I'm much more keen on grabbing a few minutes of that blissful feeling that comes from having *nothing to do*.
* **We created a monster.** SuccessWhale (or FailWhale as it was then called) was first and foremost a simple Twitter client. I explicitly declared that it would never be a client for other social networks such as Facebook. Nowadays, SuccessWhale has its own API that wraps [both Twitter and Facebook](http://blog.ianrenton.com/announcing-successwhale-version-2-0), along with several front-ends.
* **Rewrites are no fun.** Version 2.0 was badly coded and had to go. Version 3 is nice and designed properly from the start! But it requires hundreds of hours of work just to let it do all the things that version 2 could already do.
* **The APIs are crap.** In fairness to Twitter, its API is well-documented and makes a lot of sense. But, like all APIs it is regularly updated, meaning that all application developers need to work just to keep up &mdash; we put hours in not to add new features, but just to make sure the existing stuff doesn't break.<br/>Facebook's API is much the same, except that it makes much less sense and the documentation is largely non-existent. It's quite telling that I asked [a simple question on StackOverflow](http://stackoverflow.com/questions/7122394/in-the-facebook-api-how-can-i-retrieve-the-source-object-from-a-notification-ob), and a Facebook dev replied with "here's how to do it. I guess I'd better add that to the docs, huh?"
* **The services are hostile.** Twitter, once the darling of those that believed in a strong 3rd-party client ecosystem, are now [actively hostile to developers](http://ryanmarkel.com/2012/09/07/twitters-api-and-user-hostility/) that create clients like mine that "replicate the core Twitter experience". It's not nice to develop with a hard 10,000-user limit hanging over your head because you're making a client for a service that would rather your software didn't exist.<br/>Facebook isn't so hostile, but its privacy settings mean that SuccessWhale is only useful to a user [if their friends have configured their privacy settings badly](http://blog.ianrenton.com/from-hells-heart-i-stab-at-thee-thou-facebook-privacy-model).
* **The services are crap.** Twitter is the playground of celebrities, companies seeking "engagement" and people who want to have a ["personal brand"](https://medium.com/better-humans/6d0174c3a4cf). Its artificial 140-character limits and endless retweets are not a good medium for talking to friends, which is all I want to do. Facebook is a privacy-violating monster on course to [balkanise the web](http://www.dailydot.com/business/walled-garden-facebook-pages/) with its all-consuming reach. These services are the internet now, and my [pleas to return to more honest times](http://blog.ianrenton.com/lament-for-web-0-1) fall on deaf ears. But I don't *want* to use them, and that makes developing a client for them a distinctly unfulfilling experience.

For now, SuccessWhale stays alive. Twitter and Facebook are what I'm stuck with as the only sensible way of communicating with many of my friends and family, and SuccessWhale helps me avoid the worst features of their interfaces &mdash; their cryptically-curated feeds, in-line adverts and one-feed-at-a-time pages. That, plus a vague sense of responsibility to my users, are what keeps it around.

When the day comes that I can jetission Twitter and Facebook from my life without missing them, it will be SuccessWhale whose loss I mourn. Like many projects before it, its user count will fall to zero and it will slowly start to fade from the internet.

One day, I'll be sad that I made a thing that is no more. But right now, all I feel for the thing is the frustration that developing it is fighting a losing battle that has no end in sight.
