---
author: Ian
comments: true
date: 2010-10-21 19:09:40
layout: post
slug: game-idea-spam-time
title: Game Idea Spam Time!
wordpress_id: 11301
categories:
- Games
- Projects
- Software
tags:
- Development
- Games
- Ideas
- Programming
- RTS
- Software
---

One of the games I remember liking from what I was shocked to discover was _11 years_ ago was [Warzone 2100](http://en.wikipedia.org/wiki/Warzone_2100).  It's actually one of the rare examples of an Abandonware game that's been taken and updated on by a loyal community -- over a decade since it was first released, they're working on version 3.0.  (You can [download it from here, completely free](http://wz2100.net/).)

The reason I'm mentioning it today is for its vehicle construction mechanic.  Rather than simply building a Light Tank or a Heavy Tank and so on, each vehicle came in a number of bits -- body, tracks, turret, and so on.  You researched each item individually, then you could build vehicles with whatever bits you'd researched.

For some reason this idea has been weighing heavily on my brain over the last few days, so I've sketched out some ideas for a game that I'm half tempted to write.

It would be sort of like a naval version of Warzone, only 2D with a limited playing field, and probably rather simplistic graphics (especially if I'm building it on my own, since I can't draw for toffee).  There aren't any buildings apart from a single base for each player which builds your ships, and you lose if your base is destroyed.  In order to defend it, you build ships from blueprints you have researched.

Each ship is composed of four bits:

	
  * **Hull** -- affects how much armour (health) the ship has.  More armour, roughly speaking, makes a ship heavier and also take longer to build.
  * **Engine** -- engines provide thrust, which along with the hull's weight, affects its speed.
  * **Radar** -- affects the range of the ship's weapons.
  * **Weapon** -- deals damage to other ships.  Weapons have a power (damage per shot) and a fire rate.

Ships can shoot at other ships (submarines are a possibility too) and if they get close enough, the enemy base.  They can be moved around the playing field, and will automatically fire on any enemy ship within range.

Here's the rest of my thought processes (and doodles) in Awful Handwriting form:
[![](//files.ianrenton.com/sites/blog/2010/10/Untitled001-150x150.jpg)](//files.ianrenton.com/sites/blog/2010/10/Untitled001.jpg)[![](//files.ianrenton.com/sites/blog/2010/10/Untitled002-150x150.jpg)](//files.ianrenton.com/sites/blog/2010/10/Untitled002.jpg)[![](//files.ianrenton.com/sites/blog/2010/10/Untitled003-150x150.jpg)](//files.ianrenton.com/sites/blog/2010/10/Untitled003.jpg)[![](//files.ianrenton.com/sites/blog/2010/10/Untitled004-150x150.jpg)](//files.ianrenton.com/sites/blog/2010/10/Untitled004.jpg)

My big question is, if I were to make this -- and have the patience to _finish_ making it, which is a rare thing indeed -- for what platform should I be making it?

	
  * **For the Desktop** is the easiest option.  I could code it comfortably with tools I'm used to.  But it'd be yet another crappy downloadable game that no-one would keep around.
  * **For Phones** would give it a more interesting market, though the UI would need some work on anything less than an iPad or Galaxy Tab.  Also, CBA developing for Apple stuff.
  * **For the Web** is probably the best way to get people playing.  But it's probably not doable in HTML5+JavaScript, I can't afford Adobe Flash, and I can't write a Java applet because it's not 1995.

Does anyone out there in internetland have any thoughts on which format they'd like to see a game like this in?  (And while you're there, do please wade in with any other suggestions, rants, reasons why the whole idea is flawed, etc...)!
