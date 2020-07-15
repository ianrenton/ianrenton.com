---
layout: post
title: "ATP: Camera Mounting"
date: 2015-01-08 21:25
comments: true
categories:
---

With the All-Terrain Pi freely exploring, the next step is to add a camera to it so it can be driven around beyond line of sight.

I'm actually using the camera from the quadcopter, which is in the 'shop' (my very messy desk) at the moment.

![Raspberry Pi Camera](/atp/40.jpg){: .center}

Unfortunately, there's no neat place on the All-Terrain Pi chassis to fit a camera. The front 80% of the chassis rolls around 30 degrees off vertical when the vehicle turns, which isn't ideal. The only section that remains vertical at all times is the rear section.

For this reason I decided to run the vehicle in reverse. This allows a fixed front section to mount sensors, at the cost of making the vehicle effectively have rear-wheel steering.

For a temporary fit, the camera was fitted with some sticky-backed velcro.

![Raspberry Pi Camera with velcro](/atp/41.jpg){: .center}

The counterpart was stuck to what's now the front section of the robot.

![Velcro mount for camera](/atp/42.jpg){: .center}

The camera can now be fixed to the front:

![Camera fitted to robot](/atp/43.jpg){: .center}

And a long camera cable was fitted to allow for the fact that the electronics stack will move from side to side during operation.

![All-Terrain Pi with Camera](/atp/44.jpg){: .center}

I was hoping that for an initial test, the `raspivid` utility could be used from my desktop via X forwarding. Unfortunately, the preview functionality of `raspivid` doesn't seem to be compatible with X forwarding over SSH, so in the screenshot below I have taken an image with `raspistill` and opened that in an image viewer over SSH.

![Demonstration of Camera working](/atp/45.jpg){: .center}
