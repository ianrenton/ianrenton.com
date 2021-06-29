---
comments: true
layout: post
title: Bill of Materials
slug: bill-of-materials
---

The full Bill of Materials for the Plane/Sailing project is as follows. I have updated the costs as of July 2021.

| Part                              | Purchase Link        | Quantity  | Cost (GBP)/ea | Cost (GBP) |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
| Diamond X-50 Antenna              | [Nevada Radio][1]    | 1         | 59.95         | 59.95      |
| Pimoroni ADS-B Antenna            | [Pimoroni][2]        | 1         | 24.90         | 24.90      |
| Pimoroni 8m N-type to SMA Cable   | [Pimoroni][3]        | 2         | 10.50         | 21.00      |
| SMA Cable Splitter                | [Amazon][4]          | 1         | 7.49          | 7.49       |
| FlightAware Pro Stick Plus        | [Pimoroni][5]        | 1         | 19.92         | 19.92      |
| RTL-SDR v3 Dongle                 | [Technofix][6]       | 2         | 30.99         | 61.98      |
| Raspberry Pi 4 Model B 2GB Kit    | [The Pi Hut][7]      | 1         | 58.00         | 58.00      |
| USB Mini Hub                      | [The Pi Hut][8]      | 1         | 4.30          | 4.30       |
| Ethernet Cable                    | [Amazon][9]          | 1         | 4.37          | 4.37       |
|---------------------------------  |--------------------  |---------- |-------------- |----------- |
|                                   |                      |           | **TOTAL**     | **261.91** |

If you're recreating the build for yourself, you have some options:

1. I found the Raspberry Pi starter kit to be a convenient and cost-effective way of getting a Pi, case, power supply and SD card all in one package, but if you have some of those already lying around, you can of course break this line out and buy components individually.
2. A lot of the cost here is in SDR dongles, so for example if you were only interested in AIS and ADS-B, not APRS, you could save at least £30 by skipping one RTL-SDR and the cable splitter.

[1]: https://www.nevadaradio.co.uk/product/diamond-x-50/
[2]: https://shop.pimoroni.com/products/ads-b-1090-mhz-antenna-0-6m-5-5dbi
[3]: https://shop.pimoroni.com/products/type-n-male-to-sma-male-cable-for-ads-b-antenna?variant=31058670026835
[4]: https://www.amazon.co.uk/Bingfu-Antenna-Adapter-Splitter-Cellular/dp/B086JB79HT/
[5]: https://shop.pimoroni.com/products/pro-stick-plus-high-performance-usb-sdr-ads-b-receiver
[6]: https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3
[7]: https://thepihut.com/collections/raspberry-pi-kits-and-bundles/products/raspberry-pi-starter-kit
[8]: https://thepihut.com/products/usb-mini-hub-with-power-switch
[9]: https://www.amazon.co.uk/gp/product/B004WCURXM/
