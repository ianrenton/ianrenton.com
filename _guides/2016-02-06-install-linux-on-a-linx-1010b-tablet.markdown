---
layout: post
title: "HOWTO: Install Linux on a Linx 1010B Tablet"
date: 2016-02-06T11:43:41+00:00
last_update: 2022-12-27T00:00:00+00:00
wordpress_id: 1030
---

* TOC
{:toc}
{: #toc}

Do you have an old [Linx 1010B tablet](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj_of_hpOb1AhXYilwKHZOVAlAQFnoECAUQAQ&url=https%3A%2F%2Fwww.amazon.co.uk%2FLinx-1010B-10-1-Tablet-Black%2Fdp%2FB014D847FS&usg=AOvVaw0SFLrDOW1XztJo4YE4GcIm) sat around doing nothing? These tablets were cheap, underpowered and are now very much showing their age; in particular they no longer receive Windows updates. If you'd like to give yours a new lease of life, consider installing Linux on it. This guide will show you how.

There are a lot of sections to this page and a lot of comments providing useful tips as well, but don't be put off! The good news is, if you are happy to use the latest version of Fedora Linux Workstation on this tablet, you should be able to get up and running within an hour with minimal Linux knowledge.

Further down the page, there's also instructions on how to revert back to Windows if you change your mind, so don't worry&mdash;so long as you've backed up anything of importance on your tablet, you shouldn't be at risk of losing anything.

## What’s Working?

Your first decision is the distribution and version of Linux to install. My personal preference is for Fedora Linux and the GNOME desktop environment, as this combination seems to provide the best support for the LINX1010B tablet's hardware at the time this page was last updated.

With Fedora Workstation 37, the following all work:

*   Installation
*   Dual-booting with Windows 10
*   Touchscreen with multi-touch and on-screen keyboard
*   Automatic screen rotation using accelerometer
*   Gestures and long-press to right click
*   Sleep
*   Screen brightness
*   Sound
*   WiFi
*   Bluetooth
*   Battery level

The following features do not work:

*   Cameras *(drivers only seem to work for Windows)*

If you’re happy to use Fedora Linux with the default GNOME desktop environment, carry on reading! If not, you might want to jump down to the "[Other Setups](#othersetups)" section.

<div class="notes">
  <p><strong>Why not Ubuntu?</strong></p>
  <p>For first-time Linux users, Ubuntu would normally be my distro recommendation, due to the incredible amount of help and resources available for it online. However, since around 2020 Ubuntu support for the Linx tablet has been getting steadily worse, particularly around the 32-bit EFI/grub issues, and now in 2022 a new problem with sound output. For this reason I have switched my recommendation to Fedora as it now offers the easiest setup and least bugs. If you still want to try Ubuntu, check out <a href="#ubuntu">the Ubuntu section of this page</a>.</p>
</div>

![Fedora Workstation on a Linx 1010B tablet](/guides/linx-fedora-2022.jpg){: .center}
*Fedora Workstation on a Linx 1010B tablet*

## Equipment Required

To get started you will need:

*   Linx 1010B tablet and charger
*   A Fedora Workstation x86_64 Live ISO image (download from [here](https://getfedora.org/en/workstation/download/))
*   The [Rufus](http://rufus.ie/en/) tool to write the image to the USB stick
*   A USB memory stick with at least 4GB capacity

The Linx 1010B keyboard attachment (or other USB keyboard) is useful to speed things up a little, but isn't strictly necessary.

<div class="notes">
  <p><strong>Why Rufus and not Unetbootin or Fedora Media Writer?</strong></p>
  <p>The Fedora image is unusual amongst Linux LiveUSB installers in that it uses the "ISOHybrid" format. Rufus is the only USB image writing program I know of that will automatically do the more advanced techniques required to write an ISOHybrid image to a USB stick and make it boot properly while keeping the stick in FAT32 format for later use. By contrast:</p>
  <ul><li>Unetbootin will write the image to the USB stick in a more basic way, and while the result is bootable, the Fedora environment does not load properly within it and it cannot be installed.</li>
  <li>Fedora Media Writer directly writes the image to the USB stick as if it were a DVD (ISO9660 file system). It will install fine from this, but afterwards the memory stick won't immediately be usable in the normal way. The Fedora Media Writer has a built-in "Restore" function intended to revert the USB stick back to a normal state, but during my testing I found that this didn't work and I had to recreate the partition table manually with GParted. I could not fix it with Windows Disk Management Console. Therefore, I don't recommend this approach for new users.</li></ul>
</div>

## Considering Dual-Boot

Whether you dual-boot with Windows or wipe out Windows completely and just use Linux is up to you. Linux is now suitable for daily use on this tablet, so I’ve wiped off Windows completely. If you’re not sure, you can dual-boot for a while&mdash;but note that if you have two operating systems on the tablet, both operating systems will be very limited in the amount of space available to them.

Whichever way you choose, the Linux installer will handle repartitioning the disk for you during the installation, but if you’re dual-booting you may need to delete some old files and applications from within Windows, then run a disk cleanup to ensure at least 8GB of space is free.

## Ensuring you can go Back to Windows Later

If you are removing Windows completely from the tablet, and think you might want to go back to Windows later, you'll need to ensure you can reactivate it. The easiest way to do that is just to sign into Windows using a Microsoft account. If you do that, your Windows licence will be associated with your Microsoft account, and if you ever reinstall Windows on the tablet and sign in again with the same account, it will automatically activate.

If you prefer not to do that, you should be able to get the licence key from your existing install. To do this, run PowerShell as an administrator, then in the PowerShell window run the following command: 

```
wmic path SoftwareLicensingService get OA3xOriginalProductKey
```

Note down the 25-character code that appears; you may need it to reactivate Windows if you later decide to reinstall it.

## Preparing for the Install

First, create your installation USB stick using Rufus. Select the ISO image and make sure you select the right drive for your USB stick. All other options can be left as the defaults, which should match those shown in the image below.

You will be prompted whether to write the disk in ISO or DD mode, choose ISO (the default). You will also be prompted whether to download the right version of syslinux from the internet, choose "Yes" to this.

![Rufus interface with options highlighted](/guides/linx-rufus-options.png){: .center .noshadow}
*The Rufus interface with default options highlighted*

Once Rufus finishes writing to the USB stick, it's time to boot the LINX1010B tablet from it.

1.  Ensure your tablet is off.
2.  Insert the USB stick into one of the USB ports.
3.  Turn the tablet on while holding the Volume Up button. The screen should say "Esc is pressed. Go to boot options.", then you will be given a setup menu.
4.  Press "Boot Manager" and you’ll see an "EFI USB Device" in the list. Press it to continue.
5.  You will boot from the memory stick and get to the GRUB bootloader screen.
6.  If you have a keyboard, press Up to select the top option, and Enter to run it immediately. (This saves having to wait for the default "Test this media" option.)
7.  When the GUI appears, press once on the workspace, then press the "Install to Hard Drive" button. The installer will appear after a few seconds.

<div class="notes">
  <p><strong>Can't see your USB device in the list?</strong></p>
  <p>If you don’t see your USB device in the Boot Manager list, your tablet may have Secure Boot enabled. Go to "Secure Boot Option" from the menu, and check that at the top of the screen it shows "Secure Boot Status" as "Disabled". If not, look for where it says "Erase all Secure Boot Settings", press on "&lt;Disabled&gt;" under that, and change it to "Enabled". Here you will need a keyboard&mdash;press F10 on the keyboard to save and restart. Now power off the tablet again and start from step 3.</p>
  <p>If you <em>still</em> don't see it, double-check that your device is really a USB Mass Storage device and not a USB Hard Disk, and that if you used Unetbootin or Rufus to write the ISO, that it's FAT32 formatted and not NTFS.</p>
</div>

## Installing Fedora

The Fedora installer is reasonably easy to use. Firstly it will prompt you to select your keyboard layout; after that it will present the "Installation Summary" menu.

Because your tablet's internal storage already has an operating system on it, you will see that the "Installation Destination" icon has a warning symbol, forcing you to make a decision about the partitions already on the disk. Click on the icon and you will be presented with the Installation Destination screen. Select "Free up space by removing or shrinking existing partitions", then click "Done" in the top left. After a short delay, you will be presented with a "Reclaim disk space" dialog with a list of the device's partitions, which you will need to modify to make space for Linux.

* If you are removing everything currently on the tablet, you can press the "Delete All" button. This will free up all the space on the tablet's internal storage for your new Linux installation.
* **If you are dual-booting** (e.g. with Windows), **do not remove any existing partitions**. Your "EFI System Partition" should be left unmodified. Select your Windows partition, click "Shrink" (not "Delete"), and reduce its size by at least 8GB to allow space for Fedora.

Once complete, click the "Reclaim Space" button. You will then be returned to the "Installation Summary" menu. You can now select your time zone using the third menu option, and then begin the install.

The install will take around 10-15 minutes. Once it is complete, click "Finish Installation" and reboot the tablet. It should now start up automatically into the new Linux installation, and you can remove the USB stick.

## Post-Install Notes

*   If GNOME feels sluggish, it can be slightly improved by turning off animations. This is possible using the "GNOME Tweaks" tool that you can install from the "Software" app.
*   The GNOME on-screen keyboard is pretty good at popping up automatically when you focus a text field in a GTK3 application. If it doesn’t pop up automatically, you can bring it up by swiping up from the bottom of the screen.

<div class="notes">
  <p><strong>Congratulations!</strong> You’re done! You should be able to connect to WiFi, use the tablet with or without the keyboard, and do almost everything you'd like to do with the tablet. Unless you'd like to explore other operating systems or desktop environments, you can stop reading here.</p>
</div>

* * *

## Other Setups {#othersetups}

If you want to use a Linux distro other than Fedora, a desktop environment other than GNOME, or a different operating system entirely, the following sections gives some information and additional steps that may help you out. **The majority of users who have followed the instructions above can stop reading here!**

### Other Desktop Environments {#otherdes}

As the most touch-oriented of the big Linux desktop environments, GNOME seems to be the best set up for tablets at this time, although it can be slow on a low-powered tablet like the LINX 1010B. If you want to stay with GNOME but speed things up a bit, you can install "GNOME Tweaks" and turn off animations, which gives a slight improvement.

The other big Linux desktop environment, KDE Plasma, also works fairly well. Again this is a heavyweight desktop like GNOME, so it can feel a little slow. It's also not quite as touch-oriented, but while I think it works better with a mouse or touchpad than the touchscreen, it's still perfectly usable. I have tested Fedora's KDE "spin" and can confirm it sets up KDE just fine, so if that's your preference, use the Fedora KDE spin image from the start.

I have also tried Cinnamon, MATE and XFCE on the tablet. These are generally less demanding and therefore faster and more responsive than GNOME or KDE. However, they also don't fully cater for tablets in the way that the bigger desktop environments. For example, when I last tested them, none of the three support automatic rotation of the screen based on the accelerometer, or automatic rotation of touch inputs. That means you'll have to set your screen rotation to landscape manually if you want to use it in that orientation, and if you want to use the touchscreen in landscape orientation, you'll need to rotate it using the command-line scripts [shown here](#screenrotation).

In XFCE particularly, I have also had issues with tapping to click and long-pressing to right-click.

### Ubuntu {#ubuntu}

#### Ubuntu 20.04.3

Before 2022, Ubuntu was my recommendation for installing Linux on this tablet. There are a few quirks to installing and using it, which mean that I can no longer recommend it as strongly as I recommend Fedora, but it is still an option. Of all the available versions of Ubuntu, 20.04.3 was the high point in terms of compatibility and lack of bugs, and is therefore what I recommend if you're set on using Ubuntu.

To install Ubuntu on the tablet, you will need your tablet and USB stick, plus:
*   Ubuntu Linux ISO image (20.04.3 LTS 64-bit recommended, download from [here](https://old-releases.ubuntu.com/releases/focal/))
*   32-bit EFI boot image (download from [here](https://github.com/jfwells/linux-asus-t100ta/blob/master/boot/bootia32.efi?raw=true) or [here](/guides/bootia32.efi))
*   An application to write the ISO to the memory stick, such as [Unetbootin](http://unetbootin.github.io/) or [Rufus](http://rufus.ie/en/)

<div class="notes">
  <p><strong>Why the 32-bit EFI boot image?</strong></p>
  <p>The Linx 1010B uses the Bay Trail chipset, which has a history of causing frustration when trying to boot Linux, particularly because although it features a 64-bit processor, it uses an EFI system that only operates in 32-bit. So while I recommend a 64-bit OS, you will need this file to get the installer to boot properly with the 32-bit EFI.</p>
</div>

To install, follow this procedure:
1.  Begin by flashing your Ubuntu ISO onto your memory stick using Unetbootin or Rufus.
2.  Grab the `bootia32.efi` file that you downloaded above, and place it in `<usb stick>:\EFI\boot\`.
3.  Turn your tablet off.
4.  Turn the tablet on while holding the Volume Up button. The screen should say something like "Esc is pressed", then you will be given a setup menu.
5.  Press "Boot Manager" and you’ll see your USB device in the list. Press it to continue. (If you don’t see it, your tablet may have Secure Boot enabled. Play around in the setup menu until you find the option to disable Secure Boot, then press F10 on the keyboard to save, and repeat this step.)
6.  You will boot from the memory stick and get to the GRUB bootloader screen, following which Ubuntu will boot automatically.
7.  When the GUI appears, click the "Install Ubuntu" icon and select most options as you normally would in the installer.
8.  If you’re choosing to dual-boot, choose "Install Ubuntu alongside existing operating system" when prompted for where to install, and ensure that at least 8GB of space is allocated. Otherwise, you can choose to replace the existing Windows OS at this stage. (You shouldn't need to select "advanced partitioning options", but if you do it will offer to let you encrypt the disk. I would recommend you *don't* select this option&mdash;not because it'll break anything, but simply because there is no on-screen keyboard support on the disk unlock screen. If you set this option, you will require a keyboard every time you power on.)
9.  Once installation is complete, your tablet will prompt you to reboot. It should now start up automatically into the new Ubuntu installation.
10. If you're encountering choppy scrolling, particularly noticeable in web browsers, it may be resolved by switching to Wayland as your graphics server. ([See this bug report](https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1883534).) To do that, log out, select your name on the login screen, and before entering your password click the "cogs" icon at the bottom right. Choose "Ubuntu on Wayland".

<div class="notes">
  <p><strong>Sound not working?</strong></p>
  <p>As of January 2022, there is a <a href="https://bugs.launchpad.net/ubuntu/+source/linux-meta-hwe-5.13/+bug/1958410">known bug that prevents sound from working on the tablet</a> after updating your kernel. Hopefully this will be fixed properly in a future Ubuntu update, but at the moment this is one of the main reasons I recommend Fedora over Ubuntu on the LINX1010B. Barry in the comments below has let me know there is a fix you can apply to resolve this issue, which is:</p>
  <ol><li>Open <code>/etc/modprobe.d/alsa-base.conf</code> in a text editor as <code>root</code> / using <code>sudo</code></li>
  <li>Add the line <code>options snd-intel-dspcfg dsp_driver=2</code></li>
  <li>Power off the tablet fully</li>
  <li>Power on. Sound should now be working.</li></ol>
</div>

![Ubuntu 20.04 on a Linx 1010B tablet](/guides/linx-2004.jpg){: .center}
*Ubuntu 20.04 on a Linx 1010B tablet*

#### Later Versions: Ubuntu 20.04.4&mdash;22.10

These are more recent releases of Ubuntu than the recommended version, 20.04.3. However, they seem to have a regression in terms of their support for Bay Trail tablets in the installer, and they does not correctly set up 32-bit EFI and grub. If you install from an Ubuntu 20.10, 21.04 or 21.10 image or even the updated .4 release of the 20.04 LTS, you will likely find that you will boot to a grub rescue prompt and can't get into your new installation.

You can attempt to fix this by following [this procedure](#install32bitgrubafter), but it will be much easier (although more time consuming) to install 20.04.3 and do an in-place upgrade to a later release.

Some of these versions are also subject to the audio problem when upgrading the kernel.

#### Older Versions: Ubuntu 18.04&mdash;20.04

I have tested Ubuntu 20.04.3 and found it to be working well, as documented above. However, back before the ".1" update when using the base Ubuntu 20.04, a couple of people posted in the comments below about being unable to boot from USB after installation. We never got to the bottom of this, so for now I would not recommend going back to the base 20.04.

Aside from that, all Ubuntu versions between 18.04 and 20.04.3 have installed and worked correctly, using the procedure above to enable booting the USB stick on 32-bit UEFI. If you choose to use one of these older Ubuntu versions, you should be able to without problems.

![Ubuntu 18.10 on a Linx 1010B tablet](/guides/linx-1810.png){: .center}
*Ubuntu 18.10 on a Linx 1010B tablet*

#### Ancient Versions: before 18.04

These versions do not install alongside Windows properly or set up GRUB properly with the system’s 32-bit UEFI. Follow this procedure to get them installed:

1.  When it comes to step 3 of the installation, you should be offered to "Install Ubuntu alongside Windows Boot Manager". **Don’t** choose this, instead choose "Something Else".
2.  In the free space you cleared, create a single **ext3** partition and choose to mount it at `/`. (I didn’t have much luck with ext4, the installer locked up every time.) Make a note of the partition name — it should be `/dev/mmcblk0p5`.
3.  You’ll also be asked which disk/partition to install GRUB too &mdash; just leave this as the default as it won’t work anyway. We’ll fix that later.
4.  You’ll be warned about the lack of a swap partition. To save the flash memory from excess writing, and because very little space is available for Linux anyway, I chose to do without one.
5.  After copying files and configuring the system, the installer will show an error message because it failed to install GRUB. This is OK — installing GRUB is the last step, so the rest of the install has worked fine.
6.  Shut down the tablet.
7.  Now, follow the instructions in [this section](#install32bitgrubafter) to get grub installed.

![Ubuntu 15.10 on a Linx 1010B tablet](/guides/linx-1510.jpg){: .center}
*Ubuntu 15.10 on a Linx 1010B tablet*

### Linux Mint 20.1

Mint 20.1 installs the same as Ubuntu 20.04.3, using the 32-bit EFI boot file trick. There are two caveats:

1. While Ubuntu Live USB automatically boots into "Try Ubuntu" after a few seconds, Mint does not. You'll therefore need a physical keyboard (just to press Enter once during first boot!) If that's not possible for you, you can work around it by opening `<usb stick>:\boot\grub\grub.cfg` on the computer you used to make it, and add the line `GRUB_TIMEOUT=5`.
2. See the note above on [Other Desktop Environments](#otherdes) regarding Cinnamon and MATE.

### Chrome OS

Two main builds of Chrome/Chromium OS exist for installation on generic PCs – [ChromeOS Flex](https://chromeenterprise.google/os/chromeosflex/) and [Arnold the Bat](https://arnoldthebat.co.uk/wordpress/chromium-os/).

Arnold the Bat's builds seem to have stopped as of April 2022, with no later versions available on the website. The last time I tested one, back in January 2021, the Arnold the Bat arm 64-bit builds do boot (without any 32-bit EFI files required), but they do not recognise the tablet's WiFi adapter, or a USB WiFi adapter that I plugged in for testing. Unfortunately Chromium OS does not have a means to skip this section of the install, so I could not test it any further.

ChromeOS Flex is the successor to Neverware's CloudReady fork, [Neverware having been bought up by Google](https://www.theverge.com/2020/12/16/22179242/google-neverware-chromebook-laptops-chrome-os-software) back in 2020. This provides more drivers for generic PC hardware including the WiFi, which means at least you can get through the installer. However, note that the installer doesn’t support dual boot, so if you want to install it you’ll have to get rid of Windows.

The last version of ChromeOS Flex that I tried is 108.0.5359.111 (December 2022). It's usable in "laptop mode", but with the following issues (see [forum thread](https://neverware.zendesk.com/hc/en-us/community/posts/360023071953-linx-1010-tablet-laptop-works-fine-but-no-touchscreen-)). The exact same issues were all present back in version 76.4 (August 2019) as well, so don't get your hopes up for a fix&mdash;Bay Trail tablets are not officially supported by the project.

*   No touchscreen support
*   No orientation detection – screen needs rotating to 90 deg manually if you want to use it in landscape mode
*   Brightness control doesn’t work
*   Cameras don’t work
*   No Bluetooth support
*   No Sleep/Suspend support

### Android

The [Android x86](https://www.android-x86.org/) project allows Android to be run and installed on generic Intel hardware such as the Linx 1010B. As of their Oreo/8.1 release, this does work, but it is **very slow**! It’s just about usable for light web browsing but it can take over a minute just to get from the lock screen to the launcher. The project seems to be slowly dying; while builds were released for Android 9.0, they have not been for any later version. On the basis of those two points, I can't recommend it.

If you want to try Android x86, you’ll need the same 32-bit EFI trick as with the standard Ubuntu instructions to get the USB stick to boot. It installs fine though and you can dual-boot with Windows. Sleep/suspend and cameras don’t work.

Intel have a project known as [Celadon](https://www.intel.com/content/www/us/en/developer/topic-technology/open/celadon/overview.html) which produces x86-compatible builds of Android, however the system requirements likely exclude the Linx 1010B from being able to run it. I haven't tried, but if you fancy giving it a shot, please do and report back with your findings!

### Windows 10

#### From Linx Recovery Image

The Linx 1010B tablets came with Windows 8 preinstalled, and were supported up to Windows 10 19H1. If you're having problems with your device but want to stick with Windows, or you've installed Linux, found it wasn't for you and want to go back, the easiest way is to install Linx's own custom Windows recovery image. This is Windows 10 Home 32-bit 19H1 with all the Linx tablet drivers included, and you can download it from [this link provided by Linx tech support](https://mega.nz/#!HUYV1IzZ!Gu5qiTjHZOS5TbzDg5z6dZD9RA7QRqKokz2Tkp3gyx4). I have a backup [here](https://nextcloud.renton.es/s/si3NiRqniFBqmyG) just in case they take it offline for any reason. (That's on my home server, please be kind and don't hammer it.)

From that base, Windows should update itself to 20H2 and all the hardware, drivers etc. will continue to work. However, it won't update any further by itself.

#### From Microsoft Image

If you would like to force it to update to a more recent version of Windows 10, you will need to do this by [downloading a new install image from Microsoft](https://www.microsoft.com/en-gb/software-download/windows10), and using it to upgrade your existing installation, or replace whatever's on your system if you're switching back to Windows.

If you are installing Windows 10 from scratch (e.g. version 22H2). you will find that most of the hardware doesn't have driver support out-of-the-box. Most importantly, this includes the touchscreen, so you will need a physical keyboard and touchpad/mouse for this process. One of the commenters below has helpfully provided a driver package which I have verified makes the tablet fully functional on Windows 10 22H2. My recommended process for this is as follows:

1. [Download the driver package from here](https://nextcloud.renton.es/s/ybkXJHccDX7aQK8)
2. Install Windows 10 and *don't* connect to your WiFi when prompted
3. Unpack the driver package and install every `.inf` file (right-click -> Install) in turn, rebooting when prompted
4. Once they are all installed, connect to your WiFi and run Windows Update
5. From Windows Update's "Optional" section, install the RealTek bluetooth driver.

This should get you a fully working set of drivers on the tablet.

### Windows 11

The Linx 1010B does not meet the minimum system requirements for Windows 11. Amongst other problems, Windows 11 drops support for 32-bit processors&mdash;although the tablet processor is technically 64-bit, the "hack" of using a 32-bit EFI boot file (e.g. the one from the Windows 10 image) has never worked properly with the Windows 11 installer. If you use Windows, plan to stay on Windows 10.

## Other Useful Information

If you’re using a non-standard setup, some of the following sections might provide some useful information and code to fix problems you may have. From here on, we assume a reasonable level of knowledge with Linux, disk partitioning etc.

### Screen Rotation {#screenrotation}

If you’re using GNOME, the screen is probably rotating with tablet orientation as you would expect. If you're using an environment such as XFCE where this doesn't happen automatically, you can run the following commands to rotate it. The first rotates the display to landscape mode, the second is required to rotate the touch input so it matches the screen.

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

On Ubuntu 18.10 or later using the default GDM3 login screen, it should rotate automatically with tablet orientation as you would expect. Otherwise, it should be possible to apply the manual rotation above to the login screen as well by editing its configuration.

For example, in Ubuntu 15.04 using the default LightDM login screen, we achieve this by creating a file named `/etc/lightdm/lightdm.conf.d/80-display-setup.conf` with the following contents:

```ini
[SeatDefaults]
display-setup-script=xrandr -o right && xinput set-prop "pointer:Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
```

However, depending on the choice of login screen this may produce a "low graphics mode" error on startup and fail to display the login screen. In this eventuality it’s easiest just to perform the login in portrait orientation.

### Onboard setup

If you aren’t using GNOME or KDE, it’s a good idea to run "Onboard" (an on-screen keyboard) and configure it to your liking. (You may also prefer it to the GNOME on-screen keyboard anyway!) The following settings make it behave a lot like the Windows keyboard:

1.  General -> Auto-show when editing text
2.  General -> Show status icon
3.  Window -> Window options -> Dock to screen edge
4.  (Grab your onboard window and stretch it to your desired height)
5.  Window -> Resize Protection -> Window handles: None
6.  Layout -> Small
7.  Typing Assistance -> Show suggestions

### Long-press to Right Click

If you’re using an older Linux (e.g. a pre-2018 version of Ubuntu) you may not be to do a long press to right-click as you would expect. If this isn't working for you, Ubuntu’s "Universal Access" panel contains a "Simulated Secondary Click" option that should allow you to long-press on the touchscreen to get a right click effect. You can also achieve the same from the terminal with:

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

### Manually Install 32-bit Grub {#install32bitgrubafter}

If you have installed a version of Linux (such as Ubuntu 20.10, 21.04 or 21.04) which installs a 64-bit grub despite the 32-bit EFI and thus doesn't boot, you may be able to make your installation bootable by following this procedure, provided by Damien in the comments. It may also work for very old versions (pre-18.04) where grub installation fails; if not, see the next section.

First, boot from your Live USB and connect to WiFi. Then run the following commands.

<div class="warning">
  <p><strong>Warning:</strong> The disk and partition names included here are correct for the internal disk of my tablet, having installed Ubuntu with the default options and no dual-boot setup. You may need to change them depending on your setup. In particular, if you are using this procedure to rescue a <strong>Fedora</strong> install, the partitions are going to be different&mdash;you will want to set <code>root</code> to <code>/dev/mmcblk1p3</code> instead of <code>/dev/mmcblk1p2</code>, and set <code>boot</code> to <code>/dev/mmcblk1p2</code>.</p>
</div>

```shell
# Gain root permissions
sudo -iH

# Set the EFI partition on the disk. This example should be correct for
# Ubuntu and Fedora.
efi=/dev/mmcblk1p1
# Set the root partition on the disk used by Linux. This example is *only*
# correct for Ubuntu with standard install options and no dual-boot! On
# Fedora for example, this should be /dev/mmcblk1p3
root=/dev/mmcblk1p2
# Set the boot partition on the disk used by Linux. You will probably need
# to leave this blank for Ubuntu with standard install options and no dual-boot
# But on Fedora for example, this should be set to /dev/mmcblk1p2.
boot=
# Set a temporary location in which to mount the root partition.
tempmount=/mnt/target

# Mount everything we need to perform a chroot into the tablet's installed
# Linux environment
mkdir -p $tempmount
mount $root $tempmount
[ -z "$boot" ] && mount $boot $tempmount/boot
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
apt update
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

### Manually Install 32-bit Grub (Without chroot)

Back in around 2015 when first trying to get Linux installed on the tablet, the chroot approach above did not work. What had to do is temporarily use the copy of GRUB on the USB stick, and tweak it to boot Linux from the internal storage instead of the one it normally boots.

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

## Thanks To...

To get this far I’ve used information from the following places. I’m extremely grateful to the people that wrote them!

*   [Latest steps to install Ubuntu on the Asus T100TA](http://www.jfwhome.com/2016/01/04/latest-steps-to-install-ubuntu-on-the-asus-t100ta/)
*   [Installing Ubuntu on Bay Trail tablets (version 2)](https://sturmflut.github.io/linux/ubuntu/2015/02/04/installing-ubuntu-on-baytrail-tablets-version-2/)
*   [How do I repair grub2 (not) booting 32-bit EFI on a 64-bit machine?](https://unix.stackexchange.com/questions/206274/how-do-i-repair-grub2-not-booting-32-bit-efi-on-a-64-bit-machine/215546#215546)
*   [How to reinstall GRUB2 EFI?](https://superuser.com/questions/376470/how-to-reinstall-grub2-efi/376471#376471)
*   [lightdm – rotated monitor. login screen needs rotation](https://askubuntu.com/questions/408302/rotated-monitor-login-screen-needs-rotation/466618)
*   And all the many commenters down below who have contributed to this page.
