---
comments: true
layout: post
title: Bill of Materials
collection: big-mouth-phatt-bass
---

The bill of materials for the Big Mouth Phatt Bass project is shown below.

I've provided links to the places I bought the parts from&mdash;these are not necessarily the best prices or the quickest delivery; you may prefer to get things cheaper on AliExpress where I defaulted to Amazon, or support your local hobby shops, etc. If you're thinking of swapping to different components, please read the footnotes.

| Component                                                                     | Quantity | Supplier                                                                                                                   | Cost (GBP) |
|-------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------|------------|
| Big Mouth Billy Bass 15th Anniversary Edition [^1]                            | 1        | [Amazon](https://www.amazon.co.uk/Funtime-Billy-Bass-Special-Anniversary/dp/B00OW8GLRM/)                                   | 30.90      |
| Custom PCB [^2] | 1        | [JLC PCB](https://jlcpcb.com/)                                                                                             | 3.31       |
| JZK ESP-32S Dev Board [^3]                                                    | 1        | [Amazon](https://www.amazon.co.uk/ESP-32S-Development-2-4GHz-Bluetooth-Antenna/dp/B071JR9WS9/)                             | 6.39       |
| MP3-TF-16P MP3 Player Board                                                   | 1        | [Amazon](https://www.amazon.co.uk/ANGEEK-Player-Module-Arduino-Source/dp/B07WWTQN58/)                                      | 6.99       |
| TB6612 DRV8833 Motor Driver Board                                             | 1        | [AliExpress](https://www.aliexpress.com/item/1005005756666126.html?spm=a2g0o.order_list.order_list_main.35.63dc1802klifim) | 1.19       |
| JST-XH Connector Female 2-pin                                                 | 2        | [Amazon](https://www.amazon.co.uk/Litorange-500PCS-Housing-Adapter-Connector/dp/B086W9HB3M)                                | 7.99       |
| JST-XH Connector Female 4-pin                                                 | 1        | (see above kit)                                                                                                            |            |
| JST-XH Connector Female 6-pin                                                 | 1        | (see above kit)                                                                                                            |            |



[^1]: The 15th Anniversary edition (sings "I Will Survive") definitely has JST-XH connectors, I believe the Alexa-enabled one may do as well. Older models are not necessarily connectorised internally, so you may have to terminate the wires yourself if using an older variant.
[^2]: [Gerber files can be downloaded here.](/projects/big-mouth-phatt-bass/phattbass-gerbers.zip) Drill files are included. All the default options were used during the ordering process, e.g. 1.6mm depth, 2-sided PCB. Minimum order quantity was 5 so I have some spares; if you're in the UK drop me an email and I will post you one for free.
[^3]: There are *lots* of different variants of ESP32 "Devkit" boards, with different numbers of pins and different layouts. The PCB design is based on the "JZK" board linked above, which may be the same as other 30-pin "DOIT" boards, but if you're ordering a different component, please check the pinout carefully.



