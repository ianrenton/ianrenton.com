---
author: Ian
comments: true
date: 2010-12-15 12:40:49
layout: post
slug: adventures-in-the-diaspora-ghost-town
title: Adventures in the Diaspora Ghost Town
wordpress_id: 11367
categories:
- Internet
- Software
tags:
- Developer
- Diaspora
- Facebook
- First Impressions
- Internet
- Rambling
- Review
- Social Networks
- Software
---

[Diaspora*](https://joindiaspora.com), for those unaware, is a distributed and privacy-conscious social network currently in development by students at New York University.  It raised [$200,000 of funding](http://www.kickstarter.com/projects/196017994/diaspora-the-personally-controlled-do-it-all-distr) via Kickstarter back in June, and is currently in alpha testing state.  By virtue of [my pseudowife's](http://ericthegirl.onlydreaming.net) donation, we have been sent both the developer preview software itself, and invites for the Disapora "pod" at [joindiaspora.com](https://joindiaspora.com).

For my first impressions, read on!

### Settling Spores: The Developer Preview

One of Diaspora's strengths is that unlike centralised social networks such as Facebook, where all your content is stored on their server, Diaspora is _distributed_.  While you can have an account on `joindiaspora.com`, you can equally set up your own "pod" on your own domain, or even on a home PC, and it will link up and join the network.  Users that do so are not second-class citizens, and there is nothing innately special about `joindiaspora.com`.

Except, of course, that it's set up and working already.

While I don't doubt that I am technically capable of setting up a Diaspora pod, the [installation instructions](https://github.com/diaspora/diaspora/wiki/Installing-And-Running-Diaspora) alone were enough to put me off.  Take a look -- it's not for the faint of heart.

The 'official way' doesn't look too complicated -- except that I fall at the first hurdle, "get yourself an IP and root password to a CentOS machine".  Well, I don't have one, so that's out.  And even if I did, there's the slightly ominous "you will need to edit config files, etc.", with no further explanation.

The rest of that document is the 'non-official' way.  It merely requires that you set up and configure a compiler, `libxml`, `libxslt`, Ruby, MongoDB, OpenSSL, ImageMagick, git, Redis, RubyGems, and Bundler.  And once you're done with that, all you need to do is install the required gems, start MongoDB, edit Diaspora's config file, run the server, run the _app_ server, run the websocket and Redis servers, run the Resque worker, add user information to the database, run the test framework, set the permissions on certain directories, then point your browser at your pod and log in.  Simples!

It was 10pm when I started the procedure, and about 10:03 when I decided I couldn't be bothered.

It may have taken me until gone midnight to set up, and given that an invite to `joindiaspora.com` was imminent, all I would get out of it would be being able to say I'd done it.  Bragging rights aren't much of an incentive.

With all those dependencies, Diaspora is also not going to be supported by shared hosting providers any time soon, so piggybacking off "onlydreaming.net" wasn't an option either.

Unless the installation process is drastically simplified -- made foolproof, almost -- and the dependencies are reduced, very few people are going to be able to run their own pod.  And that means there's still the question of trust -- just like we now have to trust Facebook not to be evil (whoops), with Diaspora we also have to trust whoever runs the pod we use.

Granted, this is a developer preview, and true to form they have provided something that only developers will be able to use.  I'm not objecting to that, I'm just hoping that somewhere along the line they _do_ have plans for making it something that just about anybody can install for themselves.

### Life in the Pod: Using Diaspora

Invite in hand, I dismissed setting up my own pod and joined the main one at `joindiaspora.com`.

My first impression?  I can't access it at all.  Due to my browser.

Now I develop for the web; I understand what a pain in the arse Internet Explorer can be.  It would be a great day for web designers if it just stopped existing tomorrow.  But the appropriate response to that is not to outright bar it from your site.

I run six websites.  None are quite as polished as Diaspora, but they have one thing in common: they work in IE.  Even IE6.  Sometimes a few things don't look quite the same as in other browsers, but I've tried to work around those, and even in the worst case things fail gracefully.  And it's only ever the appearance that feels a little different; the functionality is unaffected.

Sure, I hate IE.  But for me at the office, and for countless other users, IE is not a choice we made.  Outright blocking us from a website isn't going to make us change our browsers and suddenly see the light of standards-compliance.  It's just going to make us more bitter that we're forced to use IE and more bitter that your site doesn't have the decency to accept that.

Onwards.  Back at home, running a decent browser, I tried again.  My second impression:

Diaspora looks very polished, with nice gradients on buttons, drag-and-drop JavaScript and a nice walkthrough to set up your account.  A lot of thought has clearly gone into the interface, and it's truly pleasant to use.

Groups, or "Aspects" in Diaspora parlance, are part of the core experience rather than something bolted on the side as they are on Facebook.  You can not only flick between them to see status updates only from people in those aspects -- much like Twitter's lists -- but you can also post only to certain aspects, too.  This feels a little friendlier than Twitter or Facebook, particularly if a friendship group have each set up an aspect containing roughly the same people.  'See everything' / 'post to everybody' options are still available, of course.  Each friend can only be assigned to a single aspect -- hopefully this will change before Diaspora is released, as at the moment there is no way for your social graph to represent a friend who you know in two contexts.

Of course, this aspect structure is all pretty meaningless for now, because Diaspora is a ghost town.

Public registration is disabled, and each user has 5 invites to dish out, so `joindiaspora.com` is growing very slowly -- by design, of course.  But privacy-conscious Diaspora offers no way of finding out if any of your existing friends, on say Twitter or Facebook, have Diaspora accounts.  The only way to friend someone is to know their Diaspora username and pod address.

And while you can syndicate posts from Diaspora _to_ Twitter and Facebook, there's no way to pull data back in.

For it to be an enjoyable experience rather than a minimalist virtual ghost town, you need lots of friends posting lots of stuff.  It's the old 'critical mass' problem.  If lots of people were using it heavily, other people would want to join.  But while there's only a few users who don't post much, other potential users are put off.  Only by overcoming that gap, reaching critical mass, can Diaspora take off.  And for that it needs an advantage, something to pull people across to it.

It needs Twitter's myriad of clients, mobile interfaces, the recognisability of "@username".  It needs Facebook's groups, events, apps.  I hate to say it, but it needs its _Farmville_.

Without that, I can't see it taking off on any major scale -- it won't be the much-desired "next Facebook".

Maybe it doesn't want to be?  As always in the Open Source world, _choice is good_.  Diaspora's developers saw a niche for something, they got coding and now they're starting to fill it.  Great!  But I wonder how big that niche really is.

Diaspora started with a focus on privacy -- a social network 'done right', where users' data is private by default and is never served up to marketing companies.  It's a laudable goal, but even for people like me who understand the implications of Facebook and Diaspora's differing privacy settings and business model, it's not enough.

I know this article has been somewhat of a downer, and I wish it wasn't.  I wish the developers all the best, and I do hope that Diaspora is the Next Big Thing.  I'll continue to test it, and if I can, to help it get better.  Once there's an app API, who knows, maybe it'll be me that writes Diaspora's _Farmville_.

But the sad state of online privacy is this:  _Privacy is not a feature_.

To beat Facebook, you have to be more _fun_ than Facebook, not just better-designed and more ethical.

I and millions of other users understand how Facebook treats our data, and wish apps weren't allowed to auction off the list of our sexual preferences to the highest bidder.  But Facebook is so far beyond critical mass that it can afford to keep us at a level where we hate it, but we don't hate it enough to leave.
