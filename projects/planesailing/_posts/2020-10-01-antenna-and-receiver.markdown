---
comments: true
layout: post
title: Antenna & Receiver Choices
slug: antenna-and-receiver
date: 2020-10-01 00:00:00
last_update: 2021-08-14T00:00:00+00:00
layout: post
---

If you've seen [my first flight tracker](/projects/flight-tracker), you will probably have noticed that it uses a stock RTL-SDR v3 tuner, and the basic extendable dipole antenna that comes in the RTL-SDR kit. In converting that project to become "Plane Sailing", I decided to improve the antenna and receiver hardware for ADS-B tracking. Of course, I had to add a second antenna for the AIS and APRS tracking part of the project, since the two technologies use different frequencies and therefore benefit from different antenna lengths.

![Antenna setup](/img/projects/planesailing/antennas-labelled.jpg){: .center}
*Antennas on my roof*

## ADS-B Antenna & Receiver

For the ADS-B side, I did my shopping from [Pimoroni](https://www.pimoroni.com)&mdash;buying their [0.6m 5.5dBi ADS-B antenna](https://shop.pimoroni.com/products/ads-b-1090-mhz-antenna-0-6m-5-5dbi), along with a [FlightAware Pro Stick Plus](https://shop.pimoroni.com/products/pro-stick-plus-high-performance-usb-sdr-ads-b-receiver) that improves on the basic RTL-SDR by adding a 1090 MHz filter and pre-amp.

The antenna altitude is also around 1m higher than the old antenna in the shed.

Although I didn't get the chance to test the new antenna and the change of height independently, between them they added an estimated 6dB of gain based on the reported signal levels reported by Dump1090. The number of messages per second, while not an exact science, jumped from around 100 to around 500. The Pro Stick Plus added another 20% or so messages per second on top of that, [putting me just inside the top 10,000](https://flightaware.com/adsb/stats/user/ianrenton) on FlightAware's leaderboard, and occasionally picking up aircraft over 200 miles away.

## AIS Antenna & Receiver

The AIS performance of my setup is much less impressive, for the simple reason that I don't have line of sight to the sea&mdash;to achieve that I would need an approximately 65-foot antenna pole, and none of my neighbours would ever speak to me again.

![Terrain altitude map](/img/projects/planesailing/terrain.png){: .center}
*Figure 2. The Problem.*

However, I thought I'd give it a try anyway. I used a [Diamond X-50 antenna](https://www.nevadaradio.co.uk/product/diamond-x-50/), which has internal elements tuned for both the 2m and 70cm bands and thus can be used for general hamming when not in use as an AIS tracker. I re-used the stock RTL-SDR tuner to receive the AIS signals.

Performance is, to be honest, poor&mdash;but I wasn't expecting great things. I have tried adding a [Uputronics AIS filtered pre-amp](https://store.uputronics.com/index.php?route=product/product&product_id=93) to the receiver but any increase in performance has been modest at best&mdash;there really is no cheating the laws of physics. When building the electronics enclosure for the project, I chose not to include this. With or without it, I regularly get some packets off 4-5 ships on a bad day, up to 20-30 on a nice summer day, so it's good enough for me.

## APRS Receiver

The APRS receiver uses the same antenna as AIS, split using a simple SMA cable splitter. Not being particularly high up also restricts the amount of APRS signals I can see, along with it not being a hugely popular protocol, so APRS reception remains very limited.
