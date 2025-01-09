---
layout: post
title: "Optimising for Download Size"
date: 2015-10-16T07:22:19+01:00
categories:
- Internet
tags:
- website
- size
- download
- minimal
- minify
---

If, by some vanishing small probability, you are a regular visitor to this website, you may have noticed a few subtle changes over the past few weeks. In part due to trying to access it from a slow mobile connection, and also in part due to a [series](https://twitter.com/baconmeteor/status/654025366109982720) [of](https://twitter.com/dombili/status/654028070148513792) [tweets](https://twitter.com/baconmeteor/status/654029928099266560) courtesy of [@baconmeteor](https://twitter.com/baconmeteor) which got me wondering how much data is required to load a simple page on my own website.

The answer, apparently, is just over quarter of a megabyte.

![](/img/blog/2015/website-old.png){: .center}

Not a tremendous amount in this world of 8MB rants about how web pages are too big nowadays, but still unnecessarily large given that it contains only about two kilobytes of useful text and hyperlinks. After 65ms (10% of total load time) and 1.59kB (0.5% of total data size), the content and structure of the page is done &mdash; the remaining 90% of time and 99.5% of data are largely useless.

Over the past few days I have made a few changes to improve the performance of the site.

## Changes Made

* **Web fonts have been removed.** I was using three: one for body text, one for italic body text, and one for the menu. Together they comprised over 50% of the data that browsers were expected to download, and although I do like those fonts, it's dubious for me to [impose my font choices](https://twitter.com/0xFae/status/647307014121635840) on others, let alone make them download 100kB for the priviledge. If you happen to have Open Sans and ETBembo on your system they'll be used, otherwise the website will appear in something reasonably close.
* **Font Awesome JavaScript is gone.** I used the excellent [Font Awesome](http://fontawesome.io/) to generate the menu icons on the site, but it pulls in 63kB of JavaScript to support 500+ icons, when all I use it for is static rendering of 12 of them. All major browsers now support inline SVG, so I took the relevant icons from the [Font Awesome SVG set](https://github.com/encharm/Font-Awesome-SVG-PNG) and used them instead. Aside from the Juvia commenting system and MathJax, there is no longer any JavaScript on the website.
* **Reduced image size.** Although my inner egotist is quite fond of people being able to put a face to the name on all my stuff, the 28kB JPEG could be compressed to 6kB with no discernable loss of quality.

The result has been a significant reduction in download size and load speed &mdash; the same page is now served in less than half the time and with less than 10% of the data usage.

![](/img/blog/2015/website-new.png){: .center}

One extra addition was to explicitly set cache expiry times in the HTTP headers for the website and associated files. Since the CSS and image files are unlikely to change, and in any case it wouldn't matter much if a user used old ones, setting the cache timeout to a week and a month for various file types has helped speed up loading of subsequent pages after the first. I use the Apache server's `mod_expires` module, which has some [example config here](http://www.inmotionhosting.com/support/website/htaccess/apache-module-mod-expires).

## Changes Not Made

A couple of changes I considered, but eventually avoided making, were minifying the HTML and CSS of the site.

The Octopress 3 [minify-html](https://github.com/octopress/minify-html) gem does what it says, but unfortunately increased the build time of the website by 150% &mdash; from around two minutes to over five. I already find the build time annoyingly slow on my mid-range laptop, so have decided to skip this one.

Another benefit would have resulted from minifying the CSS used for the site. This proved to be significantly more complex, involving configuration of the very capable [jekyll-asset-pipeline](https://github.com/matthodan/jekyll-asset-pipeline) module. However, the configuration seemed difficult for what would have been at most a 1kB saving, so I avoided this as well.

## Useful Tools

Two tools were particularly useful in optimising the site for download size:

* [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) identifies speed issues, along with user experience issues and provides a simple display of how the site appears on mobile and desktop. In the case of the image & CSS optimisations it suggests, it automatically performs the optimisation and allows you to download the result.
* The [Pingdom Website Speed Test](http://tools.pingdom.com/fpt/) was also useful as it picks up some issues that the Google tool doesn't, such as the lack of explicitly-set expiry times on certain files.

I hope this post has offered some useful hints if you are seeking to "minify" your own website, and optimise it for the download size of each page.
