---
author: Ian
comments: true
date: 2010-11-16 00:03:26
layout: post
slug: sea-battle-thats-what-guns-are-for
title: 'Sea Battle: That''s what Guns are for!'
wordpress_id: 11323
categories:
- Software
- Games
- Projects
tags:
- Development
- Game
- Programming
- Sea Battle
- Software
---

Another day -- or three, in this case -- brings another ton of functionality for Sea Battle.  (Previous posts: [1](/blog/game-idea-spam-time), [2](/blog/sea-battle-now-with-more-processing))

Today's release reduces the target frame rate from 60 to 30 frames per second, in an attempt to alleviate the CPU hogging [reported by aefaradien](/blog/sea-battle-now-with-more-processing/comment-page-1#comment-2238) in the previous post's comments section.  As I said in the comments, it's not an issue I see on every machine, so I'd be grateful if any testers could tell me what PC setup they have, and how much CPU power the game takes up.

Today's version also fixes the spinning ships bug that just about everyone reported.  What it doesn't do is make mouse clicks any more responsive, which is annoying me too.  Please bear with it for today, I'll see if I can work out how to deal with that soon.

Mostly this release is about new features.  Sea Battle now has:

	
  * Ships are now implemented as having separate Hulls, Weapons, Engines and Radars

	
  * Ships can shoot at each other (finally!)

	
  * Ships have health (and health bars), and can be destroyed

	
  * Bases have health (and health bars), and can be destroyed

	
  * That means there's now a win and a lose condition

	
  * Enemy ship AI now considers your ships' scariness -- a factor of firepower and remaining health -- to pick targets it thinks it can defeat

	
  * You can now build, with appropriate build delays and an 11-slot build queue

	
  * The enemy can now build too

	
  * Colours have been tweaked to make ships' allegiances more obvious

The only real bit of functionality that's still missing is the research / build options.  Currently, clicking the Build button produces a ship of a predefined configuration -- you can't change that config or research better ones.  The AI builds random ships up to and including as powerful as your default one, and has a reasonable amount of 'thought delay' to its actions, meaning that you can achieve victory fairly easily.  (Just fill up the build queue and send every ship North as soon as it's built -- you'll lose a few, but enough should survive to destroy the enemy base.)

_Note: this blog post is old, and the game now has more functionality than is described here. [The next blog post in the sequence is here.](/blog/sea-battle-here-comes-the-science-bit)_
