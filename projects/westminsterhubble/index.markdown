---
layout: page
title: "Westminster Hubble"
date: 2017-01-13 21:59
comments: true
tags:
- westminster
- westminsterhubble
- web apps
- webapps
- web
- politics
- software
- website
---

Westminster Hubble was a website that aimed to bring MPs and their constituents closer online by providing a single location to find contact details for a British Member of Parliament, in real life and on social networks. It also provided customised feeds of MPs' activity from a variety of sources, from YouTube videos to speeches made in the House of Commons. At its core was a RSS-parsing engine powered by [SimplePie](http://simplepie.org/) that pulled in content from all the sources it knew about as quickly as it could, stashing the results in one giant database table. The contents of this would then be served to users as HTML, or as an RSS "meta" feed to users who preferred to get the data that way.

The name was a pun on the ["Westminster Bubble"](https://en.wikipedia.org/wiki/Westminster_Bubble) in which MPs are sometimes unkindly said to live &mdash; implying a lack of awareness of the rest of the country &mdash; and "Hubble" alluding to the [Hubble Space Telescope](http://hubblesite.org/), which has allowed us to see distant objects in more detail than ever before.

![Westminster Hubble MP Feed](/img/blog/2013/07/wh-tom.png){: .center}

> Westminster Hubble's main "feed" page for an MP, in this case tech-savvy MP [Tom Watson](http://www.tom-watson.co.uk/).

Amongst my favourite features were the Google Maps / [They Work For You](http://www.theyworkforyou.com/) mashup that allowed users to find their local MP in an intuitive way, and the "badges" awarded to MPs for particular dedication (or just a lot of tweeting).

![Find Your MP map](/img/blog/2013/07/wh-map.png){: .center}

> Westminster Hubble's "find your MP" map

We launched the site just after similar service [Tweetminster](http://tweetminster.co.uk/) really took off, and although we never achieved their relevance or their [Wired UK features](http://www.wired.co.uk/news/archive/2011-02/17/tweetminster-new-platform-whitehall) I still feel that we were offering separate complimentary services &mdash; Tweetminster curated tweets around particular subjects for use by those in and around Westminster, while we pulled together tweets and other items from particular *people inside* Westminster and provided them to those on the *outside*.

![Westminster Hubble "badges"](/img/blog/2013/07/wh-badges.png){: .center}

> Westminster Hubble "badges"

The beginning (and end) of Westminster Hubble were documented in a series of blog posts at the time:

1. [Announching: Westminster Hubble](https://ianrenton.com/blog/announcing-westminster-hubble/)
2. [The Technology of Westminster Hubble](https://ianrenton.com/blog/the-technology-of-westminster-hubble/)
3. [The End of Westminster Hubble](https://ianrenton.com/blog/the-end-of-westminster-hubble/)

When we closed the site back in 2013, we open-sourced the code. You can [download it from GitHub](https://github.com/ianrenton/westminsterhubble), although time has not been kind to the APIs on which it depends&mdash;I believe its Twitter, Facebook and YouTube integrations would need rewriting to get it working again.
