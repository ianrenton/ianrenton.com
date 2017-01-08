---
author: Ian
comments: true
date: 2010-04-20 23:29:57
layout: post
slug: howto-convert-wordpress-posts-to-pages
title: 'HOWTO: Convert WordPress Posts to Pages'
wordpress_id: 3095
categories:
- Guides
tags:
- Convert
- Guide
- HOWTO
- Page
- Post
- Query
- Software
- SQL
- Tutorial
- Wordpress
---

_This HOWTO is in the public domain.  You are free to re-post it wherever and however you like, though a link back [here](http://guides.ianrenton.com/howto-convert-wordpress-posts-to-pages) would be appreciated._

I've recently had the unfavourable job of converting some 400 _posts_ on my WordPress-powered site into _pages_.  I'd been putting this off for a while, as as far as I could see the only sane way of doing this was using [p2pConverter](http://www.briandgoad.com/blog/downloads/p2pConverter/) -- a great plugin for converting individual posts to pages and back, but sadly with no bulk conversion capability.

I had a number of post categories, and I wanted all the posts in each category to become pages underneath a certain pre-existing page.  The advantage with this scheme is that if the old category and the new parent page have the same name, the URL of the page doesn't change during conversion.  (e.g. a post "SuccessWhale" in category "Software" has the URL `/software/successwhale`, and so does a page "SuccessWhale" underneath a parent page "Software".)

In the end, I wrangled some SQL to do the job.  This is how I did it.

**Before anything else, back up your database!**  I am not responsible if you break your site by following these instructions.

After backing up, I fired up [MySQL Query Browser](http://dev.mysql.com/downloads/gui-tools/5.0.html) and pointed at my database.  You could use that, or [phpMyAdmin](http://www.phpmyadmin.net) if your host provides it, or even a command-line interface on the MySQL server if you so desire.

Back in the web browser, head to the Dashboard.  We need to get two numbers -- the ID number of the category you're moving posts from, and the ID number of the parent page you want the new pages to sit under.  For the first, pull down the Posts menu and click Categories.  On the right-hand side, hover over the "Edit" link under a category name.

[![Category Mouseover](https://files.ianrenton.com/sites/guides/category-mouseover.png)](https://files.ianrenton.com/sites/guides/category-mouseover.png)

  
On your status bar, you should see the location that link is pointing to.  At the end there should be a number, such as the '14' in this example.

[![Category Statusbar](https://files.ianrenton.com/sites/guides/category-statusbar.png)](https://files.ianrenton.com/sites/guides/category-statusbar.png)

  
To get the second number, click the Pages menu on the sidebar.  Just as before, hover over the Edit link of the page you want to be a parent.

[![Page Mouseover](https://files.ianrenton.com/sites/guides/page-mouseover.png)](https://files.ianrenton.com/sites/guides/page-mouseover.png)

  
And again, the status bar text will end with a number, which you need to note down.  Here, it's '890'.

[![Page Statusbar](https://files.ianrenton.com/sites/guides/page-statusbar.png)](https://files.ianrenton.com/sites/guides/page-statusbar.png)

  
Now back to the MySQL Query Browser.  Before jumping in with a move straight away, we should check what we're about to move just to make sure we've got it right.  Execute the following query, replacing `14` with the first number you obtained earlier:

    
    SELECT *
    FROM wp_posts, wp_term_relationships
    WHERE (wp_posts.id = wp_term_relationships.object_id)
    AND (wp_term_relationships.term_taxonomy_id = 14)
    AND (wp_posts.post_type = "post");


This should produce a list of the posts you want to move, and only those posts.  If it does, great!  Edit the following query, replacing `14` with your first number from earlier, and `890` with the second number:

    
    UPDATE wp_posts, wp_term_relationships
    SET wp_posts.post_type = "page",
    wp_posts.post_parent = 890
    WHERE (wp_posts.id = wp_term_relationships.object_id)
    AND (wp_term_relationships.term_taxonomy_id = 14)
    AND (wp_posts.post_type = "post")


Execute that, and you should be done!  Check the Posts and Pages sections of the Dashboard to make sure it's worked as you expected.

In my experience, the first query will sometimes not return exactly what it should.  In this case, I'm afraid I don't have a clever solution -- this problem occurred with less than half a dozen posts for me, so I just converted them with p2pConverter.

If you have more categories of posts to convert, repeat this procedure again until you've got them all done.

I hope you've found this useful!
