---
comments: true
layout: post
title: 'The Tracking Packet Format FAQ'
slug: tracking-packet-format-faq
---

Throughout the course of creating Plane/Sailing, I have learned a lot about the various packets and formats involved with tracking aircraft, ships and amateur radio users. This page is a Frequently Asked Questions list, but I'm not exactly a guru people come to for answers&mdash;really, this is a list of questions I've asked, and answers I've found, while developing the system. If you are creating a similar system for yourself, I hope this list helps to summarise and explain the key points of all these various packets and messages. Certainly if this page had existed when I started writing code, it would have been a whole lot quicker!

<div class="notes"><p>This page is a work in progress. Not all questions are currently answered!</p></div>

**Questions**
* TOC
{:toc}

### How can we Track Aircraft?

![The Red Arrows](/hardware/planesailing/redarrows.jpg){: .center}
*I can see five already, this shit is easy*

In the beginning (1950), there was radar. A typical air traffic control radar spins around, emitting radio-frequency waves. These bounce off a target and return to the radar installation. The known angle of the dish, combined with the measured time for the pulse to get back from the plane, gives a range and bearing to the aircraft. This is great for tracking aircraft in a horizontal plane, but rubbish at determining their altitude, and it has no way of identifying any particular plane.

As the skies got busier, the "secondary radar" concept was developed to help solve this problem. Along with the "primary" radar that simply bounces radio-frequency waves off a target, secondary radar triggers a transponder within the aircraft, which responds with not just a pulse but with data *encoded* in the pulse. The secondary radar installation emits a signal at 1030 MHz, and the transponders reply at 1090 MHz, with messages such as "Mode A", which encodes a squawk code identifier for the aircraft, and "Mode C", that encodes the altitude. Great! Air traffic controllers could now see altitude and identify individual planes.

The skies got busier again. With so many aircraft in the air, a new method was required where the radar installation could selectively (hence "S") query certain aircraft, rather than sending out a signal and have every aircraft reply at virtually the same time. Alongside this new capability, Mode S was designed to carry much more data (up to 112 whole bits!) for future capabilities.

Every aircraft in UK & EU airspace has a Mode S transponder, and it's the Mode S replies (that is, what the aircraft are sending back to the radar installation) that we receive and decode. So the aircraft aren't really talking *to* us, but we can hear what they are sending out.

![Spitfire ADS-B track](/hardware/planesailing/spitfire.png){: .center}
*Every aircraft. No exceptions.*

There's an excellent write-up of the history and implementation of these protocols [here](https://mode-s.org/decode/content/introduction.html), and some additional information about idents/squawk codes [here](https://www.skybrary.aero/index.php/Transponder).

### What's an Extended Squitter?

It's what happens the morning after you drink five pints and eat a vindaloo.

No, alright. Mode S was designed to send more data, and be more flexible, than Mode A & C before it. It has a concept called a "downlink format", which says what kind of message it is. Some of these are equivalents to the old formats, so DF4 provides altitude, and DF5 provides the squawk code.

DF17 and DF18 are what's known as "extended squitter" messages, which are like expansions to the Mode S format. Within DF17 and DF18 messages, a further identifier says what kind of data is encoded, so these extended squitter messages can be used to carry many different types of data alongside those specified by the main Mode S downlink formats.

There's a good table [here](https://www.radartutorial.eu/13.ssr/sr24.en.html).

![A lot of planes](/hardware/planesailing/snake.jpg){: .center}
*DF19 is a military extended squitter. We don't go there, it's a silly place.*

### What's ADS-B?

ADS-B is one of the main uses of those extended squitter Mode S messages. It takes the Mode S transponder system to the next level, allowing aircraft to transmit many types of data in their response, including latitude & longitude, heading, speed, the status of their autopilot, and much more. Since the introduction of ADS-B on most aircraft, it has been easy for hobbyists to buy a simple software defined radio and antenna, tune to 1090 MHz, and start decoding the position of aircraft&mdash;tracking. It's this data on which Plane/Sailing largely depends.

With so many aircraft in the air, easy line-of-sight, lots of data being transmitted *and* cheap hardware required to receive it, tracking planes has become a popular hobby for nerds.

![A lot of planes](/hardware/planesailing/lottaplanes.jpg){: .center}
*That's a lotta planes.*

### What's Multilateration (MLAT)?

Although all aircraft in UK & European airspace have Mode S transponders, not all are equipped with support for ADS-B, which is a specific set of messages within the Mode S framework. This means that some aircraft provide identifiers and an altitude, but never any more information than this, unless you happen to have a primary radar of your own. However, if you go onto a (largely amateur tracking) website like FlightAware and look up one of these aircraft, you'll see it has a position!

Websites such as FlightAware can provide position fixes for these aircraft using an approach called multilateration, or MLAT. This takes advantage of the fact that there are many receivers detecting and decoding Mode S information for any one aircraft. Provided these receivers have synchronised clocks, their time of packet reception can be measured very accurately, and used to determine the position of the aircraft via triangulation. Each individual receiver knows what time it received a message from the aircraft, and when the server puts that together with two or three others, factoring in the speed of light, the position can then be estimated.

In the description of Plane/Sailing I make a point to say that it uses *your own radios*, and isn't pulling publicly available tracking data from sites like FlightAware, Marine Traffic and aprs.fi. However, here's where the waters get muddied. Because that MLAT data is only calculated server-side, we actually *do* rely on FlightAware to provide this. This data is provided back to the client, in a ["synthetic extended squitter"](https://github.com/mutability/mlat-client/blob/master/mlat/client/synthetic_es.py) format, i.e. it looks just like "real" ADS-B position and velocity data received from the radio. This can then be ingested into Dump1090 and Plane/Sailing.

### What's Dump1090?

Dump1090 is a piece of software that decodes 1090 MHz signals from a software defined radio dongle, or other radio receiver, and provides that data out in a number of formats, described below. It's also capable of receiving MLAT data from a server as well, and provides a web-based interface by which the user can view all the aircraft it's tracking. Other applications are available for doing this job, but Dump1090&mdash;and the FlightAware version of it in particular&mdash;is by far the most common.

Its web interface uses JSON to fetch the data from the software itself. In version 1 of Plane/Sailing, our web interface queried that JSON directly, rather than using our own back-end server and other data formats as we do now.

### What are the Common Formats of Mode S Data?

So, we have established that Mode S uses 56-bit or 112-bit payloads, with a number of header bytes and a checksum. Great, how do we tap into that data coming out of Dump1090? Well the short answer is, we can't.

Dump1090 supports three different output formats which are de facto standards for sending Mode S/ADS-B data around a network, but none of them are quite the raw bytes.

Two are named after the [Mode S Beast](https://shop.jetvision.de/Mode-S-Beast/en) that pioneered them.

* The [Beast Binary format](https://wiki.jetvision.de/wiki/Mode-S_Beast:Data_Output_Formats) is what the vast majority of applications, including Plane/Sailing and feeders such as PiAware, use for their data. It consists of an `0x1a` escape character, a message type byte, a timestamp, a signal level byte, then the actual Mode A, C or S bytes themselves. The fact that it contains a timestamp is key to its use in multilateration, as it preserves the time the time at which the message was received. Dump1090 provides a TCP server on port 30005 for this data.
* The [Beast AVR format](https://wiki.jetvision.de/wiki/Mode-S_Beast:Data_Output_Formats) is the raw data bytes converted to hexadecimal. Each packet starts with an asterisk, then the hexadecimal bytes, finishing with a semicolon, carriage return and line feed. There's no additional information here like timestamps or signal levels. Dump1090 provides a TCP server on port 30002 for this data.
* The [SBS/BaseStation format](http://woodair.net/sbs/article/barebones42_socket_data.htm) is human-readable and looks similar to a CSV file or NMEA-0813. It's very easy to use, but unfortunately does not contain all the data that's available in the other formats. Signal strength is not included, and neither are aircraft categories. Dump1090 provides a TCP server on port 30003 for this data.

![Mode S Data Formats](/hardware/planesailing/adsbformats.png){: .center .noshadow}

Plane/Sailing supports all three formats, though Beast Binary is preferred.

### What are Feeders?

"Feeders" provide data from your radio receiver to websites that track aircraft, like FlightAware and FlightRadar24. They all (as far as I know) expect to receive data in Beast Binary format from software such as Dump1090, and they then provide that to their server. The server aggregates this information from all over the world, providing a global display of aircraft tracks. They also provide user-submitted content such as photographs of each plane.

![FlightRadar24 Screenshot](/hardware/planesailing/flightradar24.png){: .center}

Some of these servers do multilateration calculations for aircraft without ADS-B capabilities, and not only use the results for their own displays, but provide them back to the client as well. For example PiAware, which feeds FlightAware, provides its MLAT data in Beast Binary data back to Dump1090 on port 30104, and provides an additional server for this same data on 30105 that Plane/Sailing taps into.

### What Different Identifiers do Aircraft Have?

Aircraft have a number of different identifiers, which you may see in Plane/Sailing, Dump1090, FlightRadar24 and other software. They are:

* A *24-bit address* for the specific aircraft and is globally unique. You'll often see this formatted as a six-character hexadecimal value, like "4CAFDO". Each Mode S message contains this 24-bit code, so it's ideal for use as a unique ID. ICAO manages the system and grants each country a block of addresses that it can then assign to aircraft. In some countries, these are algorithmically related to the aircraft registration, but in others they're not.
* A *registration*, or *tail number*, which also identifies a specific aircraft and is globally unique. This is painted on the side of the aircraft and is usually five letters, like "G-JZHG". The prefix identifies the country of registration, e.g. "G" for Great Britain. It's not transmitted in any Mode S message. Some countries allow vanity tail numbers...

![Track of M-RBIG](/hardware/planesailing/mrbig.png){: .center}
*MRBIG: Sex & the City fan, insufferable dick, or both?*

* A *flight number*, or *callsign*, which is based on the operator and route. This will usually be globally unique at any given time, but an aircraft may change flight numbers, e.g. when it is sold or moved to a different route. It's usually letters followed by numbers, like "BA731". This is what air traffic control will use when talking to the aircraft. There is an ADS-B message that provides this information. If an aircraft belongs to a private individual it likely won't have an operator-based flight number, so the tail number will be used instead as the callsign.
* An *ident*, or *squawk code*, which is assigned by air traffic control and set by the pilot. It's a four-digit number like "7123", and can be changed for certain reasons, e.g. there are special squawk codes for emergency situations. At any given time, many aircraft will share the same squawk, though they should be unique within a single ATC's airspace. This is available from Mode A, Mode S and ADS-B messages.

### How can we Determine Tail Numbers, Aircraft Types, Operators etc?

You may recall from the previous section that tail numbers are not transmitted in ADS-B at all, and yet when look at an aicraft on Plane/Sailing or other websites you'll often see the tail number listed. Likewise, nothing in ADS-B indicates the type of an aircraft (beyond a broad size category) or the operator. So how do we determine these?

The answer is: databases.

The [OpenSky database](https://opensky-network.org/datasets/metadata/) and Dump1090's [internal JSON database](https://github.com/adsbxchange/dump1090-fa/tree/master/public_html/db) both contain a mapping of ICAO 24-bit addresses to tail numbers and aircraft types with a reasonable level of coverage, along with manufacturer, operator and owner information for a smaller subset.

Plane/Sailing uses a customised version of these databases, along with its own mapping of flight number prefixes to operators (e.g. "BAW" -> "British Airways") to provide more information than can be obtained from ADS-B alone.

### How can we Track Ships?

![A lot of ships](/hardware/planesailing/aistracks.jpg){: .center}
*Step 1, pick a sunny weekend and wait for the yachties to emerge.*

TODO

### What's rtl_ais?

TODO

### What AIS Data is Available?

TODO

### What's the Common Format for AIS Data?

TODO

### How can we distribute AIS Data?

TODO

### How can we Track Amateur Radio Users?

![My desk with computer and radio equipment](/hardware/planesailing/nerdstuff.jpg){: .center}
*Figure 12. The Domain of a Nerd*

### What's Direwolf?

TODO

### What are APRS and AX.25?

TODO

### What are Common Formats for APRS Data?

TODO

### What's an iGate?

TODO