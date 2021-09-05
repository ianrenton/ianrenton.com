---
comments: true
layout: post
title: 'ADS-B Receiver Setup'
slug: adsb-receiver
---

They say something about "standing on the shoulders of giants", and this project is no exception. Making an ADS-B receiver with a Raspberry Pi is not an uncommon project, and there are plenty of resources out there to help set one up. In the original "version 1" of Plane/Sailing, I used [FlightAware's](https://flightaware.com/) pre-configured ["PiAware"](https://flightaware.com/adsb/piaware/build) disk image to be the easiest way of getting started. For version 2 I wanted complete control of my own OS installation, so I started from scratch with a base Raspberry Pi OS image, but even when not using the PiAware image, FlightAware's repositories are still the best way to get the right packages installed.

If you're replicating this build guide, now is the time to plug that first FlightAware Pro Stick or RTL-SDR v3 dongle into the Pi. Let's track some planes!

![Eurofighter Typhoon in Plane/Sailing](/hardware/planesailing/typhoon3.png){: .center}

### Dump1090

The core of most ADS-B receivers is the Dump1090 software, which decodes the raw data provided by the USB dongle, and provides that data in a variety of formats to other software. It also comes with its own "SkyAware" web server so&mdash;if all you're interested in is aircraft&mdash;it's really the only package required.

Various forks of Dump1090 exist in source code form on Github, but FlightAware go the extra mile and provide compiled versions for the Raspberry Pi's architecture, so by far the easiest approach to getting it up and running is to follow [their instructions](https://uk.flightaware.com/adsb/piaware/install):

```bash
wget https://uk.flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_5.0_all.deb
sudo dpkg -i piaware-repository_5.0_all.deb
sudo apt update
sudo apt install dump1090-fa
```

This will automatically run now and on subsequent restarts, so it should be up and running already! You can use a web browser to visit the SkyAware web interface using the Pi's IP address and port 8080.

### Checking Mode S Data

Plane/Sailing Server by default connects to Dump1090 on port 30002 to receive ADS-B Mode S data in hexadecimal encoding. By installing and running ncat, you can check this data is available:

```bash
sudo apt install ncat
ncat 127.0.0.1 30002
```

Your output should look like this:

![Terminal showing ADS-B Mode S data encoded as hexadecimal](/hardware/planesailing/adsb.png){: .center .noshadow}

### Sharing your Data

One of the most common use cases for receiving ADS-B data is to upload that data to websites that handle it and provide global aircraft tracking coverage. They each have their own installable package that will make that happen, once Dump1090 is up and running.

Since we are already using FlightAware's PiAware repository, we can just install piaware from there with `sudo apt install piaware`. If you're moving from a different machine like I was when moving from Plane/Sailing v1's Pi to the new one for v2, you will want to make sure your new Feeder ID matches the old one: `sudo piaware-config feeder-id <your-id>`.

Once you're set up and registered with FlightAware, it will give you a nice statistics page showing the range your receiver is achieving, along with its directionality, weekly and monthly history etc, plus e-mail alerts if your system goes offline.

![FlightAware Stats](/hardware/planesailing/flightaware-stats.png){: .center}
*FlightAware Stats*

Other community-sourced flight tracking websites offer offer their own packages for the Raspberry Pi that take the data from Dump1090 and send it to their own server. You can also install [FlightRadar24's feeder](https://www.flightradar24.com/share-your-data), [ADS-B Exchange Feeder](https://www.adsbexchange.com/how-to-feed/#scriptmethod) and [OpenSky Feeder](https://opensky-network.org/community/projects/30-dump1090-feeder) following the instructions at those links. They each ask you to download and run a script that will install essential utilities and then present a text-based interface for you to provide information such as the receiver position.

(When installing fr24feed, don't panic if it says "You don't seem to have any dump1090 installed"! It will properly detect it later in the setup process.)

### Disabling lighttpd

Dump1090 includes a dependency on the Lighttpd web browser, which it uses to provide access to its web page. This runs by default on port 80 and 8080, the former of which we want to use for Plane/Sailing, and the latter is the default port used by AIS Dispatcher. [Later in the build guide](/hardware/planesailing/plane-sailing-server) we will set up Nginx as the web server on the Raspberry Pi, because we want to use its easier HTTPS setup using Let's Encrypt's Certbot&mdash;a task that is nice and easy with Nginx but a pain with Lighttpd. If you're following this guide yourself, once you're happy that Dump1090 is set up properly, you will want to disable Lighttpd before continuing. You can do that with `sudo systemctl disable lighttpd`. Don't worry, the guide also covers configuring Nginx to serve the Dump1090 pages as well.