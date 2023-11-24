---
comments: true
layout: page
title: Plane/Sailing Portable
slug: plainsailing-portable
---

<div class="notes"><p>Please note that this project is currently a work in progress. The build guide on this page is not yet complete and several sections contain only my shorthand notes on what to investigate. If you'd like to recreate this project for yourself at this stage, there will still be some things for you to figure out on your own!</p></div>

"Plane/Sailing Portable" is a tiny hardware stack designed to be installed in ad-hoc locations, fitted to a vehicle or even carried in a pocket, from where it can contribute ADS-B, AIS or APRS coverage to the [Plane/Sailing](https://ianrenton.com/hardware/planesailing/) tracking system.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle attached together](/projects/planesailing-portable/prototype.jpg){: .center}
*The first prototype of Plane/Sailing Portable*

## Background

* TOC
{:toc}
{: #toc}

As explained in my [initial blog post on the subject](/blog/a-new-project-plane-sailing-portable/), while Plane/Sailing works very well, its biggest limitation is where I live, and the lack of line-of-sight to the sea or any APRS digipeaters. The "portable" concept developed as a solution to that problem, and an exercise to see how small an extra feeder into the system could get.

## Goals

As well as being simply as small as possible, I had a few other goals for the system:

1. Be made entirely of commercial off-the-shelf parts (no PCB design!)
2. Be plug-and-play (little or no soldering involved)
3. Be configurable to receive ADS-B, AIS or APRS&mdash;one at a time
4. Have a fourth operating mode where it is usable as a generic network-connected SDR
5. Able to feed data to Plane/Sailing as well as common web-based trackers

In the first iteration of the system, I allowed myself to rely on there being power and WiFi available at the operating location&mdash;e.g. wall power socket, car cigarette lighter socket or handheld USB power bank, and household WiFi or phone hotspot. I also allowed that changing the function of the device between its four supported modes could be done via SSH. (See later for potential future developments removing these limitations.)

## Design

For the radio receiver, I chose the [RTL-SDR Blog v3](https://www.rtl-sdr.com/wp-content/uploads/2018/02/RTL-SDR-Blog-V3-Datasheet.pdf). There were a number of reasons for this, including familiarity with the device and it having the widest range of software support. It's what I use three of in the main Plane/Sailing system, so I knew for sure it would work.

The v4 was rejected as it was very new to market, and software compatibility could not be guaranteed. Cheaper DVB-based SDR dongles were rejected due to an expectation of poorer performance. The [CaribouLite](https://github.com/cariboulabs/cariboulite) would have been my first choice due to the pHAT form factor that would have made the unit much neater, but their issue tracker [did not fill me with confidence it would actually work](https://github.com/cariboulabs/cariboulite/issues/117).

For the computer itself, I chose the [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/), which has built-in WiFi.

To join the two neatly, I chose a [Zero4U USB hub](https://www.uugear.com/product/zero4u/) and a [back-to-back USB A connector](https://www.aliexpress.com/item/1005003238590718.html?spm=a2g0o.order_detail.order_detail_item.2.4ff9f19c6Eqea2). The Zero4U drove the choice of a Pi Zero W as opposed to a Pi Zero *2* W, as compatibility was not guaranteed due to a slight change in pin positions between the two versions.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle](/blog/2023/plane-sailing-portable-bits.jpg){: .center}
*Parts ready to be assembled*

A simple perspex "case" and some PCB spacers makes the build rigid, though far short of rugged, then an SD card and an SMA telescopic whip antenna (purchased [with the RTL-SDR from Technofix](https://shop.technofix.uk/sdr/usb-rtl-sdr-sticks/super-stable-1ppm-tcxo-r820t2-tuner-rtl2832u-rtl-sdr-com-usb-stick-version-3)) completes the hardware.

## Build

To test the concept, I first put together a prototype of the hardware. The Pi Zero, Zero4U USB hub and RTL-SDR dongle arrived relatively quickly compared to the AliExpress USB connector and perspex case parts, so I initially put them together using a chunkier USB adapter, cardboard spacer and cable tie.

I did consider removing the case of the RTL-SDR to reduce the size of the unit slightly, however I couldn't find much information about this online, and given concerns about heat and electromagnetic interference, I decided to leave the case attached.

![A Raspberry Pi Zero W, USB pHAT and RTL-SDR dongle attached together](/projects/planesailing-portable/prototype.jpg){: .center}
*The first prototype, with chunky USB connector, cardboard spacer and cable ties*

*TODO: Build guide with prototype 2 component set*

*TODO: Prototype 2 build image*

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
rtl_fm -d 1 -M fm -f 144.80M -o 4 -g 34 -s 24000 - | direwolf -t 0
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

Then this is enabled on startup: `sudo systemctl daemon-reload && sudo systemctl enable run`. Note that this is the *only* custom service that is "enabled" (i.e. runs automatically on startup). The other services for Dump1090, AIS-Catcher etc. are all run *by* this script.

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

*TODO: Performance assessment*

### Power Consumption

*TODO: Power consumption*

## Integration with Plane/Sailing

### AIS: The Easy Bit

*TODO: Summarise feed-in arrangements (port forward etc)*

### ADS-B & APRS: The Workaround

*TODO: Tailscale, multi connection support in UxV*

### ADS-B & APRS: The Better Solution

*TODO: BEAST data to Plane Sailing Server - Use readsb? PS to support TCP server?*

*TODO: KISS data to Plane Sailing Server - PS to support TCP server? Use socat?*

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

### 3D-Printed Case

To improve the ruggedness of the system and make it look neat and tidy, a case could be used. No commercially available cases will neatly fit the specific set of components in use here, so one would have to be manufactured, likely by 3D printing. I don't have a 3D printer, so this will be postponed until I have decided which (if any) of the additional hardware options I will use, so that I only have to get it printed once.