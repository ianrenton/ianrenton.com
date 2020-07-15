---
author: Ian
comments: true
date: 2012-03-02 16:31:14
layout: post
slug: a-beginners-guide-to-java-swing
title: A Beginner's Guide to Java Swing
wordpress_id: 12021
categories:
- Software
tags:
- cthulhu
- GUI
- Java
- Software
- Swing
- User Interface
---

_For those looking for a quick introduction to laying out Graphical User Interface components using Java's Swing technology, this guide may prove helpful.  (But probably not.)_

Swing Components all have a few common properties that affect how they are laid out on the GUI.  These are:

  * **alignmentX** and **alignmentY** do nothing whatsoever.

  * **maximumSize** sets the largest size the component can be when rendered, unless the Layout Manager feels like messing with you.

  * **minimumSize** sets the smallest size the component can be, although this only holds when Venus is in Capricorn.

  * **preferredSize** sets the exact size that a component will try to be, provided you have entered the secret unlock codes which are known only to Larry Ellison and the Illuminati.

Swing components are arranged inside their parent panels by Layout Managers.  Many layout managers are available to achieve certain common layouts.  They include:

  * **FlowLayout** arranges components in a straight horizontal line, hiding any that it can't be bothered to display because your box was too small for them.

  * **BoxLayout** places all components in either a horizontal or vertical line, expanding to fit them all, but resizing the child components for the lulz.

  * **BorderLayout** places components on the top, left, bottom or right-hand side of the panel.  If you place two on the same side, they duel to the death until only one survives.

  * **GridLayout** arranges components in a grid with fixed size cells.  If the component in one of the cells happens to be huge for some reason (e.g. you did not enter the Illuminati secret unlock code), your entire parent panel expands until it consumes the universe.

  * **GridBagLayout** represents the eternal influence of the Outer Gods in the affairs of man.  Ï̷̫̥̣͈ͯ̌a̱̮̼̣̞͇̬͚ͧ́̉̆ͭͭ͜I̻̝̰̟͕̖͎ͦ̏ͫ̀͗̋͢ã̶̧̭͚͖ͤ͑́̎ͩͅ!̙͉͙̫̋̋͠ ̹͓̝̹͙͉̲͉̰́̽̐̈ͭ͆̎!̛̘̖̺̺̦̙ͦ͗̂͗̈͊͝
f̦̬̲͇̥̗̙̬͆ͦͦ̀̒̕G̸̩̹̞̫̈ͨ͒͆͞r̶̤͆̋i̴̮͖̦̙̤͈̗͍̎͛ḑ̗̰̘̔ͥ͆͢B̻͇͎̣̰͓̀̇͒ͬ̈́͂ͣ̚͠͠ä̲̮̰͚̬͑̎́g̷̲͔̬͓̙̙̑̂ͧ͢L̶̛͍͎̝̲͐̃a̴͈̤̖͚̠̼̳̺̬͊ͥ̕͡ẏ̶̹̃̌͛̀ǒ̴̙̜̭͖̆͆ͮ̀ͫ͌ͤ͠u̶̥͈̝̱̺͖̔̿͗̊ͦ̒̋ͩ́t͖̤̻̥̟̻̻̹̞̻̎͒̅͂͗͑̽̎ͩ̇̇̔̉̌̃ ̵͕̘̬̳͆̒̈́ͭͦ̚͠'̷̘̔͋ͦ͂͝t͍͉͒̄ͨ̓ͧ̋̀h̲̣̜̱̳̝ͣ̓ą̶̸̜͎̝̹̭̹͒̐̄͊ͯ̐g̯̹̔̍ͦ͡n̩͚̞͆͌ͬ̐!̞̪͎͙̼͇͌͊̌

I hope that helps.
