---
comments: true
layout: post
title: Bill of Materials
slug: bill-of-materials
last_update: 2021-08-14T00:00:00+00:00
---

The Bill of Materials for the Plane/Sailing project is shown on this page. I have updated the costs as of July 2021.

For the basic build:

| Part                              | Purchase Link        | Quantity  | Cost (GBP)/ea | Cost (GBP) |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
| Diamond X-50 Antenna              | [Nevada Radio][1]    | 1         | 59.95         | 59.95      |
| Pimoroni ADS-B Antenna            | [Pimoroni][2]        | 1         | 24.90         | 24.90      |
| Pimoroni 8m N-type to SMA Cable   | [Pimoroni][3]        | 2         | 10.50         | 21.00      |
| SMA Cable Splitter                | [Amazon][4]          | 1         | 7.49          | 7.49       |
| FlightAware Pro Stick Plus        | [Pimoroni][5]        | 1         | 19.92         | 19.92      |
| RTL-SDR v3 Dongle                 | [Technofix][6]       | 2         | 30.99         | 61.98      |
| Raspberry Pi 4 Model B 2GB        | [The Pi Hut][7]      | 1         | 33.90         | 33.90      |
| Raspberry Pi 4 Power Supply       | [The Pi Hut][10]     | 1         | 7.50          | 7.50       |
| MicroSD Card                      | [Amazon][11]         | 1         | 5.69          | 5.69       |
| USB Mini Hub                      | [The Pi Hut][8]      | 1         | 4.30          | 4.30       |
| Ethernet Cable                    | [Amazon][9]          | 1         | 4.37          | 4.37       |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
|                                   |                      |           | **TOTAL**     | **251.00** |

If you're recreating the build for yourself, you have some options:

1. A lot of the cost here is in SDR dongles, so for example if you were only interested in AIS and ADS-B, not APRS, you could save at least £30 by skipping one RTL-SDR and the cable splitter.
2. The antennas aren't cheap either, if you're not sure how much you want to invest in the project you can get an RTL-SDR kit that comes with its own telescopic antennas. That might be enough for some decent aircraft tracking performance so long as you can get it high up and ideally without a roof in the way.
3. I use Ethernet to connect the Pi to my home network. If you prefer you could use a USB WiFi dongle, or the WiFi connectivity that is built into the RPi 4.

For the electronics enclosure, to take it from a messy desk setup to a nice self-contained unit:

| Part                              | Purchase Link        | Quantity  | Cost (GBP)/ea | Cost (GBP) |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
| 50mm high Eurocard Enclosure      | [CPC][21]            | 1         | 22.50         | 22.50      |
| USB C Panel Mount Connector       | [Amazon][22]         | 1         | 14.48         | 14.48      |
| RJ45 Panel Mount Connector        | [Amazon][23]         | 1         | 5.83          | 5.83       |
| Raspberry Pi 4 Heat Sink Case     | [Amazon][24]         | 1         | 12.99         | 12.99      |
| USB C Right-Angle Adapter         | [Amazon][25]         | 1         | 6.99          | 6.99       |
| Ethernet Cable                    | [Amazon][26]         | 1         | 2.99          | 2.99       |
| Cable Ties & Adhesive Mounts      | [Amazon][27]         | 1         | 5.99          | 5.99       |
| Thermal Adhesive Tape             | [Amazon][28]         | 1         | 10.99         | 10.99      |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
|                                   |                      |           | **TOTAL**     | **82.76**  |

Again if you are recreating this, you have plenty of cost saving options:

1. As discussed in on the [electronics enclosure page](/projects/planesailing/electronics-enclosure), the chosen enclosure is not that big and very fiddly due to the lack of a removable lid. You may want to investigate different enclosure options and find one that works better for you.
2. If you're not using wired ethernet you can skip the RJ45 panel mount connector and cable. WiFi may be bad inside the metal box, but you can use the spare USB-A socket on the USB panel mount connector to bring a WiFi dongle to the outside of the box.
3. The cable ties and thermal tape are massive quantities compared to what's needed, but they are the most cost-effective ways I found to buy them. If you're in the UK I will happily post you some as I now have a lifetime's supply!


[1]: https://www.nevadaradio.co.uk/product/diamond-x-50/
[2]: https://shop.pimoroni.com/products/ads-b-1090-mhz-antenna-0-6m-5-5dbi
[3]: https://shop.pimoroni.com/products/type-n-male-to-sma-male-cable-for-ads-b-antenna?variant=31058670026835
[4]: https://www.amazon.co.uk/Bingfu-Antenna-Adapter-Splitter-Cellular/dp/B086JB79HT/
[5]: https://shop.pimoroni.com/products/pro-stick-plus-high-performance-usb-sdr-ads-b-receiver
[6]: https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3
[7]: https://thepihut.com/collections/raspberry-pi/products/raspberry-pi-4-model-b?variant=20064052674622
[8]: https://thepihut.com/products/usb-mini-hub-with-power-switch
[9]: https://www.amazon.co.uk/gp/product/B004WCURXM/
[10]: https://thepihut.com/collections/raspberry-pi-power-supplies/products/raspberry-pi-psu-uk
[11]: https://www.amazon.co.uk/Kingston-microSD-SDCS2-Adapter-Included/dp/B07YGZQ4H8/ref=sr_1_9?dchild=1&keywords=microsd&qid=1627920412&sr=8-9

[21]: https://cpc.farnell.com/hammond/1455t2202bk/extruded-enclosure-black/dp/EN84361?ost=1455t2202bk
[22]: https://www.amazon.co.uk/Duttek-USB2-0-Female-Extension-Motorcycle/dp/B08LVRMY7K/
[23]: https://www.amazon.co.uk/luosh-Connector-Ethernet-Extension-Interface/dp/B08GYGHYFC/
[24]: https://www.amazon.co.uk/Geekworm-Raspberry-Enclosure-Dissipation-fan-Black/dp/B07VD5L1VY/
[25]: https://www.amazon.co.uk/Adapter-Cellularize-Degree-Extension-Nintendo/dp/B07M75JXS1/
[26]: https://www.amazon.co.uk/C2G-Booted-Unshielded-Network-Patch-Black/dp/B00H7CPXEW/
[27]: https://www.amazon.co.uk/Adhesive-Self-Locking-Mounting-Organizer-Management/dp/B08Q31X748/
[28]: https://www.amazon.co.uk/GCCL-Thermal-Adhesive-Compound-Conductive/dp/B08H7QFN4J/
