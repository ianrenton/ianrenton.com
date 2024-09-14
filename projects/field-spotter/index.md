---
comments: true
layout: page
title: Field Spotter
slug: field-spotter
description: "A mobile Amateur Radio spotting tool for POTA, SOTA & WWFF"
image: /projects/field-spotter/banner.png
date: 2024-09-12 00:00:00
---

"Field Spotter" is an easy-to-use, mobile-first Amateur Radio spotting tool for POTA, SOTA & WWFF. It provides a geographical and band position display, with filtering, to allow you to easily find park-to-park and summit-to-summit contacts.

It is provided as a web site, and also as a Progressive Web App for installation on mobile devices. Its simple UI and colour scheme make it ideal for use in the field.

[Click here to try it out, on desktop or mobile!](https://fieldspotter.ianrenton.com/)<br/><br/>

![Photo of Field Tracker being used on a phone, in a field](/projects/field-spotter/field-use-photo-1.jpg){: .center}

## Motivation

The [POTA](https://pota.app/) [SOTA](https://sotawatch.sota.org.uk/en/) &  [WWFF](https://wwff.co/dx-cluster/) websites have their own pages showing "spots", but these are generally text-based and ordered by time. As a European activator, I find that POTA in particular is also dominated by North American stations which I have no hope of contacting.

Instead of a text-based list, I wanted something based on a map display, so that for example when operating on the 40m band with an NVIS antenna I could see more local activations for park-to-park contacts, or on 20m I could zoom out to the rest of Europe.

The only software I found with most of the functionality I wanted was [GridTracker](https://gridtracker.org/), which is great, but only available as a desktop application. I don't tend to bring a laptop to my outdoor radio adventures, so I wanted something that worked on my phone instead.

## Development

Field Spotter was developed over the course of a week during September 2024.

The development process started with some sketched out mockups of how the user interface might look. I decided on a mobile-first interface which would be adapted for desktop, rather than the other way around, to improve its usability in the field.

![A page of a notebook with a GUI mockup drawn on it](/projects/field-spotter/sketch.jpg){: .center}

The layout started off looking rather like [Plane/Sailing](/hardware/planesailing) because I simply grabbed the code from that project and started hacking away at it. Field Spotter is not (yet?) as configurable in terms of map layers and overlays, and it uses different filters, different map markers and so on, but there is quite a bit of similarity there in the code.

The idea of mobile use also guided the development of the GUI to use a light theme rather than the dark theme that Plane/Sailing generally uses.

The first step in development was to hack out all the configurability and all the symbology used on the map, along with any other Plane/Sailing code that would not be unnecessary here. Then, I added the queries to the POTA and SOTA APIs and the mangling of data into a standardised data structure, and added markers to the Leaflet map to display them.

![Markers on a map](/projects/field-spotter/markers.png){: .center}

I decided to colour the markers using the same colour scheme as PSK Reporter, for those used to that way of identifying the different amateur radio bands. I then added popups to display more information about each spot, and a line joining the spot to "you" (determined by geolocation) to better illustrate the distance and bearing.

![Markers on a map, one with a popup](/projects/field-spotter/ss-desktop-popup-small-longrange.png){: .center}

I chose to implement three pop-out panels similar to Plane/Sailing, this time using simpler iconography. I also had them pop out of the side and become fullscreen on mobile devices, while remaining to the side on the desktop. This provides a less cluttered experience which is more suitable for using in the field.

![Mobile UI with three buttons shown](/projects/field-spotter/ss-mobile-buttons.png){: .center}

The information panel provides some helpful instructions, links, and a button to install the Field Spotter PWA to the home screen of mobile devices.

The config panel provides filtering options for programme, mode and band, to help you restrict your search to only what you are interested in. It also provides the ability to show only recent spots, and shows API query information.

![Mobile UI with config panel shown](/projects/field-spotter/ss-mobile-config.png){: .center}

The third, and most complex, of the pop-out panels was the band view.

One of the key features I wanted was the ability to pan the map to an area of interest containing multiple spots, and then see a graphical representation of where those spots were on the bands.

This allows you, for example, to pan the map to north-western Europe and select the 40m band, and then open the band display to find some NVIS park-to-park contacts. Or, you could zoom the map out to the whole of Europe, set it to the 20m band, and move up the dial contacting each activator in turn.

I originally intended this to be a horizontal panel at the bottom of the screen, but while this worked fine on the desktop, it was too cluttered to be useful on mobile. Taking inspiration from logging software such as N1MM that can show spots on a vertical list, I moved the band display so that it was full-screen on mobile and vertically oriented.

![Mobile UI with bands panel shown](/projects/field-spotter/ss-mobile-bands.png){: .center}

When the spots in view are in more than three bands, this view scrolls horizontally to allow space for all the bands and their spots to be shown. It can also scroll vertically if there are too many spots in a band, but normally the band is scaled to the full height of the window.

The same functionality is present when the site is viewed on a desktop browser as well.

![Desktop UI with bands panel shown](/projects/field-spotter/ss-desktop-bands.png){: .center}

Support for WWFF was a common request from folks trying out the software within the first couple of days, so I added this in afterwards, using the same approach as the other two programmes.

## Source Code and Issue Tracking

The software is hosted on Github at https://github.com/ianrenton/field-spotter and as usual it is released into the public domain. If you do want to take it and build something cool with it, please let me know about it!

If you find any problems or would like to request any new features, please create an issue [here](https://github.com/ianrenton/field-spotter/issues).


## Thanks to...

* The many organisers and volunteers behind the [POTA](https://parksontheair.com/), [SOTA](https://www.sota.org.uk/) and [WWFF](https://wwff.co/) programmes
* The [Online Amateur Radio Community](https://oarc.uk) for their feedback during development
* OH7FXK and OH3CUF for pointing me at WWFF spot resources
* The developers of the many JavaScript libraries on which Field Spotter is based: JQuery, Leaflet, FontAwesome, and Moment; plus the following Leaflet plugins: Extra Markers, Providers, Edge Buffer, Geometry Util, GridLayer.Fadeout, Terminator, Arc, Geodesic, and Overlapping Marker Spiderfier.
* The project logo is made up of the following Creative Commons images: [The mountains are waiting….NZ by Bernard Spragg on Flickr](https://www.flickr.com/photos/88123769@N02/15179004889), 
[Map Path by snodipper on Openclipart](https://openclipart.org/detail/281636/map-path)
