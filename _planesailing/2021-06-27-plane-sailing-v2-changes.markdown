---
comments: true
layout: post
title: 'Plane/Sailing v2 Changes'
slug: plane-sailing-v2-changes
date: 2021-06-27 18:32:00
---

This page lists the differences between version 1 and version 2 of Plane/Sailing. My intention is to keep the main build guide up-to-date with the latest state of the system, as this will be of most interest to readers, while maintaining pages like this one to explain what's changed for returning visitors.

## Software Changes

One of my original goals with Plane/Sailing (and the flight tracker before it) was to only spend time doing the "fun code", i.e. the flashy web-based stuff that people will actually see. I tried to avoid the need for any back-end code, by making existing open source software accessible via the web, and tying the web-based front end directly into those endpoints. In version 1 of the system therefore, I ran Dump1090 and AIS Dispatcher on Raspberry Pis, and the web interface directly queried Dump1090's JSON interface and called up a KML file written by AIS Dispatcher.

However there are some limitations with this approach:

1. In order to fully extract aircraft data from Dump1090, I had to make changes to its config files to expose more of its web server to the internet. It's open source so nothing is preventing me doing this, but it does mean if Dump1090 gets updated, there may be unexpected breakages.
2. AIS Dispatcher's "dump to KML" feature only exists in version 1.2, and even then isn't documented. The [latest version](https://www.aishub.net/ais-dispatcher) looks like a complete rewrite and doesn't have the feature we depend on, making the AIS solution dependent on deprecated software that could be discontinued at any time.
3. AIS Dispatcher's KML doesn't include any history, so when you first load the client, you can see Dump1090's stored history for aircraft tracks (via 120 separate HTTP requests!) but no history for ship movements.
4. Data comes into the web interface in two completely different forms, so lots of code and lots of processing time is used on the client-side to merge the data sets into a cohesive whole.
5. I wanted to add APRS data handling as well, and while solutions do exist for caching APRS data within software, these (such as APRS-ISCE32 and Xastir) are heavyweight GUI applications that have no APIs through which the data can be accessed.

Considering all these problems, it was time for me to write my own back-end server software.

The new Plane/Sailing Server makes its own TCP & UDP connections direct to data sources, which use lower-level data and are therefore much less likely to change in future software updates. The server provides its own JSON API to the client that includes all its data, managed and combined from all three sources, meaning that I could significantly streamline the client.

In version 2 of the client I have also ported across the Track Table display and some config options from [UMID1090](https://github.com/ianrenton/umid1090), improving the functionality of the user interface. (I couldn't do with just making back-end improvements and the user not noticing the difference!)


## Hardware Changes

Version 1 of Plane/Sailing was running on two original Raspberry Pi Model Bs, repurposed from previous projects to keep the cost down. However, they are showing their age, and simply processing ADS-B is enough to max out one of them, let alone adding any other processing. I also simplified the install process by using [FlightAware's pre-built PiAware image](https://uk.flightaware.com/adsb/piaware/) for one, and [SARCNET's AIS image](https://www.sarcnet.org/ais-receiver.html) for the other.

These have their own share of disadvantages:

1. The need for two separate Pis complicates the system architecture and leads to questions of "why would you design it this way?"&mdash;it was convenient to set up but not a good design choice.
2. The PiAware image ties into FlightAware's system quite tightly, to the extent that you can update the whole system from FlightAware's web interface, and they offer automated updates. If the Pi was just sending data to FlightAware I wouldn't worry so much but since it's doing other tasks too, I don't like the fact that FlightAware can remotely break stuff.
3. The SARCNET image isn't actively maintained, and while the software it runs is installed and configured relatively simply, I'm more nervous about updates breaking stuff than I would be if I installed the software myself.
4. The old ARMv7 architecture used by the Pis is difficult to support with modern versions of Java, which the new server software requires.

With these problems in mind I also chose this point to upgrade to a single new Raspberry Pi 4, which is more than capable of running all the software together, and starting from a base Raspberry Pi OS install so that I have complete control of the setup.