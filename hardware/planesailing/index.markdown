---
comments: true
layout: page
title: Plane✈/Sailing⛵
slug: plainsailing
---

![Plane Sailing Banner](/hardware/planesailing/banner.png){: .center}

"Plane/Sailing" is the name given to my home aircraft and ship tracker. It receives ADS-B and AIS signals via antennas on my house, processes them to share with popular tracking websites, and displays the combined results on a website for the world to see.

If you’d like to see what I’m currently tracking, check out [https://planesailing.ianrenton.com](https://planesailing.ianrenton.com)!

## Build Guide

The links below are to the design & build information in case you are interested or would like to build a similar setup for yourself! All the software is open source, and all the hardware chosen to be as inexpensive as possible.

1. [System Architecture](./system-architecture/)
2. [Antenna & Receiver Choices](./antenna-and-receiver/)
3. [Raspberry Pis & Processing Software](./raspberry-pis-and-processing-software/)
4. [Web Front-End](./web-front-end/)
5. [Bill of Materials](./bill-of-materials/)

You may also want to check out this project's predecessor, [my first flight tracker](/hardware/flight-tracker).

## Future Plans

1. [APRS Integration](./aprs-integration)
2. Address some design weaknesses, principally the following points, by writing my own back-end server.
    * There is no consistency between data types currently - ADS-B data is fetched using JSON and AIS using KML, all tied into the out-of-the-box functionality of Dump1090 and AIS Dispatcher
    * It is very dependent on things that may change, e.g. an automatic update of Dump1090 may revert my web server config, and the next version of AIS Dispatcher is known to be removing the KML functionality
    * The web server reverse proxy setup is ugly.

## Featured On...

* [Hack a Day](https://hackaday.com/2020/10/22/tracking-boats-and-ships-in-real-time-at-the-same-time/)
* [RTL-SDR Blog](https://www.rtl-sdr.com/a-dual-aircraft-and-ship-tracking-system-with-rtl-sdr/)

## Tracking Statistics

* [FlightAware](https://flightaware.com/adsb/stats/user/ianrenton)
* [FlightRadar24](https://www.flightradar24.com/account/feed-stats/?id=28217)
* [ADS-B Exchange](https://www.adsbexchange.com/api/feeders/?feed=KqbIWnVGingH9fAz8OSyA5%2BkYcu323JazTh2ryTo8EMRbvcXfO3KWgb9%2FyjGvkxt)
* [Marine Traffic](https://www.marinetraffic.com/en/ais/details/stations/4601/_:c84491eef3bdfac87efda338636c1d20)
* [Vessel Finder](https://stations.vesselfinder.com/stations/5528)

## Similar Projects

* [How To: Display Aircraft and Ships (in Xastir)](https://xastir.org/index.php/HowTo:Display_Aircraft_and_Ships)
