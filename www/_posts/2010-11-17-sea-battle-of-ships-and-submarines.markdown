---
author: Ian
comments: true
date: 2010-11-17 16:49:49
layout: post
slug: sea-battle-of-ships-and-submarines
title: 'Sea Battle: Of Ships and Submarines'
wordpress_id: 11332
categories:
- Software
- Games
- Projects
tags:
- Code
- Development
- Game
- Programming
- Sea Battle
- Ship
- Software
- Submarine
---

The distinction between surface ships and submarines in Sea Battle has turned out to be a more thorny issue than I originally imagined.

The original plan was to have two classes of vessel, based on their hull types - ship or submarine - and weapons that could hit ships, submarines, or both.  A future update could also have included aircraft "hulls".  However, the more I think about the game balance issues, the less I'm convinced that this is a good decision with the tech tree and playing field size that Sea Battle currently has.

Sea Battle's tech tree, as it currently exists, has four straight "trees" with 10 items in each.  By and large, each component that you research is better than its predecessor.  (Later hulls are heavier and take longer to build, so small hulls are still useful.  However, you would rarely want to choose anything other than the best weapon, engine and radar that is available to you.)  Combined with the small playing field, this makes for a fast-paced game of a few minutes, with each player researching and churning out ships constantly to gain the upper hand.

There are a number of reasons why the current tech tree is inappropriate for submarines.  Firstly, the weapons that a submarine could have: there's only two.  The Sting Ray torpedo (weapon 8) and Tomahawk missile (weapon 9) are the only weapons appropriate to be fired from a submarine.  This would make rushing down the hull tree to submarines pointless unless you'd already reached near the end of the weapons tree -- and in most games, you don't even get that far.

It also creates a UI complication, in that currently, any combination of hull and weapon is permissible.  Submarine-appropriate weapons would break that behaviour.

There's an issue with _anti_-submarine weapons too.  Again, only two (Depth Charge (6) and Sting Ray (8)) are appropriate for use against submarines.  But since a viable submarine build wouldn't exist until Hull 6 + Weapon 8, they would only exist in the late game, at which point Depth Charges just can't hold their own against other weapons -- so why have them at all?

To abuse game theory, the logical choice is for players to build Depth Charge ships when they become available, then hold them in reserve as insurance against their opponent building submarines.  But if you see your opponent stocking up on Depth Charge ships, you might as well not bother building subs and just go for better weapons and radar instead.  Whoever commits to a strategy first ends up on the losing end.

To cure these problems, perhaps we need to take another lesson from Warzone 2100's book and have separate tech trees for different weapon types.  So rather than one tree of 10 weapons, we have two trees for anti-ship and anti-sub.  (And potentially anti-air later.)  If we're going down this route we ought to have different hull trees for ships and subs too.  But at this point it's turning into a rather different game -- a slower, more traditional rock-paper-scissors RTS.  But these games benefit from larger playing fields, varied terrain and squad-based combat -- none of which Sea Battle is particularly well suited to in its current form.

So the question stands: Do I expand Sea Battle significantly to include this extra complexity, on the understanding that I would probably need to rewrite it in something other than _Processing_ and that may consign it to the pile of "projects I lost interest in", or do I just ignore the issue and for the sake of simplicity not treat submarine hulls as any different from ships?
