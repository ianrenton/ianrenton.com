---
comments: true
layout: post
title: Bill of Materials
date: 2025-01-28 00:00:00
---

The bill of materials for the Billy Bass Sat Nav / Bluetooth Bass project is shown below.

I've provided links to the places I bought the parts from&mdash;these are not necessarily the best prices or the quickest delivery; you may prefer to get things from other online suppliers, or support your local hobby shops, etc. If you're thinking of swapping to different components, please read the footnotes.

| Component                                                                     | Quantity | Supplier                                                                                                                   | Cost (GBP) |
|-------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------|------------|
| Big Mouth Billy Bass 15th Anniversary Edition [^1]                            | 1        | [Amazon](https://www.amazon.co.uk/Funtime-Billy-Bass-Special-Anniversary/dp/B00OW8GLRM/)                                   | 30.90      |
| Custom PCB [^2] | 1        | [JLC PCB](https://jlcpcb.com/)                                                                                             | 2.00       |
| ESP-32 30P Devkit [^3]                                                        | 1        | [AliExpress](https://www.aliexpress.com/item/1005006246777139.html)                             | 3.15       |
| MAX98357A Audio Amplifier                                                     | 1        | [AliExpress](https://www.aliexpress.com/item/1005005383121121.html)                                      | 1.27       |
| TB6612 DRV8833 Motor Driver Board                                             | 1        | [AliExpress](https://www.aliexpress.com/item/1005005756666126.html) | 1.19       |
| JST-XH Connector Female 2-pin                                                 | 2        | [AliExpress](https://www.aliexpress.com/item/1005006498660940.html)                                | 2.05       |
| JST-XH Connector Female 4-pin                                                 | 1        | (see above kit)                                                                                                            |            |
| JST-XH Connector Female 6-pin                                                 | 1        | (see above kit)                                                                                                            |            |
| PCB Header Strip (Male)                                                       | 1        | [AliExpress](https://www.aliexpress.com/item/1005008081982484.html)                                                                                          | 0.52       |



[^1]: The 15th Anniversary edition (sings "I Will Survive") definitely has JST-XH connectors, I believe the Alexa-enabled one may do as well. Older models are not necessarily connectorised internally, so you may have to terminate the wires yourself if using an older variant.
[^2]: [Gerber files can be downloaded here.](/files/projects/bluetooth-bass/bluetooth-gerbers.zip) Drill files are included. All the default options were used during the ordering process, e.g. 1.6mm depth, 2-sided PCB. Minimum order quantity was 5 so I have some spares; if you're in the UK drop me an email and I will post you one for free.
[^3]: There are *lots* of different variants of ESP32 "Devkit" boards, with different numbers of pins and different layouts. The PCB design is based on the 30-pin board which is *one* of the options on the product page linked above. If you're in any doubt, make sure the board and its pinout looks *exactly* like [this one](/img/projects/bluetooth-bass/ESP32-DOIT-DEV-KIT-v1-pinout-mischianti.png), checking all the power connectors and pin numbers. (Original source: [Mischianti](https://mischianti.org/doit-esp32-dev-kit-v1-high-resolution-pinout-and-specs/)).
