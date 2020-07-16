---
author: Ian
comments: true
date: 2010-02-05 13:19:27
layout: post
slug: semicolon-rage
title: Semicolon Rage
wordpress_id: 2679
categories:
- Software
tags:
- Analog Devices
- Annoyance
- C
- Code
- Code Monkey Rage
- Compiler
- Rant
- Software
- Syntax
- VisualDSP
---

Yesterday, I had a simple `if` statement.  It looked like this:

    
    if ((Frames.FramesLdPtr>Frames.FramesUlPtr) && (InterPFlags.RequestInitialisation==0))
    {
        doSomeStuff(); // with function and variable names that might be classified =S
    }

This should not trigger under normal circumstances, but for some reason it triggered repeatedly, every second or so.  Breakpointing inside the `if` block, `FramesLdPtr` and `FramesUlPtr` were always zero.  `RequestInitialisation` was always zero.  I was stumped.

I spent several hours checking to see if `LdPtr` or `UlPtr` could be being changed by the other processor in the system -- maybe `LdPtr` was flicking to 1 long enough to trigger the `if` statement, then going back to zero again.  But no.

I commented out the right-hand half of the `if` statement, and lo!  It worked -- i.e. didn't trigger repeatedly -- again!  But there's not even any code to set `RequestInitialisation` anything other than zero, and besides, it's an AND statement, so removing the right-hand side couldn't _stop_ it triggering.

I spent yet more hours figuring out if memory was being corrupted, or if the values could be being distorted by there being a breakpoint there.

And then I'd run out of our own code to blame.  I began to wonder if the chip couldn't access its own external memory properly, or if logic itself was somehow broken in my compiler.

Then I had a cup of tea.  And through the wonder of caffeine, I beheld the truth.  My code _actually_ looked like this:

    
    if ((Frames.FramesLdPtr>Frames.FramesUlPtr) && (InterPFlags.RequestInitialisation==0));
    {
        doSomeStuff();
    }

Now, I understand perfectly _why_ that extra semicolon breaks it.  And now I know why commenting out the right-hand side fixed it -- I commented out the semicolon too.  And I can almost understand why someone would want to put a block of code between curly braces without any kind of `if`/`while`/`for`/etc. attached to it.

But why, dear compiler, why in the name of Xenu's testicles does an `if` statement with no content not at least generate a _warning_?

Grumble.


