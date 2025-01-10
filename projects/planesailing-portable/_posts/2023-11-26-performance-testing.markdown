---
comments: true
layout: post
title: Performance Testing
slug: performance-testing
date: 2023-11-26 00:00:00
last_update: 2023-12-10T00:00:00+00:00
layout: post
---

### Interference

When I first ran SDRSharp with `rtl_tcp` on the Pi, the noise floor was a lot higher than I expected. Radio 1, normally one of the highest receive power broadcast radio stations, came in at only 15dB above a noise floor that was sat at around -43dB compared to full scale. Luckily, it appears that a lot of the high noise floor came from the device's location. The waterfall below shows the effect of moving the system from its original location balanced on top of its mains power supply (bottom third) to approximately 30cm away (middle third). The top third shows the effect when moved to battery power from a portable power pack&mdash;I was expecting this to be another improvement, but unfortunately it was worse!

![Screenshot of a spectrum waterfall](/img/projects/planesailing-portable/interference.png){: .center}

Overall bandwidth of the screenshot is 1MHz, with Radio 1 on 98.2MHz shown slightly to the right of centre.

Luckily, the advantage of battery power is that the unit can be moved around. I wanted to see if the problem was largely of my own creation (i.e. man-made interference), so I took it for a walk around the house and into the garden.

![Plane/Sailing Portable in a garden](/img/projects/planesailing-portable/garden.jpg){: .center}

This showed significant variation in background noise level, as shown in the waterfall below. As if I was in any doubt from my general ham radio experience&mdash;the inside of my house, full of DC power supplies, LED lights and powerline ethernet adapters, is a noisy place to be.

![Screenshot of a spectrum waterfall](/img/projects/planesailing-portable/interference2.png){: .center}

### Decoding Performance

In order to assess the performance of the system, it was used with the same antennas as the main Plane/Sailing system, swapped rapidly from one to the other. The message receive rates on the server (before the switch) and portable system (after the switch) were then compared. No noticeable difference in performance was observed between the systems when the same antennas were used.

In terms of CPU load, the following 1-minute load average values were observed. These were recorded as measured by `top`. The Pi Zero W has a 1GHz single-core CPU, so a load of 1.0 is fully utilised.

| State                                       | CPU Load |
|---------------------------------------------|----------|
| Idle                                        | 0.09     |
| rtl_test Running                            | 0.11     |
| rtl_tcp Running                             | 0.11     |
| rtl_tcp Streaming                           | 1.25     |
| AIS-Catcher Running                         | 0.42     |
| rtl_fm & Direwolf Running                   | 0.64     |
| dump1090 Running (No Decodes)               | 0.46     |
| dump1090 Running (approx 800 msgs/sec)      | 0.74     |
| dump1090 + PiAware                          | 0.76     |
| dump1090 + PiAware + FR24Feed               | 0.82     |
| dump1090 + PiAware + FR24Feed + OARC Feeder | 1.04     |

As you can see from the table, streaming from `rtl_tcp` really maxes out the CPU, and if you're tracking aircraft, 3 ADS-B feeders is about all the system can cope with as a maximum. (Most feeders will connect to a BEAST binary port on a different computer though, so if you're interested in feeding several places from the portable system, and have access to another always-on server, it might be better to run the feeders there instead of on the Pi Zero.)

Rates of APRS and AIS message receive at my location are low enough that it no noticeable effect on CPU load was detectable by plugging in the antenna (i.e. there was no load difference between the software being running but idle, and running and actively decoding). With ADS-B, the message receive rate was high enough to make a significant difference, which is why this distinction has been made in the table above.

Note that the ADS-B feeders are not sending or receiving MLAT in this portable setup. If this was configured, providing position information to the feeders to enable MLAT, the CPU usage could increase slightly.

Note also that (as covered in a later section) the device was also running the Tailscale client. This accounted for approximately 1-6% of CPU usage on top of that used by `ssh`, `top` and other background processes.

### Power Consumption

![Inline USB current meter next to Plane/Sailing Portable](/img/projects/planesailing-portable/current.jpg){: .center}
*Using an inline USB current meter to measure power consumption*

Power consumption was monitored during testing using an inline USB current meter. Results are as follows. All were at 5 V nominal, although the supply dropped as low as 4.75 V under the highest loads. Values quoted are the highest instantaneous value displayed by the device over 10 seconds of monitoring.

| State                                  | Current Draw / A |
|----------------------------------------|------------------|
| Startup                                | 0.325            |
| Idle                                   | 0.263            |
| rtl_test Running                       | 0.331            |
| rtl_tcp Running                        | 0.465            |
| rtl_tcp Streaming                      | 0.655            |
| AIS-Catcher Running                    | 0.466            |
| rtl_fm & Direwolf Running              | 0.498            |
| dump1090 Running (No Decodes)          | 0.527            |
| dump1090 Running (approx 800 msgs/sec) | 0.533            |
| dump1090 + 3 Feeders                   | 0.556            |
