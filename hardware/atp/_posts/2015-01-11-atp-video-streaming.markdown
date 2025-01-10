---
layout: post
title: "ATP: Video Streaming"
date: 2015-01-11 21:57
comments: true
---

One of the goals of the All-Terrain Pi was to have a "game-like" smartphone control experience, where touch and tilt input controls the vehicle, and the feedback is full-screen video streamed from the vehicle &mdash; and all of it in the browser for maximum cross-platform compatability.

With [the control input sorted](../atp-smartphone-control), it's time to sort out that streaming video.

For the browser, there's only two options that don't require (often desktop-only) plugins: HTML5 video and MJPEG. Of these, getting the Raspberry Pi camera video encoded into something that would work cross-platform with HTML5 video turns out to be particularly awkward, so MJPEG was chosen.

MJPEG (motion JPEG) was also the video streaming format [used on the tank](http://robots.ianrenton.com/day-14-video-streaming/). There, it returns only a couple of frames per second from a webcam with proper Video4Linux support, so I wasn't optimistic about its performance with the Raspberry Pi's unusual camera.

![Raspberry Pi camera powered on](/hardware/atp/47.jpg){: .center}

Luckily, I shouldn't have been worried. Github user jacksonliam has written an [mjpg_streamer input plugin](https://github.com/jacksonliam/mjpg-streamer) specifically for the Raspberry Pi camera, which with good network conditions can achieve 15fps at high resolution!

One compile of his experimental build of mjpg_streamer later, we were up and running! (Compiling required dependencies: `cmake build-essential libjpeg8-dev imagemagick libv4l-dev`. I've been lazy and included the whole thing &mdash; binaries and all &mdash; [in my repository](https://github.com/ianrenton/All-Terrain-Pi/tree/master/home/pi/mjpg-streamer-experimental), if you want to grab that and save yourself the compile step.)

![mjpg_streamer display on desktop computer](/hardware/atp/48.jpg){: .center}

With mjpg_streamer successfully streaming video at >10fps (much better than the tank), all that remained was to point the All-Terrain Pi's web interface at the MJPEG stream and use it as the background to the control UI.

The interface is complete!

![mjpg_streamer display on smartphone](/hardware/atp/49.jpg){: .center}
