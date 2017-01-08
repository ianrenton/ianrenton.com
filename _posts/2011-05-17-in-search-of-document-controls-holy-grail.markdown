---
author: Ian
comments: true
date: 2011-05-17 15:57:43
layout: post
slug: in-search-of-document-controls-holy-grail
title: In Search of Document Control's Holy Grail
wordpress_id: 11643
categories:
- Software
tags:
- Business
- Configuration Management
- Data
- Documents
- Lazyweb
- Office
- Revision Control
- sharepoint
- Software
---

Just over a year ago, our site was sold by its owners to another parent company. In the run-up to the sale, we had been slowly making ourselves a new intranet based around Microsoft [SharePoint](http://sharepoint.microsoft.com/). After the event, SharePoint kicked off in a big way, with more and more projects and teams starting to use it for their file storage.

Fast forward to today, and our critical business data is split about half-and-half between SharePoint and the older "file store" (simply a Windows Server box with a giant, shared partition). The Powers that Be have decided that now is the time to do something about it, and standardise on one solution. What that solution is, however, is proving difficult to grasp.

SharePoint is now, in my opinion, past critical mass. The majority of Engineering use it for all their filing and often other activities. The rest of the company is split -- maybe 50% use it, 50% don't, and of those that don't, half are distrusting or actively hostile.  The IT team have been enthusiastic adopters, but a number of technical issues remain unsolved, which has set them looking at alternatives.

As I see it:

  * **SharePoint**, first and foremost, features configuration control and revision history for documents. This is the stuff that software projects live by and die without, yet there are areas of the business that just don't see the advantage. The ability to view the same data in many different ways by use of metadata means that every part of the business can have the view they want. It also offers a host of other features such as calendars and task lists that a number of projects are actively using, and full-text search takes milliseconds rather than days for a data set in the hundreds of gigabytes.
  

  * **Network Shares** are simple, and have essentially no learning curve. They're also not as affected by proprietary software 'lock-in' -- it's far easier to get your data out of a network share than out of SharePoint should you need to. They also support larger files, and in our experience provide a faster access speed.
  

  * **[Subversion](http://subversion.apache.org/)** is most of our software teams' source code management software. I once ran a project entirely out of Subversion -- users liked the ability to merge Word document versions using Track Changes, but by and large the non-technical staff found it too complicated and difficult to use.
  

  * **[Alfresco](http://www.alfresco.com/)** and **[KnowledgeTree](http://www.knowledgetree.com/)** have been suggested as possible SharePoint equivalents that could be cheaper if we used their open source versions, but could also introduce a host of other problems.
  

  * **[Clearcase](http://www-01.ibm.com/software/awdtools/clearcase/)** was suggested by a friend via Twitter, but it seems likely that as a primarily source code-oriented tool, the learning curve may be too steep for many users.
  

I'm interested to know how other companies solve the problem of document control (primarily of MS Office documents), and what tools they use. If you haven't already waded in on Twitter or Facebook, feel free to do so here!

I'd like to believe that this is such a common problem that there is an existing, widely-used solution -- but the more I talk to people about it, the less I am convinced that such a thing exists. Even if it doesn't, what do you think is the least bad of all the options? Is there anything we haven't considered?   


