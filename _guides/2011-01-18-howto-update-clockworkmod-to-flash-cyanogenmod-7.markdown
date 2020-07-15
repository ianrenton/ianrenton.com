---
author: Ian
comments: true
date: 2011-01-18 11:50:15
layout: post
slug: howto-update-clockworkmod-to-flash-cyanogenmod-7
title: 'HOWTO: Update ClockworkMod to flash CyanogenMod 7'
wordpress_id: 11432
categories:
- Guides
tags:
- Android
- clockworkmod
- cyanogen
- fastboot
- gingerbread
- Guide
- HOWTO
- recovery
---

_Since writing this article, Koush has updated ROM Manager to support the new 3.x versions of ClockworkMod Recovery.  The complex procedure within this guide is now unnecessary for the majority of users, who can simply flash CWM 3 through ROM Manager without requiring Engineering HBOOT or any console hackery._

_Once again: 99% of users will **NOT** need to follow this procedure. If you're not sure, you are in the 99%! :)_

_As always, I am not responsible for any loss of data, bricked phones or global thermonuclear wars that result from you following this guide._

At the time of writing (18 January 2011), the latest version of ClockworkMod Recovery is 3.0.0.5.  The latest version of ROM Manager is 3.0.0.7, and the similarity between those numbers seems to be causing some confusion amongst those trying to install newly-released ROMs based on Gingerbread.  To put it simply:

  * Gingerbread (Android 2.3) uses ext4 as its filesystem format.
  * Flashing a Gingerbread ROM such as CyanogenMod 7 creates an ext4 filesystem on your device.
  * Once your ROM is flashed, flashing Google Apps requires that your Recovery image can write to ext4.
  * ClockworkMod 2.x cannot write to ext4; ClockworkMod 3.x can.
  * ROM Manager is often used to install ClockworkMod, however, it does not list ClockworkMod 3.x versions yet.
  * You can put ClockworkMod 3.0.0.5 on your device without touching ROM Manager.
  * This guide shows you how.

The guide mentions the HTC Desire HD (HTC Ace) specifically because that's what I have, but it should be reasonably universal - just Google which button combination gets you into HBOOT on your device, and make sure you download the appropriate ClockworkMod image for your phone.

## Step 1: Get root and S-OFF if you haven't already

If you're still running a stock ROM and haven't yet got root or S-OFF on your device, follow the appropriate guide on the CyanogenMod wiki.  [Here's the one for the Desire HD](http://wiki.cyanogenmod.com/index.php?title=HTC_Desire_HD:_Full_Update_Guide).  The Engineering HBOOT section may be listed as optional; it _is required_ for this process.  (There are ways of flashing your recovery with only S-OFF rather than Engineering HBOOT, but they are not covered in this guide.)  Once you get to "Install a Custom Recovery Image", ignore the wiki and follow this guide.

## Step 2: Boot your device into FASTBOOT

Your device must be in FASTBOOT mode to accept a new Recovery image.  For the Desire HD:

  1. Turn off your device.  (If you came straight from stock and are using HTC's quick-boot feature, you may need to remove the battery for a few seconds to stop it quick-booting.)
  2. Boot into HBOOT.  (On a Desire HD, hold down the Volume Down button while turning your device on.  This varies between devices, if you have a different phone, the CyanogenMod wiki will probably tell you.)  You will arrive at a coloured text menu.
  3. The top green line should mention "S-OFF", if it doesn't, go back to Step 1 and try again.
  4. The first white-on-blue line says "HBOOT".  You're in HBOOT mode.
  5. The coloured items are a menu, which the orange text tells you how to use.  "FASTBOOT" is first and is already highlighted, so just press the Power button once to go into FASTBOOT.
  6. The white-on-blue "HBOOT" should now have changed into a white-on-red "FASTBOOT".  You're in FASTBOOT mode.
  7. Connect your phone to your computer via USB.

## Step 3: Put the fastboot app on your computer

  1. If you don't have the Android SDK, grab it from [Google's site](http://developer.android.com/sdk/index.html) and install it.
  2. Get the 'fastboot' app (`fastboot.exe`, `fastboot-mac` or `fastboot` for Win/Mac/Linux respectively) from [HTC's site](http://developer.htc.com/adp.html).
  3. Put the fastboot app in your SDK's tools folder ("`C:Android_SDKTools`", "`~/android_sdk/tools`" or wherever you installed it).
  4. Get the image for ClockworkMod 3.0.0.5 from [crackflashers.com](http://www.crackflashers.com) (thanks gridlock32404).  Here's a [direct link to the Desire HD ("Ace") image.](http://phones.crackflashers.com/ace/recoveries/ace-cwm3src3.0.0.5-1-16-11.img)
  5. Put that file in the `tools` directory alongside your fastboot app.
  6. Open a terminal on your computer and navigate to the tools directory.
  7. Run `fastboot devices` to check your phone is listed. (`fastboot-mac devices` on Mac. On Linux you may need to make `fastboot` executable first, run `chmod +x ./fastboot`)
  8. Assuming it's listed, run:  
`fastboot flash recovery /path/to/recovery.img`  
-- in the case of the file we downloaded above, if you put it in `tools`, the command becomes  
`fastboot flash recovery ./ace-cwm3src3.0.0.5-1-15-11.img`
  9. Run `fastboot reboot`

## Step 4: Boot into your new recovery!

  1. Turn off your device.  (If you're still using HTC's quick-boot feature, you may need to remove the battery again.)
  2. Hold down the Volume Down button while turning your device on.  You will arrive at a coloured text menu.
  3. The first white-on-blue line says "HBOOT".  You're in HBOOT mode.
  4. The coloured items are a menu, which the orange text tells you how to use.  "RECOVERY" is second, so press Volume Down to highlight it, then press the Power button once to go into Recovery.
  5. After the HTC logo, you'll see your new recovery image up and running.  The menu should be orange, and the line at the top should say "ClockworkMod Recovery v3.0.0.5".
  6. Happy flashing!
