---
layout: software
title: "Raspberry Pi Utilities"
comments: true
githublink: https://github.com/ianrenton/raspi-utils/
---

Raspberry Pi utilities.

* `capture*.sh` - RPi video capture and streaming scripts, one for each kind of streaming that I've found to work in some respect:
 * `capture-raspivid-netcat.sh` - Streams video from raspivid to a netcat listen socket. Client netcat can connect and pipe video to mplayer.
 * `capture-raspivid-vlc.sh` - Streams video from raspivid to VLC, which runs an HTTP server to stream it to clients.
 * `capture-mjpgstreamer.sh` - Runs raspistill rapidly and launches mjpg_streamer to broadcast the result.
* `videocapture` - init script to run `capture*.sh`. Very hacky.
