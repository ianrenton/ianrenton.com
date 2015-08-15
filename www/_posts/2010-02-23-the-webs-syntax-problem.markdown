---
author: Ian
comments: true
date: 2010-02-23 13:56:30
layout: post
slug: the-webs-syntax-problem
title: The Web's Syntax Problem
wordpress_id: 2756
categories:
- Software
- Internet
tags:
- BBcode
- Blogs
- Forums
- HTML
- Internet
- Markdown
- Markup
- phpBB
- Syntax
---

As [@aefaradien notes](http://twitter.com/aefaradien/status/9520818967), the web has a syntax problem.  It's this:  A user wishes to post something complicated - text with links, formatting, even inline graphics.  They go to a website and are faced with a text box and a flashing cursor.  What do they type?  What syntax will help them achieve their goal?

It depends entirely on which website they're on and what powers it.  With any luck the text box itself might have an area below explaining how to use it, but chances are, the user won't read it.  The knowledgable user has a whole bunch of questions:

  * **Can I use HTML?**  The internet is made of HTML ([and cats](http://www.rathergood.com/cats)).  Once the post is submitted, it'll be sent to everyone else's browser as HTML, so can I just write in HTML anyway?  But HTML is complex, am I restricted to a certain subset?  Do I have to worry about breaking the website's formatting?  Is the site using some weird CSS that's going to distort my post?  Could I introduce security vulnerabilities?
  * **Is the syntax HTML-like?**  Am I using a [phpBB](http://www.phpbb.com)-powered forum, or others that support its syntax?  Something else HTML-like but not true HTML?  To make something bold, do I write `<b>` or `[b]`?
  * **Is the syntax Wiki-like?**  And what even _is_ Wiki-like?  [MediaWiki](http://www.mediawiki.org), which powers [Wikipedia](http://www.wikipedia.org), probably has the most popular syntax out there, but each wiki is subtly different.  If I [CamelCase](http://en.wikipedia.org/wiki/CamelCase) words, will they become links?  If I surround a word with *asterisks*, will it become bold?  What about apostrophes?  Forward-slashes?
  * **Is it something much stranger?**  Could it be something like [Markdown](http://daringfireball.net/projects/markdown/), which could interpret some unintentional meaning from my text because I don't know its syntax?

To my mind, there's no simple solution to this problem.  Each has its own strengths and weaknesses, and developers of each web platform, blog or forum app have their own preferences.  [BBcode](http://en.wikipedia.org/wiki/BBCode) has some traction, but it's so close to HTML -- why not just use HTML?  Wiki markup's great for linking to internal wiki pages, not so great for anything else.  And Markdown and its cohort of technically superior solutions just don't have any traction in the real (non-geek) world.

I think if this problem were to ever be solved -- and I must say I don't think it's likely -- _we have no option but to pick the lowest common denominator_, because nothing else will ever have enough traction.

And here's where I make myself unpopular: _the common denominator is HTML_.  But HTML used with some intelligence:

  * **Auto-link URLs**, but deal with it if users want to use `<a>` tags.  Nothing's more annoying than having to copy-paste a URL into your location bar because it's not actually a hyperlink.  Also, it breaks the web.
  * **Deal gracefully with special characters.**  If a user doesn't _know_ HTML, they should be penalised as little as possible for using triangular brackets in their text.
  * **Limit HTML as little as possible.**  Sure, don't allow `<IFRAME>` or `<SCRIPT>`, but if there's no way a user's HTML could be harmful (including to layout and design), let them use it.
  * **Don't use weird CSS.**  If you don't want users to use `<h3>` because your `<h3>` is 72px high, change your CSS.  You design a website for its users, and that includes giving them what they expect when they use their own HTML in their posts.

And that's that.  By auto-linking URLs and gracefully dealing with triangular brackets, we're giving users that don't know the syntax what they expect.  For users that know HTML, we're not making them learn some other new syntax that offers a slight improvement.  And for users that want to learn the syntax so that they can do more complex things, they'll be learning HTML, and that opens up far more of the internet to them than knowing BBcode or Markdown syntax.

Thoughts, as always, appreciated!
