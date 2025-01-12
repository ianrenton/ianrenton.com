---
comments: true
layout: page
slug: radio-shack
title: Radio Shack
date: 2020-12-27T00:00:00+00:00
last_update: 2025-01-10T00:00:00+00:00
redirect_from:
  - /hardware/radioshack
  - /hardware/radioshack/
---

This page describes my "radio shack" and other ham radio equipment, along with providing some links to other radio-related pages below.

![Radio Shack Setup](/img/projects/radioshack/shack.jpg){: .center}
*A photo of the "shack" (one end of a desk), circa 2021*

![Antenna Setup](/img/projects/radioshack/antennas.jpg){: .right}

I discovered the ham radio hobby though some of my previous radio-related projects, primarily using AIS, ADS-B and APRS packet data for tracking. I got my Foundation licence during Covid lockdown, then went for Intermediate and Full in the following years to expand the list of interesting things I can do!

At home I usually work HF SSB, primarily chasing portable or special event stations rather than having long ragchews. I have a high level of QRM there so I also use weak signal digital modes and can often be found passing the time on 40m/20m/10m JS8 or FT8. Equipment there for HF is a Yaesu FT-840 transceiver and auto tuner,  with a 9:1 unun and 13m of "random wire" strung down my small garden at about 3m high. For VHF/UHF I have a Yaesu FT-7800 and Diamond X-50 antenna.

<div class="clear"></div><br/>

![A picture of me operating from a field with an HF dipole antenna](/img/projects/radioshack/me-sota.jpg){: .left}

Outside of home I am a regular activator for POTA, WWFF etc. when time allows. Equipment for outdoors is a Yaesu FT-891 and Sotabeams Band Hopper II inverted V dipole or JPC-12 vertical. I have also very much enjoyed doing Jamboree on the Air with the Scouts for the first time in 2024.

<div class="clear"></div><br/>

![Me sat on a plank of wood with radio in hand, view of Poole behind me](/img/blog/2024/canford-heath-3.jpg){: .center}

Outside of the ham bands, I also use radio systems professionally, both for data and for marine VHF voice communication. I try my best not to say the wrong things on the wrong service...

I confirm all QSOs via LOTW, eQSL, Clublog & QRZ.com. I'm also happy to exchange cards direct (e-mail me for postal address) or via Bureau - just let me know if you want one.

See you on the air

## Radio-Related Projects

* [Field Spotter](/projects/field-spotter/)
* [Plane/Sailing](/projects/planesailing/)
* [Plane/Sailing Portable](/projects/planesailing-portable/)
* [Flight Tracker](/projects/flight-tracker/)
* [POTA Local Parks Progress](https://github.com/ianrenton/pota-local-progress)
* [POTA Unactivated Park Finder](https://github.com/ianrenton/newparks)
* [The "Worked Everything, Everywhere, All at Once" Award](/projects/worked-everything-award/)
* [The 2EØUXV "Random Shit I Found in my Shed" Antenna](/projects/radioshack/2e0uxv-random-shit-i-found-in-my-shed-antenna)

## Radio-Related Blog Posts

<p>The 10 latest posts tagged "radio" are:</p>

<ul>
{% for post in site.tags.radio limit:10 %}
{% capture post-url %}{{ post.url | prepend: site.baseurl }}{% endcapture %}
{% capture meta %}{{ post.date | date: "%b %Y" }}{% endcapture %}
<li>{{ meta }}: <a href="{{ post-url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>

## Other Radio-Related Stuff

* [Useful Files](/projects/radioshack/useful-files/) including CHIRP configs
