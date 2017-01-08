---
layout: software
title: "Quadcopter Software"
comments: true
githublink: https://github.com/ianrenton/quadcopter/
---

Scripts used to control my quadcopter, and other miscellaneous stuff.

* `remote/remote_server.py` - Accepts NMEA strings over TCP and makes the appropriate demands of the quad via serial output
* `remote/remote_client.py` - Hacky client for `remote_server.py` that uses keyboard input to send demands
* `video/stream.sh` - Stream video from the RPi using netcat and mplayer
* `transmitter/txconfig.dat` - Channel map for my 2.4GHz transmitter
