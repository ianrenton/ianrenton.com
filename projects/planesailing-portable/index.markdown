---
comments: true
layout: page
title: Plane/Sailing Portable
slug: plainsailing-portable
---

"Plane/Sailing Portable" is a tiny hardware stack designed to be installed in ad-hoc locations, fitted to a vehicle or even carried in a pocket, from where it can contribute ADS-B, AIS or APRS coverage to the [Plane/Sailing](https://ianrenton.com/hardware/planesailing/) tracking system.

The project is still at the prototype stage (cable ties are still involved!)&mdash;see the bottom of the page for potential future improvements to be made.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle attached together](/projects/planesailing-portable/prototype2.jpg){: .center}
*The second prototype of Plane/Sailing Portable*

## Background

* TOC
{:toc}
{: #toc}

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

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle](/blog/2023/plane-sailing-portable-bits.jpg){: .center}
*Parts ready to be assembled*

A simple perspex "case" and some PCB spacers makes the build rigid, though far short of rugged, then an SD card and an SMA telescopic whip antenna (purchased [with the RTL-SDR from Technofix](https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3)) completes the hardware.

## Bill of Materials

The following parts were used to build the project in its current incarnation:

| **Part**                         | **Supplier**                                                                                                                                             | **Cost / GBP** |
|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Raspberry Pi Zero W              | [The Pi Hut](https://thepihut.com/products/raspberry-pi-zero-w)                                                                                          | 15.00    |
| SD Card                          | (from parts bin, but cheaply available e.g. [Amazon](https://www.amazon.co.uk/Kingston-microSD-SDCS2-Adapter-Included/dp/B07YGZ7JD5/ref=sr_1_3))         | N/A      |
| Zero4U USB Hub                   | [The Pi Hut](https://thepihut.com/products/zero4u-4-port-usb-hub-for-raspberry-pi-zero)                                                                  | 9.90     |
| RTL-SDR v3                       | [Technofix](https://shop.technofix.uk/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3)                                      | 37.99    |
| Telescopic whip antenna          | Technofix (addon to above product)                                                                                                                       | 3.99     |
| USB A back-to-back connector     | [AliExpress](https://www.aliexpress.com/item/1005003238590718.html)                                                                                      | 4.01     |
| Raspberry Pi Zero W perspex case | [eBay](https://www.ebay.co.uk/itm/256280694812)                                                                                                          | 2.68     |
| 2.5mm PCB spacers                | (from parts bin, but cheaply available e.g. [Amazon](https://www.amazon.co.uk/Knpwer-Standoff-Assortment-Threaded-Motherboard/dp/B09YLWJPD7/ref=sr_1_9)) | N/A      |
| **TOTAL**                        |                                                                                                                                                          | **73.57**    |

## Build

To test the concept, I first put together an initial prototype of the hardware. The Pi Zero, Zero4U USB hub and RTL-SDR dongle arrived relatively quickly compared to the AliExpress USB connector and perspex case parts, so I initially put them together using a chunkier USB adapter, cardboard spacer and cable tie.

I did consider removing the case of the RTL-SDR to reduce the size of the unit slightly, however I couldn't find much information about this online, and given concerns about heat and electromagnetic interference, I decided to leave the case attached.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle attached together](/projects/planesailing-portable/prototype.jpg){: .center}
*The first prototype, with chunky USB connector, cardboard spacer and cable ties*

Once the rest of the parts arrived, the build could be improved somewhat with a smaller USB adapter and the perspex "case" parts providing extra rigidity.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle attached together](/projects/planesailing-portable/prototype2a.jpg){: .center}
*The second prototype, improving the neatness of the unit*

## Software Setup

### Raspberry Pi OS & basics

[Raspberry Pi OS Imager](https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/) was used to create the SD card, using what at time of writing is called "Raspberry Pi OS (Legacy) Lite". This is the Debian Bullseye 32-bit version, the only one currently compatible with the Pi Zero, and the "lite" version so as not to include a desktop environment.

The tool now offers a way to customise things like the WiFi credentials and enable SSH right from the GUI, which is nice:

![Screenshot of the Raspberry Pi OS Imager showing customisation settings](/projects/planesailing-portable/pi-imager-customisation.png){: .center}
*Customisation options in Raspberry Pi OS Imager*

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

On first login to the Pi via SSH, I updated the package repository info and installed packages, as is good practice, with `sudo apt update && sudo apt upgrade`.

### RTL-SDR

To set up the RTL-SDR, I followed the instructions on their [Quick Start Page](https://www.rtl-sdr.com/rtl-sdr-quick-start-guide/) (about half-way down for the Linux instructions).

They were to download, build and install the RTL-SDR drivers:

```bash
sudo apt-get install libusb-1.0-0-dev git cmake pkg-config
git clone https://github.com/rtlsdrblog/rtl-sdr-blog
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo ldconfig
```

Then blacklist the "standard" DVB drivers for the dongle, allowing the RTL-SDR drivers to be used instead:

```bash
echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
```

And then reboot.

Running `rtl_test` then results in a good initialisation of the device. (The "lost at least 124 bytes" message occurs only once on startup and not subsequently, so no bytes are being lost in an ongoing way.)

```
ian@planesailingportable:~ $ rtl_test
Found 1 device(s):
  0:  Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM
Found Rafael Micro R820T tuner
Supported gain values (29): 0.0 0.9 1.4 2.7 3.7 7.7 8.7 12.5 14.4 15.7 16.6 19.7 20.7 22.9 25.4 28.0 29.7 32.8 33.8 36.4 37.2 38.6 40.2 42.1 43.4 43.9 44.5 48.0 49.6 
Enabled direct sampling mode, input 2
Sampling at 2048000 S/s.

Info: This tool will continuously read from the device, and report if
samples get lost. If you observe no further output, everything is fine.

Reading samples in async mode...
lost at least 124 bytes
```

### rtl_tcp

The first application I set up on the device was `rtl_tcp`. This is not doing any ADS-B/AIS/APRS tracking by itself, but fulfills the requirement for the "fourth mode" I wanted the device to function in, where it is usable as a generic network-connected SDR. This is useful both for testing the device, and for making it more generally useful for tinkering with.

It would have been nice to use [SpyServer](https://www.rtl-sdr.com/rtl-sdr-tutorial-setting-up-and-using-the-spyserver-remote-streaming-server-with-an-rtl-sdr/) for this role, as it has more features than `rtl_tcp`, but unfortunately it is not compatible with the Pi Zero. I therefore proceeded with the simpler software.

Running it without arguments listens on port 1234, but only to local applications. To enable access from other computers on the network, I ran it with:

```bash
rtl_tcp -a 0.0.0.0
```

Another PC on the network can then connect to it on this port. I used [SDRSharp](https://airspy.com/download/), selected the "RTL-TCP" source and configured it with the correct IP address and port. Though this provided a connection and streamed data, I found that I had to enable "Tuner AGC" *after* making a connection before anything useful came through. This is likely a limitation of `rtl_tcp`.

A standard simple test is to listen in to Radio 1:

![SDRSharp screenshot showing RTL-TCP settings](/projects/planesailing-portable/sdrsharp.png){: .center}
*SDRSharp screenshot showing RTL-TCP settings and Radio 1 streaming in the background*

The Killers were immediately playing out of my PC speakers&mdash;so at the very least we have an extremely over-engineered FM broadcast radio receiver working! I was mildly concerned about the high noise floor though&mdash;it remained to be seen how badly this would impact packet decoding.

I created a systemd service to allow `rtl_tcp` to run in the background. I created a file at `/etc/systemd/system/rtl_tcp.service` with the following content:

```
[Unit]
Description=rtl_tcp
After=network.target
StartLimitIntervalSec=0

[Service]
ExecStart=rtl_tcp -a 0.0.0.0
StandardOutput=inherit
StandardError=inherit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

I then ran `sudo systemctl daemon-reload` to update and `sudo systemctl start rtl_tcp` to start it in the background. Reconnecting using SDRSharp worked as expected. I avoided `sudo systemctl enable rtl_tcp` (which would make it run on startup) at this stage, as we will later sort out scripts to stop and start `rtl_tcp` along with the other applications.

Finally, I used `sudo systemctl stop rtl_tcp` to stop the service before I started setting up AIS-Catcher.

### AIS-Catcher

AIS-Catcher was built from source using the same method as in [the main Plane/Sailing system AIS setup guide](/hardware/planesailing/ais-receiver/):

```bash
sudo apt install git make gcc g++ cmake pkg-config libcurl4-openssl-dev zlib1g-dev
cd
git clone https://github.com/jvde-github/AIS-catcher.git
cd AIS-catcher
mkdir build
cd build
cmake ..
make
sudo make install
```

Then tested using:

```bash
/usr/local/bin/AIS-catcher -d:0 -gr RTLAGC on TUNER auto -a 192K
```

![AIS-Catcher command-line output](/projects/planesailing-portable/ais-output.png)

This worked well for a while, but eventually started printing "RTLSDR: buffer overrun" warnings. The [AIS-Catcher README](https://github.com/jvde-github/AIS-catcher) suggests that the `-F` flag for fast downsampling may be needed on the Pi Zero, and there some additional suggestions in [this thread](https://github.com/jvde-github/AIS-catcher/issues/34) which I used as well. My eventual choice of command-line to minimise issues was:

```bash
/usr/local/bin/AIS-catcher -d:0 -gr RTLAGC on TUNER auto BUFFER_COUNT 12 -a 192K -s 288K
```

This omits the `-F` flag&mdash;in my experimentation, supplying `-F` resulted in about 20% CPU load on the Pi Zero, whereas without it used about 30%. In this system, when in "AIS mode", the Pi will not need to be running anything else apart from AIS-Catcher, I decided to omit the flag for better decode performance. The `-s 288K` and `BUFFER_COUNT 12` additions definitely seemed to help reduce the "buffer overrun" messages though. AIS data modulation is 9600 baud GMSK so 288kS/s sample rate should still be plenty.

Once proven working, I created a systemd service at `/etc/systemd/system/ais-catcher.service` including adding an output that will send the data to Plane/Sailing:

```
[Unit]
Description=ais_catcher
Wants=network-online.target
After=network.target network-online.target
StartLimitIntervalSec=0

[Service]
ExecStart=/usr/local/bin/AIS-catcher -d:0 -gr RTLAGC on TUNER auto BUFFER_COUNT 12 -a 192K -s 288K -F -u planesailingserver.ianrenton.com 10111
StandardOutput=inherit
StandardError=inherit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

This is slightly modified from the version on the Plane/Sailing server, because the server has hard-wired ethernet and can guarantee it's online at the point the service starts up. Here, I have added a dependency on `network-online.target` to ensure that AIS-Catcher doesn't start up before the Pi has found a WiFi network to connect to, because if it does it will fail domain name resolution of `planesailingserver.ianrenton.com` and shut down.

The example above also *only* sends data to Plane/Sailing server; it can of course be extended with other `-u` arguments to send data to MarineTraffic and other online services.

![AIS vessels visible in the Plane/Sailing interface in two different locations](/projects/planesailing-portable/ais-coverage.png)
*Plane/Sailing Portable providing AIS coverage in the Weymouth area, while the main system covers Poole to the Solent*

I then used `sudo systemctl daemon-reload` to update and `sudo systemctl start ais-catcher` to start it to ensure the service works. I avoided `sudo systemctl enable ais-catcher` (which would make it run on startup) at this stage, as we will later sort out scripts to stop and start AIS-Catcher along with the other applications.

Finally, I used `sudo systemctl stop ais-catcher` to stop the service before I started setting up Dump1090.

### Dump1090

Dump1090 was installed from FlightAware's Raspberry Pi repository as described on the [the main Plane/Sailing system ADS-B setup guide](/hardware/planesailing/adsb-receiver/):

```bash
wget https://uk.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb
sudo dpkg -i flightaware-apt-repository_1.2_all.deb
sudo apt update
sudo apt install dump1090-fa
```

On install, Dump1090 starts its own service&mdash;and lighttpd&mdash;so the PiAware web interface will immediately be available on port 8080 from a web browser.

![Screenshot of PiAware showing 4 planes](/projects/planesailing-portable/flightaware.png){: .center}
*An untuned antenna, indoors at ground level is not the ideal set of conditions for tracking a lot of planes.*

Once set up, feeder software such as PiAware can also be set up in order to send the data to flight tracking websites as well as Plane/Sailing. These applications typically include an interactive setup on install that prompts you for the location of the receiver to enable MLAT. For a portable system, unless it is intended to only ever remain in one place (or unless a GPS receiver is fitted - see later), the location should *not* be set. If it's set and the system is moved, it will mess up MLAT calculations in the local area.

Feeders for [FlightAware](https://www.flightaware.com/adsb/piaware/install), [FlightRadar24](https://www.flightradar24.com/share-your-data) and [OARC](https://wiki.oarc.uk/flight:adsb) were set up in order to test the system, following the linked instructions. These software for these feeders will run all the time on the device; we don't particularly care about turning them on and off as without `dump1090-fa` running they won't be doing much anyway.

You may notice the above instructions get the received data to common tracking websites, but not to Plane/Sailing&mdash;this step is covered later under "Integration with Plane/Sailing".

As usual, we want to manage which services run on this device manually. Because Dump1090 has added and enabled its services automatically, we now want to disable them, and stop them before continuing with the guide:

```bash
sudo systemctl disable dump1090-fa
sudo systemctl disable lighttpd
sudo systemctl stop dump1090-fa
sudo systemctl stop lighttpd
```

### Direwolf

Direwold was installed from the operating system repositories as described on the [the main Plane/Sailing system APRS setup guide](/hardware/planesailing/aprs-receiver/):

```bash
sudo apt install direwolf
sudo usermod -G plugdev pi
```

Then creating a config file at `/home/pi/direwolf.conf` with the following contents, replacing the values in square brackets:

```
ACHANNELS 1
ADEVICE - null
ARATE 24000
CHANNEL 0
MODEM 1200
KISSPORT 8001
MYCALL [call]-[ssid]
IGLOGIN [call] [passcode]
IGSERVER [region].aprs2.net
IGTXLIMIT 6 10
```

The `TBEACON` command could be used in future in this config if a GPS receiver is attached.

To test, the following command was run:

```bash
rtl_fm -d 0 -M fm -f 144.80M -o 4 -g 34 -s 24000 - | direwolf -t 0 -a 10
```

Output was then observed to see lines like the following&mdash;97 is a reasonable value for audio level.

```
ADEVICE0: Sample rate approx. 24.2 k, 0 errors, receive audio level CH0 97
```

If you have APRS transmitters that you can receive, you will hopefully see some APRS decodes here&mdash;I wasn't able to during initial testing.

As with the main Plane/Sailing server, I created a `direwolf.sh` file in the home directory to run the software:

```bash
#!/bin/bash
rtl_fm -d 0 -M fm -f 144.80M -o 4 -g 34 -s 24000 - | direwolf -t 0
```

I then made it executable with `chmod +x ~/direwolf.sh` and created a systemd service file at `/etc/systemd/system/direwolf.service`:

```
[Unit]
Description=rtl_fm and direwolf
After=network.target

[Service]
ExecStart=/home/pi/direwolf.sh
WorkingDirectory=/home/pi
StandardOutput=inherit
StandardError=inherit
Restart=always
User=pi

[Install]
WantedBy=multi-user.target
```

You may notice the above instructions get the received data iGated to standard APRS servers, but not to Plane/Sailing&mdash;this step is covered later under "Integration with Plane/Sailing".

I then used `sudo systemctl daemon-reload` to update and `sudo systemctl start direwolf` to start it to ensure the service works. I avoided `sudo systemctl enable direwolf` (which would make it run on startup) at this stage, as we will later sort out scripts to stop and start Direwolf along with the other applications.

Finally, I used `sudo systemctl stop direwolf` to stop the service before I started setting up the management scripts.

### Service Management Script

Two scripts are used for controlling the services that get run on startup: `menu.sh` and `run.sh`. I placed these in the main user's home directory.

`menu.sh` presents a simple menu, writes the user's selection to a file called `choice.txt`, then runs `run.sh`.

`run.sh` also runs automatically on startup. It reads the user's selection (either from just having made the choice, or based on the last time the choice was set). It then runs the appropriate service(s), and also blinks the LED on the board to indicate which role was picked.

`menu.sh` is as follows:

```bash
#!/bin/bash
# Elevate permissions if not already root
if [ "$EUID" != 0 ]; then
   sudo "$0" "$@"
   exit $?
fi

# Print menu
echo "Select mode:"
echo "[1] Network-enabled SDR (rtl_tcp)"
echo "[2] ADS-B (dump1090)"
echo "[3] AIS (ais-catcher)"
echo "[4] APRS (direwolf)"

# Get input
read -p 'Enter a number 1-4: ' choice

# Write to choice file
echo "$choice" > choice.txt

# Stop existing services
systemctl stop rtl_tcp
systemctl stop dump1090-fa
systemctl stop ais-catcher
systemctl stop direwolf

# Chain run.sh
./run.sh
```

`run.sh` is as follows:

```bash
#!/bin/bash
# Define LED flash function. $1 = number of flashes
flash () {
   for ((i = 0 ; i < $1 ; i++ )); do
       echo 1 | tee /sys/class/leds/ACT/brightness
       sleep 0.5
       echo 0 | tee /sys/class/leds/ACT/brightness
       sleep 0.5
   done
} 

# Hijack control of the LED
echo none | tee /sys/class/leds/ACT/trigger

# Initial LED off period
echo 0 | tee /sys/class/leds/ACT/brightness
sleep 2

# Load user selection from file
choice=`cat choice.txt`

if [ $choice = "1" ]; then
   echo "Starting rtl_tcp..."
   systemctl start rtl_tcp
   flash 1

elif [ $choice = "2" ]; then
   echo "Starting dump1090..."
   systemctl start dump1090-fa
   flash 2

elif [ $choice = "3" ]; then
   echo "Starting ais-catcher..."
   systemctl start ais-catcher
   flash 3

elif [ $choice = "4" ]; then
   echo "Starting direwolf..."
   systemctl start direwolf
   flash 4

else
   echo "Unknown choice $choice, doing nothing!"
fi

# Final LED off period
echo 0 | tee /sys/class/leds/ACT/brightness
sleep 2

# Return control of the LED
echo cpu | sudo tee /sys/class/leds/ACT/trigger
```

Both scripts need to be made executable:

```bash
chmod +x menu.sh
chmod +x run.sh
```

Finally, a service file needs to be created to run `run.sh` on startup. This is placed at `/etc/systemd/system/run.service`:

```
[Unit]
Description=Startup runner
After=network.target

[Service]
Type=oneshot
ExecStart=/home/pi/run.sh
WorkingDirectory=/home/pi
StandardOutput=inherit
StandardError=inherit
User=root

[Install]
WantedBy=multi-user.target
```

Then this is enabled on startup: `sudo systemctl daemon-reload && sudo systemctl enable run`. Note that this is the *only* custom service that is "enabled" (i.e. runs automatically on startup). The other services for Dump1090, AIS-Catcher etc. are "disabled" so they don't run automatically, then they are individually started *by* this script.

To test the menu, run `menu.sh`, enter your password, and make a selection from the menu. The LED will blink the number of times based on your selection, then the selected service will run. It will then re-run on every startup until a different choice is made.

## Performance

### Interference

When I first ran SDRSharp with `rtl_tcp` on the Pi, the noise floor was a lot higher than I expected. Radio 1, normally one of the highest receive power broadcast radio stations, came in at only 15dB above a noise floor that was sat at around -43dB compared to full scale. Luckily, it appears that a lot of the high noise floor came from the device's location. The waterfall below shows the effect of moving the system from its original location balanced on top of its mains power supply (bottom third) to approximately 30cm away (middle third). The top third shows the effect when moved to battery power from a portable power pack&mdash;I was expecting this to be another improvement, but unfortunately it was worse!

![Screenshot of a spectrum waterfall](/projects/planesailing-portable/interference.png){: .center}

Overall bandwidth of the screenshot is 1MHz, with Radio 1 on 98.2MHz shown slightly to the right of centre.

Luckily, the advantage of battery power is that the unit can be moved around. I wanted to see if the problem was largely of my own creation (i.e. man-made interference), so I took it for a walk around the house and into the garden.

![Plane/Sailing Portable in a garden](/projects/planesailing-portable/garden.jpg){: .center}

This showed significant variation in background noise level, as shown in the waterfall below. As if I was in any doubt from my general ham radio experience&mdash;the inside of my house, full of DC power supplies, LED lights and powerline ethernet adapters, is a noisy place to be.

![Screenshot of a spectrum waterfall](/projects/planesailing-portable/interference2.png){: .center}

### Decoding Performance

In order to assess the performance of the system, it was used with the same antennas as the main Plane/Sailing system, swapped rapidly from one to the other. The message receive rates on the server (before the switch) and portable system (after the switch) were then compared. No noticeable difference in performance was observed between the systems when the same antennas were used.

In terms of CPU load, the following 1-minute load average values were observed. These were recorded as measured by `top`. The Pi Zero W has a 1GHz single-core CPU, so a load of 1.0 is fully utilised.

| State                                       | CPU Load |
|---------------------------------------------|----------|
| Idle                                        | 0.09     |
| rtl_test Running                            | 0.11     |
| rtl_tcp Running                             | 0.11     |
| rtl_tcp Streaming                           | 1.25     |
| AIS-Catcher Running                         | 0.42     |
| rtl_fm & Direwolf Running                   | 0.64     |
| dump1090 Running (No Decodes)               | 0.46     |
| dump1090 Running (approx 800 msgs/sec)      | 0.74     |
| dump1090 + PiAware                          | 0.76     |
| dump1090 + PiAware + FR24Feed               | 0.82     |
| dump1090 + PiAware + FR24Feed + OARC Feeder | 1.04     |

As you can see from the table, streaming from `rtl_tcp` really maxes out the CPU, and if you're tracking aircraft, 3 ADS-B feeders is about all the system can cope with as a maximum. (Most feeders will connect to a BEAST binary port on a different computer though, so if you're interested in feeding several places from the portable system, and have access to another always-on server, it might be better to run the feeders there instead of on the Pi Zero.)

Rates of APRS and AIS message receive at my location are low enough that it no noticeable effect on CPU load was detectable by plugging in the antenna (i.e. there was no load difference between the software being running but idle, and running and actively decoding). With ADS-B, the message receive rate was high enough to make a significant difference, which is why this distinction has been made in the table above.

Note that the ADS-B feeders are not sending or receiving MLAT in this portable setup. If this was configured, providing position information to the feeders to enable MLAT, the CPU usage could increase slightly.

Note also that (as covered in a later section) the device was also running the Tailscale client. This accounted for approximately 1-6% of CPU usage on top of that used by `ssh`, `top` and other background processes.

### Power Consumption

![Inline USB current meter next to Plane/Sailing Portable](/projects/planesailing-portable/current.jpg){: .center}
*Using an inline USB current meter to measure power consumption*

Power consumption was monitored during testing using an inline USB current meter. Results are as follows. All were at 5 V nominal, although the supply dropped as low as 4.75 V under the highest loads. Values quoted are the highest instantaneous value displayed by the device over 10 seconds of monitoring.

| State                                  | Current Draw / A |
|----------------------------------------|------------------|
| Startup                                | 0.325            |
| Idle                                   | 0.263            |
| rtl_test Running                       | 0.331            |
| rtl_tcp Running                        | 0.465            |
| rtl_tcp Streaming                      | 0.655            |
| AIS-Catcher Running                    | 0.466            |
| rtl_fm & Direwolf Running              | 0.498            |
| dump1090 Running (No Decodes)          | 0.527            |
| dump1090 Running (approx 800 msgs/sec) | 0.533            |
| dump1090 + 3 Feeders                   | 0.556            |

## Integration with Plane/Sailing

### AIS (The Easy Part)

You may have noticed in the setup guide above, that AIS data was easily pointed at Plane/Sailing Server by means of a `-u` command in AIS-Catcher, but I conventiently skipped over how to do the same for ADS-B (Dump1090) and APRS (Direwolf). That's because they work in different ways.

The way AIS data is typically passed to online trackers such as MarineTraffic, and to Plane/Sailing, is via UDP. This is very simple; the sender simply sends to an IP address/hostname and port combination, and off the message goes. To allow Plane/Sailing to aggregate AIS messages from the portable system as well as its local receiver, all I had to do was forward a port on my home router, in this case 10111, to the same port on the same PC that Plane/Sailing normally uses for this. Messages then arrive on that port from both sources. The server can't tell the difference, but at this stage it doesn't need to.

### ADS-B & APRS: The Problem

For ADS-B we generally use BEAST data on a port served by Dump1090, and for APRS we use KISS data on a port served by Direwolf. These are TCP, so unlike with UDP we need to deal with connections and the differences between clients and servers. More importantly, it's Dump1090 and Direwolf that are the *servers*&mdash;Plane/Sailing Server is the *client* in these relationships. That means that Dump1090 and Direwolf in the portable system can't connect in to the main system&mdash;the main system must connect to *them*.

The first step to make this happen was to allow multiple connections of each type in Plane/Sailing Server. Instead of just connecting to one Dump1090 instance, or one Direwolf instance, [a change was made](https://github.com/ianrenton/planesailing-server/commit/4553e9d4b8611fe1d274cb566aa12618b63775f8) to allow as many as you like.

The JSON protocol and client UI code were also updated to reflect the back-end server changes, so now if you have multiple computers providing input, they are all shown separately in the server telemetry.

![Plane/Sailing client showing server telemetry with three sources](/projects/planesailing-portable/planesailingtelemetry.png){: .center}
*Plane/Sailing client showing server telemetry with three sources*

Great! Plane/Sailing Server can now connect to Dump1090 & Direwolf on its own network, as well as Dump1090 or Direwolf on the portable system. But how does it find the portable system? It's running on ad-hoc WiFi networks, and even using mobile phone tethering, so it's not so easy to give Plane/Sailing Server an IP address and port and say "connect to this". In particular, the port forwarding we use on normal internet-connected routers is impossible on a phone network, as the Network Address Translation is beyond our control.

### ADS-B & APRS: The Quick Solution

The quick solution to this is to *put them on the same local network*, wherever the portable system is, using a VPN. This way, Plane/Sailing Server will be able to see the portable system on one IP address regardless of where it is in the world, and connect directly to it. I am a recent convert to [Tailscale](https://tailscale.com) for this, as it's simple to set up on just about any device, and they provide the key management. I previously used [OpenVPN](https://openvpn.net/), which works just as well, though you need to generate and distribute keys manually.

![Tailscale dashboard showing several computers connected to a VPN with IP addresses shown](/projects/planesailing-portable/tailscale.png){: .center}
*Tailscale dashboard showing "plainsailingportable" and "innsmouth" (the Plane/Sailing Server) connected to the VPN with IP addresses in the same range*

The VPN allows Plane/Sailing Portable to connect in and be accessible from Plane/Sailing Server on a known IP address, in this case on the 100.x.y.z subnet, so that the server can connect to it rather than the other way around.

### ADS-B & APRS: Alternative Solutions

If you don't want to set up a VPN, there are some alternative approaches to solving this problem (i.e. that A needs to connect to B, but only B knows where A is, not the other way around).

The first and probably most common is an SSH reverse proxy. There's some good summaries of this approach [here](https://unix.stackexchange.com/questions/46235/how-does-reverse-ssh-tunneling-work).

What we will need to do is configure the portable system to run a command like this on startup:

```bash
ssh -f -N -T -R40005:localhost:30005 -R9001:localhost:8001 planesailingserver.ianrenton.com
```

This creates (and then backgrounds) an SSH session from the portable unit to the server, making reverse connections available from 40005 and 9001 on the server, back to 30005 and 8001 on the local (portable) end. Plane/Sailing can then be configured to connect to a BEAST data socket on `localhost` port 40005, and it will actually end up connecting to port 30005 on the portable unit; the same with APRS KISS from 9001 to 8001.

To prevent the portable system needing a password every time, keys should be used so that the portable system can authenticate with the server automatically.

The above approach comes with its own disadvantage, which is that it requires SSH access to the server from the outside world to be enabled. If we didn't want to deal with that security risk (hint: move to a non-standard SSH port and run `fail2ban`), there is another approach which could just allow the data itself into the server, using software like `ncat` and `socat`.

Here, we want to run a "double-ended" client on the portable system, and a "double-ended" server on the main system, in order to effectively change the client-server relationship between the two ends. Like so:

![Diagram of socat being used to bridge connections between dump1090 and direwolf on the portable system, and Plane/Sailing server](/projects/planesailing-portable/socat.png){: .center}

However, as you can see this is getting quite complicated with a lot of services to set up on both ends. It also scales badly, with more portable systems meaning more services running and more ports open. Even the SSH reverse proxy solution doesn't scale brilliantly, with a need to manually allocate two ports per system on the server end. The VPN approach is the simplest and most easily scaleable, and therefore preferred.

## Future Enhancements

A number of future enhancements are being considered for the project to overcome its current limitations.

### Improved RTL-SDR Mounting

The RTL-SDR is still held on by a cable tie in the current prototype. With the ability to precisely cut perspex or 3D print, a bracket could be fashioned to hold the dongle securely.

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

The final concession to simplicity made at design time was that the mode could be changed between ADS-B, AIS, APRS and rtl_tcp by logging in via SSH and running a script. SSH&mdash;or seeing the results on the Plane/Sailing interface&mdash;is also the only way to know if it's working.

An additional board providing a small screen and a few buttons, such as this [1.3" OLED display HAT](https://thepihut.com/products/1-3inch-oled-display-hat-for-raspberry-pi-128x64) could provide information on the unit's function as well as the ability to change it, and perhaps even to log into a WiFi network, via the buttons.

This again does increase the size of the system, going against the "as small as possible" idea, but the size increase is modest and the functional improvement significant.

### 3D-Printed Case

To improve the ruggedness of the system and make it look neat and tidy, a case could be used. No commercially available cases will neatly fit the specific set of components in use here, so one would have to be manufactured, likely by 3D printing. I don't have a 3D printer, so this will be postponed until I have decided which (if any) of the additional hardware options I will use, so that I only have to get it printed once.