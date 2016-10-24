---
layout: software
title: "Can I Call It...?"
comments: true
githublink: https://github.com/ianrenton/canicallit/
---

"Can I Call It...?" is a simple script for checking if the name you'd like for your new, shiny project has already been used by somebody else.

It uses project data from [Github][1], [SourceForge][2], [Ruby Gems][3], [PyPI][4], [Maven][5], [Debian][9] and [Fedora][8]. (Only Github repositories with >5 watchers (stars) are considered 'significant' enough to worry about.)

It was written by [Ian Renton][6]. Source code is available under the [BSD licence][7].

 [1]: https://github.com
 [2]: http://sourceforge.net
 [3]: http://rubygems.org
 [4]: http://pypi.python.org
 [5]: http://search.maven.org
 [6]: http://ianrenton.com
 [7]: https://github.com/ianrenton/canicallit/blob/master/LICENCE.md
 [8]: https://admin.fedoraproject.org/pkgdb
 [9]: http://packages.debian.org

I just want to use it!
----------------------

That's OK! There's a version running at [cici.onlydreaming.net](http://cici.onlydreaming.net). It's a little slow and will buckle if Slashdot/Reddit/Hacker News find it, but it should be OK for casual use.

I want my own copy!
-------------------

That's fine too! Just clone this repo and you'll be on your way. There's no environment variables or anything to set up, but if you're running your own copy, you probably want to change or remove the Google Analytics ID in `config.ru`.

"Can I Call It...?" is provided with a `Procfile` so it should be ready to go as a Heroku app, and can be run locally with `foreman start`.
