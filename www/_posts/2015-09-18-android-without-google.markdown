---
layout: post
title: "Android Without Google"
date: 2015-09-18T06:17:46+01:00
---

For several years, I've been [considering](/blog/could-i-live-without/) whether I could&mdash;and should&mdash;dispose of my Google account. Since I wrote the linked post back in 2011, my use of Google services has declined anyway, and I no longer use GMail, Google+ or Google Calendar. At the same time, it has become apparent that users are at the whim of Google's [decision to close unprofitable services](/blog/google-reader-vs-do-no-evil/) (even beloved ones like Reader), and to [force us into using others](http://phandroid.com/2013/11/11/do-you-hate-the-new-google-youtube-comments/) against our will. "Don't Be Evil" is [starting to look hilariously na&iuml;ve](http://gizmodo.com/5878987/its-official-google-is-evil-now).

The last hold-out in my desire to dump Google is my Android phone. Without a Google account and the [closed-source "Google Play Services"](http://arstechnica.com/gadgets/2013/10/googles-iron-grip-on-android-controlling-open-source-by-any-means-necessary/) blob that sits at the core of an Android phone, the experience is diminished significantly. While I like my phone's hardware, I am not fond of the Google integration that I no longer fully trust. So, for the last few months I have been experimenting with running *Android without Google*.

Here's what I've learned.

## I do Depend on Some Google Apps after all.

Aside from what's provided in my AOSP-based CyanogenMod base software (much of which was written by Google, but is at least open source), I have two Google apps left on my phone&mdash;Maps and YouTube.

{% img right http://files.ianrenton.com/sites/blog/2015/maps.jpg Google Maps %}

*Maps* features live traffic updates, a key feature when driving long distances to see friends and family. Although other apps have voice guided navigation (I also have [OsmAnd](http://osmand.net/) installed), I've been unable to find a free live traffic offering that matches Google's.

*YouTube* doesn't seem to have a decent open source client for Android, either due to legal problems or just that there's little desire for one. To cope with my son's regular desire to watch the music videos for obscure pop songs on my phone, I've had to keep this installed too.

## That means Google Play Services stays.

Neither Maps nor YouTube works without Google Play Services installed, and so far that's meant I have had to keep it installed on my phone.

However, my main trust issues with Google stem from their tracking and the amount of data they (want to) store about me. I can still prevent this another way&mdash;by removing the Google account from my phone. Play Services, Maps and YouTube continue working correctly, but my phone-based activities are no longer reported to Google in a way that connects them to me, and I can move one step closer to deleting my account.

## You can Just About Survive on Open Source Apps

{% img right http://files.ianrenton.com/sites/blog/2015/fdroid.png F-Droid %}

My replacement for the Play Store is [F-Droid](https://f-droid.org/), a repository for open source apps, and in the spirit of trying to copy my laptop's (mostly) open source software, I have decided to use it almost exclusively.

There are other app stores available, such as [Amazon's](http://www.amazon.com/appstore), but the "ditching Google" exercise is about trust, and I'm not sure I trust Amazon any more than Google when it comes to their ability to monitor my phone usage and try to sell me things. [Aptoide](http://www.aptoide.com/) is another possibility, but the user-hosted repositories are full of software the users don't own, are pirated, or potentially full of malware; once again the trust is lacking.

### Productivity

As far as standard productivity apps go, there has either been an open source equivalent that fulfilled all my needs, or I was already using an open source app anyway and could update it direct from F-Droid.

* **K9 Mail** was my default mail client anyway. It has a few failings, but in my opinion is still the best mail client on Android.
* **Firefox** was my default browser, and is open source as you would expect.
* **SMS Secure** replaced TextSecure. It's a fork that is identical in every way bar the name.
* **WeeChat**'s Android client is open source.
* **VX ConnectBot** is open source.
* **DAVDroid** replaced CalDAV-sync and CardDAV-sync. My self-signed SSL certificate had to be added to Android itself manually, but aside from that quirk this one app replaced two.
* For security, **Google Authenticator** and **OpenKeyChain** are open source apps that I was already using, and **KeePassDroid** replaced Keepass2Android with only a few little irritations.
* **Ghost Commander** replaced File Explorer and Turbo FTP Client together&mdash;I find its interface annoying to use, but it seems to be the only open source file manager with SFTP and certificate-based login support.

### Web Stuff

Here again, I didn't find much to change from my original apps, largely because I was using non-standard software anyway.

* [**OnoSendai**](http://onosendai.mobi) is written by a friend of mine, and is my normal Twitter client. It has its own F-Droid repository.
* **FaceSlim** is a simple wrapper around the Facebook mobile website. Again, I have used this in preference to the permission-hungry "real" Facebook app for a long time.
* I was already using **ownCloud** and **ownCloud News Reader** for file sync and RSS reading; both are open source.
* **Diode** replaced Reddit Sync as my go-to Reddit client. There's another service I ought to ditch one of these days.

Everything else, I already used my browser for on Android.

### Games

Games have been the biggest difference between my phone before ditching the Play Store and my phone now. The number of games for Android&mdash;even closed source ones&mdash;outside of the Play Store is very limited. F-Droid has a variety of simple puzzle and arcade games, while past Android [Humble Bundles](http://humblebundle.com) have provided some high-quality indie titles as downloadable APKs, but on the whole the choice is bleak.

On the plus side, the exercise has given me a great excuse to dump a number of [potentially evil mobile games](http://t.co/roC1ymlMsm) that I seem to have picked up since [my last purge](/blog/on-game-design-time-to-quit/).

{% img right http://files.ianrenton.com/sites/blog/2015/castleclash.png Castle Clash %}

> How many hours have I wasted on improving pixel people and harvesting ephemeral bits?

### The Gaps

There are a bunch of applications that I still use because there is no proper open source replacement. oandbackup is not yet a decent replacement for Titanium Backup, and try as I might, I cannot get my VPN server working in "OpenVPN for Android" while it works fine in the closed source "OpenVPN Connect".

And there are the proprietary services that will likely never have open source clients that offer the full functionality&mdash;Spotify, Netflix, the apps for my mobile ISP and my bank. This is where the main problem lies: these apps that I can continue using but are no longer receiving security updates via the Play store.

## Conclusion

The vast majority of apps on my phone either come preinstalled in AOSP or Cyanogenmod, or can be found in the F-Droid repository and successfully kept up to date there. It's workable as an entirely open source platform (bar the separate issue of device drivers).

But dragging a few "essential" closed-source apps into the situation is a lot more difficult than on a desktop operating system. On my laptop I can install Spotify direct from the company's website, and even add a repository to my package manager to get automated updates. But on Android, the Play Store dominates and the majority of app writers do not allow publishing anywhere else.

This is an unintentional lock-in that prevents users from having a choice of software sources.

It's an almost useless fight, but I feel that we ought to continue fighting against the new operating systems' desire to contain our purchasing and constrain what we can and cannot do with our devices.

The future's good for me&mdashl;I'm getting by without Google's tracking features on my phone, which puts me in a goof position for a potential switch to Ubuntu Touch, Sailfish or another phone OS that respects its users' privacy. But not everyone would find it so easy to do without the proprietary blob at the middle of Android, and that's worrying for the future of the [general purpose computers](http://ianrenton.com/blog/the-need-for-mobile-general-computation-aka-why-im-stuck-with-android/) we all could have in our pockets.
