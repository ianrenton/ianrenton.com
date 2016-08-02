---
author: Ian
comments: true
date: 2010-11-16 21:32:02
layout: post
slug: sea-battle-here-comes-the-science-bit
title: 'Sea Battle: Here Comes the Science Bit'
wordpress_id: 11325
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

Another day down, and somehow Sea Battle is remarkably close to the finish line.  (No idea what I'm talking about?  See previous blog entries [1](http://ianrenton.com/blog/game-idea-spam-time), [2](http://ianrenton.com/blog/sea-battle-now-with-more-processing) & [3](http://ianrenton.com/blog/sea-battle-thats-what-guns-are-for).)

First things first, my failings: CPU use and mouse sensitivity are still not fixed.  I'm now having to re-render more of the window on each refresh than before, so if anything they might be slightly worse.

On [the Facebook thread](http://www.facebook.com/notes/ian-renton/sea-battle-thats-what-guns-are-for/500597827278), Scott and Mark mentioned an AI issue in that a suitably scary player ship, when parked close to but slightly off to one side of the enemy base, will be ignored by enemy ships in favour of attacking the player base instead -- even when they have no hope of destroying the player's base before their own is destroyed.  As far as I know that issue is still there, though improved enemy research and build AI should mean the enemy is pumping out ships just as scary as yours.

On to the new features:

	
  * All 10 hulls, weapons, engines and radars are now implemented

	
  * You can now choose between them when setting build orders, so you can build in whatever configuration you like

	
  * Research is now implemented -- click on an unresearched component to start researching it

	
  * You start the game with only basic components, and must research more to survive

	
  * Colours: Grey - not researched yet, Green - researching now, White - available, Yellow - selected (clicking Build will build this)

	
  * Enemy AI now handles its own research

	
  * Enemy AI now builds intelligently rather than randomly

	
  * You can now drag a box to select multiple ships
  

And bug fixes / tweaks:

	
  * Base health significantly increased

	
  * Building a second ship without moving the first no longer places them on top of one another

	
  * Pathfinding code tweaked to cope with much faster/slower ships now all the hulls and engines are available

	
  * Fixed an issue whereby the blue radar circles were drawn at half the ships' actual radar range

  

Still to come:

	
  * Ship / submarine hull and vs ship / submarine weapon distinction

	
  * Tweaks to enemy AI

	
  * CPU use / mouse responsiveness fixes

	
  * Menu system and difficulty picker

  

If you'd like a good strategy for beating the game at this point, I recommend you begin by keeping your build queue about 3-4 ships full, building the best thing you can at any point.  Research-wise, rush down the weapons tree as far as Harpoon missiles, throwing in a couple of hulls and radars.  Avoid engines for now.  As soon as you have Frigates with Harpoons and Radar Mk 4, keep building them until you've fended off all the enemies near your base and you have a fleet of 15-20 of them, then move them all right up to the enemy base.  With that fleet you should be able to destroy the base before the ships they build wear yours down too much.

[You can play the current version of Sea Battle as a Java applet by clicking here.](http://files.ianrenton.com/Sea_Battle/)
