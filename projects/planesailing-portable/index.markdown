---
comments: true
layout: page
title: Plane/Sailing Portable
slug: plainsailing-portable
---

"Plane/Sailing Portable" is a tiny hardware stack designed to be installed in ad-hoc locations, fitted to a vehicle or even carried in a pocket, from where it can contribute ADS-B, AIS or APRS coverage to the [Plane/Sailing](https://ianrenton.com/hardware/planesailing/) tracking system.

## Background

As explained in my [initial blog post on the subject](/blog/a-new-project-plane-sailing-portable/), while Plane/Sailing works very well, its biggest limitation is where I live, and the lack of line-of-sight to the sea or any APRS digipeaters. The "portable" concept developed as a solution to that problem, and an exercise to see how small an extra feeder into the system could get.

## Goals

As well as being simply as small as possible, I had a few other goals for the system:

1. Be made entirely of commercial off-the-shelf parts (no PCB design!)
2. Be plug-and-play (little or no soldering involved)
3. Be configurable to receive ADS-B, AIS or APRS&mdash;one at a time
4. Have a fourth operating mode where it is usable as a generic network-connected SDR (e.g. using [SpyServer](https://www.rtl-sdr.com/rtl-sdr-tutorial-setting-up-and-using-the-spyserver-remote-streaming-server-with-an-rtl-sdr/))
5. Able to feed data to Plane/Sailing as well as common web-based trackers

In the first iteration of the system, I allowed myself to rely on there being power and WiFi available at the operating location&mdash;e.g. wall power socket, car cigarette lighter socket or handheld USB power bank, and household WiFi or phone hotspot. I also allowed that changing the function of the device between its four supported modes could be done via SSH. (See later for potential future developments removing these limitations.)

## Design

For the radio receiver, I chose the [RTL-SDR Blog v3](https://www.rtl-sdr.com/wp-content/uploads/2018/02/RTL-SDR-Blog-V3-Datasheet.pdf). There were a number of reasons for this, including familiarity with the device and it having the widest range of software support. It's what I use three of in the main Plane/Sailing system, so I knew for sure it would work.

The v4 was rejected as it was very new to market, and software compatibility could not be guaranteed. Cheaper DVB-based SDR dongles were rejected due to an expectation of poorer performance. The [CaribouLite](https://github.com/cariboulabs/cariboulite) would have been my first choice due to the pHAT form factor that would have made the unit much neater, but their issue tracker [did not fill me with confidence it would actually work](https://github.com/cariboulabs/cariboulite/issues/117).

For the computer itself, I chose the [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/), which has built-in WiFi.

To join the two neatly, I chose a [Zero4U USB hub](https://www.uugear.com/product/zero4u/) and a [back-to-back USB A connector](https://www.aliexpress.com/item/1005003238590718.html?spm=a2g0o.order_detail.order_detail_item.2.4ff9f19c6Eqea2). The Zero4U drove the choice of a Pi Zero W as opposed to a Pi Zero *2* W, as compatibility was not guaranteed due to a slight change in pin positions between the two versions.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle](/blog/2023/plane-sailing-portable-bits.jpg){: .center}

A simple perspex "case" and some PCB spacers makes the build rigid, though far short of rugged, then an SD card and an SMA telescopic whip antenna (purchased [with the RTL-SDR from Technofix](https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3)) completes the hardware.

## Build

TO DO

## Software Setup

### Raspberry Pi OS & basics

[Raspberry Pi OS Imager](https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/) was used to create the SD card, using what at time of writing is called "Raspberry Pi OS (Legacy) Lite". This is the Debian Bullseye 32-bit version, the only one currently compatible with the Pi Zero, and the "lite" version so as not to include a desktop environment.

The tool now offers a way to customise things like the WiFi credentials and enable SSH right from the GUI, which is nice:

![Screenshot of the Raspberry Pi OS Imager showing customisation settings](/projects/planesailing-portable/pi-imager-customisation.png){: .center}

Setting up the WiFi once for my home network is fine, but what about when moving to a new location? Luckily, there is a way around this&mdash;though not an ideal one, as it involves editing a file on the SD card every time. By creating a file at `/boot/wpa_supplicant.conf` on the Pi, we can get it to copy the settings in it to its internal config on startup. (When the SD card is accessed from a Windows PC, `/boot` is the only visible partition, so it's just dropping a `wpa_supplicant.conf` file in there.)

Unfortunately the Pi deletes the source file when it internalises it, so it can't be simply updated next time. I therefore created a `wpa_supplicant_template.conf` file to use later, with the following contents:

```
country=gb
update_config=1
ctrl_interface=/var/run/wpa_supplicant
network={   
   scan_ssid=1
   ssid="XXX"  
   psk="XXX"
}
network={   
   scan_ssid=1
   ssid="XXX"  
   psk="XXX"
}
```

(Where "XXX" are real credentials for networks I will connect the device to.) Any time I want to move the device to a new network, I can put the SD card in a computer, edit the file to include a new `network` block, then copy that file to `wpa_supplicant.conf`, put the SD card back in the Pi and power on.

In future I aim to try [this script](https://raspberryconnect.com/projects/65-raspberrypi-hotspot-accesspoints/183-raspberry-pi-automatic-hotspot-and-static-hotspot-installer) which should set the Pi up as a WiFi access point if it can't find any of its preconfigured networks. This will allow adding new network credentials without needing an SD card reader.

### RTL-SDR

TO DO

### Dump1090

TO DO

### AIS-Catcher

TO DO

### Direwolf

TO DO

### SpyServer

TO DO

### Service Management Scripts

TO DO

## Performance

TO DO

## Integration with Plane/Sailing

TO DO

## Future Enhancements

A number of future enhancements are being considered for the project to overcome its current limitations.

### 4G & GPS

To overcome the system's current reliance on household WiFi or phone tethering, a [4G HAT](https://thepihut.com/products/4g-phat-for-raspberry-pi-lte-cat-4-3g-2g-with-gnss-positioning) could be added. This relies on PoGo pins underneath the Pi Zero rather than being a true "HAT", which means it would have to take the place of the USB hub. Luckily, the 4G HAT identified does have an end-mounted USB A socket, so it's an easy replacement!

The addition of a 4G radio would allow Plane/Sailing Portable to talk directly to the Plane/Sailing server and the wider internet without depending on WiFi. As the board also has a GPS receiver, this also enables other features such as being able to use MLAT for Mode-S signals, and reporting its own position to Plane/Sailing, APRS.fi etc.

However, this device is expensive and comes with the ongoing expense of needing a SIM card and data contract&mdash;a consideration for the future if I build more of these systems and use them in more interesting places.

This board also requires separate antennas for the GPS and LTE radios, with fragile U.FL connectors on the PCB. To improve ruggedness I would want to encapsulate this all inside a box and have three SMA connectors on the outside, and at this point it is stretching the definition of "as small as possible".

### Battery Power

Another desirable upgrade would be to remove the reliance on USB power, and provide an internal battery that would also be chargeable through the system.

There are a number of neat options such as [this UPS HAT](https://thepihut.com/products/uninterruptible-power-supply-ups-hat-for-raspberry-pi-zero), but unfortunately it too uses PoGo pins to connect to the underside of the Pi Zero. The USB hub (or 4G/GPS HAT if upgraded) is already in this position, so unfortunately this is a non-starter.

Although not as neat in terms of battery placement, and not having a built-in switch, the [PiJuice Zero](https://uk.pi-supply.com/products/pijuice-zero) may be a better option as it mounts to the top of the Pi Zero using header pins instead.

### Screen and Buttons

The final concession to simplicity made at design time was that the mode could be changed between ADS-B, AIS, APRS and SpyServer by logging in via SSH and running a script. SSH&mdash;or seeing the results on the Plane/Sailing interface&mdash;is also the only way to know if it's working.

An additional board providing a small screen and a few buttons, such as this [1.3" OLED display HAT](https://thepihut.com/products/1-3inch-oled-display-hat-for-raspberry-pi-128x64) could provide information on the unit's function as well as the ability to change it, and perhaps even to log into a WiFi network, via the buttons.

This again does increase the size of the system, going against the "as small as possible" idea, but the size increase is modest and the functional improvement significant.