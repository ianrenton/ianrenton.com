---
author: Ian
comments: true
date: 2011-03-17 09:44:20
layout: post
slug: successwhale-considering-the-reply-ui
title: 'SuccessWhale: Considering the Reply UI'
wordpress_id: 11501
categories:
- Internet
- Projects
- Software
- UX and Design
tags:
- Design
- Development
- Facebook
- Poll
- Software
- SuccessWhale
- Twitter
- UI
- UX
---

What was once my simple Twitter client, [SuccessWhale](http://ianrenton.com/software/successwhale), is undergoing a lot of changes in the build-up to version 2.  One of the biggest changes is the support for multiple services, of which Facebook is the first to be integrated.  This, combined with the Twitter website's new design, brings into question SuccessWhale's "reply" UI.

There's no question that there should be a big "type your status update here" box at the top.  Both incarnations of Twitter do this, Facebook does this, every non-mobile client (and a few mobile ones too) does it.  It's what users expect, and I see no reason not to stick with it.

About a thousand years of internet time ago (2010), replying to a tweet from Twitter's website re-used that top status box for the reply.  The user clicked the "reply" button, and the status box got pre-filled with "@" plus the username of the person they were replying to.  It looked like this:

[![Old Twitter Reply UI](//files.ianrenton.com/sites/blog/2011/03/oldtwitter-top.png)](//files.ianrenton.com/sites/blog/2011/03/oldtwitter-top.png)

SuccessWhale, then solely a Twitter client, copied this behavior.  Its reply UI involved clicking a "reply" button and having its main "publish status update" box update with the replied-to user's name, like this:

[![SuccessWhale version 1 Reply UI](//files.ianrenton.com/sites/blog/2011/03/successwhale-top.png)](//files.ianrenton.com/sites/blog/2011/03/successwhale-top.png)

Now SuccessWhale is attempting to be a Facebook client, too.  On Twitter, replies to a status update are given virtually the same prominence as the original status.  On Facebook however, posts are more thread-based, with comments on a status update clearly being daughter objects of the original update.  Status updates themselves use "newest at the top" order, just like Twitter, but comments on an update are "newest at the _bottom_".  So on Facebook, it makes sense for the "reply" field to be inline, like this:

[![Facebook Reply UI](//files.ianrenton.com/sites/blog/2011/03/facebook-inline.png)](//files.ianrenton.com/sites/blog/2011/03/facebook-inline.png)

In playing around with the UI for SuccessWhale version 2, I introduced an inline reply box, which works something like this:

[![Successwhale version 2 Prototype Reply UI](//files.ianrenton.com/sites/blog/2011/03/successwhale-inline.png)](//files.ianrenton.com/sites/blog/2011/03/successwhale-inline.png)

A third reply UI was introduced with the new Twitter website - a floating "lightbox"-style reply area which appears when the "reply" button is clicked.  Like this:

[![New Twitter Reply UI](//files.ianrenton.com/sites/blog/2011/03/rsz_newtwitter-lightbox.png)](//files.ianrenton.com/sites/blog/2011/03/rsz_newtwitter-lightbox.png)

So, between the two sites that SuccessWhale currently talks to, we have three UI paradigms for replying to a status update.  I feel it is very important for SuccessWhale to have a consistent UI for replying, particularly when we introduce columns that mix updates from Twitter, Facebook and potentially other sources.

So, my question to SuccessWhale users is: which one do you like best?  I have no particular attachment to any of them, so let's get our democracy on.  Your choice is between:

	
  1. **Using the main status update box** (like SuccessWhale version 1 and old Twitter)

	
  2. **Using an inline box** (like Facebook)

	
  3. **Using a pop-up 'lightbox'** (like new Twitter)

The comments are yours, vote away!
