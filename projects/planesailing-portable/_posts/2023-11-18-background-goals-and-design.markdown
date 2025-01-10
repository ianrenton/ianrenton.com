---
comments: true
layout: post
title: Background, Goals & Design
slug: background-goals-and-design
date: 2023-11-13 00:00:00
last_update: 2023-12-30T00:00:00+00:00
layout: post
---

As explained in my [initial blog post on the subject](/blog/a-new-project-plane-sailing-portable/), while Plane/Sailing works very well, its biggest limitation is where I live, and the lack of line-of-sight to the sea or any APRS digipeaters. The "portable" concept developed as a solution to that problem, and an exercise to see how small an extra feeder into the system could get.

## Goals

My requirements for the system were as follows:

1. Fit within a 100x40x40mm footprint
2. Be made entirely of commercial off-the-shelf parts (no PCB design!)
3. Be plug-and-play (little or no soldering involved)
4. Be configurable to receive ADS-B, AIS or APRS&mdash;one at a time
5. Have a fourth operating mode where it is usable as a generic network-connected SDR
6. Able to feed data to Plane/Sailing as well as common web-based trackers

In this first iteration of the system, I allowed myself to rely on there being power and WiFi available at the operating location&mdash;e.g. wall power socket, car cigarette lighter socket or handheld USB power bank, and household WiFi or phone hotspot. I also allowed that changing the function of the device between its four supported modes could be done via SSH. (See later for potential future developments removing these limitations.)

## Design

For the radio receiver, I chose the [RTL-SDR Blog v3](https://www.rtl-sdr.com/wp-content/uploads/2018/02/RTL-SDR-Blog-V3-Datasheet.pdf). There were a number of reasons for this, including familiarity with the device and it having the widest range of software support. It's what I use three of in the main Plane/Sailing system, so I knew for sure it would work.

The v4 was rejected as it was very new to market, and software compatibility could not be guaranteed. Cheaper DVB-based SDR dongles were rejected due to an expectation of poorer performance. The [CaribouLite](https://github.com/cariboulabs/cariboulite) would have been my first choice due to the pHAT form factor that would have made the unit much neater, but their issue tracker [did not fill me with confidence it would actually work](https://github.com/cariboulabs/cariboulite/issues/117).

For the computer itself, I chose the [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/), which has built-in WiFi.

To join the two neatly, I chose a [Zero4U USB hub](https://www.uugear.com/product/zero4u/) and a [back-to-back USB A connector](https://www.aliexpress.com/item/1005003238590718.html?spm=a2g0o.order_detail.order_detail_item.2.4ff9f19c6Eqea2). The Zero4U drove the choice of a Pi Zero W as opposed to a Pi Zero *2* W, as compatibility was not guaranteed due to a slight change in pin positions between the two versions.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle](/img/blog/2023/plane-sailing-portable-bits.jpg){: .center}
*Parts ready to be assembled*

A simple perspex "case" and some PCB spacers makes the build rigid, though far short of rugged, then an SD card and an SMA telescopic whip antenna (purchased [with the RTL-SDR from Technofix](https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3)) completes the hardware.

## Bill of Materials

The following parts were used to build the project in its current incarnation:

<div class="breakout-full-width">
<table>
  <thead>
    <tr>
      <th><strong>Part</strong></th>
      <th><strong>Supplier</strong></th>
      <th><strong>Cost / GBP</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Raspberry Pi Zero W</td>
      <td><a href="https://thepihut.com/products/raspberry-pi-zero-w">The Pi Hut</a></td>
      <td>15.00</td>
    </tr>
    <tr>
      <td>SD Card</td>
      <td>(from parts bin, but cheaply available e.g. <a href="https://www.amazon.co.uk/Kingston-microSD-SDCS2-Adapter-Included/dp/B07YGZ7JD5/ref=sr_1_3">Amazon</a>)</td>
      <td>N/A</td>
    </tr>
    <tr>
      <td>Zero4U USB Hub</td>
      <td><a href="https://thepihut.com/products/zero4u-4-port-usb-hub-for-raspberry-pi-zero">The Pi Hut</a></td>
      <td>9.90</td>
    </tr>
    <tr>
      <td>RTL-SDR v3</td>
      <td><a href="https://shop.technofix.uk/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3">Technofix</a></td>
      <td>37.99</td>
    </tr>
    <tr>
      <td>Telescopic whip antenna</td>
      <td>Technofix (addon to above product)</td>
      <td>3.99</td>
    </tr>
    <tr>
      <td>USB A back-to-back connector</td>
      <td><a href="https://www.aliexpress.com/item/1005003238590718.html">AliExpress</a></td>
      <td>4.01</td>
    </tr>
    <tr>
      <td>Raspberry Pi Zero W perspex case</td>
      <td><a href="https://www.ebay.co.uk/itm/256280694812">eBay</a></td>
      <td>2.68</td>
    </tr>
    <tr>
      <td>2.5mm PCB spacers</td>
      <td>(from parts bin, but cheaply available e.g. <a href="https://www.amazon.co.uk/Knpwer-Standoff-Assortment-Threaded-Motherboard/dp/B09YLWJPD7/ref=sr_1_9">Amazon</a>)</td>
      <td>N/A</td>
    </tr>
    <tr>
      <td><strong>TOTAL</strong></td>
      <td>&nbsp;</td>
      <td><strong>73.57</strong></td>
    </tr>
  </tbody>
  </table>
</div>
