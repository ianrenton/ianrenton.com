---
title: A Sea Battle Update?!
layout: post
date: 2016-12-23 22:46
categories:
- Projects
- Software
tags:
- Sea Battle
- RTS
- Java
- Processing
---

"Sea Battle" was a casual 2D real-time strategy game that I put together in a few days back in 2010, and documented in a [series](/blog/game-idea-spam-time/) [of](/blog/sea-battle-now-with-more-processing) [blog](/blog/sea-battle-thats-what-guns-are-for) [posts](/blog/sea-battle-here-comes-the-science-bit/) at the time. It's lain dormant ever since, but I picked it up again today while bored and made a couple of tweaks.

Six years on, it's obvious how much my coding style has changed&mdash;not only is the formatting dubious and commenting sparse, there's also a lot of inefficient loops and abuse of global variables. I may change all that in a big refactor at a later date, but for now all I've done is a few minimal changes on top of the existing code.

If you played Sea Battle ages ago and fancy trying it again, here's what to expect:

![Annotated screenshot showing what's new](/img/blog/2016/seabattlechanges.png){: .center .noshadow}

1) **Islands!** You now get some randomly-generated islands to break up the wide expanse of blue sea. They'll be different each time you run the game. Collision detection is based on the old code for detecting collisions with other ships, which is not great, but your ships shouldn't get stuck behind islands *too* much. Islands only affect movement, not the firing arcs of weapons.

2) **Death list!** I originally wanted to give ships randomly-generated names in this update, so you could see something like "Bismarck sank HMS Hood". However, I couldn't find a nice way to display them on the play field without adding loads of clutter&mdash;maybe one to save for the full-screen 3D version 2. :) The implemented list instead shows which equipment the ships had, e.g. "1.2.3.4" = 1st hull, 2nd weapon, 3rd engine, 4th radar, to give you an idea what your enemy's current tech level is and what's working well against what.

3) **Equipment changes!** I've simplified some of the abbreviations for different equipment types so they're less confusing. Submarine types (SSK and SSN hulls) have been dropped, as it never really made sense to have submarines with 15-inch cannons anyway.

![HMS M1](/img/blog/2016/hmsm1.jpg){: .center}

> HMS M1, a submarine with a 12-inch cannon. It could only fire one shot before being reloaded, which required it to stay surfaced. Needless to say, it did not see operational service. (Image: [Wikimedia](https://en.wikipedia.org/wiki/HMS_M1#/media/File:HMS_M1_from_air_port_bow.jpg))

4) **Removed dodgy monotype fonts!** Not sure what I was thinking with these really. All fonts have been removed from the source package, the whole UI now just uses your system sans-serif font.

5) **Build time rebalancing!** Build times used to be dependent on hull size alone. This made it (spoilers!) preferable to research only weapons and radar, and flood the field with quick-to-build ships that did high damage and outranged the enemy so they could get a couple of shots off before dying. (The AI prefers this approach on higher levels too.) Now, although hull still dominates, the other equipment affects the build time too. For example, Hull 1 Weapon 10 Engine 1 Radar 10 used to take 4 seconds to build, it now takes 13.

6) An extra bug fix&mdash;playing a new game after a win or loss now resets the world properly.

If you fancy a go, [head to the game's page](https://ianrenton.github.io/SeaBattle/) where you'll find instructions and download links. As always, the [source is on Github](https://github.com/ianrenton/SeaBattle/).

Have fun!
