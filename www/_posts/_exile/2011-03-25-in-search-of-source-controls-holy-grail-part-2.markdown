---
author: Ian
comments: true
date: 2011-03-25 14:26:19
layout: post
slug: in-search-of-source-controls-holy-grail-part-2
title: In Search of Source Control's Holy Grail (part 2)
wordpress_id: 11516
categories:
- Software
tags:
- Code
- Lazyweb
- Problem
- Programming
- Repository
- Revision Control
- Software
- Software Engineering
- Source Control
- Subversion
- SVN
---

Hello opinionated lazyweb denizens!  Let's see if you can help resolve today's office quandry (or at the very lest, tell us that we suck and we're doing it all wrong).

Friendly hint: if you know nothing about software and source code control, you might want to go and do something more fun than reading this post. Do you have Pop-Tarts? Go eat some Pop-Tarts.

Okay, this is a little simplified for ease of understanding, but here goes. For one particular family of products, we have a Subversion repository. It contains two products, and a bunch of components that each product depends on. The basic structure looks a bit like this:

    
    repository/<br>
      components/<br>
        component1/<br>
          trunk/<br>
          tags/<br>
        component2/<br>
        component3/<br>
        component4/<br>
        shared_libraries/<br>
      products/<br>
        product1/<br>
          trunk/<br>
          tags/<br>
        product2/

  

      

Our main requirements are:  

  1. During development, we can open multiple products and components together, and edit them together in the IDE.
  

  2. The a tagged build of a product may only use tagged (not trunk) versions of components.
  

Each _component_ has a `trunk` and various `tags`. The trunk has a build script that dumps its output binary (a JAR, in this case) into `shared_libraries`. These binaries are numbered according to their _next_ version number, so that in the build-up to component1 version 1.1, its build script creates `components/shared_libraries/component1-1.1.jar`.

Once a component reaches a certain version number, it gets tagged, and its build script in `trunk` gets updated to output a file with the next version number, e.g. `component1-1.2.jar`.

Each _product_ builds against properly versioned libraries inside `shared_libraries`.

This way, during development, we can open the `trunk` of whatever we like in the IDE, and provided our _product_ build script builds all its components first, it's always building against the latest versions.

At _product_ release time, we make sure all the _components_ are tagged first, meaning that the versions of the components in `shared_libraries` that the product has been using will never be modified again. We can then tag the product, safe in the knowledge that if someone checks out that tag in future, it will be set up to build against known versions of the components on which it depends.

My question to the lazyweb is, "is this in any way sane?"

There's one down-side I can see, which is that in order to build a product, a new user needs to ensure that they have `productX` and `shared_libraries` checked out with the same relative path that they have in the repository. They presumably won't want to check out the whole repository, as that would include every tag of every component, so they'd have to recreate the top levels of the structure manually.

This could be solved by using Subversion's `extern` property to embed `shared_libraries` within the product, thus:

    
    repository/<br>
      components/<br>
        shared_libraries/<br>
      products/<br>
        product1/<br>
          lib/<br>
            shared_libraries (extern)

However, if the product builds against JARs in the `extern`ed directory, that breaks the ability to build everything at once during development -- turning it from:  

  1. Build your components
  

  2. Build your product against the built components
  

into:  

  1. Build your components
  

  2. Commit `components/shared_libraries`
  

  3. Update `product1/lib`
  

  4. Build your product against the built components
  

Introducing a mandatory SVN commit into every build has got to be a bad idea.

We also can't make components build straight into a _product's_ `lib/` directory, as we want to keep the components strictly product-independent.

Is there some industry standard or just particularly good solution to this problem that everyone else is using and we just don't know about? Or have we, in the last couple of hours, produced as good a solution as we're going to get?
