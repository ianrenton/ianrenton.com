---
comments: true
layout: post
title: Service Management Scripts
slug: service-management-scripts
date: 2023-11-24 00:00:00
layout: post
---

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