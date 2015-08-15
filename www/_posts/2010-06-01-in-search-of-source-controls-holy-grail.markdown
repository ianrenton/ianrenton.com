---
author: Ian
comments: true
date: 2010-06-01 19:18:34
layout: post
slug: in-search-of-source-controls-holy-grail
title: In Search of Source Control's Holy Grail
wordpress_id: 3203
categories:
- Software
tags:
- Code
- Code Re-use
- Engineering
- Geeky
- Programming
- Software
- Source Control
- Version Control
- Work
---

Bestowed with a new network and a new-found autonomy, we set off on a quest for [Code Re-Use](http://en.wikipedia.org/wiki/Code_reuse), one of software engineering's many Holy Grails.  How, we asked, should we modify our existing processes to make code re-use more widely practised -- to make it the norm, rather than something done on occasion?

As it stands, our network features a [Subversion](http://subversion.tigris.org/) server and a [Mantis](http://www.mantisbt.org/) instance to which it is linked.  SVN handles our source, Mantis our issue tracking, and documentation and other sundries are held on a [SharePoint](http://office.microsoft.com/en-us/sharepointserver/FX100492001033.aspx) server on the same network.  SVN has project repositories, within which sit applications, so your average URL begins:

    
    http://svn/SomeProject/trunk/BestAppEver/src/

[![Existing Structure](http://files.ianrenton.com/sites/blog/2010/06/oldstructure.png)](http://files.ianrenton.com/sites/blog/2010/06/oldstructure.png)

Libraries tend to be passed around freely in compiled forms, and many a [Java](http://java.sun.com) project begins with grabbing some JARs from a previous project and dumping them in the new project's `include/`.  Not ideal for re-using code in a sane way.

Clearly, the first-party libraries that we use should be brought properly under source control.  We also like the idea of not tying applications to projects, since one app may be easily re-used on another project with only minor configuration changes.  Furthermore, in order to reduce the large number of libraries around the place, we might also want to group them together in functional groups.

This gives us four kinds of item that we need to place under source control: Projects, Applications, Libraries, and Library Groups.

[![Proposed Structure 1](http://files.ianrenton.com/sites/blog/2010/06/proposedstructure11.png)](http://files.ianrenton.com/sites/blog/2010/06/proposedstructure11.png)

Our first proposed structure had top-level repositories for Projects, Applications and Library, to keep these classes of item separate.  Granted, this has its fair share of issues.  But regardless, here we ran foul of that old problem -- trusting the users.  It's a requirement for many development teams that their projects/applications/libraries be kept private, either invisible to or at least non-writeable by those not in the team.  Here, Subversion -- as well as every other [VCS](http://en.wikipedia.org/wiki/Revision_control) I'm aware of -- fails.  Permissions can be set per repository, but not with any greater granularity.

Given this requirement, we seem to have no choice but to make all four classes of item into repositories in their own right.  But with this structure, if our plan to break code down into smaller, more generic, more re-usable components succeeds, we will eventually have hundreds of repositories.  We'll have shot ourselves in the foot -- although all the re-usable components are now neatly controlled, they will be impossible to find.
[![Proposed Structure 2](http://files.ianrenton.com/sites/blog/2010/06/proposedstructure2.png)](http://files.ianrenton.com/sites/blog/2010/06/proposedstructure2.png)

So, how will we make the available components accessible to users?  Current thoughts centre around maintaining a list in SharePoint -- while it will provide proper filtering and searching options, and as much metadata per item as we could throw at it, it's a separate system.  Nothing I know of will tie the two nicely together, meaning that it's a manual job to update it -- every time a programmer releases a new version of the library, they must head to SharePoint, update the version number and release status, and update a link to point to the tag for that version.

There also remains the matter of how application developers will get hold of the libraries once they're aware that they exist.  Assuming we don't want to check binaries into our source control system, we seem left with two options: a separate area for builds (which would also require manual maintenance, or a hefty bit of scripting to ensure it's updated properly), or some common method for building each component from source so that any Application can rebuild its own dependencies.  Given the wide range of programming languages and build systems used across our software, this isn't an easy problem to solve.  Plus in order to get maximum uptake of this system from software teams, we also need to reduce the barrier to entry -- if we force users to re-script their build process just to add their code, they're _not going to add their code_.

That range of languages also kills off the likes of [Maven](http://maven.apache.org/), which if given control of our repository would solve a few of these problems -- but only for Java.

[![Figure 4.  The Software Engineering Experience](http://files.ianrenton.com/sites/blog/2010/06/headdesk-300x224.png)](http://files.ianrenton.com/sites/blog/2010/06/headdesk.png)

A few systems exist that seem designed to address exactly these kind of problems -- [TeamForge](http://www.open.collab.net/products/ctf/) and [Github](http://fi.github.com/), to name a few popular ones.  Unfortunately, both are prohibitively expensive at this stage, and they also muscle in on the territory of our existing SVN, Mantis and SharePoint applications -- all of which have been a struggle to persuade people to use in the first place, thus our reluctance to change them.

As of now, it looks like the many repositories solution with the SharePoint index list is the option with the least problems, though I don't foresee maintaining that list being a joyous experience for certain SharePoint admins (Hi!).

Does anyone out there in Interwebland have any thoughts?  Is there something blindingly obvious we've missed?  Are we trying to do something crazy?  Should I abandon software engineering immediately and [become a Lumberjack](http://www.youtube.com/watch?v=5zey8567bcg)?
