---
layout: post
title: "Migrating to Octopress 3"
date: 2015-08-09T20:57:15+01:00
categories:
- Software
tags:
- Website
- Octopress
- Migration
---

Those of you who follow me on Twitter may have seen me dither about whether to re-style my website after the very appealing (to me) [Tufte CSS](http://www.daveliepmann.com/tufte-css/). The sidenotes with their wide bar didn't work particularly well with my blog format, but I've taken on some of the major style elements, and unless you're reading this via RSS, you can see the results in front of you right now.

In doing so, I decided to update the old Octopress code on which many of my websites are based. This is a long, complicated process of "merge hell" where I try to keep my own customisations to core files, theme mods, new themes, and odd plugins, while making sure nothing conflicts with the changes that have taken place within Octopress itself. With eight different Octopress sites, each with their own oddities, this was a daunting task.

![](/img/blog/2015/pipes.jpg){: .center}

While looking for the latest minor version of Octopress 2, I discovered that Octopress 3 was released *months* ago... and it changes everything.

All the problems I've had with Octopress over the years&mdash;updating and merging using `git`, managing multiple sites as branches, pulling in themes as submodules&mdash;I'd always put down to me just "not getting it". Lots of people use this, so my problems are due to my inadequacies as a programmer, surely?

But no, all along [the developer has had the exact same problems with it](http://octopress.org/2015/01/15/octopress-3.0-is-coming/). Octopress 3 reworks the whole thing, to do *less* rather than more, and it makes so much more sense. It's now a `gem` that helps you set up a [Jekyll](http://jekyllrb.com) site in a certain way, with some extra tools to help manage posts and deploy the site. Your source is no longer mashed together with Octopress' source in the same repository, and it's sufficiently out of the way that Jekyll's "collections" now work properly.

I've had to faff with a few links here and there to manage the eight different sites as collections under the same site (so apologies if you find any dead links), but the whole thing should be a lot more manageable!
