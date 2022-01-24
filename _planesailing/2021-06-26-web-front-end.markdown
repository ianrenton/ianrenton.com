---
comments: true
layout: post
title: Web Front-End
slug: web-front-end
last_update: 2021-08-14T00:00:00+00:00
---

Having put together the full set of server-side processing software, the finishing touch for the Plane/Sailing project is the web interface by which the data is displayed to the end user.

Luckily, I had already done most of the hard work in [UMID1090](https://github.com/ianrenton/umid1090), the predecessor to this project:

![UMID1090 Interface](/hardware/planesailing/umid1090.png){: .center}
*UMID1090 Interface*

For Plane/Sailing, I decided to drop some of the more complex options for configuring the software, and instead go for a full-screen map with only a few options hidden inside pop-out panels. I used the dark map background, blue highlights and [Exo font](https://fonts.google.com/specimen/Exo) from my [Career Explorer](https://careerexplorer.ianrenton.com/) to give it a more futuristic feel. It's not just an unnecessary military interface, it's an unnecessary *Hollywood military interface*.

Version 1 provided a more limited set of options and no track table:

![Plane/Sailing v1 Interface](/hardware/planesailing/ui.png){: .center}
*Plane/Sailing v1*

Version 2 re-added UMID1090's track table, and brought across a few extra configuration options, along with the major rewrite in order to have it communicate with a dedicated back-end Plane/Sailing server rather than directly accessing data within Dump1090 and AIS Dispatcher.

![Plane/Sailing v2 Interface](/hardware/planesailing/ui2.png){: .center}
*Plane/Sailing v2*

Subsequent minor versions have improved the UI and added more features, such as selectable background layers and overlays, classifying targets, and accessing server telemetry.

![Plane/Sailing v2.1 Interface](/hardware/planesailing/ui2.1.png){: .center}
*Plane/Sailing v2.1*

![Plane/Sailing v2.3 Interface](/hardware/planesailing/ui2.3.png){: .center}
*Plane/Sailing v2.3*

[Source code is available on Github](https://github.com/ianrenton/planesailing) and is in the public domain.

I host the front-end using GitHub Pages, as it's an easy way to make it available given that the software is already hosted there. If you're replicating this build for yourself, you can of course do the same, or alternatively it could be hosted from the same Raspberry Pi that runs the rest of the software if you prefer.