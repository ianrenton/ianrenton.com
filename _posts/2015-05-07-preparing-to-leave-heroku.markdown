---
layout: post
title: "Preparing to Leave Heroku"
date: 2015-05-07 22:20
comments: true
categories: 
- Software
- Internet
tags:
- Heroku
- PaaS
---

An email today announced a beta test of some new features that Heroku are "excited" to introduce. New service levels are available that include a "hobby" tier that does... exactly what the old "free" tier used to do. For $7 per month per app!

The free tier has now been downgraded so that it must "sleep" &mdash; i.e. be unavailable &mdash; for at least six hours a day.

As a long-term abuser of Heroku's free tier, I've enjoyed continuous uptime for all my sites courtesy of Heroku. A lot of sites.

![Heroku Apps](/img/blog/2015/heroku-apps.png){: .center}

All of which I now have to slowly migrate off Heroku as freeloaders like me are no longer welcome!

The sites that are static HTML (including the Octopress sites) and PHP have in the main already been migrated back to my own web server over the last few hours, and I'll continue to monitor usage statistics over the next few days to ensure it can cope with the extra load.

Some sites using Ruby, and others that depend on HTTPS will be a little more difficult to move. Certain sites such as the SuccessWhale API that require high bandwidth and good uptime may stay on Heroku and move up to a paid tier if required.

Hopefully none of this should impact users of the sites, but please let me know if you find a site or application is inaccessible or suffering from poor performance.
