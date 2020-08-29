---
layout: post
title: "HOWTO: Install Linux on a Linx 1010B Tablet"
date: 2016-02-06T11:43:41+00:00
wordpress_id: 1030
---

<div class="oldwarning">
<p>Warning: A couple of people in the comments are reporting an inability for the tablet to boot from USB after installing Ubuntu 20.04, which is currently an unsolved problem. I have not tried 20.04 myself—I recommend sticking with 19.04 if possible. If you want to try 20.04, read the comments before continuing, and proceed at your own risk.</p>
</div>



<p>In this guide I will be demonstrating how to install Linux on the <a href="https://www.currys.co.uk/gbuk/computing/tablets-and-ereaders/tablets/149_3402_32003_xx_xx/xx-criteria.html">Linx 1010B tablet</a>, a low-cost 10-inch Windows 10 tablet. It uses the Bay Trail chipset, which has a history of causing frustration when trying to boot Linux, particularly because although it features a 64-bit processor, it uses an EFI system that only operates in 32-bit. Linux support for the hardware in general is not perfect, but now provides most of the same functionality as Windows.</p>



<p>The good news is, if you just want to use the latest Ubuntu on this tablet, it’s now pretty easy! The next few sections of this guide will show you how.</p>



<p>(If you want to install other versions of Linux, Linux derivatives, different desktop environments etc, skip down to the “<a href="#othersetups">Other Setups</a>” section!)</p>



![](/guides/linx.png){: .center}



<h2 id="current-status">What’s Working?</h2>



<p>Your first decision is the distribution and version of Linux to install. My personal preference is for Ubuntu Linux and the GNOME desktop environment, as this combination seems to provide the best tablet support at the current time.</p>



<p>As of Ubuntu 19.04, the latest when this page was last updated, the following all work:</p>



<ul><li>Installation</li><li>Dual-booting with Windows 10</li><li>Touchscreen with multi-touch and on-screen keyboard</li><li>Gestures and long-press to right click</li><li>Sleep</li><li>Screen brightness</li><li>Sound</li><li>WiFi (although sometimes unreliable?)</li><li>Bluetooth</li><li>Battery level</li></ul>



<p>The one big omission seems to be the cameras. Neither front nor back camera work on Ubuntu 19.04, or any OS apart from Windows.</p>



<p>If you’re happy to use Ubuntu 19.04 with GNOME, carry on reading! If not, you might want to jump down to the “<a href="#othersetups">Other Setups</a>” section.</p>



<h2 id="equipment-required">Equipment Required</h2>



<p>To get started you will need:</p>



<ul><li>Linx 1010B tablet and charger</li><li>Ubuntu Linux ISO image (19.04 64-bit recommended, download from <a href="https://ubuntu.com/download/desktop">here</a>, scroll down and be sure to select 19.04 and not 18.04 LTS)</li><li>A USB memory stick with at least 4GB capacity</li><li>The Linx 1010B keyboard attachment, or other USB keyboard is useful just in case you have touchscreen problems, though shouldn’t strictly be needed.</li></ul>



<h2>Considering Dual-Boot</h2>



<p>Whether you dual-boot with Windows or wipe out Windows completely and just use Ubuntu is up to you. Ubuntu is now suitable for daily use on this tablet, so I’ve wiped off Windows completely. If you’re not sure, you can dual-boot for a while, but note that when dual-booting, Linux will be very limited in the amount of space available.</p>



<p>Whichever way you choose, the Ubuntu installer will handle if for you during the installation, but if you’re dual-booting you may need to clear out some space from within Windows, then run a disk cleanup, to ensure at least 8GB of space is free.</p>



<h2>Preparing for the Install</h2>



<ol><li>Begin flashing your Ubuntu ISO onto your memory stick using <a href="https://unetbootin.github.io/">Unetbootin</a>.</li><li>The USB stick will currently be bootable on EFI systems in 64-bit mode, but not in 32-bit mode (which is all this tablet supports). To fix this, grab <a href="https://github.com/jfwells/linux-asus-t100ta/blob/master/boot/bootia32.efi?raw=true">this bootia32.efi file</a> and place it in <code>&lt;usb stick&gt;:\EFI\boot\</code>.</li><li>Turn your tablet off.</li><li>Connect your Linx or USB keyboard.</li><li>Turn the tablet on while holding the Volume Up button. The screen should say something like “Esc is pressed”, then you will be given a setup menu.</li><li>My tablet had Secure Boot disabled by default, so you should be able to press “Boot Manager” and you’ll see your USB device in the list. Press it to continue. (If you don’t see it, play around in the setup menu until you find the option to disable Secure Boot, then press F10 on the keyboard to save, and repeat this step.)</li><li>You will boot from the memory stick and get to the GRUB bootloader screen, following which Ubuntu will boot automatically.</li></ol>



<h2 id="installing-ubuntu">Installing Ubuntu</h2>



<p>In Ubuntu 18.04 or later, this is now very easy as the installer understands about the 32-bit UEFI issue. You can click the “Install Ubuntu” icon and select most options as you normally would in the installer.</p>



<p>If you’re choosing to dual-boot, choose “Install Ubuntu alongside Windows Boot Manager” when prompted for where to install, and ensure that at least 8GB of space is allocated. Otherwise, you can choose to replace the existing Windows OS at this stage.</p>



<p><strong>Important:</strong> The only slight wrinkle is that you should <strong>not</strong> select to encrypt the disk when prompted on the formatting/partitioning screen. That’s not because of any boot problems in this configuration, but merely because there is no on-screen keyboard support on the disk unlock screen! If you set this option, you will require a keyboard every time you power on.</p>



<p>Once installation is complete, your tablet will prompt you to reboot. It should now start up automatically into the new Ubuntu installation.</p>



<p><strong>Congratulations! </strong>At this point, if you’re using Ubuntu 19.04 as recommended, you’re done! You should be able to connect to WiFi, use the tablet with or without the keyboard, etc.</p>



<h2>Post-Install Usage Notes</h2>



<ul><li>It’s not that intuitive how to summon the GNOME on-screen keyboard if it doesn’t pop up automatically. You do it by swiping up from the bottom of the screen!</li><li>If you use Firefox, you may want to install the <a href="https://addons.mozilla.org/en-GB/firefox/addon/grab-and-drag/">Grab and Drag</a> add-on which will improve web browsing with a touchscreen. I find Chrome/Chromium has better touch scrolling support.</li></ul>



<p>You’re done! Feel free to send me an email if you have any questions and problems.</p>



<p></p>



<hr/>



<h2>Other Setups<a name="othersetups"></a></h2>



<p>If you want an Ubuntu version prior to 19.04, a desktop environment other than GNOME, a different Linux distribution, or a different Linux derivative such as Chrome OS or Android, the following sections gives some information and additional steps that may help you out. From here on, we assume a reasonable level of knowledge with Linux, disk partitioning etc. <strong>The majority of users who have followed the instructions above can stop reading here!</strong></p>



<h3>Other Desktop Environments</h3>



<p>GNOME seems to be the best set up for tablets at this time, although it can be slow. I have spent some time with XFCE on the tablet which is much faster, but has issues with tapping-to-click in some applications, and screen rotation must be managed manually (example commands below).</p>



<p>If you want to stay with GNOME but speed things up a bit, you can install “GNOME Tweaks” and turn off animations.</p>



<h3>Ubuntu 18.04.1 LTS</h3>



<p>Ubuntu 18.04.1 works reasonably well, and actually seems to have slightly more reliable WiFi than 19.04. However, the following issues are present over and above the non-functional camera, so in general this version is not recommended:</p>



<ul><li>Sound doesn’t work</li><li>Bluetooth doesn’t work</li><li>Screen rotation accelerometer is inverted</li><li>Cannot control screen brightness</li><li>Long-press does not trigger right-click</li><li>GNOME on-screen keyboard does not work well with some applications e.g. Firefox (“<em>Onboard</em>” recommended as a replacement)</li></ul>



<h3>Other Linux Distros</h3>



<p>If you prefer Fedora, Dave H in the comments below reports that Fedora 29 with Gnome works well. There’s also <a href="https://www.happyassassin.net/fedlet-a-fedora-remix-for-bay-trail-tablets/">Fedlet</a>, a customised version specifically for Bay Trail computers, but it’s been out of development since 2016 so the main branch of Fedora is now much more likely to provide proper support for the tablet.</p>



<h3>Chrome OS</h3>



<p>Two varieties of Chrome OS exist for installation on generic PCs – <a href="https://arnoldthebat.co.uk/wordpress/chromium-os/">Arnold the Bat</a> and <a href="https://www.neverware.com/freedownload">Neverware CloudReady</a>. I have had a pretty frustrating experience with Arnold the Bat’s builds, whereas CloudReady works a bit better, and provides a USB installer that “just works” without messing around with EFI files. However, its installer doesn’t support dual boot, so if you want to install it you’ll have to get rid of Windows.</p>



<p>As of version 83.4.4 (Auguse 2020), it’s usable in “laptop mode”, but with the following issues (see <a href="https://neverware.zendesk.com/hc/en-us/community/posts/360023071953-linx-1010-tablet-laptop-works-fine-but-no-touchscreen-">forum thread</a>). The exact same issues were all present in version 76.4 (August 2019) as well, so I wouldn't expect them to be resolved soon - Bay Trail tablets are not officially supported by the project.</p>



<ul><li>No touchscreen support at all</li><li>No orientation detection – screen needs rotating to 90 deg manually if you want to use it in landscape mode</li><li>Brightness control doesn’t work</li><li>Wifi is tempramental - sometimes it works fine, sometimes it reconnects over and over again</li><li>Cameras don’t work</li><li>No Bluetooth support</li><li>No Sleep/Suspend support</li></ul>



<h3>Android</h3>



<p>The <a href="https://www.android-x86.org/">Android x86</a> project allows Android to be run and installed on generic Intel hardware such as the Linx 1010B. As of their Oreo/8.1 release, this does work, but it is <strong>very slow</strong>! It’s just about usable for light web browsing but it can take over a minute just to get from the lock screen to the launcher. On that basis, it’s not recommended.</p>



<p>If you want to try, you’ll need the same 32-bit EFI trick as with the standard Ubuntu instructions to get the USB stick to boot. It installs fine though and you can dual-boot with Windows. Sleep/suspend and cameras don’t work.</p>



<h3>Ubuntu versions earlier than 18.04</h3>



<p>These versions do not install alongside Windows properly or set up GRUB properly with the system’s 32-bit UEFI. Follow this procedure to get them installed:</p>



<ol><li>When it comes to step 3 of the installation, you should be offered to “Install Ubuntu alongside Windows Boot Manager”. <strong>Don’t</strong> choose this, instead choose “Something Else”.</li><li>In the free space you cleared, create a single <strong>ext3</strong> partition and choose to mount it at <code>/</code>. (I didn’t have much luck with ext4, the installer locked up every time.) Make a note of the partition name — it should be <code>/dev/mmcblk0p5</code>.</li><li>You’ll also be asked which disk/partition to install GRUB too — just leave this as the default as it won’t work anyway. We’ll fix that later.</li><li>You’ll be warned about the lack of a swap partition. To save the flash memory from excess writing, and because very little space is available for Linux anyway, I chose to do without one.</li><li>After copying files and configuring the system, the installer will show an error message because it failed to install GRUB. This is OK — installing GRUB is the last step, so the rest of the install has worked fine.</li><li>Shut down the tablet, leaving the USB stick attached.</li></ol>



<p>Currently, there’s no boot loader that will let you boot your Ubuntu install. What we can do temporarily is use the copy of GRUB on the USB stick, and tweak it to boot the copy of Ubuntu on your internal storage instead of the one it normally boots.</p>



<p>The easiest way I found to do that is as follows:</p>



<ol><li>Boot into Windows.</li><li>Open up your USB stick in Explorer, and open the file <code>&lt;usb stick&gt;:\boot\grub\grub.cfg</code> in a text editor.</li><li>Just above the line <code>menuentry "Try Ubuntu without installing" {</code>, add the following lines: <div class="highlighter-rouge"> <pre class="highlight"><code>GRUB_DEFAULT=0
GRUB_TIMEOUT=5
menuentry "Run from internal disk" {
    linux    (hd1,gpt5)/boot/vmlinuz-4.2.0-16-generic.efi.signed root=/dev/mmcblk0p5 intel_idle.max_cstate=0 quiet splash $vt_handoff
    initrd   (hd1,gpt5)/boot/initrd.img-4.2.0-16-generic
}</code></pre></div></li></ol>



<div class="notes">
<p>Note: I believe this should be the right kernel version that gets installed with Ubuntu 15.10. If it doesn’t boot at all, when you try to boot from GRUB in a moment, press <code>C</code> and enter the <code>linux</code> and <code>initrd</code> commands yourself, using tab completion to find the right versions.</p>
<p>If it boots but you get a busybox console instead of a proper Ubuntu login GUI, check your partition numbering — <code>/dev/mmcblk0p5</code> may not be the right partition.</p>
</div>



<p>Now turn your tablet off, and turn it on again with Volume Up held. As before you should be able to boot from the USB stick, but this time the GRUB menu will have a new “Run from internal disk” option. Ubuntu should start and you can log in as the user you set up.</p>



<p>Now follow these steps to get GRUB set up permanently without requiring the USB stick:</p>



<ol><li>Install the 32-bit version of grub by executing the following from a terminal: <code>sudo apt-get install grub-efi-ia32 grub-efi-ia32-bin</code></li><li>As before, we still don’t have a proper 32-bit EFI file for grub, so download <a href="http://www.thinktwisted.com/gradschool/Public/grubia32.efi">this one</a>.</li><li>Place the downloaded file in the right location, instead of the 64-bit file that grub is expecting, which is at <code>/boot/efi/EFI/ubuntu/grubx64.efi</code>. (For example, <code>sudo mkdir -p /boot/efi/EFI/ubuntu &amp;&amp; sudo cp grubia32.efi /boot/efi/EFI/ubuntu/grubx64.efi</code>.)</li><li>Edit the default GRUB configuration on your tablet by opening <code>/etc/default/grub</code> in a text editor as root (e.g. <code>sudo nano /etc/default/grub</code>).</li><li>There should be a line that reads <code>GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"</code>. Edit that so it reads <code>GRUB_CMDLINE_LINUX_DEFAULT="intel_idle.max_cstate=0 quiet splash"</code>.</li><li>There should be a commented out line that reads <code>GRUB_TERMINAL="console"</code>. Uncomment that line.</li><li>To start up without a keyboard attached, you will want the default GRUB option to boot automatically without you having to press Enter. To do this, make sure the lines at the top of the file that read something like:
<div class="highlighter-rouge">
<pre class="highlight"><code>GRUB_DEFAULT=0
GRUB_TIMEOUT=5</code></pre></div>
</li><li>If you have a line that sets <code>GRUB_HIDDEN_TIMEOUT</code>, comment it out.</li><li>Save and close the file.</li><li>Install GRUB with <code>sudo update-grub &amp;&amp; sudo update-grub2 &amp;&amp; sudo grub-install</code>.</li><li>Check that GRUB has added “ubuntu” as an option to the EFI boot manager by running <code>sudo efibootmgr -v</code>. Check the four-digit numbers of each partition against the boot order shown, and it should list your Ubuntu install as the first one. If not, manually add this install to your EFI boot list with <code>sudo efibootmgr -c --disk /dev/mmcblk0 --part 1</code>.</li><li>Shut down your tablet and remove the USB stick.</li><li>Start up the tablet (no need to hold Volume Up any more!), and it should show you GRUB for a few seconds, then start up to the Ubuntu login screen.</li></ol>



<h2>Other Useful Information</h2>



<p>If you’re using a non-standard setup, some of the following sections might provide some useful information and code to fix problems you may have.</p>



<h3 id="screen-rotation">Screen Rotation</h3>



<p>If you’re using GNOME, the screen is probably rotating with tablet orientation as you would expect. If not, to rotate it, run the following commands. The first rotates the display to landscape mode, the second is required to rotate the touch input so it matches the screen.</p>



<div class="highlighter-rouge">
<pre class="highlight"><code>xrandr -o right
xinput set-prop "pointer:Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
</code></pre>
</div>



<p>If you want this to happen automatically when you log in, save both commands to a file (e.g. <code>~/scripts/rotate</code>), make it executable (<code>chmod +x ~/scripts/rotate</code>) and add it to your desktop environment’s Startup Applications.</p>



<p>The equivalent script to set the screen back to portrait mode is as follows (thanks to Scott in the comments!):</p>



<div class="highlighter-rouge">
<pre class="highlight"><code>xrandr -o normal
xinput set-prop "pointer:Goodix Capacitive Touchscreen" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
</code></pre>
</div>



<h3 id="rotating-the-login-screen">Rotating the Login Screen</h3>



<p>On Ubuntu 18.10 using the default GDM3 login screen, it should rotate automatically with tablet orientation as you would expect. Otherwise, it should be possible to apply the manual rotation above to the login screen as well by editing its configuration.</p>



<p>For example, in Ubuntu 15.04 using the default LightDM login screen, we achieve this by creating a file named <code>/etc/lightdm/lightdm.conf.d/80-display-setup.conf</code> with the following contents:</p>



<div class="highlighter-rouge">
<pre class="highlight"><code>[SeatDefaults]
display-setup-script=xrandr -o right &amp;&amp; xinput set-prop "pointer:Goodix Capacitive TouchScreen" 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
</code></pre>
</div>



<p>However, depending on the choice of login screen this may produce a “low graphics mode” error on startup and fail to display the login screen. In this eventuality it’s easiest just to perform the login in portrait orientation.</p>



<h3 id="preparing-for-touchscreen-only-use">Onboard setup</h3>



<p>If you aren’t using GNOME, it’s a good idea to run “Onboard” (an on-screen keyboard) and configure it to your liking. (You may also prefer it to the GNOME on-screen keyboard anyway!) The following settings make it behave a lot like the Windows keyboard:</p>



<ol><li>General -&gt; Auto-show when editing text</li><li>General -&gt; Show status icon</li><li>Window -&gt; Window options -&gt; Dock to screen edge</li><li>(Grab your onboard window and stretch it to your desired height)</li><li>Window -&gt; Resize Protection -&gt; Window handles: None</li><li>Layout -&gt; Small</li><li>Typing Assistance -&gt; Show suggestions</li></ol>



<h3 id="long-press-to-right-click">Long-press to Right Click</h3>



<p>If you’re using Ubuntu 18.10 or above with the default GNOME environment, you should already be able to do a long press to right-click as you would expect.</p>



<p>If not, Ubuntu’s “Universal Access” panel contains a “Simulated Secondary Click” option that should allow you to long-press on the touchscreen to get a right click effect. You can also achieve the same from the terminal with:</p>



<div class="highlighter-rouge">
<pre class="highlight"><code>gsettings set org.gnome.desktop.a11y.mouse secondary-click-enabled "true"
</code></pre>
</div>



<p>On older versions of Ubuntu, the touchscreen sensitivity seems to be very high, so even if you keep your finger relatively still, it is still counted as a left button drag rather than a right button click. No other GNOME/Unity settings appear to alter this.</p>



<p>There are some xinput options that are configurable and should achieve this as well, such as those below, but I have not succeeded in getting them working so far.</p>



<div class="highlighter-rouge">
<pre class="highlight"><code>xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Emulation" "1"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Threshold" "100"
xinput --set-prop "Goodix Capacitive TouchScreen" "Evdev Third Button Timout" "500"</code></pre>
</div>



<h2 id="thanks-to">Thanks To…</h2>



<p>To get this far I’ve used information from the following places. I’m extremely grateful to the people that wrote them!</p>



<ul><li><a href="http://www.jfwhome.com/2016/01/04/latest-steps-to-install-ubuntu-on-the-asus-t100ta/">Latest steps to install Ubuntu on the Asus T100TA</a></li><li><a href="https://sturmflut.github.io/linux/ubuntu/2015/02/04/installing-ubuntu-on-baytrail-tablets-version-2/">Installing Ubuntu on Bay Trail tablets (version 2)</a></li><li><a href="https://unix.stackexchange.com/questions/206274/how-do-i-repair-grub2-not-booting-32-bit-efi-on-a-64-bit-machine/215546#215546">How do I repair grub2 (not) booting 32-bit EFI on a 64-bit machine?</a></li><li><a href="https://superuser.com/questions/376470/how-to-reinstall-grub2-efi/376471#376471">How to reinstall GRUB2 EFI?</a></li><li><a href="https://askubuntu.com/questions/408302/rotated-monitor-login-screen-needs-rotation/466618">lightdm – rotated monitor. login screen needs rotation</a></li></ul>
