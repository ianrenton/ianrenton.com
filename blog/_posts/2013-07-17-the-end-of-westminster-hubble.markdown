---
layout: post
title: "The End of Westminster Hubble"
date: 2013-07-17 12:59
comments: true
categories: 
- Internet
- Software
- Politics
tags:
- westminster
- westminsterhubble
- web apps
- webapps
- web
- politics
- software
- website
- forwestminsterhubble
---

Three years ago, after a two-month secret development period working with my old school friend [Chris](http://recampaign.blogspot.com/2010/01/about-me.html), we [announced Westminster Hubble](/blog/announcing-westminster-hubble/).

The name was a pun on the ["Westminster Bubble"](https://en.wikipedia.org/wiki/Westminster_Bubble) in which MPs are sometimes unkindly said to live &mdash; implying a lack of awareness of the rest of the country &mdash; and "Hubble" alluding to the [Hubble Space Telescope](http://hubblesite.org/), which has allowed us to see distant objects in more detail than ever before.

Westminster Hubble was a website that aimed to bring MPs and their constituents closer online by providing a single location to find contact details for an MP, in real life and on social networks. It also provided customised feeds of MPs' activity from a variety of sources, from YouTube videos to speeches made in the House of Commons. At its core was a RSS-parsing engine powered by [SimplePie](http://simplepie.org/) that pulled in content from all the sources it knew about as quickly as it could, stashing the results in one giant database table. The contents of this would then be served to users as HTML, or as an RSS "meta" feed to users who preferred to get the data that way.

![Westminster Hubble MP Feed](/img/blog/2013/07/wh-tom.png){: .center}

> Westminster Hubble's main "feed" page for an MP, in this case tech-savvy MP [Tom Watson](http://www.tom-watson.co.uk/).

Amongst my favourite features were the Google Maps / [They Work For You](http://www.theyworkforyou.com/) mashup that allowed users to find their local MP in an intuitive way, and the "badges" awarded to MPs for particular dedication (or just a lot of tweeting).

![Find Your MP map](/img/blog/2013/07/wh-map.png){: .center}

> Westminster Hubble's "find your MP" map

We launched just after similar service [Tweetminster](http://tweetminster.co.uk/) really took off, and although we never achieved their relevance or their [Wired UK features](http://www.wired.co.uk/news/archive/2011-02/17/tweetminster-new-platform-whitehall) I still feel that we were offering separate complimentary services &mdash; Tweetminster curated tweets around particular subjects for use by those in and around Westminster, while we pulled together tweets and other items from particular *people inside* Westminster and provided them to those on the *outside*.

In many ways, Tweetminster provided a *destination*, somewhere people would go to get information, whilst Westminster Hubble was designed to fade into the background and become part of the plumbing of the internet &mdash; RSS feeds went in, RSS feeds came out in a more structured form as chosen by the users. In many ways, then, it shouldn't be surprising that this week I am closing Westminster Hubble due to a lack of use. Without the user appeal of being a "destination", the users didn't come &mdash; didn't spread the word.

![Westminster Hubble "badges"](/img/blog/2013/07/wh-badges.png){: .center}

> Westminster Hubble "badges"

In recent months, the web itself seems to have turned a corner from the heady days of the early 2000s; [the Web we lost](http://dashes.com/anil/2012/12/the-web-we-lost.html). Twitter's discontinued API v1 takes with it the availability of RSS feeds for a user &mdash; parsing Twitter feeds now requires a "proper" Twitter client that must authenticate and use the JSON API. Facebook pages no longer advertise their RSS feeds; third-party tools must often be relied upon instead.

It seems the days of mashups, of open services that exposed their data in freely-usable machine-readable formats, are fading. Facebook, and to a lesser extent Twitter, are realising that to maximise their profits, they need to keep users on their sites rather than accessing their data from elsewhere. They are becoming [walled gardens in the tradition of AOL](http://usatoday30.usatoday.com/tech/news/story/2012-05-01/facebook-aol-walled-garden/54669780/1), a transition that is fundamentally bad for the free and open web that most of us enjoy today.

If I were more of an activist, I would keep Westminster Hubble alive and fix its links to Twitter and Facebook precisely for the reason that this trend needs to be fought &mdash; that the British public should have the right to see what MPs post on ["walled garden"](https://en.wikipedia.org/wiki/Closed_platform) websites without the members of the public themselves needing to enter that garden. But the fact of the matter is that Westminster Hubble has failed to become a popular service. In the past month there have been exactly *six* unique visitors, and that includes consumers of the RSS feeds.

It is tempting to leave the service running somewhere in some capacity &mdash; its database currently contains nearly a million items posted by MPs over the course of 16 years. (Westminster Hubble has only been running for three years; it retrieves old posts from feeds when it can.) However, there seems little point in maintaining the [domain name](http://www.westminsterhubble.com), the [Twitter account](https://twitter.com/westminsterhub) and the [Facebook page](https://www.facebook.com/pages/Westminster-Hubble/131789076860594) for a service that now sees so few users.

For anyone wanting one last play with the site, on the understanding that many social network integration features no longer work, can do so on the [Westminster Hubble temporary server](http://wh.onlydreaming.net). On request I am also happy to host the complete (~420MB) database dump, in case anyone wants a large data set of MP activity on which to run some analysis.

To everyone else who has used Westminster Hubble over the years, thank you. I hope it proved useful, and I like to hope that maybe even one of you was inspired by it to support an open government, to campaign for it, or to follow in the footsteps of Chris and I and build your own tools to make it happen.

After many MPs have held Hubble's "badges" over the years, I'd like to award one special, final badge of honour. The Westminster Hubble award for Social Network Mastery could go to nobody else: ladies and gentlemen, Ed Balls.

<blockquote class="twitter-tweet"><p>Ed Balls</p>&mdash; Ed Balls (@edballsmp) <a href="https://twitter.com/edballsmp/statuses/63623585020915713">April 28, 2011</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

So long, and thanks for all the fish.
