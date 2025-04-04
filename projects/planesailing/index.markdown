---
comments: true
layout: page
title: Plane✈/Sailing⛵
slug: plainsailing
redirect_from:
  - /hardware/planesailing
  - /hardware/planesailing/
---

"Plane/Sailing" is the name given to my home tracker system. It originally supported tracking of aircraft and ships, before expanding to include mobile amateur radio stations, radiosondes, and Meshtastic nodes. It receives ADS-B, AIS, APRS, Radiosonde and LoRA signals via antennas on my house, processes them to share with popular tracking websites, and displays the combined results on a website for the world to see.

If you’d like to see what I’m currently tracking, check out [https://planesailing.ianrenton.com](https://planesailing.ianrenton.com)!

![Plane Sailing Banner](/img/projects/planesailing/banner7.png){: .center}

## Build Guide

The links below are to the design & build information in case you are interested or would like to build a similar setup for yourself! All the software is open source, and all the hardware chosen to be as inexpensive as possible.

### Original Project

1. [System Architecture](./system-architecture/)
2. [Antenna & Receiver Choices](./antenna-and-receiver/)
3. [Raspberry Pi Setup](./raspberry-pi/)
4. [ADS-B Receiver Setup](./adsb-receiver/)
5. [AIS Receiver Setup](./ais-receiver/)
6. [APRS Receiver Setup](./aprs-receiver/)
7. [Plane/Sailing Server Setup](./plane-sailing-server/)
8. [Electronics Enclosure](./electronics-enclosure/)
9. [Bill of Materials](./bill-of-materials/)

### Later Updates

1. [Plane/Sailing v2 Changes](./plane-sailing-v2-changes)
2. [Adding Radiosonde Support](./adding-radiosonde-support/)
3. [Adding Meshtastic Support](./adding-meshtastic-support/)
4. [2024 Hardware Stack](./plane-sailing-2024-hardware/)
5. [Plane/Sailing v4 Changes](./plane-sailing-v4-changes)

### Miscellaneous

1. [The Tracking Packet Format FAQ](./tracking-packet-format-faq)
2. [Plane/Sailing Does the Bournemouth Air Festival!](/blog/plane-sailing-does-the-bournemouth-air-festival/)

## Featured On...

* [Hack a Day](https://hackaday.com/2020/10/22/tracking-boats-and-ships-in-real-time-at-the-same-time/)
* [RTL-SDR Blog](https://www.rtl-sdr.com/a-dual-aircraft-and-ship-tracking-system-with-rtl-sdr/)

## Tracking Statistics

* [FlightAware](https://flightaware.com/adsb/stats/user/ianrenton)
* [FlightRadar24](https://www.flightradar24.com/account/feed-stats/?id=28217)
* [ADS-B Exchange](https://www.adsbexchange.com/api/feeders/?feed=aeb9add2-e933-408b-82ee-36e5f41edeb8)
* [Marine Traffic](https://www.marinetraffic.com/en/ais/details/stations/4601/_:c84491eef3bdfac87efda338636c1d20)
* [Vessel Finder](https://stations.vesselfinder.com/stations/5528)

## Similar Projects

* [How To: Display Aircraft and Ships (in Xastir)](https://xastir.org/index.php/HowTo:Display_Aircraft_and_Ships)
* [SARCNET AIS Receiver](https://www.sarcnet.org/ais-receiver.html)
* [KB9IQX AIS Receiver](http://kb9iqx.net/rtlsdr/ais/)

You may also want to check out this project's predecessor, [my first flight tracker](/projects/flight-tracker).
