---
comments: true
layout: post
title: Web Front-End
slug: web-front-end
date: 2020-10-02 00:00:01
layout: post
---

Having put together the [antennas, receivers](./antenna-and-receiver/), [Raspberry Pis and processing software](./raspberry-pis-and-processing-software/), the finishing touch for the Plane/Sailing project is the web interface by which the data is displayed to the end user.

Luckily, I had already done most of the hard work in [UMID1090](https://github.com/ianrenton/umid1090), the predecessor to this project:

![UMID1090 Interface](/hardware/planesailing/umid1090.png){: .center}
*UMID1090 Interface*

For Plane/Sailing, I decided to drop the track table and all the complex options for configuring the software, and instead go for a full-screen map with only a few options&mdash;to change theme and to hide certain tracks to reduce clutter. I used the dark map background, blue highlights and [Exo font](https://fonts.google.com/specimen/Exo) from my [Career Explorer](https://careerexplorer.ianrenton.com/) to give it a more futuristic feel. It's not just an unnecessary military interface, it's an unnecessary *Hollywood military interface*.

![Plane/Sailing Interface](/hardware/planesailing/ui.png){: .center}
*Plane/Sailing Interface*

In addition to the code that pulls data from *Dump1090*, I extended it to also read in *AIS Dispatcher*'s KML data. This occurs at a slower interval since ships don't move as quickly as aircraft. As well as the vessel name, position, course and speed, vessel type, navigation status and destination are also extracted and displayed.

A few other modifications were made to the code to improve quality, provide a theme toggle, allow for the addition of sea ports, and fetch METAR & TAF (weather) data for airports.

![METAR Data](/hardware/planesailing/metar.png){: .center}
*METAR Data*

And that's it&mdash;job done! ✈⛵🎉🍺

[Source code is available on Github](https://github.com/ianrenton/planesailing) and is in the public domain.