---
layout: software
title: "Rimbaud Monitoring System (Gecko Cam)"
comments: true
githublink: https://github.com/ianrenton/geckocam/
---

Raspberry Pi-based gecko vivarium monitoring system. You can check out our gecko at [http://rimbaud.renton.es](http://rimbaud.renton.es) !

# About the Software

The software comes in two parts &mdash; one that runs on the Pi, and one that runs on a remote web server. The Pi half of the code does all the interesting bits (taking photos, measuring temperature and humidity, plotting graphs, etc.) and uploads the results to a web server for display. I implemented it this way to avoid having to host the website itself on the Pi, since I have a home internet connection with a dynamic IP.

The Pi half also sends its warning emails by ssh-ing into the server and sending from there, because I'm too lazy to set up mail from the Pi :)

# Configuration required &mdash; Web Server

The web server setup is roughly as follows:

1. Create an account for the geckocam, ensure it has ssh access
1. Create a website using the hosted files using e.g. Apache
1. `chown`/`chmod` the `upload` folder so that it's writeable by `geckocam` and readable by the web server user (e.g. `www-data`)
1. Give the new user a mailbox, or set up your MTA so that mails to it are forwarded to your normal mail address
1. Set birthday in `index.html`

# Configuration required &mdash; Raspberry Pi

The Raspberry Pi setup is roughly as follows:

1. Connect Raspberry Pi NoIR camera, AM2315 sensor (to I2C GPIO pins with 3.3VDC power), and wired/wifi network
1. Make sure your Pi is set up with I2C & camera enabled using `raspi-config`, reboot if necessary
1. Drop the files from this repo somewhere, e.g. home dir
1. Make `cronjob.sh` executable
1. Set up a cron job to run it every 15 minutes
1. Add your user to the `i2c` and `gpio` groups
1. Add the Quick2wire repository ([see here](http://dist.quick2wire.com/))
1. Install `python python3 python-matplotlib python3-numpy quick2wire-gpio-admin quick2wire-python3-api imagemagick`
1. Download AM2315 Python library [from here](https://code.google.com/p/am2315-python-api/source/browse/)
1. Install the library as root with `setup.py`
1. Add connection details in `~/.ssh/config` so you have an entry called "server" that can be logged into without a prompt (i.e. include the password there, or generate a pubkey and add that to `authorized_keys` on the server).

# Licence

All my code in this project is BSD 2-clause licenced, so you can take it and do what you like with it, but please give credit!

I've included the moment.js library and an extension that do the age calculations in `index.html`. Those are both MIT licenced.
