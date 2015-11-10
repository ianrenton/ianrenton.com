---
layout: post
title: "Tank Day 27: More Power!"
date: 2013-12-14 14:15
comments: true
categories: 
tags:
- power
- battery
- sparks flying everywhere
---

It's been a while since the last Raspberry Tank diary entry, so the first step today was to dust off the tank&mdash;literally. And why use a duster when you can use a can of compressed air!

{% img center http://files.ianrenton.com/sites/raspberrytank/airduster.jpg The Raspberry Tank with air duster %}

One of the problems that is stopping the Raspberry Tank being as fun as it could be is its battery. As shipped from the Heng Long factory, the Tiger I tank has a 1700mAh Ni-Cd battery. The specs of this battery aren't detailed anywhere, but I assume it was specced to be as cheap as possible while being capable of supplying the main drive motors with the ~6A of current they need at peak. Out of the box, this gives the tank about 30 minutes of play time before the battery needs to be recharged with its dubious [Shenzen special](http://www.evilmadscientist.com/2009/a-visit-to-the-electronics-markets-of-shenzhen/) charger.

The Raspberry Pi, webcam, wifi dongle and I2C components we have added to the tank, combined with the innate inefficiencies of the voltage regulators, are drawing a constant current of roughly 2A from the battery, resulting in a "play time" of only around 15 minutes. It also seems that the peak current draw from the battery is not much above 6A, as when the motors are engaged while the battery is low on charge, the electronics "brown out"&mdash;there extra current draw drops the supply voltage briefly, and the Raspberry Pi locks up.

There's a simple solution to these problems&mdash;replace the battery.

There are batteries that have a much greater energy density and a much bigger maximum current draw and are available very cheaply. I chose a [ZIPPY Compact 4000mAh 2S 25C Lipo Pack](http://hobbyking.co.uk/hobbyking/store/uh_viewItem.asp?idProduct=21359) battery which was around $20 with shipping. (But before you rush out and buy one for your own build, you need to read the rest of this page first!)

{% img center http://files.ianrenton.com/sites/raspberrytank/charging.jpg The new battery charging %}

The 4000mAh capacity will give us more than double the play time, while the 25C constant, 35C peak discharge rate means that the Raspberry Tank could draw a constant 100A from the battery&mdash;far more than it needs (at least until we replace that BB gun with a railgun...)

{% img center http://files.ianrenton.com/sites/raspberrytank/newbattery.jpg The new battery %}

You may notice the connector has been removed from the battery in that image, leaving bare wires. The battery comes with an HXT discharge connector, which is different to the Tamiya connector on the tank. Rather than swapping one with the other, I chose to replace both with the much smaller, neater [XT60 connector](http://hobbyking.co.uk/hobbyking/store/uh_viewItem.asp?idProduct=44333).

It probably goes without saying, but **be incredibly careful** when doing this. I wandered around the building with those battery terminals stripped back, and managed to touch them together with my thumb&mdash;in front of a bunch of electrical engineers, no less. While I look forward to a future of never living that down, don't make the same mistake yourself. It could go a lot worse!

{% img center http://files.ianrenton.com/sites/raspberrytank/xt60.jpg New XT60 connectors on the battery, and new wires to put inside the tank. %}

I chose thick 12 AWG wire here, but you can and probably should use something smaller. 12 AWG is a nice fit in the XT60 connectors, but the wire is very stiff and does not bend well inside the tank, as you can see in the following photo.

Rather than re-soldering my new wires onto the tank's power switch, I chose to instead put them into the choc block that joins the other common power lines inside the tank. Heng Long's standard of soldering is almost as bad as mine, and I didn't fancy my chances of making a good connection, especially since the switch is glued into the tank chassis and cannot be removed.

{% img center http://files.ianrenton.com/sites/raspberrytank/newbatteryinternals.jpg The internals of the tank to support the new battery %}

Here comes the reason why I told you to wait before buying that battery&mdash;it's too long. I measured the Tiger I's battery compartment as 135mm long, then forgot all about it and bought a battery that was 145mm long. If you're following along, you may want to buy a different battery.

I contemplated drilling out the end of the battery compartment, but for now I have installed the battery inside the main electronics compartment, above the right-hand tracks. Luckily the shape of the tank leaves a lot of space inside, but it's becoming apparent that the rear panel of the tank is never going to get attached again!

This is what the Raspberry Tank now looks like from the rear:

{% img center http://files.ianrenton.com/sites/raspberrytank/newbatteryinstalled.jpg The new battery installed in the tank %}

Combined with the second identical battery that I bought at the same time, the Raspberry Tank now has nearly an hour of "play time"&mdash;perfect for evenings at the [hackerspace](http://www.constructorium.org). Power brown-outs are also a thing of the past.

Merry Christmas!

{% img center http://files.ianrenton.com/sites/raspberrytank/christmas.jpg The Raspberry Tank in front of the Christmas tree %}