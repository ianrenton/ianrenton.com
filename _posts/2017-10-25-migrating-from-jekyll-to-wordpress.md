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

Over the course of many years, I've changed blogging software several times, including WordPress to Jekyll and back again twice! One thing I've found is that while migrations from WordPress to Jekyll are well documented, with various scripts and plugins available, the reverse from Jekyll to WordPress seems to be a rarer switch and therefore not as well written up. To that end, here's a quicky summary of how I moved from Jekyll (with Disqus comments) to WP in 2017.

1.  [This post](http://davidlynch.org/blog/2016/01/migrating-from-jekyll-to-wordpress/) was really useful, and RSS export/import does seem to be the best way of moving the main post data across. I moved my pages (20 of them) manually, and used the RSS method for my ~1000 posts.
2.  My Jekyll site had three levels of taxonomy - Collection, Category, and Tag. I believe it's possible to create the same taxonomies in WordPress, but I didn't bother. I moved one collection at a time, merged Jekyll's categories and tags into WordPress' tags, then Jekyll collections became WordPress categories.
3.  The RSS importer can't import tags, only categories, so I imported everything as categories and used a "Categories to Tags converter" plugin to sort the mess out.
4.  The Disqus comment importer script from the page linked above worked well for importing a Disqus export, with the exception that Disqus comment and thread IDs are now greater than 2^32\. The importer uses these as keys into maps, so I had to subtract arbitrary large numbers from the IDs (which PHP is perfectly happy to do) in order to make them usable as integer keys.
5.  I had a lot of files such as pictures in arbitrary locations which Jekyll is happy to deal with, but WordPress is not. I moved everything into "wp-content/uploads/" with some .htaccess redirects so that they can still be found.
6.  Recreating the Jekyll theme wasn't too hard, although it took around half the total time. When I first moved away from WordPress its themes were a messy mystery to me, but with four years' more experience, I can see the parallels between my Jekyll templates and WordPress' ones, and the transition went very smoothly.
