---
author: Ian
comments: true
date: 2012-06-14 21:37:24
layout: post
slug: tank-day-8-it-lives
title: 'Tank Day 8: It Lives!'
wordpress_id: 12941
categories:
- Projects
- Raspberry Tank
tags:
- Build
- Build Diary
- Heng Long
- Project
- Raspberry Pi
- Raspberry Tank
- Raspberry Tank Build Diary
- Tank
- Video
- Vimeo
- YouTube
---

[Day 7 of the Raspberry Tank build diary](../tank-day-7-bridging-the-gap/) saw us with nothing left to do but to plug the Raspberry Pi into the tank via the transistor board we built, and see if it works!

### Final Preparations

While connecting things up, we made up a new connector that allows us to plug and unplug the transistor board from the Raspberry Pi easily (left photo, below), and we wired the other end of the transistor board into the choc block that was previously used to break out signals for our oscilloscope (right photo).  Note the colour mismatch at the choc block. For the new transistor board I decided to go for the "proper" colours -- red for +7.2V, black for Ground, and green for data.  This is at odds with the [weird cable](/hardware/tank-day-4-point-of-entry/) that was installed on my tank, so the colours swap over at the choc block.

[![New plug for the Raspberry Pi's GPIO Header](https://files.ianrenton.com/sites/raspberrytank/IMAG0063-300x179.jpg)](https://files.ianrenton.com/sites/raspberrytank/IMAG0063.jpg) [![Transistor Board Connected to Choc Block](https://files.ianrenton.com/sites/raspberrytank/IMAG0065-300x179.jpg)](https://files.ianrenton.com/sites/raspberrytank/IMAG0065.jpg)

Now that the RF receiver board (TK-YL101-3) was no longer connected to anything inside the tank, it was removed by taking out the four small screws that held it in place.  Then carefully photographed before being stuffed in the bag of "junk I took off this tank".

[![Disconnected TK-YL101-3 Board](https://files.ianrenton.com/sites/raspberrytank/IMAG0067-e1339705680366-300x179.jpg)](https://files.ianrenton.com/sites/raspberrytank/IMAG0067.jpg)

For this test, the software was also updated to include new bit codes -- some of those used before were incorrect -- and also to test the Forward, Backward, Left and Right controls rather than just Forward.  [The updated source code is on GitHub.](https://github.com/ianrenton/raspberrytank/tree/38fb9cf42fabca6464da3139ad714e2aab993e15)

### The Moment of Truth

Components connected, battery inserted, tank and Pi powered up.

Aaaaaaand....

<center><iframe src="//player.vimeo.com/video/78955489" width="500" height="300" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></center>

It lives!

### And now...

Now that we have control of the tank, the fun can really begin.  Built-in autonomy, smartphone remote control, sensors, webcams, GPS, laser-pointer-following and more are all still to come on the Raspberry Tank build diary!

Tune in next time to find out how we can power the Raspberry Pi from the tank's battery -- the first step to cutting the wires and being able to drive the tank around via remote control!
