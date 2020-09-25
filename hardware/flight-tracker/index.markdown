---
comments: true
layout: page
title: Flight Tracker
slug: flight-tracker
---

<p>I run a relatively simple home-made ADS-B aircraft tracker using and old Raspberry Pi, a cheap Software Defined Radio dongle, and some software. It’s installed in my shed, and provides <a href="http://flightmap.ianrenton.com">tracking of planes across the south of the UK</a>.</p>

![Raspberry Pi with HDR setup](/hardware/flight-tracker/hw.jpg){: .center}

<p>I found the easiest setup was to use <a href="https://flightaware.com/adsb/piaware/build">PiAware</a> from <a href="https://flightaware.com/">FlightAware</a>. (This asks for a Raspberry Pi 3, but works just fine on the original Model B that I used.) The PiAware link has a good guide to getting it all set up.</p>

<p>My SDR dongle is an R820T from <a href="https://www.rtl-sdr.com/">RTL-SDR.com</a>, and worked perfectly out of the box. I used the dipole antenna mount that came with it, and the two vertical antennas set to roughly 69mm long&mdash;quarter of the wavelength of ADS-B's 1090MHz signal. (You can see one antenna fitted in the photo above, adding the second antenna pointing downwards to make a dipole doubles the receive signal, an extra 3dB.)</p>

<p>Following the simple instructions from FlightAware gives you a device that will automatically upload tracking data to their website, and also provides a local web server (via the included <a href="https://www.satsignal.eu/raspberry-pi/dump1090.html">Dump1090</a> software) that shows what’s being tracked.</p>

![Dump1090 web interface (lol at some rich dude and his custom tail number)](/hardware/flight-tracker/sw1.png){: .center}

<p>This web interface is nice, but I wanted to go one further and add military symbology, airspace layers from <a href="https://www.openaip.net/">openAIP</a> on the map, and some tweaks to the information shown. Rather than getting dirty and recompiling a fork of Dump1090, I discovered that a simple JSON HTTP request underlies its own web interface’s data retrieval. I therefore chose to write my own web front-end, and use Dump1090’s JSON as a data source. (There are other “proper” ADS-B formats available from Dump1090 as well, but JSON is the most convenient to use from a web application.)</p>

![Military symbology and airspace layer in U.M.I.D. 1090)](/hardware/flight-tracker/sw2.png){: .center}

When setting this up, I did encounter a problem, which is that PiAware's lighttpd web server config has a problem with the `Access-Control-Allow-Origin` flag that it uses to enable cross-site script requests for the data. I fixed that in [this commit](https://github.com/ianrenton/dump1090/commit/c89e3b9e9e2c02c722ffab40a8c1d4fcb5b92652), which has since been merged into Dump 1090, but I don't believe that has been incorporated into the latest PiAware images yet. If you're recreating this build, you may need to look at my commit and make the same change for yourself in `/etc/lighttpd/conf-available/89-dump1090-fa.conf`. I also made [this change](https://github.com/ianrenton/dump1090/commit/8aa9dc8b8fd43d4755a8042423af2ab841f104bf) while I was there there to expose the JSON files in `/db/` to the outside world as well as just those in `/data/`, so U.M.I.D. can fetch tail number and airframe IDs. This kind of goes against how dump1090 expects to be used, so I haven't done a pull request for that&mdash;if you want tail number and airframe ID lookup to be accessible from outside the local web server, you will need to recreate that for yourself.

Since I wanted HTTPS support, I also got a certificate from [Let's Encrypt](https://letsencrypt.org/) to serve the same web root on port 443 as well&mdash;[instructions can be found here](https://www.itzgeek.com/how-tos/linux/how-to-configure-lets-encrypt-ssl-in-lighttpd-server.html).

![Track table in U.M.I.D. 1090)](/hardware/flight-tracker/sw3.jpg){: .center}

<p>As well as providing data to FlightAware, I also wanted to provide data to its "competitors" <a href="https://www.flightradar24.com/">FlightRadar24</a> and <a href="https://www.adsbexchange.com/">ADS-B Exchange</a>. The easiest way to do this was as I found in <a href="https://forum.flightradar24.com/forum/radar-forums/flightradar24-feeding-data-to-flightradar24/11792-beginner-feed-both-fr24-und-fa-with-raspberry-pi-3-model-b-flightaware-pro-stick">this forum post</a> – to stick with the PiAware base software, then add the additional software for FlightRadar24 and ADS-B Exchange on top. Downloading and running <a href="https://repo-feed.flightradar24.com/install_fr24_rpi.sh">this script</a> got FlightRadar24 all set up. The procedure is now even simpler than shown in the forum post, because the script detects running instances of Dump1090 and knows not to interfere with them, so you are no longer required to be so careful with the options you provide. Then, <a href="https://www.adsbexchange.com/how-to-feed/#scriptmethod">this script</a> got me set up with ADS-B Exchange.</p>

<p>The system architecture is as follows:</p>

![Flight Tracker system diagram)](/hardware/flight-tracker/arch.png){: .center .noshadow}

<p>If you’d like to see what I’m currently tracking, my custom front-end is online at <a href="https://flightmap.ianrenton.com">https://flightmap.ianrenton.com</a>, and the software it runs is <a href="https://github.com/ianrenton/umid1090">on Github</a> under a Public Domain licence if you’d like your own copy.</p>
