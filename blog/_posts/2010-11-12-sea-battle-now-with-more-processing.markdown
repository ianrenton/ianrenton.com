---
comments: true
date: 2010-11-12 21:33:06
layout: post
slug: sea-battle-now-with-more-processing
title: Sea Battle, now with more Processing
tags:
- Applet
- Code
- Demo
- Development
- Game
- Java
- Processing
- Programming
- Sea Battle
- Software
---

Nearly a month ago now, I blogged [some sketches and ideas for a game I felt like writing](/blog/game-idea-spam-time).  [masterofwalri](http://masterofwalri.livejournal.com/) made a passing reference to [Processing](http://www.processing.org) in his [comment](/blog/game-idea-spam-time/comment-page-1#comment-6248), and having heard people mention it in the past, I figured I should check it out.

I'm very, very glad I did.

It neatly deals with the issue of what I should develop for.  The comments were leading me down the Java path anyway, but Processing's two-click export to Applet _and_ bundles for Windows, Linux and Mac OS sealed the deal.  And it's easy to program in too -- it's clear that it's beginner-oriented, but it's also ideal for simple games like this as it simply removes all the starting _faff_, like sorting out `JPanel`s and `TimerTask`s and all the rest.  Time will tell if Processing over-simplifies things and stops me doing something I want to do, but for now it is excelling at the main task of high-level programming languages -- reducing the amount of brain overhead I need to allocate in order to talk to the computer.

One lunchtime has produced 270 lines of code -- which already includes the game area of the GUI, controllable player ships, and the beginnings of AI for the enemy ships.

_Note: this blog post is old, and the game now has more functionality than is described here.  [The next blog post in the sequence is here.](/blog/sea-battle-thats-what-guns-are-for)_

Currently there's no real gameplay -- you can't build, and ships can't shoot or be damaged.  You can move your ships (starting at the bottom of the screen) around, and the AI ship will hunt yours.  Click on a ship to select it (blue circle), then click elsewhere to set its destination.  Red lines, when they appear, show when ships would be shooting.

The next block of code will give the ships customised gear, health points, and the ability to attack and sink others.  With that will probably come attack animations, which with my lack of skill in that department, will take a while.  After that, damageable bases and win/lose conditions, then the build/research system.  Finally, graphics tweaks, AI improvements and game balancing will finish it off.

More bloggery will appear once more coding occurs!
