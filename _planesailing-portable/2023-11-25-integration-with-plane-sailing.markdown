---
comments: true
layout: post
title: Integration with Plane/Sailing
slug: integration-with-plane-sailing
date: 2023-11-25 00:00:00
last_update: 2023-12-01T00:00:00+00:00
layout: post
---

### AIS (The Easy Part)

You may have noticed on previous pages of the setup guide that AIS data was easily pointed at Plane/Sailing Server by means of a `-u` command in AIS-Catcher, but I conventiently skipped over how to do the same for ADS-B (Dump1090) and APRS (Direwolf). That's because they work in different ways.

The way AIS data is typically passed to online trackers such as MarineTraffic, and to Plane/Sailing, is via UDP. This is very simple; the sender simply sends to an IP address/hostname and port combination, and off the message goes. To allow Plane/Sailing to aggregate AIS messages from the portable system as well as its local receiver, all I had to do was forward a port on my home router, in this case 10111, to the same port on the same PC that Plane/Sailing normally uses for this. Messages then arrive on that port from both sources. The server can't tell the difference, but at this stage it doesn't need to.

### ADS-B & APRS: The Problem

For ADS-B we generally use BEAST data on a port served by Dump1090, and for APRS we use KISS data on a port served by Direwolf. These are TCP, so unlike with UDP we need to deal with connections and the differences between clients and servers. More importantly, it's Dump1090 and Direwolf that are the *servers*&mdash;Plane/Sailing Server is the *client* in these relationships. That means that Dump1090 and Direwolf in the portable system can't connect in to the main system&mdash;the main system must connect to *them*.

The first step to make this happen was to allow multiple connections of each type in Plane/Sailing Server. Instead of just connecting to one Dump1090 instance, or one Direwolf instance, [a change was made](https://github.com/ianrenton/planesailing-server/commit/4553e9d4b8611fe1d274cb566aa12618b63775f8) to allow as many as you like.

The JSON protocol and client UI code were also updated to reflect the back-end server changes, so now if you have multiple computers providing input, they are all shown separately in the server telemetry.

![Plane/Sailing client showing server telemetry with three sources](/projects/planesailing-portable/planesailingtelemetry.png){: .center}
*Plane/Sailing client showing server telemetry with three sources*

Great! Plane/Sailing Server can now connect to Dump1090 & Direwolf on its own network, as well as Dump1090 or Direwolf on the portable system. But how does it find the portable system? It's running on ad-hoc WiFi networks, and even using mobile phone tethering, so it's not so easy to give Plane/Sailing Server an IP address and port and say "connect to this". In particular, the port forwarding we use on normal internet-connected routers is impossible on a phone network, as the Network Address Translation is beyond our control.

### ADS-B & APRS: The Quick Solution

The quick solution to this is to *put them on the same local network*, wherever the portable system is, using a VPN. This way, Plane/Sailing Server will be able to see the portable system on one IP address regardless of where it is in the world, and connect directly to it. I am a recent convert to [Tailscale](https://tailscale.com) for this, as it's simple to set up on just about any device, and they provide the key management. I previously used [OpenVPN](https://openvpn.net/), which works just as well, though you need to generate and distribute keys manually.

![Tailscale dashboard showing several computers connected to a VPN with IP addresses shown](/projects/planesailing-portable/tailscale.png){: .center}
*Tailscale dashboard showing "plainsailingportable" and "innsmouth" (the Plane/Sailing Server) connected to the VPN with IP addresses in the same range*

The VPN allows Plane/Sailing Portable to connect in and be accessible from Plane/Sailing Server on a known IP address, in this case on the 100.x.y.z subnet, so that the server can connect to it rather than the other way around.

### ADS-B & APRS: Alternative Solutions

If you don't want to set up a VPN, there are some alternative approaches to solving this problem (i.e. that A needs to connect to B, but only B knows where A is, not the other way around).

The first and probably most common is an SSH reverse proxy. There's some good summaries of this approach [here](https://unix.stackexchange.com/questions/46235/how-does-reverse-ssh-tunneling-work).

What we will need to do is configure the portable system to run a command like this on startup:

```bash
ssh -f -N -T -R40005:localhost:30005 -R9001:localhost:8001 planesailingserver.ianrenton.com
```

This creates (and then backgrounds) an SSH session from the portable unit to the server, making reverse connections available from 40005 and 9001 on the server, back to 30005 and 8001 on the local (portable) end. Plane/Sailing can then be configured to connect to a BEAST data socket on `localhost` port 40005, and it will actually end up connecting to port 30005 on the portable unit; the same with APRS KISS from 9001 to 8001.

To prevent the portable system needing a password every time, keys should be used so that the portable system can authenticate with the server automatically.

The above approach comes with its own disadvantage, which is that it requires SSH access to the server from the outside world to be enabled. If we didn't want to deal with that security risk (hint: move to a non-standard SSH port and run `fail2ban`), there is another approach which could just allow the data itself into the server, using software like `ncat` and `socat`.

Here, we want to run a "double-ended" client on the portable system, and a "double-ended" server on the main system, in order to effectively change the client-server relationship between the two ends. Like so:

![Diagram of socat being used to bridge connections between dump1090 and direwolf on the portable system, and Plane/Sailing server](/projects/planesailing-portable/socat.png){: .center}

However, as you can see this is getting quite complicated with a lot of services to set up on both ends. It also scales badly, with more portable systems meaning more services running and more ports open. Even the SSH reverse proxy solution doesn't scale brilliantly, with a need to manually allocate two ports per system on the server end. The VPN approach is the simplest and most easily scaleable, and therefore preferred.