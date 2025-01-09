---
author: Ian
comments: true
date: 2012-05-05 20:37:01
layout: post
slug: goddamnit-php-episode-587
title: '"Goddamnit, PHP", Episode 587'
wordpress_id: 12748
categories:
- Internet
- Projects
- Software
tags:
- Accuracy
- Floating Point
- Integers
- php
- Rant
- SuccessWhale
- Twitter
- Weak Typing
---

If any of my readers are also [SuccessWhale](https://successwhale.com) users, you may have noticed that for the last few days, clicking the "Conversation View" button for a tweet (this one: ![SuccessWhale Conversation View button](https://successwhale.com/images/convo.png)) has resulted in a message declaring that you have tried to look at a "protected or deleted tweet" even though that is plainly not the case.

First and foremost, you'll be pleased to know that [this bug](https://github.com/ianrenton/SuccessWhale/issues/43) is [now fixed](https://github.com/ianrenton/SuccessWhale/commit/324dc3c4d241c1f1f5f549fdfca9810d3052e46b) in both the stable and testing versions of the public SuccessWhale server, and in the [master branch](https://github.com/ianrenton/SuccessWhale) on GitHub as of today.

So, why did this happen? A one-two punch of Twitter's meteoric rise in popularity and some PHP developers' dubious decisions.

Tweets that are replies have a field named `in_reply_to_status_id` which can be used to query Twitter for the tweet that it was made in reply to. By iterating this process until a tweet does not return an `in_reply_to_status_id` field, SuccessWhale builds up a "Conversation View" page that allows users to see a chain of posts at once. The code looks like this, and until a few days ago it worked perfectly:

``` php
    $statusID = $_GET['status'];
    
    // Get tweet data and render
    while ($statusID > 0) {
        $data = $twitter->get('statuses/show/' . $statusID, $paramArray);
        $statusID = $data['in_reply_to_status_id'];
        // Blank array is for the blocklist. Blocklists aren't obeyed in convo
        // threads.
        $item = generateTweetItem($data, false, false, true, $_GET['thisUser'],
            array());
        $content .= $item['html'];
    }
```

The issue came about due to PHP's bizarre implementation of [weak typing](https://en.wikipedia.org/wiki/Dynamic_typing#Strong_and_weak_typing). Twitter is now so huge that it has a very large number of tweets; the value returned by `in_reply_to_status_id` is an integer identifying a specific one. That number long since passed the maximum that could be stored in a 32-bit integer (2<sup>32</sup>, or 4294967296), and since then the PHP code behind SuccessWhale has been silently converting the number from an integer to a floating point number. This was not immediately a problem, as PHP's double-precision floats can still uniquely specify integers higher than 2<sup>32</sup>. But as we have now found, it actually _is_ a problem -- it only manifests much later, because a floating point number is [not _always_ accurate to the nearest integer](https://en.wikipedia.org/wiki/Floating_point#IEEE_754:_floating_point_in_modern_computers). Twitter's post ID numbers are now larger than 2<sup>53</sup> (9007199254740992), the threshold beyond which a double-precision float can no longer distinguish one whole number from the one next to it.

This is absolutely fine in a strongly-typed language, when the programmer has declared a variable to be floating point and can see this coming. But when the programmer was expecting the variable to be an integer type, this causes some very odd behaviour to arise in the software.

When SuccessWhale sends that `in_reply_to_status_id` value back to Twitter, which tweet is it requesting? The right one, or a subtly different one?  Actually, _neither_, because another type conversion issue comes into play.  Beyond this 2<sup>53</sup> threshold, PHP rightly realises that it can't hope to express the value as an integer -- so rather than trying, it represents the number in its exponential form.  Rather than requesting tweet number 12345678901234567 -- which PHP cannot handle due to the aforementioned issue -- it requests tweet number 1.234567890E16.  Twitter takes one look at this, gives a "WTF this number has a letter and punctuation in it" and promptly falls over.

Luckily, Twitter pre-empted this issue and provides a `in_reply_to_status_id_str` field: exactly the same number, but as a string rather than an integer.  PHP is perfectly happy to handle very large numbers as strings -- and, on line 4 of the example code above, perfectly happy to compare that string to zero.

![Why, PHP? Just why?](/img/blog/2012/05/wpid-meme4697357194.jpg){: .center}
