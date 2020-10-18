---
comments: true
layout: post
title: Raspberry Pis & Processing Software
slug: raspberry-pis-and-processing-software
date: 2020-10-02 00:00:00
layout: post
---

![Plane Sailing Banner](/hardware/planesailing/banner4.png){: .center}

One of my goals for the Plane/Sailing project was to use old hardware that I had lying around as far as possible. Although the entire system could likely have run on a single modern version such as the Raspberry Pi 4, I instead opted to use two of the original Model B units that were spare. Both sit at just over 50% CPU utilisation according to `top`, so it was definitely a good decision to use two rather than trying to only use one of these lower-spec computers.

## ADS-B Processor

They say something about "standing on the shoulders of giants", and this project is no exception. Making an ADS-B receiver with a Raspberry Pi is not an uncommon project, and I found [FlightAware's](https://flightaware.com/) pre-configured ["PiAware"](https://flightaware.com/adsb/piaware/build) disk image to be the easiest way of getting started. Following the simple instructions from FlightAware gives you a device that will automatically upload tracking data to their website, and also provides a local web server (via the included [Dump1090](https://www.satsignal.eu/raspberry-pi/dump1090.html) software) that shows what’s being tracked.

Other community-sourced flight tracking websites exist of course, and they all seem to offer their own packages for the Raspberry Pi that take the data from *Dump1090* and send it to their own server. As discussed in [this forum thread](https://forum.flightradar24.com/forum/radar-forums/flightradar24-feeding-data-to-flightradar24/11792-beginner-feed-both-fr24-und-fa-with-raspberry-pi-3-model-b-flightaware-pro-stick), the general consensus seems to be that PiAware is the best starting point, and on top of that base you can also install [FlightRadar24's feeder](https://www.flightradar24.com/share-your-data), [ADS-B Exchange Feeder](https://www.adsbexchange.com/how-to-feed/#scriptmethod) and [OpenSky Feeder](https://opensky-network.org/community/projects/30-dump1090-feeder).

## AIS Processor

The same is true for the AIS side as well. While this isn't quite as common a project&mdash;not everyone lives close to the sea after all&mdash;there are folks out there who have done it and share their software configuration. [SARCNET's AIS Receiver page](https://www.sarcnet.org/ais-receiver.html) is a good resource here, and they also provide a Raspberry Pi image that works out of the box (although you have to email them and ask for the link). Their image comes with `rtl_ais` preconfigured to talk to an RTL-SDR dongle and output NMEA-0183 messages on a local port.

Feeding your data to online trackers is a little less sophisticated for AIS than for ADS-B; each provider simply gives you an IP address and port to which you send the raw NMEA messages. SARCNET's image pre-installs *AIS Dispatcher*, essentially a utility that reads UDP from one socket and sends it to a number of others. It comes preconfigured with the appropriate ports for [Vessel Finder](https://stations.vesselfinder.com/become-partner), [Pocket Mariner](http://pocketmariner.com/ais-ship-tracking/cover-your-area/) and [Ship Finder](https://shipfinder.co/about/coverage/), while registering an account on [Marine Traffic](https://www.marinetraffic.com/en/users/register/1/12) and [AIShub](http://www.aishub.net/join-us) gets you a unique port on each of their servers that you can also send data to.

![Two Raspberry Pis with SDR dongles attached](/hardware/planesailing/pis.jpg){: .center}
<center><em>Raspberry Pis with SDR dongles attached</em></center><br/>

## Back-end Data Store & Web Server

While I did want to write the [web front-end](../web-front-end/) for the project, as a development of [UMID1090](https://github.com/ianrenton/umid1090), I wanted if possible to avoid writing too much back-end code to support it. (i.e. I just wanna do the fun part.)

From reverse engineering *Dump1090*'s web interface on that previous project, I already knew that this is very easy to do. The main "live data" JSON API is easy to stream data from, as are the circular buffer of history files, and with a [small tweak to the pre-installed *lighttpd* configuration](https://github.com/ianrenton/dump1090/commit/8aa9dc8b8fd43d4755a8042423af2ab841f104bf), the database of tail numbers etc. is easily exposed as well.

I did think I would have to do a back-end processor for the AIS data, since there's no way for the NMEA-0183 UDP packets to be sent *out* directly to the user's web browser, but luckily there is a feature in AIS Repeater to dump out its current knowledge to a KML file, including maintaining historical data for a certain amount of time. I installed another copy of *lighttpd*, this time on the AIS processor PC, and configured AIS Repeater to dump its KML file in `/var/www/html`, from where it can be served. I edited `/etc/systemd/system/aisdispatcher.service` to the following (note the extra parameters on the "ExecStart" line):

```ini
[Unit]
Description=AIS Dispatcher service
After=network.target

[Service]
ExecStart=/usr/local/bin/aisdispatcher -u -g -h 127.0.0.1 -p 10110 -H 54.225.113.225:5322,109.200.19.151:4001 -X 10 -z no -S /var/www/html
WorkingDirectory=/home/pi
StandardOutput=inherit
StandardError=inherit
Restart=always
User=pi

[Install]
WantedBy=multi-user.target
```

No change was required to the *lighttpd* config.

## Common HTTPS Endpoint

This configuration gave me two Raspberry Pis, each running web servers accessibly on my local network. I wanted to expose them to the outside world, ideally via HTTPS on a single standard port (443). I first configured my home router to forward port 443 (and 80) to the ADS-B Processor, making *Dump1090* and its data accessible from the web. In order to make the KML file from the ADS-B Processor's web server, I set up a reverse proxy configuration on the ADS-B Processor side, following [these instructions for *lighttpd* v1.4](https://stackoverflow.com/a/19466700/58755), creating `/etc/lighttpd/conf-enabled/90-ais.conf` as follows:

```ApacheConf
server.modules += ( "mod_setenv" )

$HTTP["url"] =~ "(^/ais.*)" {
  proxy.server  = ( "" => ("" => ( "host" => "127.0.0.1", "port" => 81 )))
  setenv.set-response-header = ( "Access-Control-Allow-Origin" => "*" )
}

$SERVER["socket"] == ":81" {
  url.rewrite-once = ( "^/ais/(.*)$" => "/$1" )
  proxy.server  = ( "" => ( "" => ( "host" => "192.168.1.242", "port" => 80 )))
  setenv.set-response-header = ( "Access-Control-Allow-Origin" => "*" )
}
```

A dynamic DNS configuration finished the job. Accessing that server via HTTPS on port 443 now allows access to *Dump1090* data (`/dump1090-fa/data/receiver.json`) and *AIS Dispatcher* data (`/ais/aisDispatcherSnapshot.kml`). [On to the web interface!](../web-front-end/)