---
comments: true
layout: post
title: Adding Radiosonde Support
slug: adding-radiosonde-support
date: 2024-05-17 00:00:00
---

In early 2024, I was [asked](https://github.com/ianrenton/planesailing-server/issues/24) to add support for Radiosondes in Plane/Sailing&mdash;specifically, to add support for the output of [`radiosonde_auto_rx`](https://github.com/projecthorus/radiosonde_auto_rx).

The easiest output to choose looked like being the [HORUS JSON over UDP](https://github.com/projecthorus/radiosonde_auto_rx/wiki/Configuration-Settings#horus-udp-payload-summary-output), so this is what I implemented. In a similar way to AIS messages, Plane/Sailing simply operates as a listener for UDP datagrams on a certain port, in this case typically 55673.

In order to set up and test `radiosonde_auto_rx`, I largely followed the [instructions on their wiki](https://github.com/projecthorus/radiosonde_auto_rx/wiki). My actual setup for Plane/Sailing these days involves Proxmox and complicated passing through of SDR hardware to certain LXC hosts, but downloading and building the software essentially came down to this on a Debian machine:

```bash
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install python3 python3-venv sox git build-essential libtool cmake usbutils libusb-1.0-0-dev rng-tools libsamplerate-dev libatlas3-base libgfortran5 libopenblas-dev 
cd ~
git clone https://github.com/projecthorus/radiosonde_auto_rx.git 
cd radiosonde_auto_rx/auto_rx 
./build.sh 
cp station.cfg.example station.cfg
```

At this point I edited `station.cfg` to set the following:
* RTL-SDR ID
* Frequency range appropriate for Europe
* Station location, callsign, and antenna description.

Output in the Horus JSON format that we use is enabled by default, theoretically for ChaseMapper, but we will intercept this for Plane/Sailing.

`radiosonde_auto_rx` wants to run in a Python `venv`, so after building and configuring the software as above, and remaining in the same directory:

```bash
python3 -m venv venv 
source venv/bin/activate 
pip install -r requirements.txt
```

I could then run the software from the `venv` with:

```bash
python3 auto_rx.py
```

By default, the software exposes a web server on port 5000, which I was able to access to check that it was working. I also wanted to check the HORUS JSON output, so I ran:

```bash
ncat -u -l 55673
```

and waited for a Radiosonde to be tracked. After a while, I got the output I was looking for&mdash;JSON that looked like this:

```json
{"type": "PAYLOAD_SUMMARY", "station": "2E0UXV", "callsign": "V5010902", "latitude": 51.19209, "longitude": -1.81665, "altitude": 1377.92594, "speed": 36.338868, "heading": 227.96102, "time": "05:33:43", "comment": "Radiosonde", "model": "RS41", "freq": "404.401 MHz", "temp": -273.0, "frame": 1171, "bt": 65535, "humidity": -1.0, "sats": 9, "batt": 2.9, "snr": 10.3, "fest": [-2250.0, 2625.0], "f_centre": 404401187.5, "ppm": 49.6, "subtype": "RS41", "sdr_device_idx": "0"}
```

To run `radiosonde_auto_rx` as a background service, the software provides its own `systemd` service file that can be copied to the right place using:

```bash
sudo cp auto_rx.service /etc/systemd/system/
```

However, note that this file makes assumptions about the path to the software in 3 places, as well as the user to run as. If you're not running the software as `pi` or from `/home/pi`, the file will need to be edited accordingly.

As usual with `systemd`, we can enable and start the service with:

```bash
sudo systemctl daemon-reload
sudo systemctl enable auto_rx.service 
sudo systemctl start auto_rx.service 
```

With the service running and the software successfully receiving data, I then added support for the format to Plane/Sailing. Radiosonde tracking, via `radiosonde_auto_rx` and the HORUS JSON over UDP connectivity, is now supported as of Plane/Sailing v3.1.

