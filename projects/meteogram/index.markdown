---
comments: true
layout: page
title: Home Meteogram Display
---

My Home Meteogram Display is based around a Raspberry Pi and a small ultra-wide aspect ratio screen. It lives in the kitchen and provides a passive weather and calendar display tailored to our needs. The build process is documented below and all code is open source.

![The Meteogram display showing weather and calendar events on an ultra-wide screen](banner.jpg){: .center}

## The Goal

This project largely came about because I saw [these Waveshare ultra-widescreen displays](https://www.waveshare.com/11.9inch-hdmi-lcd.htm) and thought they looked cool, so came up with a project based around one.

As explained in my earlier [blog post](/blog/making-meteograms-in-python/), I came up with the idea of doing a [Meteogram](https://en.wikipedia.org/wiki/Meteogram) display to solve my issues with most weather forecast sites and apps: when a daily forecast says "lows of 0°C", should I expect the frosty night to be the previous one or the following one? And with "90% chance of rain", is that all day, or just starting at 10pm when I don’t really care? When trying to protect frost-intolerant plants, or just get the laundry dry, not knowing is quite annoying. A meteogram is a very nerdy way of solving this problem, but it does solve it&mdash;by displaying a time series chart of temperature, precipitation, and other values.

While there are [sites that will generate Meteograms for you](https://meteograms.com/), I decided to build my own software so that I could extend it, for example introducing logic to label good days for drying laundry outside, and overlaying calendar events so I can see them visually alongside the forecast.

An additional goal with the project was to use one of my original Raspberry Pi Model B units that is sat around gathering dust. The meteogram only needs to be regenerated once an hour, so it shouldn't be a demanding task requiring a more recent device. However, using such an old computer did cause a number of implementation problems, discussed down below.

The good (and almost unexpected) news is that the original Pi Model B does output enough power over USB for both the screen and a WiFi dongle. 

The bad news is that despite claiming to be compatible with all Raspberry Pi models, the screen is only tenuously "compatible" with the original Model B&mdash;no suitable USB adapter board is provided, the mounting holes don't line up, and the touchscreen doesn't work.

The low DPI of the screen (it is only 320 pixels high after all) is very noticeable, so while it's fine for this project and text is readable on the display, don't rush out and buy one thinking you're getting a screen with the same kind of pixel density as a smartphone.

If you're looking to copy this project for yourself, I would recommend at least a Pi 2 rather than an original Model B, as you'll have connectors and mounting holes that match, and probably a working touchscreen too. If you're going all the way to a Pi 3 or 4, consider the [DSI version of the screen](https://www.waveshare.com/11.9inch-DSI-LCD.htm) instead for a neater install.

## The Hardware & Operating System 

Setting up the hardware and the operating system was a little tricky due to the nature of the screen. I started by following the instructions from the [Waveshare Wiki page](https://www.waveshare.com/wiki/11.9inch_HDMI_LCD), "Working with Raspberry Pi" section:

* Flash an SD card with the Raspberry Pi 32-bit standard desktop image, using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
* Once complete, open `config.txt` on the SD card in a text editor and add the following: 

```
max_framebuffer_height=1480 
hdmi_group=2 
hdmi_mode=87 
hdmi_timings=320 0 80 16 32 1480 0 16 4 12 0 0 0 60 0 42000000 3
```

The wiki provides two ways of rotating the screen, one graphical inside the LXDE environment which is described as "for Raspberry Pi 4", and the other by adding `display_rotate=1` to `config.txt`, described as being "for older versions". I found that `display_rotate=1` only rotated the framebuffer display as the unit boots, and had no effect on the graphical environment, so I did not bother to set this. However, the graphical method of setting worked fine, even for my ancient Pi Model B.

Assemble onto screen – plastic spacers, tape over touching contacts, tape over green light, USB cable required 

Can't get past welcome screen 

Connect to normal monitor, keyboard, mouse to get past this stage 

Add wifi dongle - requires USB hub or swapping mouse/keyboard USB to get connected to the network 

Config (GUI or raspi-config) - desktop mode, auto login, enable SSH, disable screen blanking 

Screen config -> rotate to the right 

Right-click panel, Panel Settings, Advanced, Enable auto-hide 

Apply software updates (GUI or CLI), reboot if required 

Disable screen timeout part 2: 

Sudo echo "xserver-command=X -s 0 -dpms" >> sudo nano /etc/lightdm/lightdm.conf 

Shut down 

Tape over green light 

Reassemble back onto wide screen 

 

The software… 

 

SSH in 

git clone https://github.com/ianrenton/home-meteogram-display.git meteogram 

Cd meteogram 

Pip install -r requirements.txt 

Follow process described in readme 

 

The problem 

 

Kaleido arm6f, touchscreen 

 

The workaround 

 

Run on another home server 

/var/www/html shared as part of standard nginx configuration 

Cd /var/www/html/ 

Mkdir meteogram 

Sudo chown ian meteogram 

Sudo ln -sf /home/ian/meteogram/output.png meteogram.png 

Crontab 1 * * * * cd /home/ian/meteogram && python meteogram.py && cp output.png /var/www/html/meteogram/output.png 

 

Run on Pi 

Sudo apt install imagemagick feh unclutter 

Crontab 2 * * * * wget http://192.168.1.11/meteogram/output.png -O meteogram.png && env DISPLAY=:0.0 pcmanfm -w meteogram.png 

Run once: wget http://192.168.1.11/meteogram/output.png -O meteogram.png && env DISPLAY=:0.0 pcmanfm -w meteogram.png 

Autostart: 

Sudo nano /etc/xdg/autostart/setwp.desktop 

[Desktop Entry] 

Type=Application 

Name=setwp   

Comment=Set wallpaper to Meteogram 

Exec=wget http://192.168.1.11/meteogram/output.png -O meteogram.png && env DISPLAY=:0.0 pcmanfm -w meteogram.png 

 

echo "unclutter &" >> .xinitrc 

 

The enclosure & mounting 

 

Coming soon [cetacean needed] 

 

The future solution 

 

Pi 4, run on board, proper touchscreen support, better mounting. DSI version 

Plotly -> Matplotlib? 

Brightness control – hardware mods required http://capnbry.net/blog/?p=210