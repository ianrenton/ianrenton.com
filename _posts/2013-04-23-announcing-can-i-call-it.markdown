---
author: Ian
comments: true
date: 2013-04-23 22:29:03
layout: post
slug: announcing-can-i-call-it
title: 'Announcing: "Can I Call It...?"'
wordpress_id: 13531
categories:
- Internet
- Projects
- Software
tags:
- Can I Call It
- CICI
- Naming
- Open Source
- Web App
---

There are a whole host of decisions involved with starting a new software project. What's my target audience? What language shall I write it in? Which libraries shall I use? And of course, "What shall I call it?"

<blockquote class="twitter-tweet"><p>So picking a name for an open-source project or tool is IMPOSSIBLE it seems...</p>&mdash; Mark Embling (@markembling) <a href="https://twitter.com/markembling/status/326344017526804480">April 22, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

For anyone looking to give their new project a unique name, there's an annoying process to go through of searching for each idea to see if something already exists by that name. Linux packages need to have unique names, as do SourceForge projects, Ruby Gems and projects on many other distribution systems.

As of 4pm yesterday, there was no simple way of querying all these repositories and package management systems together, to see if your chosen name was already taken by someone else.

So at 8pm I sat down to code. And by 11pm, there _was_ a way to do exactly that.

<blockquote class="twitter-tweet" data-conversation="none"><p>@<a href="https://twitter.com/markembling">markembling</a> @<a href="https://twitter.com/aefaradien">aefaradien</a> I should probably have done something actually useful tonight, but... here you go: <a href="http://t.co/9f26Q6gEAW" title="http://cici.onlydreaming.net/">cici.onlydreaming.net</a></p>&mdash; Ian Renton (@tsuki_chama) <a href="https://twitter.com/tsuki_chama/status/326454516507635712">April 22, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Meet CICI, or "Can I Call it...?"

CICI is a simple website. You give it a name you would like to use for your project, it checks against a bunch of services, and tells you if your name is unique -- i.e., you _can_ call it that -- or not.

[![CICI Results Page](https://files.ianrenton.com/sites/blog/2013/04/Screen-shot-2013-04-23-at-22.17.26.png)](https://files.ianrenton.com/sites/blog/2013/04/Screen-shot-2013-04-23-at-22.17.26.png)

Currently, CICI looks up information on packages and projects using [Github](https://github.com), [SourceForge](http://sourceforge.net), [Ruby Gems](http://rubygems.org), [PyPI](http://pypi.python.org), [Maven](http://search.maven.org), [Debian](http://packages.debian.org) and [Fedora](https://admin.fedoraproject.org/pkgdb), but it's easy to add more.  CICI itself is a simple Ruby script (full of ugly hacks, as is befitting for a program that I knocked together in a few hours), which you can [download and contribute to on GitHub](https://github.com/ianrenton/canicallit). It's all [BSD-licenced](https://github.com/ianrenton/canicallit/blob/master/LICENCE.md).

Of course, you can play with CICI on the web right here:

**[Can I Call It...?](http://cici.onlydreaming.net)**

As we have also discovered, typing random words into the search box to see what it finds is surprisingly addictive...  See what odd (or even useful) things you can find on CICI, and good luck with your new projects -- whatever name you end up giving them!
