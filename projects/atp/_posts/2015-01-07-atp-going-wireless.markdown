---
layout: post
title: "ATP: Going Wireless"
date: 2015-01-07 21:24
comments: true

---

We have a set of boards capable of controlling the vehicle &mdash; all that's left to get the electronics stack wired up to the vehicle and cut the cables tethering the Pi to other things.

![Original control board](/img/projects/atp/25.jpg){: .center}

First of all, the original control board has to go. The six wires that join it to the battery and motors were cut, leaving stubs in case we need to restore the original functionality.

![Original control board with snipped cables](/img/projects/atp/26.jpg){: .center}

![Trailing wires](/img/projects/atp/27.jpg){: .center}

Now we have something to connect up to.  The electronics stack has no neat place to sit on top of the vehicle, but the area on top of the battery enclosure is the closest there is to a flat area. This is part of the section of the vehicle that tilts when turning (which is roughly 80% of the chassis), so it must be firmly attached. Three cable ties do the job during testing, until a better mount can be designed.

![Electronics stack tied to chassis](/img/projects/atp/28.jpg){: .center}

With a stable location for the electronics stack, the somewhat fragile cables can now be connected to the PicoBorg control board. Red and blue connect to the battery, black and grey to the main drive motor, and orange and green to the tilt/turn motor.

![Connections on PicoBorg](/img/projects/atp/30.jpg){: .center}

We're now capable of controlling the robot's motors from the Pi, although as we still require power, keyboard, mouse and monitor plugged into the Pi, it can't be driven around just yet.

![Electronics stack connected to robot](/img/projects/atp/31.jpg){: .center}

Using the simple Python GUI supplied with the PicoBorg libraries, we can test the motors in turn to ensure each one works as expected &mdash; with the robot lifted off the ground when testing the drive motor.

![PicoBorg test GUI in use](/img/projects/atp/32.jpg){: .center}

![](/img/projects/atp/33.jpg){: .center}

There are a few more wires to cut. Firstly, attaching a WiFi adapter and configuring it to run as an access point allows remote access to the Pi via SSH.

![All-Terrain Pi with WiFi dongle fitted](/img/projects/atp/35.jpg){: .center}

The USB power cable is now the only connection tying the robot to the wall. The BattBorg allows us to cut that cord too and provide 5V power supply to the Raspberry Pi from the vehicle's batteries.

![Attaching the BattBorg to the PicoBorg](/img/projects/atp/36.jpg){: .center}

![Attaching the BattBorg to the electronics stack](/img/projects/atp/37.jpg){: .center}

This now allows the All-Terrain Pi robot to be powered up without connection to anything else &mdash; it's finally mobile.

![All-Terrain Pi powered up independently](/img/projects/atp/38.jpg){: .center}

Now we're free to roam!

![Freely roaming All-Terrain Pi](/img/projects/atp/39.jpg){: .center}

Here's a video of its first run using the PicoBorg example GUI:

<center><video width="640" controls><source src="https://video.ianrenton.com/atp/remotecontroltest.mp4" type="video/mp4"></video></center>
