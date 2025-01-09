---
layout: post
title: "How I Blog Now"
date: 2016-10-27T21:11:00+01:00
categories:
- Internet
tags:
- Blog
- History
---

It's fifteen years today since I first posted something&mdash;specifically, [terrible teenage poetry](/blog/shining-future/)&mdash;on what would become my blog. Back then my website was a purple-and-black exhibition of my poor teenage sense of humour, and I started posting snippets of poetry to it under the category of "Thoughts".

![Mad Marmablue Web Portal, circa 2001](/img/blog/2016/mmwp2001.png){: .center}

In 2002 I was invited to an up-and-coming site called "LiveJournal", a perfect platform for sharing my young adult angst and drama for the world to see. At university it became central to our social lives, a foreshadowing of the social network generation that was yet to come.

LiveJournal came and went. By 2009 I was blogging on my own WordPress site and syndicating the posts to LJ, and by 2011 [I was reminiscing about what we had lost](/blog/the-rise-and-fall-of-livejournal/). In 2013, beset by buggy plugins and security problems with WordPress, I moved to about the nerdiest blog platform imaginable, the static site generator Octopress.

![My Octopress blog, circa 2013](/img/projects/website/2013-09-15.png){: .center}

Editing a site this way has its advantages&mdash;the end result is fast and secure, and appeals to my geekier tendencies by allowing me to keep it all under version control. But it has its disadvantages too, principally the fact that the site needs a "compile" step before the results can be seen. In recent months the combination of my old PC, 3000+ pages to render, and a few poorly-implemented plugins have resulted in compile times in excess of three minutes. That's not too bad for a one-off post, but it's particularly grating when we do [Film Review by the Numbers](/filmreviews/) on a Saturday night. Writing the reviews is something of a spontaneous group activity, and when it takes three minutes to see what a change will look like, those minutes feel a lot longer.

A fifteenth anniversary seems like as good a time as any to make some changes, so I've been working on some ways to speed up the writing and generating process.

Firstly, I have started doing the simpler editing tasks, like writing a new post, directly on GitHub where the source code lives. Its Markdown editor has a preview function that renders instantly, meaning that for Film Review by the Numbers (and everything else) we can get an approximately-correct rendered page with inline images straight away. I can also commit directly to the repository from there once everything is looking right.

I've contemplated using GitHub Pages to host the site directly as well, though its lack of support for SSL certificates and Jekyll plugins rules it out for now. I have, however, started using GitHub's "webhooks" to trigger an automatic rebuild of the site&mdash;on every commit, GitHub pings a script on my server based on [marcomarcovic's simple-php-git-deploy](https://github.com/markomarkovic/simple-php-git-deploy), which updates its local copy of the site, rebuilds it using jekyll, and deploys it to the public directory on the server.

With it all configured, I can now keep my fast and secure static site, while also regaining some of the ease of a web-based editor that I miss from the WordPress days. I can also sensibly blog on the move from my phone or tablet, without having to open up a command-line console every time.

This is my first test, and if you're reading this, I guess it works!
