---
comments: true
layout: post
title: 'Plane/Sailing Server Setup'
slug: plane-sailing-server
---

The final piece of the puzzle on the server side is Plane/Sailing Server itself. This is responsible for gathering all the information provided by Dump1090, rtl_ais and Direwolf into a single consistent format that the web front-end can use. As well as the core functionality, it has a number of other features that improve the Plane/Sailing experience:

* Support for config-based addition of extra tracks for the base station, airports and seaports
* Support for config-based addition of AIS track names, to cover the period between getting a position message and a details message
* Includes look-up tables to determine aircraft operators, types, and the correct MIL-STD2525C symbols to use for a variety of tracks
* Persists data to disk so the content of the track table is not lost on restart
* Allows customisable times to drop tracks etc.

![The Track Table within Plane/Sailing](/hardware/planesailing/tracktable.jpg){: .center}
*The Track Table within Plane/Sailing*

The server is written in Java, simply because it's the easiest language for me to get up and running with quickly, and hopefully should avoid the "dependency hell" of my [previous back-end server project](https://github.com/ianrenton/SuccessWhale-api) written in Ruby.

If you're interested in replicating this build for yourself, there is a complete set of setup instructions in the [Plane/Sailing Server README file](https://github.com/ianrenton/planesailing-server/blob/main/README.md). This covers not only getting the software up and running, but also ensuring it runs on startup on the Raspberry Pi, using Nginx to provide a Reverse Proxy setup, and setting up HTTPS using Let's Encrypt certificates. I wrote the README while going through the process myself, so hopefully it should work for you. If not, let me know and I'll see if I can help you out!