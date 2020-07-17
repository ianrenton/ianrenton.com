---
author: ian
title: Migrating from Jekyll to WordPress
slug: migrating-from-jekyll-to-wordpress
id: 1623
date: '2017-10-25 23:10:38'
layout: post
categories:
  - Blog
tags:
  - Internet
  - Jekyll
  - Migration
  - Octopress
  - Wordpress
---

The final, and most difficult, part of the [plan to wind down some of the more complex stuff I do on the internet](https://ianrenton.com/blog/planning-the-wind-down/) was the migration of this site from Jekyll and Hashover to WordPress. It's a decision I took with some trepidation, as I well remember ditching my old WordPress site for Jekyll (via Octopress) four years ago and enjoying the speed and security it brought. However, the workflow is what killed it. The typical ["By the Numbers" film review](https://ianrenton.com/filmreviews/) is a shared activity with friends around the TV, which doesn't lend itself to being sat at a desk at the only computer of mine that can reasonably _compile_ the Jekyll site. I switched to hosting the site on GitHub pages and just [editing the pages myself in a browser window](https://ianrenton.com/blog/how-i-blog-now/), but uploading and linking images was still a multiple step, non-WYSIWYG game of making sure the URLs are all right, followed by a 3-minute compile stage where everyone is waiting to read the finished article and I have to explain why. Comments were worse still. I staggered between Juvia, a discontinued Rails application that I was out of my depth maintaining by myself, Disqus which "just worked" but put visitors off commenting, and HashOver where fighting spam involved finding offending new comments via ssh. Back on WordPress, things may be slower and security more of a concern, but comments are natively supported, I can drag images in, and preview posts on the fly. No compile stage! All in all the process took about 10 hours. If you're contemplating a similar step, here are some useful hints, as unlike the reverse move, migrating in this direction seems to be a rare activity:

1.  [This post](http://davidlynch.org/blog/2016/01/migrating-from-jekyll-to-wordpress/) was really useful, and RSS export/import does seem to be the best way of moving the main post data across. I moved my pages (20 of them) manually, and used the RSS method for my ~1000 posts.
2.  My Jekyll site had three levels of taxonomy - Collection, Category, and Tag. I believe it's possible to create the same taxonomies in WordPress, but I didn't bother. I moved one collection at a time, merged Jekyll's categories and tags into WordPress' tags, then Jekyll collections became WordPress categories.
3.  The RSS importer can't import tags, only categories, so I imported everything as categories and used a "Categories to Tags converter" plugin to sort the mess out.
4.  The Disqus comment importer script from the page linked above worked well for importing a Disqus export, with the exception that Disqus comment and thread IDs are now greater than 2^32\. The importer uses these as keys into maps, so I had to subtract arbitrary large numbers from the IDs (which PHP is perfectly happy to do) in order to make them usable as integer keys.
5.  I had a lot of files such as pictures in arbitrary locations which Jekyll is happy to deal with, but WordPress is not. I moved everything into "wp-content/uploads/" with some .htaccess redirects so that they can still be found.
6.  Recreating the Jekyll theme wasn't too hard, although it took around half the total time. When I first moved away from WordPress its themes were a messy mystery to me, but with four years' more experience, I can see the parallels between my Jekyll templates and WordPress' ones, and the transition went very smoothly.

Although it's been a few days of working late into the night, I'm happy to say it's now done. Hopefully the blog will be easier to manage from here on. _No compile stage!_