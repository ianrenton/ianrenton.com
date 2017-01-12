---
author: Ian
comments: true
date: 2012-06-20 13:16:36
layout: post
slug: tank-day-9-power-to-the-pi
title: 'Tank Day 9: Power to the Pi'
wordpress_id: 12942
categories:
- Projects
- Raspberry Tank
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
---

[Last time around](../tank-day-8-it-lives/), we proved that the Raspberry Pi could indeed be integrated into a Heng Long Tiger I RC tank, and so control its functions.  That's a significant achievement, but there's plenty more to do.

Firstly and most importantly, we can't yet drive the tank around because the Raspberry Pi is still dependent on a power source, keyboard input and video output -- each of which is a cable connecting the tank to a computer.  On day nine of the build diary, we cut one of those dependencies, resulting in a Raspberry Pi that is powered from the tank's internal battery.   Compared to previous days, this was a relatively simple matter.

The tank's power supply comes from a 7.2V NiCd battery.  The Pi's power input is a very strict 5V ±5%, so we sourced a component that could convert one to the other.  The Pi's maximum current draw of around 1A was also a consideration.  A cheap voltage regulator such as the ubiquitous LM7805 could do the job, but it would need protective capacitors in parallel with it, and would also give us a heat dissipation problem -- the regulator would get rather hot stepping 7.2V down to 5V at 1A, and the plastic body of the tank gives us no convenient heat sinks.

Instead of a regulator, a switching DC/DC converter was chosen, specifically a [Recom R-785.0-1.0](http://uk.rs-online.com/web/p/dc-dc-converters/6727124/?searchTerm=672-7124&relevancy-data=636F3D3126696E3D4931384E525353746F636B4E756D6265724D504E266C753D656E266D6D3D6D61746368616C6C26706D3D5E5C647B337D5B5C732D2F255C2E5D5C647B332C347D2426706F3D313426736E3D592673743D52535F53544F434B5F4E554D424552267573743D3637322D373132342677633D4E4F4E4526).  This provides exactly the voltage and current output we need, with a higher efficiency so less heat dissipation. The tank's 7.2V battery is well within its input range, even accounting for possible voltage drops when the battery charge is low.

This component was bought and soldered to a small piece of veroboard, with flying leads to connect to the tank's power supply (via our choc block) and a hacked-up microUSB cable to connect to the Raspberry Pi.  (The USB cable I chose to cut up had the normal red, black, green and white cores as expected, but the black core was just a strain member -- full of fluff -- whilst the ground line was actually connected to the screen. I'm not sure how common this is, so watch out for it if you are recreating this build.)

[![DCDC Converter](/raspberrytank/IMG_20120619_135946-300x155.jpg)](/raspberrytank/IMG_20120619_135946.jpg)<br/>
_Raychem hides many sins._

Once built, this board was tested with a power supply providing the 7.2V and a multimeter checking the 5V output.  Once I was happy that the output was clean and at the right voltage, the Raspberry Pi itself was connected and booted up.  During the boot process, the current draw on the 7.2A side peaked at 550mA, coming to stabilise at around 250mA once the Pi was idle.

(**Warning** to anyone recreating this build: Please use a bench power supply at this stage, don't go straight for the tank's battery as a power source.  Dodgy wiring or soldering could short the battery, leaving you with an exploded mess where your tank once was.)

[![Raspberry Pi powered from 7.2V Supply](/raspberrytank/IMG_20120619_135849-300x225.jpg)](/raspberrytank/IMG_20120619_135849.jpg)

Once I was sure that the power supply to the Raspberry Pi was working correctly, we _then_ switched out the bench power supply for the tank's battery.  And voila -- we now have the tank powering the Pi as well as itself.

With the upper chassis removed, the tank now looks like this:

[![Current State of Raspberry Tank's Lower Chassis](/raspberrytank/IMG_20120619_141830-600x389.jpg)](/raspberrytank/IMG_20120619_141830.jpg)

In case you've lost track over the last few days of the build diary, the electrical schematic now looks like this (including the upper chassis):

[![Raspberry Tank Schematic (Day 9)](/raspberrytank/raspberry-tank-schematic-309x500.png)](/raspberrytank/raspberry-tank-schematic-1.png)

You can download that as an SVG file here: [Raspberry Tank Schematic (Day 9)](/raspberrytank/raspberry-tank-schematic-1.svg)

Next time on the Raspberry Tank build diary, we will be integrating a WiFi dongle into the tank and enabling SSH on the Raspberry Pi in order to remove the last two cables keeping the tank from roaming freely.
