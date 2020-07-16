---
author: Ian
comments: true
date: 2010-08-29 23:17:32
layout: post
slug: a-thousand-words-getting-and-posting
title: 'a thousand words: GETting and POSTing'
wordpress_id: 11268
categories:
- Internet
- Projects
- Software
- UX and Design
- Writing
tags:
- AThousandWords
- Code
- Development
- Fiction
- Internet
- Project
- Software
- Web
---

Another day, another bunch of functionality added to [a thousand words](http://athousandwords.org.uk).  With the main public-facing interfaces largely complete, I have moved on to the guts of the site's user interaction.  The site now has working, but ugly, implementations of:

	
  * _E-mail address / password authentication_, with cookie support based on a secret phrase generated at registration.

	
  * _Registration_ itself, including the setting of a display name (users authenticate with their e-mail address, so we need something friendlier to display in the UI).  Accounts are created in an unactivated state, and an e-mail is sent allowing the user to use their secret phrase to activate the account (GETted via a "click here to activate!" URL).

	
  * _Picture submission_, which adds the submission to a 'queue' table.  In time there will be an admin interface for moving items from the queue to the real pictures table, i.e. promoting a suggested picture to "picture of the week" status.

	
  * _Story submission_, which adds the story to the live site and takes you there after submission.  There's currently no edit capability, and the picture that the story is based on must be manually specified by ID number.  (The latter will become a scrollable jQuery list of all pictures.)

A story edit/delete interface is my next task, and once that's done, the core functionality (excluding any user profile-related code) will be largely finished.  After that there'll be a period of testing and improving the interfaces of the new functions, before I put a call out for a couple of willing guinea pigs to try and break the site for me!  If anyone out there is expecting to be really bored sometime this week, let me know!
