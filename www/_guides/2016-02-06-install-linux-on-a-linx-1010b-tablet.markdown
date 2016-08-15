---
layout: post
title: "HOWTO: Install Linux on a Linx 1010B Tablet"
date: 2016-02-06T11:43:41+00:00
---

<div class="notes"><p>This guide is a work in progress. I have not yet got everything I'd like to have working, but it is bootable and most of the hardware works. I will be updating this post if and when I get more features working properly.</p></div>

{% img center //files.ianrenton.com/sites/guides/linx1010b-ubuntu.jpg %}

In this guide I will be demonstrating how to install Linux on the [Linx 1010B tablet](http://www.currys.co.uk/gbuk/computing/tablets-and-ereaders/tablets/linx-1010b-10-1-tablet-32-gb-black-10138450-pdt.html), a low-cost 10-inch Windows 10 tablet. It uses the Bay Trail chipset, which has a history of causing frustration when trying to boot Linux, particularly because although it features a 64-bit processor, it uses an EFI system that only operates in 32-bit.

I will be using Ubuntu 15.10 in this tutorial because I'm most familiar with Debian-based distros. If you prefer Fedora you may have more luck with [Fedlet](https://www.happyassassin.net/fedlet-a-fedora-remix-for-bay-trail-tablets/), a customised version specifically for Bay Trail computers.

This guide assumes a reasonable level of knowledge with Linux, disk partitioning etc.

## Current Status

The following things are currently working:

* Installation
* Dual-booting with Windows 10
* Touchscreen with multi-touch and on-screen keyboard

These things aren't working yet:

* Built-in WiFi
* Battery level reporting
* Suspend
* Automatic brightness
* Long press to right-click

Things I haven't tested:

* Sound
* Bluetooth
* Cameras

## Equipment Required

To get started you will need:

* Linx 1010B tablet and charger
* Ubuntu 15.10 64-bit ISO image (download from [here](http://www.ubuntu.com/download/desktop/thank-you?country=GB&version=15.10&architecture=amd64))
* A USB memory stick with at least 4GB capacity
* The Linx 1010B keyboard attachment, or other USB keyboard
* (Currently) a USB WiFi dongle supported by Ubuntu ([list](https://help.ubuntu.com/community/WifiDocs/WirelessCardsSupported))

## Preparing for Ubuntu Installation

I recommend dual-booting Ubuntu with Windows for now while the tablet doesn't have full Linux support. The disadvantage of this will be very limited space on the Ubuntu partition (~8GB), but the ability to fall back to Windows if things go wrong is very useful!

1. Begin by putting your Ubuntu ISO onto your memory stick using [Unetbootin](https://unetbootin.github.io/). You may want to delete the ISO from your hard disk afterwards to save space!
2. The USB stick will currently be bootable on EFI systems in 64-bit mode, but not in 32-bit mode (which is all this tablet supports). To fix this, grab [this bootia32.efi file](https://github.com/jfwells/linux-asus-t100ta/blob/master/boot/bootia32.efi) and place it in `<USB stick>:\EFI\boot\`.
3. You need to repartition your tablet's internal storage to make space for Ubuntu. The easiest way to do this is to resize your Windows partition in Windows Disk Management. Reduce it to the smallest size it can be, which should leave you with around 8GB of free unpartitioned space. (If not, uninstall some stuff in Windows first.) Don't create a new partition now, we'll do that from within the Ubuntu installer.
4. Turn your tablet off.
5. Connect your Linx or USB keyboard.
6. Turn the tablet on while holding the Volume Up button. The screen should say something like "Esc is pressed", then you will be given a setup menu.
7. My tablet had Secure Boot disabled by default, so you should be able to press "Boot Manager" and you'll see your USB device in the list. Press it to continue. (If you don't see it, play around in the setup menu until you find the option to disable it, then reboot.)
8. You will get to the GRUB bootloader screen, which doesn't support touch input. Using your keyboard, go down to "Install Ubuntu" and press Enter. The Ubuntu installer will run.

## Installing Ubuntu

1. In the Ubuntu installer, select most options as you normally would. The only unusual settings are to make sure you **don't** choose to download updated packages, and the following changes in the disk partitioning section:
2. When it comes to step 3 of the installation, you should be offered to "Install Ubuntu alongside Windows Boot Manager". **Don't** choose this, instead choose "Something Else".
3. In the free space you cleared, create a single **ext3** partition and choose to mount it at `/`. (I didn't have much luck with ext4, the installer locked up every time.) Make a note of the partition name &mdash; it should be `/dev/mmcblk0p5`.
4. You'll also be asked which disk/partition to install GRUB too &mdash; just leave this as the default as it won't work anyway. We'll fix that later.
5. You'll be warned about the lack of a swap partition. To save the flash memory from excess writing, and because very little space is available for Linux anyway, I chose to do without one.
6. After copying files and configuring the system, the installer will show an error message because it failed to install GRUB. This is OK &mdash; installing GRUB is the last step, so the rest of the install has worked fine.
7. Shut down the tablet, leaving the USB stick attached.

## First Boot

Currently, there's no boot loader that will let you boot your Ubuntu install. What we can do temporarily is use the copy of GRUB on the USB stick, and tweak it to boot the copy of Ubuntu on your internal storage instead of the one it normally boots.

The easiest way I found to do that is as follows:

1. Boot into Windows.
2. Open up your USB stick in Explorer, and open the file `<USB stick>:\boot\grub\grub.cfg` in a text editor.
3. Just above the line `menuentry "Try Ubuntu without installing" {`, add the following lines:

          GRUB_DEFAULT=0
          GRUB_TIMEOUT=5

          menuentry "Run from internal disk" {
	          linux	(hd1,gpt5)/boot/vmlinuz-4.2.0-16-generic.efi.signed root=/dev/mmcblk0p5 intel_idle.max_cstate=0 quiet splash $vt_handoff
	          initrd	(hd1,gpt5)/boot/initrd.img-4.2.0-16-generic
          }

<div class="notes"><p>Note: I believe this should be the right kernel version that gets installed with Ubuntu 15.10. If it doesn't boot at all, when you try to boot from GRUB in a moment, press <code>C</code> and enter the <code>linux</code> and <code>initrd</code> commands yourself, using tab completion to find the right versions.</p>
<p>If it boots but you get a busybox console instead of a proper Ubuntu login GUI, check your partition numbering &mdash; <code>/dev/mmcblk0p5</code> may not be the right partition.</p></div>

Now turn your tablet off, and turn it on again with Volume Up held. As before you should be able to boot from the USB stick, but this time the GRUB menu will have a new "Run from internal disk" option.

Ubuntu should start and you can log in as the user you set up. Everything will be sideways for now, we'll fix that soon!

## Screen Rotation

If you're using the Linx keyboard, the most frustrating thing right now is probably that the screen is in portrait mode. To rotate it, run the following commands. The first rotates the display, the second is required to rotate the touch input so it matches the screen.

```
xrandr -o right
xinput set-prop "Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
```

If you want this to happen automatically when you log in, save both commands to a file (e.g. `~/scripts/rotate`), make it executable (`chmod +x ~/scripts/rotate`) and add it to Ubuntu's Startup Applications.

The equivalent script to set the screen back to portrait mode is as follows (thanks to Scott in the comments!):

```
xrandr -o normal
xinput set-prop "Goodix Capacitive Touchscreen" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
```

### Rotating the Login Screen

It should be possible to apply this to the login screen as well, by creating a file named `/etc/lightdm/lightdm.conf.d/80-display-setup.conf` with the following contents:

```
[SeatDefaults]
display-setup-script=xrandr -o right && xinput set-prop "Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
```

However, for me this produces a "low graphics mode" error on startup and the Unity greeter fails to run.

## Preparing for Touchscreen-only use

Since you probably want to detach the keyboard at some point, it's a good idea to run Onboard (the on-screen keyboard) and configure it to your liking. The following settings make it behave a lot like the Windows keyboard:

1. General -> Auto-show when editing text
2. General -> Show status icon
3. Window -> Window options -> Dock to screen edge
4. (Grab your onboard window and stretch it to your desired height now)
5. Window -> Resize Protection -> Window handles: None
6. Layout -> Small
7. Typing Assistance -> Show suggestions

You should now be able to detach the keyboard and still use the tablet, though you might want to keep it connected for the upcoming sections which heavily use the terminal.

If you use Firefox, you may want to install the [Grab and Drag](https://addons.mozilla.org/en-GB/firefox/addon/grab-and-drag/) add-on which will improve web browsing with a touchscreen.

### Long-press to Right Click

Ubuntu's "Universal Access" panel contains a "Simulated Secondary Click" option that should allow you to long-press on the touchscreen to get a right click effect. You can also achieve the same from the terminal with:

```
gsettings set org.gnome.desktop.a11y.mouse secondary-click-enabled "true"
```

Unfortunately, the touchscreen sensitivity seems to be very high, so even if you keep your finger relatively still, it is still counted as a left button drag rather than a right button click. No other GNOME/Unity settings appear to alter this.

There are some xinput options that are configurable and should achieve this as well, such as those below, but I have not succeeded in getting them working so far.

```
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Emulation" "1"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Threshold" "100"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Timout" "500"
```

## Setting up WiFi

The internal WiFi adapter is currently unsupported by Ubuntu, so plug in the USB one. It should work immediately, if not, reboot and it will come up.

Before proceeding, update your packages with `sudo apt-get update && sudo apt-get upgrade`.

## Booting to Ubuntu properly

So far we are still relying on the USB stick to boot into Ubuntu. The following steps will add Ubuntu as a new option on the built-in EFI boot loader, so the USB stick is no longer required. It will set Ubuntu to be the default, but it will still be possible to boot into Windows by holding Volume Up during boot and selecting the Windows partition.

1. Install the 32-bit version of grub by executing the following from a terminal: `sudo apt-get install grub-efi-ia32 grub-efi-ia32-bin`
2. As before, we still don't have a proper 32-bit EFI file for grub, so download [this one](http://www.thinktwisted.com/gradschool/Public/grubia32.efi).
3. Place the downloaded file in the right location, instead of the 64-bit file that grub is expecting, which is at `/boot/efi/EFI/ubuntu/grubx64.efi`. (For example, `sudo mkdir -p /boot/efi/EFI/ubuntu && sudo cp grubia31.efi /boot/efi/EFI/ubuntu/grubx64.efi`.)
4. Edit the default GRUB configuration on your tablet by opening `/etc/default/grub` in a text editor as root (e.g. `sudo nano /etc/default/grub`).
5. There should be a line that reads `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`. Edit that so it reads `GRUB_CMDLINE_LINUX_DEFAULT="intel_idle.max_cstate=0 quiet splash"`.
6. There should be a commented out line that reads `GRUB_TERMINAL="console"`. Uncomment that line.
7. To start up without a keyboard attached, you will want the default GRUB option to boot automatically without you having to press Enter. To do this, make sure the lines at the top of the file that read something like:

          GRUB_DEFAULT=0
          GRUB_TIMEOUT=5

8. If you have a line that sets `GRUB_HIDDEN_TIMEOUT`, comment it out.
9. Save and close the file.
10. Install GRUB with `sudo update-grub && sudo update-grub2 && sudo grub-install`.
11. Check that GRUB has added "ubuntu" as an option to the EFI boot manager by running `sudo efibootmgr -v`. Check the four-digit numbers of each partition against the boot order shown, and it should list your Ubuntu install as the first one. If not, manually add this install to your EFI boot list with `sudo efibootmgr -c --disk /dev/mmcblk0 --part 1`.
12. Shut down your tablet and remove the USB stick.
13. Start up the tablet (no need to hold Volume Up any more!), and it should show you GRUB for a few seconds, then start up to the Ubuntu login screen.

## Thanks To...

To get this far I've used information from the following places. I'm extremely grateful to the people that wrote them!

* [Latest steps to install Ubuntu on the Asus T100TA](http://www.jfwhome.com/2016/01/04/latest-steps-to-install-ubuntu-on-the-asus-t100ta/)
* [Installing Ubuntu on Bay Trail tablets (version 2)](https://sturmflut.github.io/linux/ubuntu/2015/02/04/installing-ubuntu-on-baytrail-tablets-version-2/)
* [How do I repair grub2 (not) booting 32-bit EFI on a 64-bit machine?](http://unix.stackexchange.com/questions/206274/how-do-i-repair-grub2-not-booting-32-bit-efi-on-a-64-bit-machine/215546#215546)
* [How to reinstall GRUB2 EFI?](http://superuser.com/questions/376470/how-to-reinstall-grub2-efi/376471#376471)
* [lightdm - rotated monitor. login screen needs rotation](http://askubuntu.com/a/466618)
