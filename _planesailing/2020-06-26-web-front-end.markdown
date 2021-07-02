---
comments: true
layout: post
title: Web Front-End
slug: web-front-end
---

Having put together the [antennas, receivers](./antenna-and-receiver/), [Raspberry Pis and processing software](./raspberry-pis-and-processing-software/), the finishing touch for the Plane/Sailing project is the web interface by which the data is displayed to the end user.

Luckily, I had already done most of the hard work in [UMID1090](https://github.com/ianrenton/umid1090), the predecessor to this project:

![UMID1090 Interface](/hardware/planesailing/umid1090.png){: .center}
*UMID1090 Interface*

For Plane/Sailing, I decided to drop some of the more complex options for configuring the software, and instead go for a full-screen map with only a few options hidden inside pop-out panels. I used the dark map background, blue highlights and [Exo font](https://fonts.google.com/specimen/Exo) from my [Career Explorer](https://careerexplorer.ianrenton.com/) to give it a more futuristic feel. It's not just an unnecessary military interface, it's an unnecessary *Hollywood military interface*.

Version 1 provided a more limited set of options and no track table:

![Plane/Sailing Interface](/hardware/planesailing/ui.png){: .center}
*Plane/Sailing Interface*

Version 2 re-added UMID1090's track table, and brought across a few extra configuration options.

<div class="notes"><p>Version 2 screenshot coming soon.</p></div>

And that's it&mdash;job done! ✈⛵🎉🍺

[Source code is available on Github](https://github.com/ianrenton/planesailing) and is in the public domain.