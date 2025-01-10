---
comments: true
layout: post
title: Adding Meshtastic Support
slug: adding-meshtastic-support
date: 2024-05-18 00:00:00
---

Since [getting into Meshtastic](/blog/meshtastic/) a while back, I have wanted to add support for tracking Meshtastic nodes into Plane/Sailing.

The Meshtastic software is very much in its early days, with incomplete documentation and rapidly changing functionality, but at the time of writing there are a number of ways of retrieving data from a node.

The "proper" way to support this from Plane/Sailing would be to take the Meshtastic project's [Protobuf](https://developers.google.com/protocol-buffers/) files, develop a standalone Java library for Meshtastic support, add Bluetooth and Serial support to Plane/Sailing, read the protobuf data directly, and use it. However, that sounds like more work than I'm up for at the moment, especially as Meshtastic isn't really designed for tracking mobile nodes with any great fidelity anyway.

Instead, for the moment, I have relied on the "ugly hack" of just having Plane/Sailing Server call the [Meshtastic Python CLI application](https://meshtastic.org/docs/software/python/cli/) directly. This isn't great because it involves a fragile and insecure system call, and currently is only implemented on Linux, but it sounds better than having to be the maintainer of the Java Meshtastic API library forever.

I roughly followed the [installation instructions](https://meshtastic.org/docs/software/python/cli/installation/) for the Meshtastic Python CLI, using a Python `venv` in the home directory:

```bash
sudo apt install python3 python3-pip python3-venv 
python3 -m venv ~/meshtastic-venv 
source ~/meshtastic-venv/bin/activate 
pip3 install --upgrade pytap2 
pip3 install --upgrade meshtastic 
deactivate
```

With the environment set up, I could then query a Meshtastic node on my local network with:

```bash
source ~/meshtastic-venv/bin/activate && meshtastic --host 192.168.1.143 --info
```

Because we are just depending on the Python CLI here, this could equally be used to talk to a Meshtastic node over Bluetooth or Serial.

The result of this command is a lot of information, unfortunately a mixture of text and JSON. But it does contain the info of all the known nodes, some of which will have position information, for example:

```json
Nodes in mesh: {
  "!da56f750": {
    "num": 3663132496,
    "user": {
      "id": "!da56f750",
      "longName": "2E0UXV",
      "shortName": "UXV",
      "macaddr": "34:b7:da:56:f7:50",
      "hwModel": "HELTEC_V3"
    },
    "position": {
      "latitudeI": [REDACTED],
      "longitudeI": [REDACTED],
      "altitude": 45,
      "time": 1716027582,
      "latitude": [REDACTED],
      "longitude": -[REDACTED]
    },
    "lastHeard": 1716027582,
    "deviceMetrics": {
      "batteryLevel": 74,
      "voltage": 3.959,
      "airUtilTx": 0.14147222
    }
  }
}
```

In Plane/Sailing, I required a bit of string manipulation to separate the JSON from everything else, but after that it was relatively easy to set up a new Meshtastic Node track type and integrate the data.

![A Meshtastic node shown in Plane/Sailing](/img/projects/planesailing/meshtastic-node.png)

Meshtastic node tracking, via the Python CLI, is now supported (on Linux only) as of Plane/Sailing v3.1.

Depending on demand for this feature, I may improve its implementation in future.
