---
comments: true
layout: page
slug: radio-shack
title: Radio Shack
---

This page describes my "radio shack" and other ham radio equipment, along with providing some links to other radio-related pages below.

![Radio Shack Setup](/hardware/radioshack/shack.jpg){: .center}
*A photo of the "shack" (one end of a desk), circa 2021*

![Antenna Setup](/hardware/radioshack/antennas.jpg){: .right}

At home, I have a high level of QRM from nearby houses so I generally prefer weak signal digital modes and can often be found passing the time on 40m/20m/10m FT8. Equipment there for HF is a Yaesu FT-840 transceiver and auto tuner,  with a 49:1 unun and 13m of "random wire" strung down my small garden at about 3m high. For VHF/UHF I have a Yaesu FT-7800 and Diamond X-50 antenna.

<div class="clear"></div><br/>

![A picture of me operating from a field with an HF dipole antenna](/hardware/radioshack/me-sota.jpg){: .left}

I have recently got into the world of outdoor radio, completing my first SOTA activation in June 2024, and planning to do JOTA with the Scouts this year as well. It's early days yet but I feel like I've "got the bug"! Equipment for outdoors is a Yaesu FT-891 and Sotabeams Band Hopper II for HF, plus one of my small collection of cheap HTs.

<div class="clear"></div><br/>

Outside of the ham bands, I also use radio systems professionally, both for data and for marine VHF voice communication. I try my best not to say the wrong things on the wrong service!

## Radio-Related Projects

* [Plane/Sailing](/hardware/planesailing/)
* [Plane/Sailing Portable](/projects/planesailing-portable/)
* [Flight Tracker](/hardware/flight-tracker/)
* [The 2EØUXV "Random Shit I Found in my Shed" Antenna](/hardware/radioshack/2e0uxv-random-shit-i-found-in-my-shed-antenna)

## Radio-Related Blog Posts

<ul>
{% for post in site.tags.radio limit:10 %}
{% capture post-url %}{{ post.url | prepend: site.baseurl }}{% endcapture %}
{% capture meta %}{{ post.date | date: "%b %Y" }}{% endcapture %}
<li>{{ meta }}: <a href="{{ post-url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>

## Other Radio-Related Stuff

* [Useful Files](/hardware/radioshack/useful-files/) including CHIRP configs
