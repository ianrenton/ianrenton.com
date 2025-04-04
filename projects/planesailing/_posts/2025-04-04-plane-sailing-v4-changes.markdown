---
comments: true
layout: post
title: 'Plane/Sailing v4 Changes'
slug: plane-sailing-v4-changes
last_update: 2025-04-04T00:00:00+00:00
---

This page lists the differences between versions 2 & 3 of Plane/Sailing, which were architecturally very similar, and version 4, which is a significant step. My intention is to keep the main build guide up-to-date with the latest state of the system, as this will be of most interest to readers, while maintaining pages like this one to explain what's changed for returning visitors.

![Plane/Sailing v4 Interface](/img/projects/planesailing/ui4.png){: .center}
*Plane/Sailing v4.0*

## The Client/Server Merge

The big step between version 3 and version 4 is the combination of client and server software into a single package.

Versions 2 & 3 of Plane/Sailing located their client and server applications on different networks, and their code in different repositories. This was designed to meet my desire to have the server application running on my local network, while the front-end files were served from via GitHub Pages, and therefore needed to be in a separate repository.

As of Plane/Sailing v4, this is no longer the case. The two have been merged, and a single application now handles both the back-end data management & API, and serving the front-end HTML/CSS/JS.

This decision was made after watching several people struggle to get the system set up, and seeing their confusion over the various potential architectures. The majority of users just wanted one thing they could slap on a Raspberry Pi and have it all just work, and therefore that is what I have pivoted to in v4.

The [old "server" repository](https://github.com/ianrenton/planesailing-server) is now deprecated, with the [main repository](https://github.com/ianrenton/planesailing) now hosting the Java application and, within it, the client-side files.