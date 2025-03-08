---
layout: post
title: "Hotel Room HF Adventures"
date: 2025-03-06 00:00 +0000
image: /img/blog/2025/03/hotel-8-small.jpg
slug: hotel-room-hf-adventures
description: "All the fun of low power operation, now also with S9 noise"
tags:
  - ham-radio
  - radio
  - amateur-radio
  - travel
---

My portable radio kit that I typically use for POTA and similar is [now even more portable](/blog/new-pota-kit-for-2025/), but while there's now plenty of space in the bag for other kit I might need, it's definitely a kit that I use *to go out and play radio*. If radio isn't the main goal of a trip, it gets left behind.

The more I travel, the more I have wanted an even more portable kit&mdash;one that could be chucked in a bag when travelling for other reasons, and used if time allows. Plus, an entry in my "radio to-do list" dating back a few years to when all I did was digimodes, reads "Hotel Room FT8".

With a bonus having funded some new radio kit, and a work trip lined up, it was time to find out if that was possible.

![A Xiegu X6100, fist mic, antenna on a winder, and power bank sat on a hotel bed](/img/blog/2025/03/hotel-1.jpg){: .center}
*The "more portable" kit*

I hope to iterate this kit in future so that it is smaller still, largely by learning CW to enable the use of a smaller rig than the X6100, but for now my focus will be SSB and digimodes. The [X6100](https://xiegu.eu/product/xiegu-x6100-hf-50mhz-portable-sdr-transceiver/) was second hand at a decent price&mdash;I debated long and hard between the many small QRP SDR radios on the market, before deciding that the built-in tuner set this one above the rest if I was planning on extreme antenna compromises in hotel rooms.

The antenna is a Sotabeams [Bandspringer Midi](https://www.sotabeams.co.uk/bandspringerMidi40m30m20m/)&mdash;yes, it would have been cheaper and no more difficult to make this myself, but I do like the fact it comes with a winder, pegs, string and a bag. This is a "random wire" antenna with a counterpoise wire. On the left of the photo is an [INIU 20000mAh power bank](https://uk-main.iniushop.com/products/iniu-p62-e1-power-bank-smallest-20000mah-65w), which I travel with anyway, so is ideal for powering the radio when combined with a [12V "trigger cable"](https://www.amazon.co.uk/DSD-TECH-MagicConn-SH-CP12A-Cable-12V-Black/dp/B0B9FDZX7P) which allows the USB PD socket to provide 12V straight to the radio's barrel jack.

The case is [this one](https://www.amazon.co.uk/dp/B083QFB9P2), designed for a Sat Nav unit but snugly fitting the X6100, fist mic and cables. I discovered it via [this video](https://www.youtube.com/watch?v=YL9icxTSg1g&pp=ygUHI3g2MTAwNA%3D%3D). In fact it fits the rig a bit *too* snugly, and I was worried about putting too much force on the knobs, so I did a quick mod with a knife to free up the upper mesh section slightly.

![The radio inside a black hard case](/img/blog/2025/03/hotel-2.jpg){: .center}
*The radio inside the case*

Sadly the antenna winder does not fit inside, and while I could cut it down or make a new one, it's already quite full inside the case when including the fist mic. But the case is decently tough and looks like it will protect the rig well when it's chucked into a bag.

![The black hard case with antenna on winder placed on top](/img/blog/2025/03/hotel-2b.jpg){: .center}
*The case and antenna winder*

On to the hotel room then. I began by stringing up the antenna as well as I could figure out how to, given the room decor. From the desk I took the main wire up to the corner of the curtains, then strung along it like Christmas lights, then down and across the headboard of the bed. The counterpoise I left on the floor following most of the same route, but with a few coils left in it due to the lack of space. Ability to take this antenna back down again quickly was a major factor in the "design", as there's no way I want the cleaners to discover this thing hanging up.

![Thin yellow antenna cable hanging down from the tops of the curtains](/img/blog/2025/03/hotel-3.jpg){: .center}
*The antenna setup*

Connecting the radio, the first problem became abundantly clear:

![X6100 showing a signal report and a waterfall full of noise](/img/blog/2025/03/hotel-4.jpg){: .center}
*S9+5 noise across almost all bands.*

As well as four recessed ceiling lights, the main room lighting also consisted of an LED strip above the curtain, mere centimetres from my antenna. It would have to go&mdash;and so, I was going to have to do this using only the "Premier Inn purple" mood lighting.

![Much less noise on the waterfall, and much less background lighting](/img/blog/2025/03/hotel-5.jpg){: .center}
*The waterfall with room lighting turned off*

Having a radio with a waterfall and built-in decoders is a new and interesting novelty for me, so I spent a while playing with FT8 and CW decoding on the rig itself, and seeing what I could see with the waterfall. A few SSB stations were audible, though none particularly clear, and FT8 was a fairly weak presence.

In fact, things seemed to get worse as time went on. Before long, nothing was audible on 20m SSB at all. I brought my laptop out and fired up WSJT-X, which provided a few decent decodes of FT8 but by no means a full band. I'm not used to noise increasing through the evening, so perhaps the lighting in other people's rooms is to blame here&mdash;as it got darker and more guests were returning to the hotel, more people put their lights on?

![X6100 R1CBU firmware showing automatic CW decoding](/img/blog/2025/03/hotel-6.jpg){: .center}
*CW decoding in the R1CBU firmware*

I spent a long time convincing WSJT-X and the rig to work properly together, and it was a recurring problem that transmissions would take out the USB connection, meaning that the computer would lose not just CAT control but audio input and output too. While this could perhaps be fixed by ferrites, I didn't pack any, and so eventually settled on limiting power output to around 3W which seemed to work.

Tuning the antenna was also a challenge, with successful tuning only achieved on the 20m and 30m bands, given the very compromised layout.

By the time I was as happy as I could be with the radio and laptop setup, I wasn't hearing anything on 30m FT8, and only around 3-4 stations on 20m FT8. I made some calls and had *half* an FT8 QSO with HA1BF before I presumably dropped down into the noise and was lost.

In the end, I gave up that evening and tried again the following morning. Then, the noise floor on 20m was slightly lower, and I finally achieved an FT8 QSO with OK1VRV, with a report of +16dB (!) from me and a return of -4dB reported by him. Not too bad for 3W, pointed out of the window in the wrong direction.

![X6100 and laptop set up on a desk, with the laptop showing WSJT-X software](/img/blog/2025/03/hotel-7.jpg){: .center}
*Portable station reporting a QSO with OK1VRV*

The following evening I tried SSB again, also with no luck&mdash;an empty-sounding band was all that awaited me, even though the noise floor was only S5 at that point. Going back to weak signal modes then, I fired up JS8Call, but unfortunately had a similarly bad time on that mode. I got a couple of decodes and one response to my heartbeat messages over around 10 minutes, but no takers for my CQ calls.

The novelty was wearing off, and the reality of QRP operation from compromised setups was catching up with me.

One final evening saw me attempting SSB again, but without luck. 20m was a dead band to me, with S7 noise even with my lights off, and while I heard half a dozen good QSOs in progress on 40m, it was again impossible to tune up my antenna on the band. At least I had good old China Radio International booming in at S9+ just above the ham band, inescapable despite the poor reception conditions.

![X6100, fist mic and power supply set up on a desk, with the radio showing an LSB signal on 7192kHz.](/img/blog/2025/03/hotel-8.jpg){: .center}
*Amateur radio by lamp light*

All in all, this week's experiment was *technically* a success&mdash;I have ticked off a goal from several years ago to do FT8 from a hotel room. It was one QSO, achieved by getting up at 0600, but still a success.

I wasn't expecting quick and easy wins from my first time operating QRP in a very noisy environment, but it has at least kept me entertained, and I have plenty more time with this kit to experiment and improve.