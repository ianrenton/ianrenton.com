---
comments: true
layout: post
title: 'ARPS Receiver Setup'
slug: aprs-receiver
---

With the project initially being to extend my older ADS-B aircraft tracker into a combined tracker for AIS-equipped ships as well, the next step was to additionally support tracking of land-based contacts using APRS. The screenshot below shows the level of tracking that should be achievable, but that was on a good day&mdash;APRS reception at my location seems quite intermittent, and the slow rate of packet reception some days means that integration into Plane/Sailing is a slow process.

![APRS data displayed on a PC](/hardware/planesailing/aprs.png){: .center}
*APRS data on a PC, using SDR#, Direwolf and APRSISCE32*

While APRS is roughly in the same VHF band as AIS, and so can use the same antenna without too much trouble, they are sadly too far apart to use the same RTL-SDR. Therefore, a third one is needed to complete the set.

![Three RTL-SDR dongles in a USB hub](/hardware/planesailing/threedongles.jpg){: .center}
*Three RTL-SDR dongles in the Plane/Sailing system*

### Deconflicting Dongles... Again

Naturally, [just like last time](../ais-receiver/), Linux decided that the dongles now belonged in yet another different order, necessitating a change to the config files that start up the software and reference each RTL-SDR by a numeric index, not a serial number. That said, the serial numbers of the two "official" RTL-SDR Blog devices are actually the same anyway:

![rtl_test results](/hardware/planesailing/threedongles-rtltest.png){: .center .noshadow}

(The `rtl_test` command used above and `rtl_eeprom` used below are part of the `rtl_sdr` package, which you can install using `apt` in the normal way. Oddly it's not actually a dependency of anything used so far in the build guide!)

I decided at this point that I had enough of not really knowing which device was which, so I used the `rtl_eeprom` package to set the serial numbers of the devices to something actually useful. To allow the program access to the devices, the services that use them must first be stopped.

```bash
sudo systemctl stop dump1090-fa
sudo systemctl stop rtl_ais
sudo rtl_eeprom -d 0 -s AIS
```

The `rtl_eeprom` command requires manual confirmation, then unplugging and replugging the device. We complete the set with:

```bash
sudo rtl_eeprom -d 1 -s APRS
sudo rtl_eeprom -d 2 -s ADSB
```

And now we can see clearly which device is which, and spot any potential reordering after reboot more easily.

![rtl_test results after setting serial numbers](/hardware/planesailing/threedongles-rtltest2.png){: .center .noshadow}

In previous pages we set `rtl_ais` to use device 0, and Dump1090 to use device 1&mdash;that now needed a change to use device 2 in `/etc/default/dump1090-fa`. Both services can then be restarted:

```bash
sudo systemctl start dump1090-fa
sudo systemctl start rtl_ais
```

### rtl_fm and Direwolf

Now that the dongle with index 1 has been properly allocated for use with APRS, and nothing else is going to try and claim it, we now need to set up software to demodulate audio from the APRS frequency, and decode it to packets that Plane/Sailing can understand. The easiest way to do this is to use `rtl_fm` to demodulate the audio, and using simple UNIX sockets, pipe it into the [Direwolf](https://github.com/wb2osz/direwolf) X.25 software modem. `rtl_fm` is provided by the the `rtl_sdr` package that's already installed, and Direwolf is already packaged up for Raspberry Pi OS as well, so installing it is simply a matter of `sudo apt install direwolf`.

The command to run `rtl_fm` and demodulate audio to `stdout` is pretty simple:

```bash
rtl_fm -d 1 -M fm -f 144.80M -s 24000 -
```

Here we are using device index 1, mode FM, frequency 144.8 MHz (which is correct for APRS in Europe, America uses a different frequency) and a sample rate of 24000 samples per second, which is enough to represent the 1200-baud APRS data correctly.

Direwolf is a little more complicated, and accepts a large number of parameters either on the command line or from a configuration file. I chose to set most parameters up in a configuration file, with a little help from [these examples](https://gist.github.com/jj1bdx/8ab103e774c81d2c068d455ab862b72e). In `/home/pi/direwolf.conf`, I set up the following:

```
ACHANNELS 1
ADEVICE - null
ARATE 24000
CHANNEL 0
MODEM 1200
KISSPORT 8001
AGWPORT 8007
```

This asks Direwolf to read mono audio at 24000 samples per second from `stdin` and decode it at 1200 baud; and not to output audio at all. It creates a KISS server on port 8001, where Plane/Sailing Server will look for it, and it changes the default port of the AGW server from 8000, which would conflict with Dump1090, to 8007.

I also added lines following this template, so that APRS data I receive would be sent to a web server, making it an internet gateway or "iGate". If following this procedure for yourself, replace everything in square brackets&mdash;you'll need an amateur radio callsign, please don't set this up if you don't have one! You'll also need to generate an [APRS-IS passcode](https://apps.magicbug.co.uk/passcode/), enter your station's lat/long and altitude (in metres), and the regional [aprs2.net](https://aprs2.net) server to connect to, in my case "euro".

```
MYCALL [call]
IGLOGIN [call] [passcode]
IGSERVER [region].aprs2.net
PBEACON sendto=IG delay=0:30 every=30:00 symbol="igate" overlay=R lat=[lat] long=[lon] alt=[alt] comment="Plane/Sailing https://planesailing.ianrenton.com - RPi, RTL-SDR, Direwolf"
IGTXLIMIT 6 10
```

You can then plug them both together on the command-line, leave it for a while, and make sure you receive some messages! (I use `-t 0` in Direwolf's command-line to remove the colours and flashing effect it has by default.)

```bash
rtl_fm -d 1 -M fm -f 144.80M -s 24000 - | direwolf -t 0
```

### Checking the Received Messages

TODO

### Running on Startup

TODO

### Checking the iGate Functionality

If you set up iGate functionality as shown above, you should see Direwolf output lines like these:

```
[ig] M7BGT>APDW14:!5045.04NR00154.12W&/A=000148Plane/Sailing https://planesailing.ianrenton.com - RPi, RTL-SDR, Direwolf
```

After a few minutes, you should be able to visit [aprs.fi](https://aprs.fi/) and find a symbol corresponding to your location! Any APRS contacts around you that your receiver picks up will be sent to the APRS Internet Service (APRS-IS) too, and will be visible there.

![Receiver location shown on aprs.fi](/hardware/planesailing/aprsfi.png){: .center}
*The Receiver location shown on aprs.fi*

That's it, APRS setup is done!