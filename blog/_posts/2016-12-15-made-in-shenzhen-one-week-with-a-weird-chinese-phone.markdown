---
title: Made in Shenzhen&#58; One Week with a Weird Chinese Phone
layout: post
date: 2016-12-15 13:09
categories:
- Hardware
tags:
- Phone
- Smartphone
- Android
- Import
- China
- Xiaomi
---

I've held onto my Galaxy S5 for 2&frac12; years, until at last the battery has stopped holding more than 8 hours' charge, the compass no longer works, and the "metal" paint is starting to peel. I had two requirements for a replacement: it must be the same size or smaller, and its battery must last significantly longer. Ideally also: cheap. Unfortunately, most popular manufacturers seem to have stabilised on 5.5 inches as the ideal screen size, having long forgotten how the tech media mocked the [Dell Streak](https://en.wikipedia.org/wiki/Dell_Streak) as a "phablet" for its *ridiculously huge* 5-inch screen, a lifetime ago. (2010.) Most smaller phones fit into major manufacturers' "budget" lines, with poor specifications, including the all-important battery size.

After some investigation, it turned out that plenty of companies *are* churning out 5-inch and smaller phones with big batteries, mostly for less than £150&mdash;[here's 309 of them](https://www.aliexpress.com/category/5090301/mobile-phones.html?spm=2114.11010108.103.8.llj9Bt&pvId=200000233-200006049)&mdash;only problem is, most of the world has never heard of them.

So, I took the plunge.

Xiaomi, a complete unknown in the western hemisphere, is in fact the world's 4th largest smartphone manufacturer, so presumably their phones must be of reasonable quality compared to the lucky dip of buying a phone from "vernee" or "Nomu" or "Doogee". A week or so later, I had in front of me a Xiaomi Redmi 4... [something](http://www.gsmarena.com/xiaomi_redmi_4_prime-8263.php). It's either called "Prime", "Pro" or "High Ed." depending on where you look for it.

It's... surprisingly nice.

![Xiaomi Redmi 4 Prime](/img/blog/2016/phone1.jpg){: .center}

Although it's a Chinese import, I bought it via [Xiaomi's UK shop](http://xiaomi-mi.co.uk/redmi-4/), and luckily it came with the "Global ROM" with Google Play Store installed, rather than the Chinese ROM that omits Google services.

Great!

Except... there is no Global ROM for this phone.

![China-only ROM page](/img/blog/2016/phone4.png){: .center}

Uh-oh.

Additionally, it looked like the default Weather app had been replaced by "SC Weather"&mdash;a decently functional replacement, with only a couple of downsides, like *consistently using >20% of the battery despite never being opened*, and *having access to write system settings, install apps, make phone calls...*

Ah. I had a [fake ROM](https://xiaomi.eu/community/threads/differences-between-global-rom-and-eu-rom.36504/).

After years of trusting Samsung and Google with all my stuff, I must at least afford Xiaomi some trust to look after all my stuff. But I sure as hell don't trust whoever installed that on my phone.

And so, the fun began.

Xiaomi helpfully offers [ROM downloads](http://en.miui.com/download.html) for all their phones&mdash;and many other people's phones&mdash;on a nice English-language website, and it already had a more recent version of the software that I could upgrade to! Unfortunately, my fake ROM denies all knowledge of over-the-air updates, and even refuses manual updating as well. Bollocks. It's time for the flashing tool.

Xiaomi's "Mi PC Suite" comes in two versions: a Chinese one, which actually works, and a helpfully translated English one, which fails to see my phone at all. Why would it? My phone doesn't exist in English-speaking regions yet. So, here we go.

![Chinese Mi PC Suite](/img/blog/2016/phone3.png){: .center}

The internet helpfully recommends downloading the ZIP of the ROM you want, booting your phone into Recovery mode, connecting to the PC, and shift-clicking that button labelled above. This will let you select the ZIP to flash.

Except, oh no it doesn't. In the *latest* version of Mi PC Suite, that opens up a menu of more buttons. And not a word of English among them, nor help from the forums, which don't seem to have encountered this new version yet. I was on my own.

![Three Hours Later](/img/blog/2016/threehourslater.jpg){: .center}

At long last, I had a phone that runs a *real* version of its software. Additionally, I can now recognise the Chinese characters for "flash", "file", "OK", "cancel", and "could not locate `adb.exe`".

More fun ensues because, of course, I now have a legitimate *Chinese* ROM. With no Google services. Fortunately, a number of websites helpfully show you how to download "Google Installer" from the Xiaomi Store, and use that to install Google Play Services, Play Store, etc. *Unfortunately*, Xiaomi (being the good citizens they are) removed the app. So it was off to dubious forums and third-party download sites in search of a copy of Google Installer.

![One Hour Later](/img/blog/2016/onehourlater.jpg){: .center}

At last I went to bed, now with an up-to-date official ROM, Google services and all, happily installed. The next day, since the phone was on an official software version, a nightly update arrived that bumped the software version significantly and conveniently fixed the majority of the issues I had with the software all in one go.

![Software update screen](/img/blog/2016/phone2.png){: .center}

I'm still waiting on a *real* Global ROM to appear eventually, so I can have Google Play Services and friends installed as real system apps, and fewer strange Chinese video streaming apps installed. But for now, I have a nice looking and feeling phone, regular software updates, and most importantly of all a battery that's currently sitting pretty on 90% after 7 hours' use.

Bye bye Galaxy S5, with which I'd now be on 30% battery and hunting for a charger. I'm keeping my weird Chinese phone.

![Battery use graph](/img/blog/2016/phonebattery.jpg){: .center}
