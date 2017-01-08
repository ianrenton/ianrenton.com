---
author: Ian
comments: true
date: 2010-07-12 23:45:36
layout: post
slug: the-technology-of-westminster-hubble
title: The Technology of Westminster Hubble
wordpress_id: 10938
categories:
- Software
- Internet
- Politics
- Projects
tags:
- Internet
- Projects
- Software
- Website
- Westminster Hubble
---

For anyone interested (yes this is mostly for you, [@HolyHaddock](http://www.twitter.com/holyhaddock)), [Westminster Hubble](http://www.westminsterhubble.com) is written in a combination of PHP and JavaScript, with a MySQL database as its backend.

Most of the clever work happens in the background, set off by a number of cron jobs with various tasks such as keeping the MP list in sync with [TheyWorkForYou](http://theyworkforyou.com), polling our blogs, generating statistics on the contents of the database, and the big one: trawling through all the MPs' feeds themselves.

The latter is a mammoth job, and trying to keep up has been a constant battle against allowed cron intervals and PHP timeouts as we can as yet only afford shared hosting for the site rather than our own dedicated server.  We keep a record of the last time an MP's feeds were checked, and every five minutes, we pick the 60 oldest ones and check them.  60 is a rough value arrived at through some pretty low-tech testing, and there's still plenty of work to do to optimise this.  With 650 MPs in total, checking 60 every 5 minutes means we cycle through everyone in about an hour, which isn't too bad, though this will get much worse once we add in MEPs and members of the regional Parliament and Assemblies.

Items that get scraped are added to the cache table in the Westminster Hubble database, from where they're served at user request without having to re-visit the original feeds.  We use [SimplePie](http://simplepie.org) to find and scrape RSS feeds, after my own attempt proved to be more trouble than it was worth.  SimplePie manages its own cache as a flat file structure, and uses its own intelligence to try and detect when feeds are unchanged, lightening our server load when scraping feeds that don't update very often.

There's currently no expiry condition for items in our cache.  Disk space is not an issue, but load times may prove to be at some point in the future.  If and when they do, we will start removing the oldest items from the cache, possibly with some kind of type bias so that blog posts hang around longer than tweets.

  

On the user experience side, there's nothing much complicated going on.  [jQuery](http://jquery.com/) is used extensively for pulling in page contents so that we can load pages with feeds on quickly.  Likewise, we use jQuery so we can filter feeds, and switch between Search, Map and List on the home page without reloading, and we use the Autocomplete jQuery plugin on our search box.

The Map view is powered by the [Google Maps API](http://code.google.com/apis/maps/index.html), and we generate the data for the pins from TheyWorkForYou's database of constituency locations.

  

All in all it's not been a tremendously difficult project - there have been no major hurdles that have caused me to tear clumps of hair out or affected the stocks of coffee producers.  Though that said, Westminster Hubble is still in beta, and there could be many more issues ahead...
