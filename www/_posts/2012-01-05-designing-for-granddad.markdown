---
author: Ian
comments: true
date: 2012-01-05 23:59:06
layout: post
slug: designing-for-granddad
title: Designing for Granddad
wordpress_id: 11935
categories:
- Internet
- Software
- UX and Design
tags:
- Choices
- Clutter
- Complexity
- Design
- Interface
- Novice Users
- Personas
- Software
- UI
- UX
---

_Slate_'s recent article, ["2011 Was a Terrible Year for Tech"](http://www.slate.com/articles/technology/technology/2011/12/the_year_s_worst_tech_trend_complexity_.html), coins the term "mom-bomb" for the moment that technology journalists declare a gadget so easy-to-use that it is actually useful to people who aren't technology journalists:

> He begins by praising the gadget’s intuitive interface and its easy setup process, but eventually he finds that mere description doesn’t adequately convey the product’s momentous simplicity. That’s when he drops the mom bomb: _This thing is so easy that even my mom could use it_.

I'm blessed with parents that, by and large, 'get' technology.  Their VCR never flashed 12:00 (and now they have a DVD recorder); they both have Android phones that they can happily e-mail from.  My grandparents are a different story, of course.  Two of them have almost never used a computer, but my Granddad has a nice new shiny one and uses it regularly.  But as the article points out, what tech journalists and we tech-savvy users think is simple and 'user-friendly' often falls far short of the 'mom (or granddad) test'.

A few observations spring to mind:

  * Moving photos from a digital camera to a computer is one of the simplest tasks non-'tech-savvy' users often want to do.  But when you plug in a digital camera, Windows 7 helpfully pops up this dialog:

{% img center http://files.ianrenton.com/sites/blog/2012/01/6a00d8341c19df53ef014e8c03b138970d-500wi.png Windows 7 Camera AutoPlay Dialog %}

Do I want to "Import Pictures and Videos" using Windows, or using Windows Live Photo Gallery?  What's the difference?  Do I want to "Copy pictures to [my] computer"?  Do I want to "Download images"? Where will the photos go?  Will they still be on the camera?  I just want to see my photos, so I click "Open device to view files", but what the heck is "DCIM"?
	
  * I set Google as his browser homepage, and since then, he has been getting his news not from the BBC News bookmark I created, but using the 'News' link on Google's own menu that appears at the top of its pages:  
  
{% img center http://files.ianrenton.com/sites/blog/2012/01/Screen-shot-2012-01-05-at-23.06.31.png Google Menu Bar %}

...which is great, except that Google can change that menu at any time.  And of course they are doing exactly that:  

{% img center http://files.ianrenton.com/sites/blog/2012/01/Screen-shot-2012-01-05-at-23.11.15.png New-Look Google Menu %}

To my granddad, and many other novice internet users, the distinction between bookmarks -- which only change if _you_ want them to -- and web page navigation menus -- which can change at the webmaster's whim -- is not necessarily clear.

	
  * Even simple mouse commands can be unclear and difficult.  In the example above, Google's instruction to find the new menu is to 'roll over' the logo.  When the novice user figures out that means 'hover the cursor over', they're greeted with a JavaScript popup which will disappear again if their cursor accidentally wanders too far from the popup.

It's my family duty to be tech support, and occasionally I am called upon to fix things that have actually gone wrong.  But more often than not, I am called upon to try to rationalise a simple task that is unexpectedly complex to perform.  This complexity has usually arisen because the software's developers and most vocal users are so immersed in common UI paradigms that they just _don't notice_ that the complexity exists.  For the novice user, on the other hand, even your software's _installation wizard_ is complexity they'd rather not deal with.

The _Slate_ article is right to cite [Facebook's](http://www.facebook.com) user interface as a particularly onerous example of software complexity.  Feeds, live updates, inboxes, [_hidden_ inboxes](http://www.geekestateblog.com/uncovering-your-hidden-inbox-in-facebook/), walls, profiles, Timeline, comments, likes, tags -- some users need and revel in that level of complexity, but a significant number just want to, say, see what their kids are up to.  I'm nervous that one day soon, my granddad will ask me to set him up with a Facebook account.  I'll dutifully comply, log him in, and give him _this_:  
  
[![Facebook User Interface](http://files.ianrenton.com/sites/blog/2012/01/Screen-shot-2012-01-05-at-23.29.061-600x322.png)](http://files.ianrenton.com/sites/blog/2012/01/Screen-shot-2012-01-05-at-23.29.061.png)

Where does one even begin?  There are multiple feeds, multiple menus, pop-up and pop-down boxes.  How do you add one of these "status" things?  How do you add a friend?  How do I send a message to someone?  What's public and what's private?  Why is there so much _stuff_?

In the world of User Experience (UX) design, we spend so much time thinking about how software will be used and by whom -- [personas](http://www.uxforthemasses.com/personas/), [use cases](http://gatherspace.com/static/use_case_example.html#1), [red routes](http://www.userfocus.co.uk/articles/redroutes.html) and all the rest.  But in the majority of software I see when working with novice users, it seems that either the novice user has not been considered, or their persona is paid lip service while the latest excitingly complicated new features are bolted onto the software.

As creators of software and of user experiences, I know we can do better than this.

_Do you have any thoughts on how we can design better for the novice user?  Just want to vent about an app with a particularly poor UI, or about a relative with a particularly poor grasp of computing?  Fire away in the comments below!_
