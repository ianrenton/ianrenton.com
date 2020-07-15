---
comments: true
layout: page
title: Flight Tracker
---

<p>I run a relatively simple home-made ADS-B aircraft tracker using and old Raspberry Pi, Software Defined Radio dongle, and some software. It’s installed in my shed, and provides reasonable <a href="http://flightmap.ianrenton.com">tracking of planes going in and out of the nearby airport</a>.</p>

![Raspberry Pi with HDR setup](/hardware/flight-tracker/hw.jpg){: .center}

<p>The Raspberry Pi is an original one I had lying around; I found the easiest setup was to use <a href="https://flightaware.com/adsb/piaware/build">PiAware</a> from <a href="https://flightaware.com/">FlightAware</a>. (This asks for a Raspberry Pi 3, but works just fine on the original.) The PiAware link has a good guide to getting it all set up.</p>

<p>My SDR dongle is an R820T from <a href="https://www.rtl-sdr.com/">RTL-SDR.com</a>, and worked perfectly out of the box, with the included antenna extended to approximately 67mm.</p>

<p>Following the simple instructions from FlightAware gives you a device that will automatically upload tracking data to their website, and also provides a local web server (via the included <a href="https://www.satsignal.eu/raspberry-pi/dump1090.html">Dump1090</a> software) that shows what’s being tracked.</p>

![Dump1090 web interface (lol at some rich dude and his custom tail number)](/hardware/flight-tracker/sw1.png){: .center}

<p>This web interface is nice, but I wanted to go one further and add military symbology, airspace layers from <a href="https://www.openaip.net/">openAIP</a> on the map, and some tweaks to the information shown. Rather than getting dirty and recompiling a fork of Dump1090, I discovered that a simple JSON HTTP request underlies its own web interface’s data retrieval. I therefore chose to write my own web front-end, and use Dump1090’s JSON as a data source. (There are other “proper” ADS-B formats available from Dump1090 as well, but JSON is the most convenient to use from a web application.)</p>

![Military symbology and airspace layer in U.M.I.D. 1090)](/hardware/flight-tracker/sw2.png){: .center}

<p>When setting this up, I did encounter a problem, which is that Dump1090 by default has a problem with the <code>Access-Control-Allow-Origin</code> flag that it uses to enable cross-site script requests for the data. The version of Dump1090 installed by default in PiAware is no longer the latest, so I tried recompiling the latest version to see if the problem was resolved, but I ran into problems getting it to compile on the Pi. In order to allow my own software to access the data, I therefore to set up a reverse proxy on the Raspberry Pi using nginx. This allowed me to rewrite the headers as required.</p>

![Track table in U.M.I.D. 1090)](/hardware/flight-tracker/sw3.jpg){: .center}

<p>As well as providing data to FlightAware, I also wanted to provide data to its competitor <a href="https://www.flightradar24.com/">FlightRadar24</a>. The easiest way to do this was as I found in <a href="https://forum.flightradar24.com/forum/radar-forums/flightradar24-feeding-data-to-flightradar24/11792-beginner-feed-both-fr24-und-fa-with-raspberry-pi-3-model-b-flightaware-pro-stick">this forum post</a> – to stick with the PiAware base software, then add the FlightRadar24 software on top. Downloading and running <a href="https://repo-feed.flightradar24.com/install_fr24_rpi.sh">this script</a> got it all set up. The procedure is now even simpler than shown in the forum post, because the script detects running instances of Dump1090 and knows not to interfere with them, so you are no longer required to be so careful with the options you provide.</p>

<p>The system architecture is therefore as follows:</p>


![Flight Tracker system diagram)](/hardware/flight-tracker/arch.png){: .center .noshadow}

<p>If you’d like to see what I’m currently tracking, my custom front-end is online at <a href="http://flightmap.ianrenton.com">http://flightmap.ianrenton.com</a>, and the software it runs is <a href="https://github.com/ianrenton/umid1090">on Github</a> under a Public Domain licence if you’d like your own copy.</p>
