---
author: Ian
comments: true
date: 2013-02-20 21:35:20
layout: post
slug: tank-day-24-from-i2c-to-http
title: 'Tank Day 24: From I2C to HTTP'
wordpress_id: 13454
categories:
- Raspberry Tank
tags:
- Build Diary
- Code
- HTTP
- I2C
- JavaScript
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Software
- Web
---

Last time around, on [day 23](../day-23-range-and-bearing) of the build diary, we connected up an I2C rangefinder and compass module to the Raspberry Pi, and checked their functionality using stand-alone applications. Today, we're going to integrate them into the main code that runs the tank, `rt_http`.

## Step 1. To the C!

Each of the sensors was [provided with a few lines of C code](http://robot-electronics.co.uk/htm/raspberry_pi_examples.htm) which could be used to read data from them and display it on the screen.

It proved very easy to combine these into a single routine -- we don't need to open and close the I2C port once for the compass and again for the rangefinder -- and add it to `rt_http`. The new sensor sampling routine runs in its own thread, and every second or so uses a mutex lock to dump the sensor readings to global variables. (Hardly elegant, I know.)

It also dumps the readings to `stdout` for debug purposes, which you can see in action below.

[![rt_http Console Output](http://files.ianrenton.com/sites/raspberrytank/console.png)](http://files.ianrenton.com/sites/raspberrytank/console.png)<br/>
_rt_http Console Output_

You can [download the latest rt_http code from GitHub](https://github.com/ianrenton/raspberrytank/tree/master/rt_http).

## Step 2. The Trouble with Javascript

The intention was to add more functionality to the embedded HTTP server by providing a URL (e.g. `http://raspberrytank:3000/?get`) that could be used to return this data. I tried this and it worked fine -- you can still see the code in `rt_http.c`, although it is commented out.

The problem is that I wanted to display the sensor data on the main web interface, and the best way to do this is using JavaScript (in my case, using the jQuery library) to request the URL and insert the results into a `<div/>` on the page. That _would_ work in this case, except that the server that provides the Web UI pages runs at `http://raspberrytank:80/`, while the Mongoose server embedded in `rt_http` runs at `http://raspberrytank:3000` -- a different port. Web browsers perceive this as a different domain, and therefore to prevent cross-site request forgeries, they prevent JavaScript from being able to query the Mongoose server.

As a work-around, I decided to put the sensor data somewhere that `lighttpd` -- the server behind the main web interface -- could find it. Unfortunately I achieved this by getting the sensor polling function to write the sensor data to `/var/www/sensordata.txt` as well as `stdout`.

There are a few problems with this: it assumes that the web UI will be served from `/var/www`, there is a potential conflict if the web server tries to read the file while the control code is writing to it, and it's just plain _ugly_. But it works. I will make this more elegant later!

## Step 3. Pulling in the Sensor Data

As I mentioned just now, the Web UI now uses jQuery to pull the sensor data into the web pages it serves. This is done with a `$.get()` request using the jQuery library, which fires once a second.

If the file is being written to at the point the JavaScript tries to read it, it will look as if the file is blank, so if this is the case then the web page isn't updated.

## Step 4. Forking the Web UI

The Web UI previously existed as a portrait-orientated interface that assumed the user was using a touch device such as a tablet or phone. As we discovered to our cost on [day 17](../day-17-whats-missing/), the "press and hold" behaviour we used for the control buttons wasn't appropriate for these devices, so we had to drop back to using a single press to start an action and a single press on the STOP button to stop it.

During testing I have mostly been using a laptop. Not only is "press and hold" possibly on a laptop, it's much more user-friendly. A landscape orientation would also be much more usable on a laptop screen.

For this reason, the Web UI now comes in two flavours -- laptop (non-touch) and phone/tablet (touch).  Visiting `http://raspberrytank/` will give you a menu to choose which UI you prefer.

An example of the new laptop orientation, including the sensor data, is shown below.

[![Laptop Web UI with Sensor Data](http://files.ianrenton.com/sites/raspberrytank/web-600x364.png)](http://files.ianrenton.com/sites/raspberrytank/web.png)<br/>
_Laptop Web UI with Sensor Data_

As always, [the Web UI code is available on GitHub](https://github.com/ianrenton/raspberrytank/tree/master/web-ui).

All my code is released under the free, open-source BSD licence. (But we do use libraries such as Mongoose and jQuery that have their own licence terms.)
