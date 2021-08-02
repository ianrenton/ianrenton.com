---
comments: true
layout: post
title: 'Raspberry Pi Setup'
slug: raspberry-pi
---

The first step to setting up Plane/Sailing was to configure the Raspberry Pi. With Plane/Sailing version 1, I used two separate Pis (one for ADS-B and one for AIS) using pre-built images from [FlightAware](https://uk.flightaware.com/adsb/piaware/) and [SARCNET](https://www.sarcnet.org/ais-receiver.html), but for version 2 I wanted to combine them into a single Raspberry Pi 4 Model B.

I chose to buy mine as a kit including case, power supply, and SD card, but if you're replicating the build you can of course buy these things separately.

The SD card came pre-installed with the NOOBS environment, which is great for first-time Pi users, but it doesn't offer the operating system flavour I wanted for this - Raspberry Pi OS Lite, which is a version that doesn't come preinstalled with any graphical environment. I don't intend on ever connecting a screen and keyboard&mdash;it will run headless and all interaction will be via SSH.

I began by using [Raspberry Pi OS Imager](https://www.raspberrypi.org/software/) from a separate machine. Once up and running, I chose the right operating system and flashed it to the MicroSD card. Then while the SD card was still in the host machine, I created a file named `ssh` in the first (boot) partition on the card. This is essential to make sure the Pi boots up with SSH enabled, otherwise there would be no way to remotely connect to it!

![Raspberry Pi OS Imager](/hardware/planesailing/rpi-imager.png){: .center .noshadow}
*Raspberry Pi OS Imager*

I use a wired connection to improve reliability for this project, so there was no need for WiFi settings. Once powered up and connected to my network router, I used it's config pages to set a fixed IP address for DHCP to assign to the Pi, and then to forward incoming ports 80 & 443 to that device so it can operate as an HTTP and HTTPS server accessible from the web.

Upon first logging into the Pi via SSH, it nags about a couple of things&mdash;the default password, which can be set using `passwd`, and the country to use for setting the WiFi bands available. I went through `raspi-config` to set that anyway so it would stop complaining, but since this is a wired-only install it's not strictly necessary.

One last thing to do is to ensure the DVB kernel drivers for the RTL chips are blacklisted. This ensures that the devices can be accessed directly via RTL-SDR libraries, rather than the kernel attaching its own drivers to them. To do so, create a new file at `/etc/modprobe.d/rtl-blacklist.conf` with the following contents:

```
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
```

Then reboot the Pi.

With the addition of a cheap USB hub, it's time to start attaching RTL-SDR dongles and installing software&mdash;see the [next page](/hardware/planesailing/adsb-receiver/)!

### Current Draw

Knowing that both the Raspberry Pi 4 and RTL-SDR dongles can be quite power hungry, I have added an in-line USB current meter to the build that will allow me to monitor and check that the current and voltage stay within bounds. With the Pi, three RTL-SDR dongles and a AIS pre-amp all powered from the same supply, Plane/Sailing reaches around 1.6A of current draw and voltage remains above 4.8V, so with my 3A power supply the system seems happy.

![USB tester](/hardware/planesailing/currentdraw.jpg){: .center}