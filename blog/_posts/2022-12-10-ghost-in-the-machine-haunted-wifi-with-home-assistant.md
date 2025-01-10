---
layout: post
title: 'Ghost in the Machine: "Haunted WiFi" with Home Assistant'
date: 2022-12-10 16:35 +0000
tags:
  - homeserver
  - homelab
  - homeassistant
  - trolling
  - haunted
image: /img/blog/2022/hauntedwifi-small.png
---

Since starting to play with [Home Assistant](https://www.home-assistant.io/), it's consistently impressed me with just *how many* possible integrations it has. From the things you'd expect, like Google Home, Siri, and smart lights, to the unexpected, like cars and smoke detectors, to the downright strange&mdash;it warms my weird little heart that I now have the ability to turn on my bedroom lights [using a VHF radio](https://www.home-assistant.io/integrations/aprs/). And of course, it's open source with open APIs, so you can code up any new integration you feel like.

Whilst I've had fun setting up some "normal" automations, I've had more fun imagining the weird things that are possible... and how they could be used to confuse, scare and mess with people. In a light-hearted way, of course.

So the concept is this: can we use Home Assistant to convince people the WiFi is haunted?

![A Lenovo Smart Clock with a display fault that makes the screen flicker](/img/blog/2022/hauntedclock.gif){: .center}
*Pretty sure this smart clock thing is already haunted.*

Halloween is the natural choice for pranks&mdash;it would be a matter of minutes to set up a timed sequence of events that sent guests mysterious messages, then started flashing the lights, played something spooky through all the smart speakers, Wake-on-LAN the entire network, get the TV to play a horror film...

Some other fun ideas to mess with your family and friends:

* Smart speakers calling out "I can see you"... whenever anyone visits an adult website (determined using AdGuard)
* All the lights in your house turn off as soon as your mother gets close
* Home VPN server that turns off when you leave the house, so you can never test it (admittedly, I'd just be messing with myself at that point)
* Inspired by the APRS integration I'd like to create a plugin for ADS-B/FlightAware/FlightRadar24 so that your lights flicker every time a plane flies overhead... And your speakers start playing a radio station from the country of its destination
* Automatically lock your door just as it's time to leave to catch your bus 
* Mess around with sensors and controls from two "connected" cars&mdash;so as soon as you pull up and turn your engine off, the other car automatically starts, and vice versa

And a shout-out to the weirdest combination of integrations I've found thus far... you could (if you were a terrible person) [automatically order a pizza](https://www.home-assistant.io/integrations/dominos/) if anyone [nukes Ukraine](https://www.home-assistant.io/integrations/ukraine_alarm/). How's that for convenience.
