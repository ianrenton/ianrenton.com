---
comments: true
date: 2012-04-13 14:39:56
layout: post
slug: app-idea-catchup
title: 'App Idea: CatchUp'
tags:
- Applications
- Chat
- Design
- Local
- Software
---

Here's some initial design ideas for a location-aware chat app that, as far as I am aware, has significant new features over and above existing mobile chat apps (iMessage, WhatsApp, BBM etc.) and existing location-based functionality in apps (FourSquare, Facebook check-ins, Google Places).

## Background

![Pictochat](https://upload.wikimedia.org/wikipedia/en/0/03/Pictochat.png){: .right}

The inspiration for this idea came, more or less, from the Nintendo DS ["Pictochat"](https://en.wikipedia.org/wiki/PictoChat)application.  PictoChat allows up to 16 users to link their DS consoles over a peer-to-peer WiFi connection, and share doodled messages with each other in real time.  Between a couple of DS-using friends, PictoChat is an interesting gimmick, but I first encountered it coming into its own at an anime (Japanese animation) convention called [MinamiCon](http://www.minamicon.org.uk/).  Here, the concentration of DS users was so high that multiple 16-person PictoChat rooms came into existence, full of people chatting away with other convention-goers.

This was in 2005, before the now ever-present smartphone really came into its own.  What about today?  Achieving a critical density of DS users to make PictoChat useful is no longer an issue -- a critical density of smartphone users exists at every event and every non-event in the Western world.  What if we reimagined PictoChat for the smartphone?

## Concept

There is one big change to the PictoChat concept that we need to make to have a viable idea -- and one big addition.

![Attempting to write using DrawSomething](/img/blog/2012/04/IMG_8830.jpg){: .right}
	
  * **Text, not pictures.**  The DS' stylus and resistive touchscreen were ideal for doodles, but not so much for text -- though a keyboard was available.  Modern smartphones have thumb-friendly capacitative screens, and anyone who's tried to give textual clues in [DrawSomething](http://www.omgpop.com/drawsomething) will tell you that writing text PictoChat-style is a non-starter.  This new app needs to be text-based, with optional picture and video sharing, much like MMS.
  * **Catching up.**  The idea of "catching up" provided the app's working title, and forms a secondary mode for the app.  As well as real-time chat between people in close proximity, the app also attempts to solve the problem of "how do I keep in touch with people I did [activity x] with?".  Say, for example, that you are at a concert.  Over the course of the event the app detects 20 people in your vicinity.  You could chat with them live (though hopefully you paid to watch the band not stare at your phone...), but the app remembers who was there so you can also chat to them _afterwards_.

## Technical Issues

There are a number of technical issues that the app would have to address.

  * **Privacy.** It must be easy for users to indicate that they _don't_ want to be interrupted by messages, and that they don't want people to detect your presence and "catch up" with you later.
  * **Identification.** Integration with Facebook would be desirable to allow users to find their friends on the service.  However, the app is providing a semi-public mapping of people to locations, so CatchUp users should not be identifiable to people who are not their friends.  Foursquare has struck a reasonable balance here.
  * **Connection technology.** PictoChat used device-to-device WiFi. This is not ideal for CatchUp as it would prevent users from using their WiFi for other things.  A low-power Bluetooth connection is a possibility which would also enforce the "chats must be local" idea. However, if we are going to enable "catch up" chats later, we need a server-side chat backend anyway, so it may be best to route everything through the server and determine user proximity for local chat groups on the server.  

[![CatchUp Architecture](/img/blog/2012/04/CatchUp-Arch.png)](/img/blog/2012/04/CatchUp-Arch.png)

> CatchUp Architecture
	
  * **Integration to other services.** Integration with the Facebook, FourSquare or Google Places API could give users the ability to "check in" and use the chat facility together, increasing uptake.  Integration with services like Last.fm could incorporate knowledge of event times and places, meaning that the "catch up" chats can have sensible names like "Justin Bieber Concert, Wembley Stadium, 1/1/2012" rather than "with 312 users at Wembley Stadium, 1/1/2012".  

[![Last.fm's Events List](/img/blog/2012/04/lastfm-events.png)](/img/blog/2012/04/lastfm-events.png)

> Last.fm's Events List
	
  * **Blocking.** It must be easy for users to block and report abusive users, prevent them from finding out where the reporter is in future, etc.

## Mockups

I have produced a couple of user interface mockups for the potential design:

[![CatchUp Main Menu](/img/blog/2012/04/5.-CatchUp-2.png)](/img/blog/2012/04/5.-CatchUp-2.png)

> CatchUp Main Menu

The main menu of CatchUp presents a simple list of chat opportunities, in reverse chronological order.

At the top is the "Chat now" area.  Pressing there takes you to the live chat for your location, as determined and managed by the CatchUp server.  The tile shows where CatchUp thinks you are, and how many people you will be placed in a chat room with.

Below this is a list of all your "catch up" opportunities.  If configured to do so, CatchUp monitors your location in the background.  If you stay in a location with enough people for long enough (possibly without having to explicitly open a chat), a "catch up" for that event will be placed in the list.  The user can press one of these to be taken to a chat room for everyone who was there.  Users can remove the Catch Up from the app (and thus prevent being chatted with by other event attendees) with a swipe.

Settings will have fine-grained privacy options, for example to prevent the user appearing in others' Catch Ups without explicit permission, to mark certain locations that Catch Up will automatically deactivate itself in, and so on.

[![CatchUp Chat Interface](/img/blog/2012/04/4.-CatchUp-1.png)](/img/blog/2012/04/4.-CatchUp-1.png)

> CatchUp Chat Interface

Chatting in CatchUp is a simple affair.  As locations may have many people chatting, iPhone-style bubbles are replaced with a more basic appearance -- though images and videos can still be embedded.

## Potential Flaws

No application is without its flaws.  Here are some that CatchUp would have to address:
	
  * **User Critical Mass.** Any social app is only as good as the number of people using it, particularly if the main use case is live chatting.  Facebook integration could help a lot here, as could venue sponsorship such as posters with instructions / QR codes to download the app.
  * **Balancing default privacy options.** Many (most?) users will never change their privacy options. The default must be restrictive enough that the app does not raise Facebook/Buzz-style security concerns, but permissive enough that Catch Ups are still useful.
  * **Web interface?** Can Catch Up do without a web interface and run mobile-only like Instagram?  Or would a web-based interface be useful so that post-event Catch Ups can be done with a proper keyboard?
  * **Permanence.** Catch Up needs to strike a balance between permanence (everything is kept forever -- but UI becomes more complex and permissions more fine-grained) and impermanence (Catch Ups expire and are deleted -- but we may need to allow users to get their data out).

## Naming Ideas

Aside from "CatchUp", a number of other names have been suggested:
	
  * **Ketchup** (a pun on Catch Up)
  * **ReCollect** (based on the idea that you can "collect" people at events then chat to them later)
  * **LiveChat**

## Next Steps

What's next for CatchUp is largely down to you.

I am a UX guy and a Java/Python/PHP developer with zero experience of mobile app development -- I can do a mean usability study, but I can't make this app myself in a sensible amount of time.

**If you want to help make this app, [get in touch](mailto:ian@ianrenton.com).**  I can't do it without help.

**If you want this app to exist but can't help, share this post!**  Eventually it'll get to someone with the time, skill and inclination to help out.

And if you have any comments whatsoever, keep on scrolling.  I'd love to hear any thoughts or (constructive) criticisms you may have!
