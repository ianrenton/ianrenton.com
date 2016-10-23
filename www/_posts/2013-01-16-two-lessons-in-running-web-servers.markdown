---
author: Ian
comments: true
date: 2013-01-16 22:11:07
layout: post
slug: two-lessons-in-running-web-servers
title: Two Lessons in Running Web Servers
wordpress_id: 13401
categories:
- Internet
tags:
- caching
- Internet
- servers
- traffic management
- web server
---

First of all, a big shout out to _les hommes et femmes_ at [http://korben.info/](http://korben.info/), who today have taught me an important lesson.

At about 9:30 today, they posted a list of [50 things to do with your Raspberry Pi](http://korben.info/idees-raspberry-pi.html), which included the [Raspberry Tank](http://blog.ianrenton.com/raspberry-tank-build-diary). At about 9:40, my web server melted.  This is the disk I/O graph:

[![Sparrowhawk Disk I/O Graph](https://files.ianrenton.com/sites/blog/2013/01/generate_graph.pl2_-600x258.png)](https://files.ianrenton.com/sites/blog/2013/01/generate_graph.pl2_.png)

Somewhere around five Apache instances per second were being spawned, all of which seemed to be waiting for each others' I/O operations, and combined together managed to slow everything else to a crawl. It took twenty minutes to successfully `ssh` into the server and stop Apache. In that whole time, I think about five visitors might have actually have seen a properly-formed web page.

From that point, it was a dainty command-line dance to get enough of WordPress up and running that I could set up a [page caching plugin](http://wordpress.org/extend/plugins/w3-total-cache/), but not so much of it that visitors could actually request pages themselves.

At around 1pm, I finally managed to get back up and running again -- and the floodgates opened.

[![Sparrowhawk IPv4 I/O Graph](https://files.ianrenton.com/sites/blog/2013/01/generate_graph.pl_-600x291.png)](https://files.ianrenton.com/sites/blog/2013/01/generate_graph.pl_.png)

So, today I learned two important lessons about running your own web server:

	
  1. If you are going to do something cool with a Raspberry Pi and post about it on your blog, **CACHE THE PAGES**.

	
  2. It's a great idea for your web server to send out e-mail alerts when it is dying. It's a less great idea to host your e-mail system on the same machine.

Thanks, crazy French blog.
