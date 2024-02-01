---
comments: true
layout: post
title: Future Enhancements
slug: future-enhancements
date: 2023-12-01 00:00:00
last_update: 2023-12-30T00:00:00+00:00
layout: post
---

A number of future enhancements are being considered for the project to overcome its current limitations.

### Improved RTL-SDR Mounting

The RTL-SDR is still held on by a cable tie in the current prototype. With the ability to precisely cut perspex or 3D print, a bracket could be fashioned to hold the dongle securely.

### 4G & GPS

To overcome the system's current reliance on household WiFi or phone tethering, a [4G HAT](https://thepihut.com/products/4g-phat-for-raspberry-pi-lte-cat-4-3g-2g-with-gnss-positioning) could be added. This relies on PoGo pins underneath the Pi Zero rather than being a true "HAT", which means it would have to take the place of the USB hub. Luckily, the 4G HAT identified does have an end-mounted USB A socket, so it's an easy replacement!

The addition of a 4G radio would allow Plane/Sailing Portable to talk directly to the Plane/Sailing server and the wider internet without depending on WiFi. As the board also has a GPS receiver, this also enables other features such as being able to use MLAT for Mode-S signals, and reporting its own position to Plane/Sailing, APRS.fi etc.

However, this device is expensive and comes with the ongoing expense of needing a SIM card and data contract&mdash;a consideration for the future if I build more of these systems and use them in more interesting places.

This board also requires separate antennas for the GPS and LTE radios, with fragile U.FL connectors on the PCB. To improve ruggedness I would want to encapsulate this all inside a box and have three SMA connectors on the outside, and at this point it is stretching the definition of "as small as possible".

### Battery Power

Another desirable upgrade would be to remove the reliance on USB power, and provide an internal battery that would also be chargeable through the system.

There are a number of neat options such as [this UPS HAT](https://thepihut.com/products/uninterruptible-power-supply-ups-hat-for-raspberry-pi-zero), but unfortunately it too uses PoGo pins to connect to the underside of the Pi Zero. The USB hub (or 4G/GPS HAT if upgraded) is already in this position, so unfortunately this is a non-starter.

Although not as neat in terms of battery placement, and not having a built-in switch, the [PiJuice Zero](https://uk.pi-supply.com/products/pijuice-zero) may be a better option as it mounts to the top of the Pi Zero using header pins instead.

### Screen and Buttons

The final concession to simplicity made at design time was that the mode could be changed between ADS-B, AIS, APRS and rtl_tcp by logging in via SSH and running a script. SSH&mdash;or seeing the results on the Plane/Sailing interface&mdash;is also the only way to know if it's working.

An additional board providing a small screen and a few buttons, such as this [1.3" OLED display HAT](https://thepihut.com/products/1-3inch-oled-display-hat-for-raspberry-pi-128x64) could provide information on the unit's function as well as the ability to change it, and perhaps even to log into a WiFi network, via the buttons.

This again does increase the size of the system, going against the "as small as possible" idea, but the size increase is modest and the functional improvement significant.

### 3D-Printed Case

To improve the ruggedness of the system and make it look neat and tidy, a case could be used. No commercially available cases will neatly fit the specific set of components in use here, so one would have to be manufactured, likely by 3D printing. I don't have a 3D printer, so this will be postponed until I have decided which (if any) of the additional hardware options I will use, so that I only have to get it printed once.