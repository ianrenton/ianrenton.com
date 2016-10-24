---
layout: software
title: "Yet Another Single File Photo Gallery"
comments: true
githublink: https://github.com/ianrenton/yasfpg/
---

A photo gallery in a single file, inspired by [SFPG](http://sye.dk/sfpg/).

This program has far fewer options and is much less customisable, but is much neater and more compact.

How to Use
----------

* Set up a file structure for your photos, with directories for albums containing image files in JPG or PNG format. Directory and file names will be used as album and photo names, while the modified date will be used to sort them (albums go newest-first, photos within them go oldest-first).
* Drop `index.php` into the top-level directory containing your album directories.
* Edit `index.php` to your liking, e.g. change the title block, CSS, whatever
* Create a `cache` directory that is writable by your web server, alongside your albums and `index.php`
* Ensure that your web server (only tested with Apache!) has PHP and [GD support](http://php.net/manual/en/book.image.php) and GD is installed.
* Visit the site in a web browser. (The first time you load a page it will take a while as it is generating thumbnails. Next time it will be much quicker!)
