---
author: Ian
comments: true
date: 2011-07-20 20:52:50
layout: post
slug: howto-install-suns-jdk-on-ubuntu-without-the-command-line
title: 'HOWTO: Install Sun''s JDK on Ubuntu (without the Command Line)'
wordpress_id: 11746
categories:
- Guides
tags:
- Guide
- HOWTO
- Installing
- Java
- JDK
- JRE
- Linux
- Oracle
- Package Management
- Partner Repository
- Repositories
- Sun
- Ubuntu
- Ubuntu Software Centre
---

The Java Development Kit (JDK), which is required to write applications in Java, is not included by default in the Ubuntu Linux OS. Various guides (such as [this one](http://happy-coding.com/install-sun-java6-jdk-on-ubuntu-10-04-lucid/)) will give you a succinct set of commands to run from the terminal to download and install Sun's (now Oracle's) official JDK. But, probably because it's harder to explain, none show you the slightly more user-friendly point-and-click way of doing it. Well, this page does.

  1. Open the _Ubuntu Software Centre_, located in your Applications menu. The app will open, but no matter what you search for, you won't get Sun's JDK. This is because it has been [moved](http://www.ubuntugeek.com/sun-java-moved-to-the-partner-repository-in-ubuntu-10-04-lucid.html) to Ubuntu's "Partner" repository, which is not enabled by default. We will now enable it.
  2. Go to the _Edit_ menu, and click _Software Sources...<br/>
_[![The Ubuntu Software Centre's Edit menu](//files.ianrenton.com/sites/guides/2-500x305.png)](//files.ianrenton.com/sites/guides/2.png)
  3. You'll be prompted to enter your password, so do that:<br/>
[![Password dialog](//files.ianrenton.com/sites/guides/3-300x170.png)](//files.ianrenton.com/sites/guides/3.png)
  4. In the box that appears, go to the _Other Software_ tab. You should see an entry on the list labelled _"Canonical Partners"_. Check the box at the left of that entry, then click _Close_.<br/>
[![Software Sources window](//files.ianrenton.com/sites/guides/4-300x291.png)](//files.ianrenton.com/sites/guides/4.png)
  5. You will now be returned to the main _Ubuntu Software Centre_ window, where an _"In Progress"_ indicator will appear for a minute or so. Once complete, you can search for "JDK" and... it still won't show it to you.
  6. As the JDK is not something that most home users want, there's an extra obstacle in the way -- you must ask the Software Centre to show you "technical items". There's a link at the bottom of the window for this:<br/>
[![Show Technical Items](//files.ianrenton.com/sites/guides/5-500x305.png)](//files.ianrenton.com/sites/guides/5.png)
  7. You should now have an extensive list of packages that feature the letters "JDK". You want to pick the one with the package name _sun-java6-jdk_. Click it, then click the _Install_ button on the right.<br/>
[![Ubuntu Software Centre window with sun-java6-jre selected](//files.ianrenton.com/sites/guides/6-500x305.png)](//files.ianrenton.com/sites/guides/6.png)
  8. The JDK will now be downloaded and installed. Within a couple of minutes, this will be complete; the _Install_ button will change to say _Remove_ and the icon next to _sun-java6-jre_ will show a green tick.

Sun's JDK is now installed. You can now search for and install Sun's JRE, and anything else you might want from the Partner repository. The appropriate locations have been added to the system path automatically, but if you should need to find the JDK files manually, they're in `/usr/lib/jvm/java-6-sun-1.6.0.26` (the last section of the path may change if the latest JDK version is later than it was when this article was written).
