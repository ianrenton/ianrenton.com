---
layout: post
title: "HOWTO: Install Linux on a Linx 1010B Tablet"
date: 2016-02-06T11:43:41+00:00
last_update: 2022-02-04T00:00:00+00:00
wordpress_id: 1030
---

Do you have an old [Linx 1010B tablet](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj_of_hpOb1AhXYilwKHZOVAlAQFnoECAUQAQ&url=https%3A%2F%2Fwww.amazon.co.uk%2FLinx-1010B-10-1-Tablet-Black%2Fdp%2FB014D847FS&usg=AOvVaw0SFLrDOW1XztJo4YE4GcIm) sat around doing nothing? These tablets were cheap, underpowered and are now very much showing their age, but if you'd like to give yours a new lease of life, consider installing Linux on it. This guide will show you how!

There are a lot of sections to this page and a lot of comments providing useful tips as well, but don't be put off! The good news is, if you just want to use the latest Ubuntu Long Term Support (LTS) release on this tablet, it’s now pretty easy. Linux support for the tablet's hardware is not perfect, but the vast majority of the tablet features should be usable.

![Ubuntu 20.04 on a Linx 1010B tablet](/guides/linx-2004.jpg){: .center}

## What’s Working?

Your first decision is the distribution and version of Linux to install. My personal preference is for Ubuntu Linux and the GNOME desktop environment, as this combination seems to provide the best tablet support at the current time.

With Ubuntu 20.04.3 LTS, the following all work:

*   Installation
*   Dual-booting with Windows 10
*   Touchscreen with multi-touch and on-screen keyboard
*   Gestures and long-press to right click
*   Sleep
*   Screen brightness
*   Sound
*   WiFi (although sometimes unreliable)
*   Bluetooth
*   Battery level

The one big omission seems to be the cameras. Neither front nor back camera work on Ubuntu 20.04.3, or any OS apart from Windows.

If you’re happy to use Ubuntu 20.04.3 with GNOME, carry on reading! If not, you might want to jump down to the "[Other Setups](#othersetups)" section.

<div class="notes">
  <p><strong>What about later (non-LTS) versions of Ubuntu?</strong></p>
  <p>At the time this page was last updated (January 2022), there have been three releases since 20.04 LTS. However, their installers don't work properly on the Linx tablet and will leave the system in an unbootable state, presenting a grub rescue prompt when trying to boot up the installed system. For this reason <strong>I still recommend installing Ubuntu 20.04.3</strong>. You can then do an in-place upgrade to 21.10 if you like.</p>
</div>

## Equipment Required

To get started you will need:

*   Linx 1010B tablet and charger
*   Ubuntu Linux ISO image (20.04.3 LTS 64-bit recommended, download from [here](https://ubuntu.com/download/desktop))
*   32-bit EFI boot image (download from [here](https://github.com/jfwells/linux-asus-t100ta/blob/master/boot/bootia32.efi?raw=true) or [here](/guides/bootia32.efi))
*   A USB memory stick with at least 4GB capacity

The Linx 1010B keyboard attachment (or other USB keyboard) is useful just in case you have touchscreen problems, though shouldn’t strictly be needed.

## Why the Extra Boot Image File?

The Linx 1010B uses the Bay Trail chipset, which has a history of causing frustration when trying to boot Linux, particularly because although it features a 64-bit processor, it uses an EFI system that only operates in 32-bit. So while I recommend a 64-bit OS, you will need this file to get the installer to boot properly with the 32-bit EFI.

## Considering Dual-Boot

Whether you dual-boot with Windows or wipe out Windows completely and just use Ubuntu is up to you. Ubuntu is now suitable for daily use on this tablet, so I’ve wiped off Windows completely. If you’re not sure, you can dual-boot for a while, but note that when dual-booting, Linux will be very limited in the amount of space available.

Whichever way you choose, the Ubuntu installer will handle if for you during the installation, but if you’re dual-booting you may need to clear out some space from within Windows, then run a disk cleanup, to ensure at least 8GB of space is free.

## Preparing for the Install

1.  Begin flashing your Ubuntu ISO onto your memory stick using [Unetbootin](https://unetbootin.github.io/).
2.  The USB stick will currently be bootable on EFI systems in 64-bit mode, but not in 32-bit mode (which is all this tablet supports). To fix this, grab the `bootia32.efi` file they you downloaded above, and place it in `<usb stick>:\EFI\boot\`.
3.  Turn your tablet off.
4.  Turn the tablet on while holding the Volume Up button. The screen should say something like "Esc is pressed", then you will be given a setup menu.
5.  My tablet had Secure Boot disabled by default, so you should be able to press "Boot Manager" and you’ll see your USB device in the list. Press it to continue. (If you don’t see it, play around in the setup menu until you find the option to disable Secure Boot, then press F10 on the keyboard to save, and repeat this step.)
6.  You will boot from the memory stick and get to the GRUB bootloader screen, following which Ubuntu will boot automatically.


## Installing Ubuntu

In Ubuntu 18.04 or later, this is now very easy as the installer understands about the 32-bit UEFI issue. You can click the "Install Ubuntu" icon and select most options as you normally would in the installer.

If you’re choosing to dual-boot, choose "Install Ubuntu alongside existing operating system" when prompted for where to install, and ensure that at least 8GB of space is allocated. Otherwise, you can choose to replace the existing Windows OS at this stage.

You shouldn't need to select "advanced partitioning options", but if you do it will offer to let you encrypt the disk. I would recommend you *don't* select this option&mdash;not because it'll break anything, but simply because there is no on-screen keyboard support on the disk unlock screen. If you set this option, you will require a keyboard every time you power on.

Once installation is complete, your tablet will prompt you to reboot. It should now start up automatically into the new Ubuntu installation.

<div class="notes">
  <p><strong>Congratulations!</strong> At this point, if you’re using Ubuntu 20.04.3 as recommended, you’re done! You should be able to connect to WiFi, use the tablet with or without the keyboard, and do almost everything you'd like to do with the tablet. Unless you'd like to explore other operating systems or desktop environments, you can stop reading here.</p>
</div>

## Post-Install Usage Notes

*   If you're encountering choppy scrolling, particularly noticeable in web browsers, it may be resolved by switching to Wayland as your graphics server. ([See this bug report](https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1883534).) To do that, log out, select your name on the login screen, and before entering your password click the "cogs" icon at the bottom right. Choose "Ubuntu on Wayland".
*   If GNOME feels sluggish, it can be slightly improved by turning off animations. This is possible using the "GNOME Tweaks" tool that you can install from Software Centre.
*   If you'd like to reclaim some screen space, you can set the dock to auto-hide, or remove it entirely, also using GNOME Tweaks. It's provided by the Ubuntu Dock GNOME Shell extension. (If you remove it completely, press "Activities" in the top left to get an application menu.)
*   It’s not that intuitive how to summon the GNOME on-screen keyboard if it doesn’t pop up automatically. You do it by swiping up from the bottom of the screen!

<div class="warning">
  <p><strong>Warning:</strong> As of January 2022, there is a <a href="https://bugs.launchpad.net/ubuntu/+source/linux-meta-hwe-5.13/+bug/1958410">known bug that prevents sound from working on the tablet</a> after updating your kernel. When applying system updates, I recommend at the moment that you don't accept any kernel updates (packages of the form <code>linux-image-*</code>), otherwise you may lose sound capability. There is no known solution to this at the moment, feel free to keep an eye on the linked bug page and if you're affected, let people know there.</p>
</div>

* * *

## Other Setups {#othersetups}

If you want an Ubuntu version other than 20.04.3, a desktop environment other than GNOME, a different Linux distribution, or a different Linux derivative such as Chrome OS or Android, the following sections gives some information and additional steps that may help you out. From here on, we assume a reasonable level of knowledge with Linux, disk partitioning etc. **The majority of users who have followed the instructions above can stop reading here!**

![Ubuntu 18.10 on a Linx 1010B tablet](/guides/linx-1810.png){: .center}

### Other Desktop Environments {#otherdes}

GNOME seems to be the best set up for tablets at this time, although it can be slow. If you want to stay with GNOME but speed things up a bit, you can install "GNOME Tweaks" and turn off animations, which gives a slight improvement.

I have also tried Cinnamon, MATE and XFCE on the tablet. As desktop environments that have more of a traditional desktop feel, they are less demanding and therefore faster and more responsive than GNOME. However, they also don't fully cater for tablets in the way that GNOME does. None of the three support automatic rotation of the screen based on the accelerometer, or automatic rotation of touch inputs. That means you'll have to set your screen rotation to landscape manually if you want to use it in that orientation, and if you want to use the touchscreen in landscape orientation, you'll need to rotate it using the command-line scripts [shown here](#screenrotation).

In XFCE particularly, I have also had issues with tapping to click and long-pressing to right-click.

### Ubuntu 21.10, 21.04 & 20.10

These are more recent releases than the recommended LTS version, 20.04.3. However, they seem to have a regression in terms of their support for Bay Trail tablets in the installer, and they does not correctly set up 32-bit EFI and grub. If you install from an Ubuntu 20.10, 21.04 or 21.10 image, you will likely find that you will boot to a grub rescue prompt and can't get into your new installation.

You can attempt to fix this by following [this procedure](#install32bitgrubafter), but it will be much easier (although more time consuming) to install 20.04.3 LTS as recommended and do an in-place upgrade to a later release.

Additionally, automatic screen rotation based on the accelerometer seems to be broken in Ubuntu 21.10.

### Ubuntu 20.04

I have tested Ubuntu 20.04.1 and 20.04.3 and found them to be working very well, as documented above. However, back before the ".1" update when using the base Ubuntu 20.04, a couple of people posted in the comments below about being unable to boot from USB after installation. We never got to the bottom of this, so for now I would not recommend going back to the base 20.04.

### Linux Mint 20.1

Mint 20.1 installs almost as well as the recommended Ubuntu 20.04.3, using the 32-bit EFI boot file trick. There are two caveats:

1. While Ubuntu Live USB automatically boots into "Try Ubuntu" after a few seconds, Mint does not. You'll therefore need a physical keyboard (just to press Enter once during first boot!) If that's not possible for you, you can work around it by opening `<usb stick>:\boot\grub\grub.cfg` on the computer you used to make it, and add the line `GRUB_TIMEOUT=5`.
2. See the note above on [Other Desktop Environments](#otherdes) regarding Cinnamon and MATE.

### Other Linux Distros

If you prefer Fedora, Dave H in the comments below reports that Fedora 29 with Gnome works well. There’s also [Fedlet](https://www.happyassassin.net/fedlet-a-fedora-remix-for-bay-trail-tablets/), a customised version specifically for Bay Trail computers, but it’s been out of development since 2016 so the main branch of Fedora is now much more likely to provide proper support for the tablet.

### Chrome OS

Two main builds of Chrome/Chromium OS exist for installation on generic PCs – [Arnold the Bat](https://arnoldthebat.co.uk/wordpress/chromium-os/) and [Neverware CloudReady](https://www.neverware.com/freedownload). As of January 2021, Arnold the Bat's arm 64-bit builds do boot (without any 32-bit EFI files required), but they do not recognise the tablet's WiFi adapter, or a USB WiFi adapter that I plugged in for testing. Unfortunately Chromium OS does not have a means to skip this section of the install, so I cannot test it any further.

CloudReady works a bit better, and provides more drivers for generic PC hardware including the WiFi. However, note that its installer doesn’t support dual boot, so if you want to install it you’ll have to get rid of Windows.

The last version of CloudReady that I tried is 87.3.41 (January 2021), which runs up fine (albeit slowly) in the USB stick environment, but does not successfully install. Prior to that I tried 83.4.4 (August 2020), which I did manage to install successfully. It's usable in "laptop mode", but with the following issues (see [forum thread](https://neverware.zendesk.com/hc/en-us/community/posts/360023071953-linx-1010-tablet-laptop-works-fine-but-no-touchscreen-)). The exact same issues were all present in version 76.4 (August 2019) as well, so I wouldn't expect them to be resolved soon - Bay Trail tablets are not officially supported by the project.

*   No touchscreen support at all
*   No orientation detection – screen needs rotating to 90 deg manually if you want to use it in landscape mode
*   Brightness control doesn’t work
*   Wifi is tempramental - sometimes it works fine, sometimes it reconnects over and over again
*   Cameras don’t work
*   No Bluetooth support
*   No Sleep/Suspend support

### Android

The [Android x86](https://www.android-x86.org/) project allows Android to be run and installed on generic Intel hardware such as the Linx 1010B. As of their Oreo/8.1 release, this does work, but it is **very slow**! It’s just about usable for light web browsing but it can take over a minute just to get from the lock screen to the launcher. On that basis, it’s not recommended.

If you want to try, you’ll need the same 32-bit EFI trick as with the standard Ubuntu instructions to get the USB stick to boot. It installs fine though and you can dual-boot with Windows. Sleep/suspend and cameras don’t work.

### Windows

The Linx 1010B tablets came with Windows 8 preinstalled, and were supported up to Windows 10 19H1. If you're having problems with your device but want to stick with Windows, or you've installed Linux, found it wasn't for you and want to go back, the easiest way is to install Linx's own custom Windows recovery image. This is Windows 10 Home 32-bit 19H1 with all the Linx tablet drivers included, and you can download it from [this link provided by Linx tech support](https://mega.nz/#!HUYV1IzZ!Gu5qiTjHZOS5TbzDg5z6dZD9RA7QRqKokz2Tkp3gyx4). I have a backup [here](https://ianrenton-my.sharepoint.com/:u:/p/ian/ERPcCpwHpZtOvUg8SP5lmk0BXSpPIXfH8KnKG0fJj6d1vQ?e=OeQluk) just in case they take it offline for any reason.

From that base, Windows should update itself to 20H2 and all the hardware, drivers etc. will continue to work. However, it won't update any further by itself. Trying to force it by using fresh download of Windows 10 21H2 direct from Microsoft, is not recommended as this install will be missing several key drivers including touchscreen, audio and cameras. Despite scouring the web, I have yet to identify good sources for driver downloads to restore the missing functionality when installing Windows this way.

The Linx 1010B does not meet the minimum system requirements for Windows 11. Amongst other problems, Windows 11 drops support for 32-bit processors&mdash;although the tablet processor is technically 64-bit, the Linux "hack" of using a 32-bit EFI boot image has never worked with Windows. If you use Windows, plan to stay on Windows 10.

### Ubuntu versions earlier than 18.04

![Ubuntu 15.10 on a Linx 1010B tablet](/guides/linx-1510.jpg){: .center}

These versions do not install alongside Windows properly or set up GRUB properly with the system’s 32-bit UEFI. Follow this procedure to get them installed:

1.  When it comes to step 3 of the installation, you should be offered to "Install Ubuntu alongside Windows Boot Manager". **Don’t** choose this, instead choose "Something Else".
2.  In the free space you cleared, create a single **ext3** partition and choose to mount it at `/`. (I didn’t have much luck with ext4, the installer locked up every time.) Make a note of the partition name — it should be `/dev/mmcblk0p5`.
3.  You’ll also be asked which disk/partition to install GRUB too — just leave this as the default as it won’t work anyway. We’ll fix that later.
4.  You’ll be warned about the lack of a swap partition. To save the flash memory from excess writing, and because very little space is available for Linux anyway, I chose to do without one.
5.  After copying files and configuring the system, the installer will show an error message because it failed to install GRUB. This is OK — installing GRUB is the last step, so the rest of the install has worked fine.
6.  Shut down the tablet, leaving the USB stick attached.

<p id="bootinternalfromusb">Currently, there’s no boot loader that will let you boot your Ubuntu install. What we can do temporarily is use the copy of GRUB on the USB stick, and tweak it to boot the copy of Ubuntu on your internal storage instead of the one it normally boots.</p>

The easiest way I found to do that is as follows:

1.  Boot into Windows.
2.  Open up your USB stick in Explorer, and open the file `<usb stick>:\boot\grub\grub.cfg` in a text editor.
3.  Just above the line `menuentry "Try Ubuntu without installing" {`, add the following lines:

```shell
GRUB_DEFAULT=0
GRUB_TIMEOUT=5
menuentry "Run from internal disk" {
    linux    (hd1,gpt5)/boot/vmlinuz-4.2.0-16-generic.efi.signed root=/dev/mmcblk0p5 intel_idle.max_cstate=0 quiet splash $vt_handoff
    initrd   (hd1,gpt5)/boot/initrd.img-4.2.0-16-generic
}
```

<div class="notes">
  <p>Note: I believe this should be the right kernel version that gets installed with Ubuntu 15.10. If it doesn’t boot at all, when you try to boot from GRUB in a moment, press <code>C</code> and enter the <code>linux</code> and <code>initrd</code> commands yourself, using tab completion to find the right versions.
  If it boots but you get a busybox console instead of a proper Ubuntu login GUI, check your partition numbering — <code>/dev/mmcblk0p5</code> may not be the right partition.</p>
</div>

Now turn your tablet off, and turn it on again with Volume Up held. As before you should be able to boot from the USB stick, but this time the GRUB menu will have a new "Run from internal disk" option. Ubuntu should start and you can log in as the user you set up.

Now follow these steps to get GRUB set up permanently without requiring the USB stick:

1.  Install the 32-bit version of grub by executing the following from a terminal: `sudo apt-get install grub-efi-ia32 grub-efi-ia32-bin`
2.  As before, we still don’t have a proper 32-bit EFI file for grub, so download [this one](http://www.thinktwisted.com/gradschool/Public/grubia32.efi).
3.  Place the downloaded file in the right location, instead of the 64-bit file that grub is expecting, which is at `/boot/efi/EFI/ubuntu/grubx64.efi`. (For example, `sudo mkdir -p /boot/efi/EFI/ubuntu && sudo cp grubia32.efi /boot/efi/EFI/ubuntu/grubx64.efi`.)
4.  Edit the default GRUB configuration on your tablet by opening `/etc/default/grub` in a text editor as root (e.g. `sudo nano /etc/default/grub`).
5.  There should be a line that reads `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`. Edit that so it reads `GRUB_CMDLINE_LINUX_DEFAULT="intel_idle.max_cstate=0 quiet splash"`.
6.  There should be a commented out line that reads `GRUB_TERMINAL="console"`. Uncomment that line.
7.  To start up without a keyboard attached, you will want the default GRUB option to boot automatically without you having to press Enter. To do this, make sure the lines at the top of the file that read something like:

        GRUB_DEFAULT=0
        GRUB_TIMEOUT=5
    
8.  If you have a line that sets `GRUB_HIDDEN_TIMEOUT`, comment it out.
9.  Save and close the file.
10.  Install GRUB with `sudo update-grub && sudo update-grub2 && sudo grub-install`.
11.  Check that GRUB has added "ubuntu" as an option to the EFI boot manager by running `sudo efibootmgr -v`. Check the four-digit numbers of each partition against the boot order shown, and it should list your Ubuntu install as the first one. If not, manually add this install to your EFI boot list with `sudo efibootmgr -c --disk /dev/mmcblk0 --part 1`.
12.  Shut down your tablet and remove the USB stick.
13.  Start up the tablet (no need to hold Volume Up any more!), and it should show you GRUB for a few seconds, then start up to the Ubuntu login screen.

## Other Useful Information

If you’re using a non-standard setup, some of the following sections might provide some useful information and code to fix problems you may have.

### Screen Rotation {#screenrotation}

If you’re using GNOME, the screen is probably rotating with tablet orientation as you would expect. If not, to rotate it, run the following commands. The first rotates the display to landscape mode, the second is required to rotate the touch input so it matches the screen.

```shell
xrandr -o right
xinput set-prop "pointer:Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
```

If you want this to happen automatically when you log in, save both commands to a file (e.g. `~/scripts/rotate`), make it executable (`chmod +x ~/scripts/rotate`) and add it to your desktop environment’s Startup Applications.

The equivalent script to set the screen back to portrait mode is as follows (thanks to Scott in the comments!):

```shell
xrandr -o normal
xinput set-prop "pointer:Goodix Capacitive Touchscreen" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
```

### Rotating the Login Screen

On Ubuntu 18.10 using the default GDM3 login screen, it should rotate automatically with tablet orientation as you would expect. Otherwise, it should be possible to apply the manual rotation above to the login screen as well by editing its configuration.

For example, in Ubuntu 15.04 using the default LightDM login screen, we achieve this by creating a file named `/etc/lightdm/lightdm.conf.d/80-display-setup.conf` with the following contents:

```ini
[SeatDefaults]
display-setup-script=xrandr -o right && xinput set-prop "pointer:Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
```

However, depending on the choice of login screen this may produce a "low graphics mode" error on startup and fail to display the login screen. In this eventuality it’s easiest just to perform the login in portrait orientation.

### Onboard setup

If you aren’t using GNOME, it’s a good idea to run "Onboard" (an on-screen keyboard) and configure it to your liking. (You may also prefer it to the GNOME on-screen keyboard anyway!) The following settings make it behave a lot like the Windows keyboard:

1.  General -> Auto-show when editing text
2.  General -> Show status icon
3.  Window -> Window options -> Dock to screen edge
4.  (Grab your onboard window and stretch it to your desired height)
5.  Window -> Resize Protection -> Window handles: None
6.  Layout -> Small
7.  Typing Assistance -> Show suggestions

### Long-press to Right Click

If you’re using Ubuntu 18.10 or above with the default GNOME environment, you should already be able to do a long press to right-click as you would expect. If not, Ubuntu’s "Universal Access" panel contains a "Simulated Secondary Click" option that should allow you to long-press on the touchscreen to get a right click effect. You can also achieve the same from the terminal with:

```shell
gsettings set org.gnome.desktop.a11y.mouse secondary-click-enabled "true"
```

On older versions of Ubuntu, the touchscreen sensitivity seems to be very high, so even if you keep your finger relatively still, it is still counted as a left button drag rather than a right button click. No other GNOME/Unity settings appear to alter this.

There are some xinput options that are configurable and should achieve this as well, such as those below, but I have not succeeded in getting them working so far.

```shell
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Emulation" "1"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Threshold" "100"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Timout" "500"
```

### Installing 32-bit Grub after a Botched Install {#install32bitgrubafter}

If you have installed a version of Linux (such as Ubuntu 20.10, 21.04 or 21.04) which installs a 64-bit grub and thus doesn't boot, my recommendation as above is still to start from 20.04.3 LTS and upgrade in place. If for any reason you aren't willing to do that, you may be able to make your installation bootable by following this procedure, provided by Damien in the comments.

First, boot from your Live USB and connect to WiFi. Then run the following commands.

<div class="warning">
  <p><strong>Warning:</strong> The disk and partition names included here are correct for the internal disk of my tablet. You may need to change them depending on your setup. Note there are <strong>four</strong> variables to set&mdash;three at the top and one inside the chroot. Be very careful if you are trying to dual boot with Windows as your partitions will be different!</p>
</div>

```shell
# Gain root permissions
sudo -iH

# Set the EFI partition on the disk. The example here is the default if you
# have chosen to remove everything and install only Linux.
efi=/dev/mmcblk1p1
# Set the root partition on the disk used by Linux. The example here is the
# default if you have chosen to remove everything and install only Linux.
root=/dev/mmcblk1p2
# Set a temporary location in which to mount the root partition.
tempmount=/mnt/target

# Mount everything we need to perform a chroot into the tablet's installed
# Linux environment
mkdir -p $tempmount
mount $root $tempmount
mount $efi $tempmount/boot/efi
for i in dev dev/pts sys proc run ; do mount --bind /$i $tempmount/$i; done

# chroot in. From this point forward you will effectively be working within
# the installed environment, and not the Live USB environment
chroot $tempmount /bin/bash

# Set the disk you will install grub into the bootloader of. The example here
# is my internal storage on the tablet.
disk=/dev/mmcblk1

# change the prompt so we know we're in the chroot, for safety
export PS1="(chroot) $PS1" 

# Install 32-bit grub
apt install grub-efi-ia32-bin
grub-install $disk

# Update grub so it picks up your partitions, kernel version etc
update-grub

# Leave the chroot
exit

# Now we have left the chroot. Time to unmount it all.
# (note the "" to umount target /)
for i in dev/pts dev sys proc run boot/efi "" ; do umount $tempmount/$i; done

# check we've not missed any umounts - should return blank.
mount | grep $tempmount
```

Restart the tablet without the Live USB inserted, and hopefully you get into your proper installed OS.

## Thanks To...

To get this far I’ve used information from the following places. I’m extremely grateful to the people that wrote them!

*   [Latest steps to install Ubuntu on the Asus T100TA](http://www.jfwhome.com/2016/01/04/latest-steps-to-install-ubuntu-on-the-asus-t100ta/)
*   [Installing Ubuntu on Bay Trail tablets (version 2)](https://sturmflut.github.io/linux/ubuntu/2015/02/04/installing-ubuntu-on-baytrail-tablets-version-2/)
*   [How do I repair grub2 (not) booting 32-bit EFI on a 64-bit machine?](https://unix.stackexchange.com/questions/206274/how-do-i-repair-grub2-not-booting-32-bit-efi-on-a-64-bit-machine/215546#215546)
*   [How to reinstall GRUB2 EFI?](https://superuser.com/questions/376470/how-to-reinstall-grub2-efi/376471#376471)
*   [lightdm – rotated monitor. login screen needs rotation](https://askubuntu.com/questions/408302/rotated-monitor-login-screen-needs-rotation/466618)
*   And all the many commenters down below who have contributed to this page.
