---
comments: true
layout: post
title: System Architecture
slug: system-architecture
date: 2020-09-30 00:00:00
layout: post
---

<div class="notes"><p>This page still reflects Plane/Sailing version 1. Over Summer 2021, I'm upgrading Plane/Sailing to include a server-side component for better long-term tracking, adding APRS input for mobile amateur radio stations, moving the processing to a single modern Raspberry Pi for all three inputs, and conducting a visual overhaul of the web interface. This page will be updated to match soon!</p></div>

The Plane/Sailing system architecture is reproduced below. More information about each aspect of it is contained on the [other pages in the Plane/Sailing build guide](/hardware/planesailing/).

Please note that the choice to use two old Raspberry Pis was made in order to re-use old hardware I had lying around&mdash;if you are looking to recreate this project for yourself, I would recommend the use of a single Raspberry Pi 4, which will simplify the system.

![Plane Sailing system architecture](/hardware/planesailing/arch.png)