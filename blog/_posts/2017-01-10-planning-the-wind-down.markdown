---
title: Planning the Wind-Down
layout: post
date: 2017-01-10 10:43
tags:
- Web server
- Web presence
- Migration
---

It's been five years now since, full of enthusiasm and [convinced that SuccessWhale might make it big](/blog/successwhale-is-terrifying-vps-edition/), I bought myself a server in London somewhere, and moved my web presence over from its previous shared hosting.

I've learnt a lot in those years.

I've learnt that despite the "S" in "SMTP", running a mail server these days is anything but simple. Fighting viruses and spam is challenging, and in particular DKIM is a hassle to get right. I've learned that PGP is a nice idea, but I never did find one person to exchange encrypted mail with, or any real reason to do so.

I've learned that LetsEncrypt makes setting up SSL certificates much easier and cheaper, but that configuring Apache to serve 23 HTTPS domains from a single machine with SNI is still difficult.

I've learned that Linux Version Hell *will* bite you at some point, and Ruby Version Hell doubly so. Today the server runs three separate versions of Ruby, because not all my Ruby/Rails sites can be run with the same one. The `www-data` user has a home directory just for `.rvm`.

I've learned that drive-by hackers and DoS attackers will find your server, often within hours of it going online, and that fail2ban and mod-blacklist are the sysadmin's friend.

I've learned that [Open Source community drama can break stuff you depend on](/blog/the-open-source-disadvantage/), sometimes without a decent way to recover, and every time you do a package update you risk something not working.

All in all, it's been a good experience. There have been some frustrating times and late nights fighting with configuration that should just work, but I've learned a lot in the process and gained a much greater understanding of how the internet works.

However, I think it might be time to start winding it down. It's no longer an interesting new experience, it's just another thing that I have to keep an eye on and ensure it doesn't break. Life, I find, is better when it's simpler.

As such I am working up a plan to migrate important things to other services over the coming weeks or months.

* **Email, contacts, calendar, file storage and photos** I've already moved from my server to Google products. I'm no great lover of Google, but having struggled so long with email servers and clients' spotty DAV support and OwnCloud updates breaking everything, I have to admit it's so much easier.
* **This blog** is based on Jekyll and can relatively easily be moved to GitHub Pages. We'd lose HTTPS support, but I don't think that's a major issue. ~500MB of images used by it currently sit on `files.ianrenton.com` but could be brought into the repository. The challenge is the comments, which use my own Juvia server. There's no migration path from that to anything, and I do want to keep the comments&mdash; particularly on the Raspberry Tank pages&mdash;as there's a lot of helpful information there. Disqus is the logical non-self-hosted equivalent, but there's no automated way of bringing the comments in. Maybe it's time to migrate the whole site back to WordPress, since hosted solutions are easier to come by.
* **Software executables** can use GitHub's "releases" feature and be hosted there next to the source code.
* Everything else on `files.ianrenton.com` is pretty much junk, bits of it can be shared ad-hoc from Google Drive.
* **[SuccessWhale](https://successwhale.com/), [Can I Call It](http://cici.onlydreaming.net/), [Daily Promise](http://dp.onlydreaming.net/), [A Thousand Words](http://1kw.onlydreaming.net/) and [Westminster Hubble](http://wh.onlydreaming.net/)** are effectively dead at this point. They can be taken down and replaced with portfolio pages saying "this is what I once made".
* **[Rimbaud's House](http://rimbaud.renton.es/)** hasn't been in use for a while anyway, it was a nice project but the camera has not proved useful and I do not trust the sensors enough to introduce full automation based on their readings.
* Random little things like **[Marvellator](http://marvellator.onlydreaming.net/), [Terrible Fanfiction Idea Generator](http://fanfic.onlydreaming.net/) and the [Business Processes Wiki](http://bpw.ianrenton.com/)** can be converted to static pages, with JavaScript instead of PHP providing the active content, and hosted somewhere like GitHub Pages.

A few potential sticking points are:

* I host **three WordPress sites** for other people. Two are potentially old enough that they can be deleted or replaced with static pages; the other I could migrate to WordPress.com although that would involve paying extra.
* I do use the server as a **VPN** occasionally when on unsecured WiFi, but almost every critical app and website uses HTTPS these days, it's not necessarily essential any more.
