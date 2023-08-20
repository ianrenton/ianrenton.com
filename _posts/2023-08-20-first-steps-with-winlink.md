---
layout: post
title: First Steps with Winlink
date: 2023-08-20 15:59 +0100
image: /blog/2023/varahf-small.jpg
tags:
  - radio
  - hamradio
  - amateurradio
  - winlink
---

Just in time for this week, I saw [a post from W0RMT](https://m.ai6yr.org/@bud_t/110910324360858296) advertising a Friday Winlink net, and figured I should take part!

[Winlink](https://winlink.org/) is a digital radio system that I'd not really considered using before. In terms of digital ham radio modes I've mostly played with the likes of FT8, seeing how many distant grid squares I can make a contact with, and SSTV, for sharing distorted cat photos. In contrast to those modes, Winlink doesn't typically see you make direct contact with other users' radios. Instead, it's more like sending mail or USENET posting in the early days of dialup internet, or Short Burst Data via satellite&mdash;you compose a message offline, dial into a gateway via radio, and the software will then send your message followed by downloading any you have waiting for you. The gateways are themselves linked via the internet, so you're not restricted to talking to people on the same gateway, and there is a bridge to and from regular email as well.

It took a couple of hours in total to get set up and send my first email via HF, for which [this guide](https://cgilligan.medium.com/how-to-set-up-and-use-winlink-for-hf-amateur-radio-8e2af7e8dc54) was extremely helpful. I skipped most of the CAT control sections as I don't have the cable for my radio.

A couple of things that weren't covered by that page, and therefore I had to figure out for myself:

1. The Winlink software displays two frequencies, "dial frequency" and "centre frequency". I wasn't entirely clear what these meant, or what mode the radio should be set to. Initially I wondered if two different frequencies were used, similar to the Tx/Rx split on an FM repeater, which would cause real problems without CAT control! However, that's not the case. I noticed that "centre frequency" was always 1.5kHz above "dial frequency", and from that figured out what was going on: "dial" in "dial frequency" is used in the sense of the round thing on the front of the radio, not "dialling in". The centre frequency used by the digital mode is 1.5kHz above this because it's in the middle of the ~3kHz bandwidth used in Upper Side Band mode. (And the radio should remain set to USB mode regardless of operating band.)
2. ARDOP is the protocol recommended by the tutorial, and most of my time was spent trying to get a connection via this method. I eventually gave up and tried Vara HF instead, which requires a separate download of the software modem (compared to ARDOP which is built-in). Vara HF is a bit of an oddity in ham radio software in that it costs quite a bit and nags you to buy the full version, but even with the free limited version I was much more successful in connecting with Vara HF than I was with ARDOP.
3. If you want to send email to a Winlink address from the outside world, the Winlink user first needs to [add the email address to their whitelist](https://winlink.org/content/how_manage_your_whitelist_spamcontrol) as a spam prevention measure. The telnet (internet-connected) mode of Winlink can be useful at this point to avoid chewing up the airwaves with managing your blocklist. The email sender can also [start the subject line with `//WL2K`](https://winlink.org/HELP) to send it regardless.

![Vara HF in use](/blog/2023/varahf.jpg){: .center}

*The Vara HF interface when connected (very slowly) to a Winlink gateway*

The whole system is of course subject to the vagueries of HF communication. The software helps you find gateways that should be on your propagation path, but the ionosphere may just decide it doesn't like you today. And with only one frequency per gateway, the risk of being talked over is always there. I had most luck on the 30m/10MHz band, but your mileage will vary.

I had a lot of fun setting it up and sending/receiving emails from a computer not connected to a network. I can't see this being a service I use regularly, though there are various attempts to get "normally-connected" people using it, such as the Friday net mentioned above; you can even [play Wordle on it](https://winlink.org/content/play_hamword).

I have a colleague whose retirement plan involves a round-the-world sail though, and here's where services like Winlink come into their own, hundreds or thousands of miles from internet infrastructure. It would be a fun way to keep in touch when that happens. Given a choice of communication methods from the middle of the ocean, I think I'd still pick a satellite phone, but it's nice to know Winlink exists as a fallback.