---
author: Ian
comments: true
date: 2010-03-28 21:50:51
layout: post
slug: an-ode-to-sharepoint
title: An Ode to Sharepoint
wordpress_id: 2869
categories:
- Software
tags:
- cthulhu
- iis
- madness
- Microsoft
- pain
- Rant
- server
- sharepoint
- Software
- suffering
- sysadmin
- Windows
---

At a loss for other, more pleasant subjects to blog about, I will instead write about my nemesis, that being that has brought naught but pain to my life.  I speak, of course, of Microsoft Sharepoint.

To upgrade one's version of Windows -- Vista to 7, say -- is by and large a pretty painless experience for the home user.  Office, likewise -- there's no dread that your Office 2003 files will be completely unopenable in Office 2007.  So why is the poor sysadmin not afforded the same easy upgrade path?

In order to move an existing SharePoint Services 2 website to a new network with Microsoft Office Sharepoint Services 2007, one must:

  1. Learn more than is healthy about the workings of Sharepoint and IIS (2 days, d10 SAN)
  2. Back up the original site to disk (using `stsadm.exe` not `smigrate.exe`, as the latter is broken) (5 hours, 13 GB)
  3. Install Windows Server, IIS, SQL Server and Sharepoint Services 2 on a new machine (1 hour)
  4. Configure said IIS, SQL and Sharepoint (1 hour)
  5. Restore the Sharepoint site from disk onto the new machine (>8 hours, >120 GB, d10 SAN, fails unrecoverably when out of disk space)
  6. Perform an in-place upgrade to Sharepoint Services 3 (Several hours, 40 GB, may fail unrecoverably)
  7. Back up this site to disk (5 hours, 15 GB)
  8. Configure MOSS 2007 on the destination server (2 hours, 24 Google searches, d10 SAN)
  9. Restore the disk backup to the MOSS 2007 server (5 hours, 40 GB, may fail right at the end if previous step performed incorrectly, d100 SAN if this occurs).
  10. Manually recreate permissions on every Sharepoint site since all the users are now part of a new domain (8 hours, d10 SAN)
  11. Perform a ritual to offer Great Cthulhu the souls of Microsoft's Sharepoint development team (d30 SAN, remarkably quick by comparison)

I began this task on Tuesday afternoon as a mildly knowledgeable Sharepoint user with virtually no admin experience.  By Thursday afternoon, I may have been our company's most experienced Sharepoint-wrangler.  On Friday morning, I started the above procedure.  _We are now on Step 5.  200 people are expecting to have Sharepoint access tomorrow.  They have not a snowball's chance in R'yleh._
