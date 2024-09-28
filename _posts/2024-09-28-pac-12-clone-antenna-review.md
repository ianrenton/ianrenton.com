---
layout: post
title: "PAC-12 / JPC-12 Antenna Review"
date: 2024-09-28 16:35 +0100
image: /blog/2024/pac12-small.jpg
slug: pac-12-clone-antenna-review
description: "Checking out my latest AliExpress haul"
tags:
  - ham-radio
  - radio
  - amateur-radio
  - antenna
  - review
---

<div class="notes"><p>Note that this is currently just the first half of the review. I haven't had chance to take this antenna beyond my garden and its suburban QRM yet; I'll update this page when I do.</p></div>

Since I started doing POTA earlier this year, my go-to antenna has been a 20/40m dipole in an inverted-V configuration, the central pole being about 6m high. I like the simplicity and efficiency of a dipole, along with the knowledge that it was cut to the right resonant frequencies and isn't going to change.

The one key disadvantage of this setup is just that&mdash;the setup. I've been lucky enough to have company on all my previous activations, but if I wanted to go solo, I would really struggle to get the mast up and guyed by myself. With that in mind, I started thinking about self-supporting verticals. The usual "make or buy" debate came up, and as usual I settled on "buy", as for POTA I much prefer kit I know I can rely on.

I decided to buy one of the many "PAC-12" clone antennas available on AliExpress, specifically [this one](https://www.aliexpress.com/item/1005004797763975.html). At the time of purchase the headline price was £81, and including tax and shipping the total cost was £98. It arrived in 8 days and luckily I didn't get stung for customs duty, despite the package being honest about the contents and value!

In the UK, they can be [found for £150 on Amazon](https://www.amazon.co.uk/PAC-12-7MHz-50MHz-Portable-Rhortwave-Antenna-as-picture-show/dp/B0C5J915NP), or [MLS will sell you one for £160](https://www.hamradio.co.uk/mydel-jpc-12-portable-shortwave-antenna-kit-10m-coax-included-pd-14764) including 10m of coax. I felt that saving £50 was worth the risk and went for AliExpress.

Now despite calling this antenna a "PAC-12 clone", and being advertised under that name, I'm not completely sure that it is a true clone. What I received was labelled "JPC-12" and looks identical to other similarly named kits online, but looking up [the original PAC-12](https://www.qrpkits.com/pac12.html), there are definitely some key differences in the size and tapping of the coil, and the use of extension rods.

![The antenna kit in its bag](/blog/2024/pac12-1.jpg){: .center}
*The antenna kit in its bag. (The coax was mine and did not come with the antenna.)*

The kit comes well packaged in a fairly rugged-looking bag, a key advantage for my hiking-focussed POTA adventures. (As a bigger bit of kit than my dipole antenna, it may end up strapped to the outside of my rucksack rather than carried inside.)

Assembling the antenna is fairly simple. The instructions aren't bad for a Chinese product but the picture on the cover is worth a thousand words.

1. First, the spike is inserted into the ground.
2. Next, the ground radials are attached by placing the ring terminal over the screw thread in the ground spike. The radials are actually a strip of ribbon cable, which needs some separating out before use.
3. The connector block is then screwed down onto that. It's the piece with female screw thread in each end and the SO-239 connector on the side.
4. Then, depending on band, the extension poles are attached to the top.
5. Again, depending on band, the loading coil is attached on top of that.
6. Finally, the telescopic whip goes on top.

Until I started putting it together, I was thinking that the extension poles were just to increase the height of the base of the antenna. However, once assembled it's clear that these are part of the radiating element, and the loading coil is halfway up the vertical length of the antenna rather than at the base.

![The base of the antenna, showing SO-239 connector and attachment of the ground radials](/blog/2024/pac12-2.jpg){: .center}
*The base of the antenna, showing SO-239 connector and attachment of the ground radials.)*

I'm not entirely sold on the idea of ribbon cable as radials. It comes nice and neatly packed in the bag, but after separating out into a number of sections and spreading it out, it's going back into the bag as a tangly mess.

After reading [a review on QRPer.com by Barry, KU3X](https://qrper.com/2023/07/barry-reviews-the-pac-12-portable-antenna/) I was worried about the length of the radial ribbon cable too. It is indeed about 18 feet (or 5 metres), which is plenty to fit into my small suburban garden for testing, but as he states, a bit too short for operating on the 40m band. I'm nervous about large radials as a trip hazard out in the field, but I may have to make my own as he did if performance on 40m doesn't hold up. (As can be seen below, SWR seems fine, but the radiation pattern could be questionable.)

Coming from a known-good wire dipole antenna, I was somewhat dreading having to figure out the tuning on this kit in the field. I don't have a portable tuner for POTA adventures and I don't relish the idea of taking the NanoVNA out with me either, so I tried to get some working settings that I could reproduce later. (In practice, I'll probably take the VNA anyway the first time.)

![The adjustable loading coil](/blog/2024/pac12-3.jpg){: .center}
*The adjustable loading coil.*

I did find the adjustable loading coil quite difficult to use. There's just a bit too much force required to start that slider moving, and it's not easy to line it up so that it is touching exactly the coil you want, and not the next one too.

The manual does give you suggested configurations of extension poles, loading coil and whip lengths to get you started on some of the key bands, and positions of the slider on the loading coil are marked.

On the 20m band, I found the provided instructions to be pretty accurate. With the loading coil slider in the marked position and the whip taken to its full height minus about 20cm, I saw a fairly uniform low SWR across the band. It didn't quite get as low as the 1.1:1 indicated in some of the product descriptions, but in other descriptions it only says <1.3:1, so I'll take it as a win.

![NanoVNA screenshot showing SWR on the 20m band](/blog/2024/pac12-4.png){: .center}
*NanoVNA screenshot showing SWR on the 20m band.*

On 40m, my other preferred POTA band, I couldn't quite get SWR as low as 1.3:1 using the dimensions given in the instructions&mdash;instead it came out about 1.8:1. Not terrible, but not great for my tuner-free POTA experience.

I found it was much improved by bringing the loading coil slider down one notch, and shortening the whip accordingly to bring the resonant frequency back into band. About 1.2:1 was achievable, though note there was a much steeper curve here, so it's worth adjusting the whip for the lower or upper part of the band depending on your modes of interest.

![NanoVNA screenshot showing SWR on the 40m band](/blog/2024/pac12-5.png){: .center}
*NanoVNA screenshot showing SWR on the 40m band.*

One more minor annoyance I should mention is the height of the overall assembly when the extension poles and loading coil are fitted. When I needed to adjust the length of the whip for tuning, I was *just about* able to. Anyone much shorter than my 5' 10" (178cm) might struggle to reach, and need to dismantle part of the antenna in order to tune the whip length.

But overall, I'm happy with this antenna and certainly feel like I've got my money's worth. It's a neatly packaged kit, and everything feels solidly well-made. I look forward to giving it a shot on future POTA adventures!

I'd like to try tuning it up on more bands when I revisit this review, and as noted in the header I still need to give it a go out on the heath where QRM is low enough for an honest signal report. Stay tuned for part 2!