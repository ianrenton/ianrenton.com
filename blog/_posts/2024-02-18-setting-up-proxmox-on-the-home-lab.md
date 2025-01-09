---
layout: post
title: Setting up Proxmox on the Home Lab
date: 2024-02-18 08:03 +0000
image: /img/blog/2024/proxmox-small.png
tags:
  - proxmox
  - containers
  - containerisation
  - lxc
  - project
  - homelab
  - linux
---

I have spent the last couple of days moving my two "home lab" servers over to using [Proxmox Virtual Environment](https://www.proxmox.com/en/proxmox-virtual-environment/overview) as their base operating system.

This is the latest step in my attempt to separate out and containerise the tasks that run on our home network. Starting from one very overloaded Raspberry Pi, a few years ago I bought a couple of [Lenovo m93p Tiny](https://www.lenovo.com/za/en/desktops/thinkcentre/m-series-tiny/10A6/p/11TC1TMM93P10A6) mini PCs to do the job instead. I started to move from "everything runs as `ian` and the home directory is a mess" towards having different users run each task, and then eventually to using [Docker](https://docker.io) to run some of them.

My search for an easy web UI for managing Docker containers led me eventually to Proxmox, which admittedly... doesn't do that. (I've still yet to find an application that does what I originally wanted.) However, Proxmox does seem to be all the rage in amateur "home lab" setups&mdash;*doing sysadmin work and not getting paid, hooray!*

I thought I'd give it a shot, and over a couple of days, I've moved all my stuff into Proxmox-managed containers.

![Proxmox screenshot showing 10 containers running across a cluster of two nodes](/img/blog/2024/proxmox.png){: .center}

Here's what I learned:

* You can't set up containers without downloading or creating templates. Templates are managed in the "local" storage area of the host, within the Proxmox web interface. Simple once you know how, but on first login this is not explained!
* Each Proxmox host comes with the `enterprise` package repository enabled, which won't work unless you pay for a Proxmox subscrption, causing `apt` calls to fail. You can switch to the `no-subscription` version instead (from the command line or through the web interface) to get updates for free.
* Don't count on being able to nicely extract all the bits you need from old, non-containerised setups. Between `docker-compose` setups, config files and service scripts scattered around the system, it's easier to start from scratch. (Now things *are* containerised, moving them around should be a lot easier in future.)
* 10 servers, even virtual ones, is tough to set up in a day! Five of mine relate to [Plane/Sailing](/hardware/planesailing), and the fact I made and published step-by-step instructions was the most useful thing of all. It's good to run through your own procedures occasionally and make sure they work!
* On the subject of testing your own stuff... backups. I had a regular job to conduct LVM backups of my two servers every week&mdash;turns out they hadn't run for a while.
* With 10 servers to create, it's helpful to have a script to run on first install, or do this once and then create a template, so you don't have to manually try to get the environment right on each one. In my case:

```bash
apt update
apt upgrade -y
apt install -y unattended-upgrades apt-listchanges vim curl sudo avahi-daemon
adduser ian
usermod -aG sudo ian
mkdir /home/ian/.ssh
cp /root/.ssh/authorized_keys /home/ian/.ssh/authorized_keys
chown -R ian:ian /home/ian/.ssh
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
service ssh reload
```

* Enlarging virtual disks later is easy, making them smaller is not. Start small and work up!
* For some software, Docker remains the only (or only supported) way of getting it running. So now I have Proxmox running LXC containers which themselves just contain a single Docker container...

!["How many layers of containerisation are you on?" "Like maybe 5 or 6, right now, my dude." "You are like a little baby, watch this" (Proxmox screenshot showing LXC containers with internal docker containers)](/img/blog/2024/containerisation.png){: .center}

* Tailscale doesn't work out of the box in a Proxmox container. I needed Tailscale not just on the host machines but specifically on the *container* that runs Plane/Sailing. Thanks to [jvoisin](https://dustri.org/) for [the required commands](https://dustri.org/b/running-tailscale-inside-of-a-proxmox-container.html) on the host machine (below, replace `[your_lxc_id]` as required), after which Tailscale can be installed on the container as normal:

```bash
echo 'lxc.cgroup.devices.allow: c 10:200 rwm' >> /etc/pve/lxc/[your_lxc_id].conf
echo 'lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file' >> /etc/pve/lxc/[your_lxc_id].conf
```

* You can create a cluster from the Proxmox web interface, but if you get it wrong, you can only remove it fround the command line! Thanks to fabian for [the required commands to do that](https://forum.proxmox.com/threads/proxmox-ve-6-removing-cluster-configuration.56259/#post-259203):

```bash
systemctl stop pve-cluster corosync
pmxcfs -l
rm -R /etc/corosync/*
rm /etc/pve/corosync.conf
killall pmxcfs
systemctl start pve-cluster
```

* All is well for Proxmox servers out there on the internet serving people's web pages, but what about access to local hardware? For Plane/Sailing I have three RTL-SDR dongles that now need to be accessed from three separate containers. [This page on the FlightAware forums](https://discussions.flightaware.com/t/howto-rtl-sdr-dongle-pass-through-to-proxmox-lxc-container/89093) has the details of what to do on the host to pass the USB device through, along with [a larger set of blacklist setup tasks](https://sdr-enthusiasts.gitbook.io/ads-b/setting-up-rtl-sdrs/blacklist-kernel-modules) for the host machine as well. After that, you can set up the container with its own blacklist and its own software as normal.
* Any USB connection glitches can actually *change* the ID of the device, as returned by `lsusb` and used in the container settings files. So if you accidentally wobble the USB stick and the container can no longer see it properly, that's probably why.
* After passing through a single RTL-USB device to a container, you might expect it to show up as the only one, with ID 0. Nope: you can still *kind of* see the other devices, but they are unusable and with corrupt names!

![Console showing the results of rtl_test, with two dongles available, one with a corrupted name that could not be accessed](/img/blog/2024/rtltest-corrupt.png){: .center .noshadow}

Well, that sure was a way to spend the weekend. Now I have a nice neat containerised set of network services, and I'm off to do *anything* other than looking at screens for a while.
