---
comments: true
layout: post
slug: 2e0uxv-random-shit-i-found-in-my-shed-antenna
title: The 2EØUXV "Random Shit I Found in my Shed" Antenna
---

In 2022 I had the need for a directional UHF antenna at around 420-425 MHz but no real desire to spend "real money" on it. Over a couple of weeks this morphed into the idea of "I wonder if I can build this with *just* stuff I have lying around". The answer is yes!

![UHF Yagi antenna lying on grass](/hardware/radioshack/randomshitantenna1.jpg){: .center}

The boom is made of an old 1-inch square fence post, cut to about a metre long and sanded down. Holes were drilled at the right positions to improve attaching the various elements. The director and reflector elements are made from some ¼-inch hollow aluminium rods that I had been using as garden canes, attached using cable ties from [that other project where I had to buy them in packets of 100](/hardware/planesailing/bill-of-materials/). To calculate lengths and spacings I used [this DL6WU Yagi calculator](https://www.changpuak.ch/electronics/yagi_uda_antenna_DL6WU.php).

![Close-up of driven element attachment](/hardware/radioshack/randomshitantenna3.jpg){: .center}

The dipole is made of old tent pegs held in a BNC-to-banana-socket adaptor by more cable ties. A BNC cable then connects to a handheld radio, which can also be attached to the antenna boom with, you guessed it, more cable ties. Naturally, for an antenna this shit, there is only one radio choice&mdash;enter the Baofeng UV-82.

![Close-up of handheld radio](/hardware/radioshack/randomshitantenna4.jpg){: .center}

(However, for my purposes it was beneficial to include AM receive capability, so I did end up swapping the UV-82 for my Yaesu FT-60.)

Putting it all together, somehow, it actually works!

![End-on view of antenna](/hardware/radioshack/randomshitantenna5.jpg){: .center}

It even has an SWR of pretty close to 1:1 at 424 MHz. Not bad for a couple of tent pegs! Once it's served its original purpose I will trim the ends of the tent pegs with a Dremel to get it resonant somewhere closer to the amateur radio 70cm band, then stand on a hilltop looking like a massive dork trying to hit a far-away repeater.

![SWR reading](/hardware/radioshack/randomshitantenna2.jpg){: .center}

Without further ado, the bill of materials for this incredible feat of engineering:

| Part                                          | Quantity  | Cost (GBP)/ea | Cost (GBP) |
|---------------------------------------------- |---------- |-------------- |----------- |
| Old fence post (found in shed)                | 1         | 0.00          | 0.00       |
| 3m Aluminium rod (found under shed)           | 1         | 0.00          | 0.00       |
| Tent peg                                      | 2         | 0.00          | 0.00       |
| Cable tie                                     | 26        | 0.00          | 0.00       |
| BNC to banana socket (from junk drawer)       | 1         | 0.00          | 0.00       |
| BNC male-to-male (from junk drawer)           | 1         | 0.00          | 0.00       |
| 50cm BNC cable (from junk drawer)             | 1         | 0.00          | 0.00       |
| BNC male to SMA female (from adapter kit)     | 1         | 0.00          | 0.00       |
| Baofeng UV-82 (estimated market value)        | 1         | 0.00          | 0.00       |
| Bird SiteHawk SK-6000-TC SWR meter (borrowed) | 1         | Uh....        | Don't ask  |
|---------------------------------------------- |---------- |-------------- |----------- |
|                                               |           | **TOTAL**     | **0.00**   |

In time-honoured ham radio tradition I will of course name it after my callsign, so there you have it&mdash;the 2EØUXV "Random Shit I Found in my Shed" antenna. A fully functional UHF Yagi antenna for free. Provided you have a shed with loads of crap lying around.
