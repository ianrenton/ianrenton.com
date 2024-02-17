---
comments: true
layout: post
title: 'AIS Receiver Setup'
slug: ais-receiver
last_update: 2023-06-17T00:00:00+00:00
---

While AIS receiving isn't quite as common a project as ADS-B&mdash;not everyone lives close to the sea after all&mdash;the tools are all out there on the internet and fairly easy to set up. The first version of Plane/Sailing used a dedicated Raspberry Pi for AIS, separate to the one used for ADS-B. [SARCNET's AIS Receiver page](https://www.sarcnet.org/ais-receiver.html) provided the pre-configured SD card image that I used. For version 2 I wanted to start from scratch with a standard Raspberry Pi OS install, so the instructions below cover setting it up manually.

Let's track some ships!

![Anthem of the Seas in Plane/Sailing](/hardware/planesailing/anthem.png){: .center}

### Installing AIS-Catcher

[AIS-Catcher](https://github.com/jvde-github/AIS-catcher) is a command-line utility that does the complex job of interfacing with an SDR dongle and decoding AIS data, providing it on as the standard NMEA-0183 format. It also has a number of advanced features for different SDR hardware, and a built-in web interface to view the data it is receiving.

Containerised images for Linux and compiled binaries for Windows are available from the project's Github, but I preferred to build from source using the following commands:

```bash
sudo apt install git make gcc g++ cmake pkg-config libcurl4-openssl-dev zlib1g-dev librtlsdr-dev -y
git clone https://github.com/jvde-github/AIS-catcher.git
cd AIS-catcher
mkdir build
cd build
cmake ..
make
sudo make install
```

AIS-Catcher is then available in `/usr/local/bin/`.

<div class="notes"><p>Note that I used to recommend <code>rtl_ais</code> and AIS Dispatcher for the task of decoding and distributing AIS messages. <a href="/hardware/planesailing/#comment-16">S Cox in the comments</a> pointed me towards AIS-Catcher with which I see hugely better performance, and I strongly recommend it on that basis alone. It also has the combined features of both previous software packages, and more.</p>
<p>Spot the point I switched over:</p>
<p><img src="/hardware/planesailing/ais-catcher-message-chart.png"/></p>
<p>If you would prefer to use the <code>rtl_ais</code> and AIS Dispatcher setup instead, <a href="/hardware/planesailing/old-rtl-ais-setup">click here.</a></p></div>

### Testing AIS-Catcher

I tested AIS-Catcher using the following command:

```bash
/usr/local/bin/AIS-catcher -d:0 -gr RTLAGC on TUNER auto -a 192K -N 12345
```

This uses RTL-SDR device ID 0. Depending on your setup, and what other SDRs you have attached, you may need to use a different number&mdash;see the following section on "Deconflicting Dongles". `-gr RTLAGC on TUNER auto -a 192K` is also specific to the RTL-SDR&mdash;see the [AIS-Catcher README](https://github.com/jvde-github/AIS-catcher/blob/main/README.md) for more information.

The command above will output AIS messages to stdout, so you should see them appearing on the command line. It will look something like this:

```
Jun 17 12:18:40 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,A,402=agAvM`dBWwpj8pLwASW00@GL,0*50 ( MSG: 4, REPEAT: 0, MMSI: 2320829, signalpower: -11.3198, ppm: -2.60417, timestamp: 20230617121840)
Jun 17 12:18:40 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,A,D02=ag@flffp,0*61 ( MSG: 20, REPEAT: 0, MMSI: 2320829, signalpower: -11.6754, ppm: -2.60417, timestamp: 20230617121840)
Jun 17 12:18:41 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,B,33IgB=5000wnpi:M0thGPC<F8Dpr,0*7A ( MSG: 3, REPEAT: 0, MMSI: 228315700, signalpower: -18.178, ppm: -0.578704, timestamp: 20230617121841)
Jun 17 12:18:46 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,A,702:oP3dTno@,0*54 ( MSG: 7, REPEAT: 0, MMSI: 2275200, signalpower: -27.201, ppm: -3.18287, timestamp: 20230617121846)
Jun 17 12:18:47 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,A,702:oP3dTnnl,0*79 ( MSG: 7, REPEAT: 0, MMSI: 2275200, signalpower: -26.9951, ppm: -3.47222, timestamp: 20230617121847)
Jun 17 12:18:49 innsmouth AIS-catcher[586481]: !AIVDM,1,1,,A,B3MBOI@00?uiLn7@4O7Q3wp1nE2b,0*0B ( MSG: 18, REPEAT: 0, MMSI: 232038245, signalpower: -24.8244, ppm: -1.15741, timestamp: 20230617121849)
```

It will also run its web server on port 12345, so you should be able to connect to this with a browser and view a map and other information about the AIS receiver.

![AIS-Catcher Map](/hardware/planesailing/ais-catcher.png){: .center}
*The map displayed in the AIS-Catcher web interface*

### Deconflicting Dongles

When testing AIS-Catcher, I started to have an issue with dongle device indices. Previously, with just my FlightAware dongle installed, it had device index 0 and there were no problems. On connecting the second device for AIS, assumed it would appear with device index 1, and so I tried to run `AIS-Catcher` with the `-d:1` parameter. Unfortunately it didn't work! Looking at the output of `AIS-Catcher` and plugging/unplugging dongles showed that the new device had bumped the *old* one into index 1.

So while I found out that `-d:0` was the appropriate parameter for `AIS-Catcher`, I then had to go back and change the index of the dongle that Dump1090 was using, by editing `/etc/default/dump1090-fa`, and changing `--device-index 0` to `1`.

I then rebooted the Pi to make sure the device indices stayed like that after a reboot, and they did. So Dump1090 can stay using device index 1, and AIS-Catcher will use device index 0.

### Sharing your Data

Feeding your data to online trackers is a little less sophisticated for AIS than for ADS-B; most providers simply give you an IP address and port to which you send the raw NMEA-0183 messages via UDP. AIS-Catcher can be given multiple `-u` arguments on the command line to output its data to the necessary locations.

To provide data to a Plane/Sailing server running on the same PC, configure an additional output to 127.0.0.1, port 10111, by adding `-u 127.0.0.1 10111` to the command line of AIS-Catcher.

You may also want to [sign up for an AIShub account](http://www.aishub.net/join-us) and get a unique port to send to, and add this to your command line too. The same applies to [Marine Traffic](https://www.marinetraffic.com/en/users/register/1/12); registration gets you a unique port to send data to, and other account benefits. There are also anonymous ports you can send data to for [Vessel Finder](https://stations.vesselfinder.com/become-partner), [Pocket Mariner](http://pocketmariner.com/ais-ship-tracking/cover-your-area/) and [Ship Finder](https://shipfinder.co/about/coverage/). Add a command-line argument for each, e.g. `-u ais.vesselfinder.com 5528 -u boatbeaconapp.com 5322 -u ais.shipfinder.co.uk 4001`

### Sharing with aprs.fi

[aprs.fi](https://aprs.fi) is mainly an APRS tracker (we'll come onto submitting APRS tracks to it on the next page) but it can also accept AIS information. Unfortunately it does so in its own format rather than generic NMEA messages, but fortunately AIS-Catcher supports that format too.

You will need to get your AIS "password" from your [account page](https://aprs.fi/account/) on aprs.fi, and add the following to your AIS-Catcher command line, replacing `[yourpassword]` and `[yourcallsign]` with the proper values:

```
-H http://aprs.fi/jsonais/post/[yourpassword] ID [yourcallsign] PROTOCOL aprs INTERVAL 30
```

### Running AIS-Catcher on Startup

We then need to make sure this runs automatically on startup, by creating an init script at `/etc/systemd/system/ais_catcher.service` with contents similar to those shown below, adding the additional `-u` and/or `-H` arguments for the services you wish to share to.

```
[Unit]
Description=ais_catcher
After=network.target

[Service]
ExecStart=/usr/local/bin/AIS-catcher -d:0 -gr RTLAGC on TUNER auto -a 192K -N 12345 -q -u 127.0.0.1 10111
StandardOutput=inherit
StandardError=inherit
Restart=always

[Install]
WantedBy=multi-user.target
```

Then enable and start it:

```bash
sudo systemctl daemon-reload
sudo systemctl enable ais_catcher
sudo systemctl start ais_catcher
```

At this point it's worth rebooting the Pi, and on startup, running both `systemctl status dump1090-fa` and `systemctl status ais_catcher` to make sure they both start up OK and don't die like they would if they couldn't access the RTL-SDR device index they were assigned. 
