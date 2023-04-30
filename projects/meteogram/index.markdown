---
comments: true
layout: page
title: Home Meteogram Display
image: /projects/meteogram/headline.jpg
---

My Home Meteogram Display is based around a Raspberry Pi and a small ultra-wide aspect ratio screen. It lives in the kitchen and provides a passive weather and calendar display tailored to our needs. The build process is documented below and all code is open source.

![The Meteogram display showing weather and calendar events on an ultra-wide screen](banner.jpg){: .center}

## The Goal

As explained in my earlier [blog post](/blog/making-meteograms-in-python/), I came up with the idea of doing a [Meteogram](https://en.wikipedia.org/wiki/Meteogram) display to solve my issues with most weather forecast sites and apps: when a daily forecast says "lows of 0°C", should I expect the frosty night to be the previous one or the following one? And with "90% chance of rain", is that all day, or just starting at 10pm when I don’t really care? Whether trying to protect frost-intolerant plants, or just trying to get the laundry dry, not knowing is quite annoying. A meteogram is a very nerdy way of solving this problem, but it does solve it&mdash;by displaying a time series chart of temperature, precipitation, and other values.

While there are [sites that will generate Meteograms for you](https://meteograms.com/), I decided to build my own software so that I could extend it, for example introducing logic to label good days for drying laundry outside, and overlaying calendar events so I can see them visually alongside the forecast.

Having these additional features on a passive display in the house means I no longer have to check the forecast on my phone to decide whether I need a coat with me, or to figure out day-by-day when I can get the laundry out.

## The Hardware Design

Despite the stated goals, this project largely came about because I saw [these Waveshare ultra-widescreen displays](https://www.waveshare.com/11.9inch-hdmi-lcd.htm) and thought they looked cool, so came up with a project based around one.

![A Waveshare ultra-widescreen display](screeninbox.jpg){: .center}

An additional aim with the project was to use one of my original Raspberry Pi Model B units that is sat around gathering dust. The meteogram only needs to be regenerated once an hour, so it shouldn't be a demanding task requiring a more recent device. However, using such an old computer did cause a number of implementation problems.

The good (and almost unexpected) news is that the original Pi Model B does output enough power over USB for both the screen and a WiFi dongle. 

The bad news is that despite claiming to be compatible with all Raspberry Pi models, the screen is only tenuously "compatible" with the original Model B&mdash;no suitable USB adapter board is provided and, the mounting holes don't line up.

The low DPI of the screen (it is only 320 pixels high after all) is very noticeable, so while it's fine for this project and text is readable on the display, don't rush out and buy one thinking you're getting a screen with the same kind of pixel density as a smartphone.

<div class="notes"><p>If you're looking to copy this project for yourself, I would recommend at least a Pi 2 rather than an original Model B, as you'll have connectors and mounting holes that match. If you're going all the way to a Pi 3 or 4, consider the <a href="https://www.waveshare.com/11.9inch-DSI-LCD.htm">DSI version of the screen</a> instead for a neater install.</p></div>

## The Software Design

With most of my recent projects being Java, C, and JavaScript-based, I thought I would use this as an excuse to get back into Python. I hadn't done any real Python since my Fantasy Football team picker back in 2009!

The two main chart plotting packages for python appear to be [Plotly](https://plotly.com/) and [Matplotlib](https://matplotlib.org/). I went with Plotly as it seemed more modern and with an easier-to-understand API&mdash;although that may not have been the right choice for a Raspberry Pi as old as mine, as described later on!

I also designed its output to be simple, rendering to a file which can then be displayed by a separate utility on the computer, rather than displaying its own screen or allowing any interactivity. This was another concession to use on an old device&mdash;I didn't want to waste effort and processing power displaying my own user interface, when Linux already has many simple solutions to displaying a full-screen image.

I chose the UK Met Office's API to provide the data for the meteogram, on the basis that I have found its forecasting the most reliable out of the many services available.

Bars below the meteogram itself were added to show logic-based conditions (laundry day, frost and storm) and calendar events sourced via iCal.

![An example output from the meteogram software](example.png){: .center}

The software is tailored to fit the ultra-wide aspect ratio screen, but I have built it to be as customisable as possible, including over two dozen config parameters to set size, layout, features and colours.

The software is open source and can be found at [https://github.com/ianrenton/home-meteogram-display](https://github.com/ianrenton/home-meteogram-display).

## The Hardware Setup

The first problem that becomes apparent when trying to integrate the screen and Raspberry Pi is that while their website *says* the screen is compatible with all models of Raspberry Pi, the fitting kit and the position of the mounting holes is only suitable for newer models. When attached using the HDMI-to-HDMI board, the USB-to-micro USB board does not line up:

![The Pi mounted to the screen, showing the USB connector not lined up](usblineup.jpg){: .center}

A short USB cable was therefore required to connect the two. It took me a couple of tries to find one that worked&mdash;apparently a bunch of the old micro USB cables I had in the drawer were "charge only" rather than providing data connectivity, which resulted in the touchscreen not working later on. I also fitted a WiFi dongle at this stage:

![The Pi mounted to the screen, with a USB cable and WiFi dongle](cableattached.jpg){: .center}

Since the mounting holes in the Pi do not line up with the ones on the screen PCB, and we are only solidly connected using a single connector (HDMI), the Pi can move around slightly, and more worryingly the back of its GPIO pins can contact some of the metal parts of the screen's PCB.

![The Pi mounted to the screen, showing points of accidental contact](touchpoints.jpg){: .center}

I worked around this problem by fitting some ~8mm nylon PCB spacers to the underside of the Pi to keep it from touching the other board, and for good measure covered any likely-looking contact points with electrical tape. I also taped over the very bright green LED on the screen's PCB.

![The Pi with spacers attached to the underside](pispacers.jpg){: .center}

![The screen PCB with highlighted points taped over](touchpoints-covered.jpg){: .center}

## The Operating System Setup

Setting up the operating system was a little tricky due to the nature of the screen. I started by following the instructions from the [Waveshare Wiki page](https://www.waveshare.com/wiki/11.9inch_HDMI_LCD), "Working with Raspberry Pi" section:

* Flash an SD card with the Raspberry Pi 32-bit standard desktop image, using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
* Once complete, open `config.txt` on the SD card in a text editor and add the following: 

```ini
max_framebuffer_height=1480 
hdmi_group=2 
hdmi_mode=87 
hdmi_timings=320 0 80 16 32 1480 0 16 4 12 0 0 0 60 0 42000000 3
```

The wiki provides two ways of rotating the screen, one graphical inside the LXDE environment which is described as "for Raspberry Pi 4", and the other by adding `display_rotate=1` to `config.txt`, described as being "for older versions". I found that `display_rotate=1` only rotated the framebuffer display as the unit boots, and had no effect on the graphical environment, so I did not bother to set this. However, the graphical method of setting worked fine, even for my ancient Pi Model B.

But to get to that point, you have to get past the Raspberry Pi OS welcome screen. As you can see, it doesn't fit on this strangely-proportioned screen, and neither is there any way to move it:

![Part of the welcome screen shown on the display](welcomescreen.jpg){: .center}

To get past this stage, I needed to connect the Pi to a normal monitor, keyboard and mouse. I used a USB hub so that I could keep my WiFi dongle connected as well on my 2-USB-port Pi.

I then used the GUI configuration utility to enable automatic login in desktop mode, disable "screen blanking" (a 10-minute screensaver), and enable SSH. (The command-line `raspi-config` utility can also be used for this.) I also enabled VNC at this stage for easier debugging of GUI problems&mdash;this is unfortunately RealVNC rather than a F/OSS VNC implementation, but although the desktop clients will beg you to create an account, you don't have to; the server is also free on the Pi.

![The Raspberry Pi configuration utility, with automatic login enabled](autologin.jpg){: .center}

I set the panel to auto-hide (right-click panel, Panel Settings, Advanced, Enable auto-hide) and its size when auto-hidden to 6 pixels. The 6 pixels is due to a later discovery that the touchscreen makes it hard to get the cursor to exactly the top pixel of the screen; setting it to be the top 6 pixels allows touch controls to bring up the menu much more easily.

I also configured the WiFi adapter to join my home network, and applied all available software updates at this point.

The remaining steps were to disable another aspect of screen timeout: 

```bash
sudo echo "xserver-command=X -s 0 -dpms" >> sudo nano /etc/lightdm/lightdm.conf 
```

And finally to rotate the screen, by going to Preferences, Screen Configuration, Layout, HDMI-1, Rotation, right. (Done last of course, because it's very annoying to have the wrong rotation on your normal desktop monitor!)

After this was completed, I shut down the Pi and reassembled it back onto the rear of the screen, then started it up again.

Initially the touchscreen controls were not rotated to match the screen; this was fixed by long-pressing (~5 seconds) the "Rotate Touch" button on the rear of the screen three times.

## The Software Setup

I then attempted to set up the meteogram software on the Pi. Raspberry Pi OS comes with Git, Python 3 and Pip preinstalled, so there's nothing to do in that regard. I connected to the Pi via SSH and ran the following:

```bash
git clone https://github.com/ianrenton/home-meteogram-display.git meteogram 
cd meteogram 
pip install -r requirements.txt 
```

## The Problem 

Here is where I ran into the big show-stopper for using the original Raspberry Pi Model B. In order to output image files of the meteogram, Plotly uses a dependency called [Kaleido](https://pypi.org/project/kaleido/). This includes native binaries which are not available for the original Pi's venerable `armv6l` architecture.

Kaleido is the successor to Plotly's previous library, Orca. I investigated that hoping it would be a simpler and more backwards-compatible approach. Unfortunately I discovered that *Kaleido* was the simple approach&mdash;Orca uses `npm` to spin up a whole Electron- and Chromium-based server application to render the output! I avoided this on account of it sounding horrendous.

I didn't really want to change the Pi or rewrite the software at that point, so I implemented a temporary workaround. (As with all software workarounds, one likely to remain in place for years until the original reason for it is lost to time.)

## The Workaround 

The temporary workaround I chose was to generate the meteogram on another home server (of which I have several, because of course I do), this one running a normal 64-bit Intel processor. I then made the image available to the network using a web server.

#### The Web Server
I already had Nginx running on this server, serving various websites when accessed with a proper URL from outside the network. However, it still had the default site enabled, serving the contents of `/var/www/html` in response to queries direct to its IP address from inside the network.

I set up a new folder to hold the meteogram output, set my user to own it:

```bash
cd /var/www/html/ 
sudo mkdir meteogram
sudo chown ian meteogram
```

I set the meteogram script itself to run automatically using cron, one minute after the hour (to give the API a chance to update its forecast data), and to copy the output to the web server directory, by running `crontab -e` and adding:

```bash
1 * * * * cd /home/ian/meteogram && python meteogram.py && cp output.png /var/www/html/meteogram/output.png
```

I also of course, ran the script manually and verified that the image was available on the web server.

#### The Pi

Moving over to the Pi, I removed the meteogram code as we wouldn't be needing it. Instead, the Pi's job is now to download the image from the web server and display it as its wallpaper.

The Raspberry Pi OS uses the LXDE desktop environment and `pcmanfm` as a file manager that is also responsible for rendering the desktop.

I achieved the required display output by running the following commands:

```bash
wget http://192.168.1.11/meteogram/output.png -O meteogram.png
env DISPLAY=:0 pcmanfm --desktop
env DISPLAY=:0 pcmanfm -w meteogram.png
```

The middle command is to avoid a "Desktop Manager not active" alert on the GUI that I sometimes encountered when setting the wallpaper from the cron job&mdash;an annoying callback to all those photos of ATMs and train departure boards obscured by Windows error messages:

![The screen showing an error message in front of the meteogram](desktoperror.jpg){: .center}

I then added a cron job on the Pi, running at two minutes past the hour, to execute the same commands. Unfortunately interacting with the desktop from cron requires exporting some extra environment variables, so for this I decided to create a script file, `setwp.sh`:

```bash
#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/ian/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1000

wget http://192.168.1.11/meteogram/output.png -O meteogram.png
pcmanfm --desktop
pcmanfm -w meteogram.png
```

And then call this from a cron job:

```bash
2 * * * * ./setwp.sh
```

I also wanted to ensure the same script was run when the Pi was restarted, as soon as the graphical environment was available, so it displayed the output immediately rather than waiting until the next two-minutes-past-the-hour. To do this, I created a file at `/etc/xdg/autostart/setwp.desktop` with the following contents:

```ini
[Desktop Entry] 
Type=Application 
Name=setwp   
Comment=Set wallpaper to Meteogram 
Exec=cd /home/ian && ./setwp.sh
```

The finishing touch on the Pi was to disable the cursor when not in use, so it's not visible on the display under normal circumstances. I achieved this using the `unclutter` utility:

```bash
sudo apt install unclutter
unclutter &
echo "unclutter &" >> ~/.xinitrc 
```

The setup of hardware and software (albeit with a horrible workaround) was then complete.

![The Meteogram display showing weather and calendar events on an ultra-wide screen](banner3.jpg){: .center}

## The Enclosure & Mounting 

Coming soon <sup>[<a href="https://boingboing.net/2013/08/06/cetacean-needed-wikipedia-wha.html">cetacean needed</a>]</sup>

## The Future Solutions

Using a second computer to run the meteogram script is, let's face it, a bit of a hack. There's a couple of ways I may work around this in future so that the project is self-contained:

1. Replace Plotly with Matplotlib. This would involve a huge rewrite of the code, which I'm not super keen on doing, but it would hopefully allow rendering the image on an `armv6l` processor. It looks like its API is not as nice as Plotly's, and it's a bit less modern, but it should avoid the complications of Plotly's "web-first" approach using Chromium binaries just to output an image.
2. Provide a web-based display on the Pi. Plotly would probably prefer to be used this way, rendering to a web page that can be full-screened to display in the way required. It could also be made interactive. However, this is a heavyweight approach that's not ideally suited to the slow processor of the original Pi.
3. Replace the original Model B with a Pi 4. This would mount properly on the screen, and be able to run the meteogram script properly thanks to its more modern CPU architecture. I was originally trying to avoid this as the software would be using a tiny fraction of the computer's power&mdash;however, perhaps this would provide the most elegant solution despite that.

I would also like to add time-based or automatic control of the screen backlight brightness. This is unfortunately not a simple software change but [one that requires hardware mods](http://capnbry.net/blog/?p=210) and so will wait until another day!