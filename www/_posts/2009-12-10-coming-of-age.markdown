---
author: Ian
comments: true
date: 2009-12-10 19:42:33
layout: post
slug: coming-of-age
title: Coming of Age
wordpress_id: 882
categories:
- Internet
- Software
- Hardware
tags:
- Archaeology
- Code
- Gadgets
- Humour
- Lottery
- Palmtop
- Programming
- Psion
---

[![Yes, she's legal.](http://files.ianrenton.com/sites/blog/2009/12/IMG_0048-300x200.jpg)](http://files.ianrenton.com/sites/blog/2009/12/IMG_0048.jpg)

The other day, while excavating the depths of our airing cupboard-turned-junk pile, I discovered possibly the oldest gadget I own: a Psion Series 3a... thingy.  Time has obscured from my memory what we actually called these things when they were new.  It certainly wasn't 'netbook' - was it 'palmtop'?  After some new batteries and a non-trivial number of blunt impacts against the table to reseat the display connector, it spluttered into life.  The back of the unit declares it to have been made in 1993, so this thing is sixteen years old.

Now where I am, at sixteen, one can do the following:

  * Drive a scooter

  * Have heterosexual sex

  * Marry (heterosexually) with your parents' consent

  * Enter full-time employment

  * Play the lottery.

[![The Psion 3a, having the decency to look embarrassed next to my cellphone.](http://files.ianrenton.com/sites/blog/2009/12/IMG_0078-300x200.jpg)](http://files.ianrenton.com/sites/blog/2009/12/IMG_0078.jpg)

There are a few issues with most of these.  Driving a scooter is clearly beyond the poor thing's capabilities.  It appears to have expansion slots, so I'm going to go ahead and consider it female.  Now that by default makes all other Psion 3as female, so marriage (within its own species at least) is presumably out.  I have no expansion cards to put in it, and now I've mentally pidgeonholed that as "having sex" I'm not sure I even want to.  Full-time employment is out as I'm not sure it does anything that peoples' cellphones don't these days.  And that just leaves playing the lottery.  Well, then.

These things can be programmed in a language called OPL, which appears to be so antiquated that even the _internet_ has largely forgotten it.  I'm immensely grateful to [Gareth and Jane Saunders](http://www.garethjmsaunders.co.uk/psion/programming16_opl.html), who seem to be the only people left with an OPL-related webpage that hosts the programmers' manual.

In the UK, one picks six numbers between 1 and 49 for each draw.  Six numbers and a bonus are chosen by the lottery machine, and matching all of the main six is a jackpot (odds about 14 million to one).  Matching three is the lowest prize, £10 at odds of about 56 to one.  So, not really confident we'll be winning anything here.  Still, onwards!

Making sure all six numbers it picks are _different_ would take more than the three minutes I'm prepared to spend in contact with OPL - damn thing doesn't even have FOR loops.  I'll just run the program again if it picks two the same.  So here's possibly the shortest program I've ever written:

[![Eat your heart out, Visual Studio 2008.](http://files.ianrenton.com/sites/blog/2009/12/IMG_0056-300x200.jpg)](http://files.ianrenton.com/sites/blog/2009/12/IMG_0056.jpg)

    
    PROC lottery:
      LOCAL count%, n%
      RANDOMIZE(MINUTE+SECOND)
      PRINT "Lottery Numbers:  ";
      DO
        n% = (RND*48+1)
        PRINT n%;
        PRINT "  ";
        count% = count% + 1
      UNTIL (count% = 6)
      GET
    ENDP

  

[![The Die is Cast.](http://files.ianrenton.com/sites/blog/2009/12/IMG_0848-300x199.jpg)](http://files.ianrenton.com/sites/blog/2009/12/IMG_0848.jpg)

And when translated (_translated?  really?_) and run, it does indeed produce lottery numbers.  So - to the newsagents!  And back, lottery ticket - and granulated sugar - in hand.

Having foolishly switched the thing off in the meantime, it took a few seconds of mashing the On button and opening and closing the lid to coax it back into life.  But back to life it came, long enough to pick its six numbers.  And now, we wait to see what fate befalls this aged device.

Will it quietly be replaced by gadgets a decade and a half its junior?  Or become a palmtop millionaire, and, er... and I'll have to work out what the heck a Psion 3a would do with a million quid.  Tune in on Saturday night to find out!

_The lottery results are in!  You can find out what happened in [my next blog post, here](http://www.onlydreaming.net/blog/so-farewell-psion-3a).  Spoilers: I am still not a millionaire._
