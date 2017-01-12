---
author: Ian
comments: true
date: 2009-10-23 11:58:49
layout: post
slug: omg-wtf-cpp
title: OMG WTF CPP
wordpress_id: 2163
categories:
- Internet
- Software
- Security
tags:
- Fail
- LOL
- Screenshot
- Security
---

Allow me to share with you one of the most bizarre and infuriating login forms I have ever seen.  This is it, the one for CPP Identity Protection.

![CPP Identity Protection Login Form](/blog/2009/10/cpplogin.png)

Yeah, you read that right.  "Password **or** username" followed by "E-mail address".  The site drops hints that apparently passwords are discontinued, and since last year every customer has a username instead.  Er, guys?  Do you even understand how this works?

So when you join, you get a letter that contains your username, which is a pretty short alphanumeric string.  It's pretty much... a password.  Not a very good one, but still.

First time you log in, you get a delightful series of prompts that up the WTF factor even more.  The first one is "change your username".  My first reaction, as I guess it is for a lot of people, is "yeah, this alphanumeric string is crazy-hard to remember.  I'll just use the same username as I use everywhere!"  I actually got as far as typing 'tsuki_chama' in the box before I realised.  That would leave my online handle and e-mail address - both publicly-known information - as the only things protecting my account.  On a website that deals with _identity theft_.  Whaaaaat?

The second prompt is for the "username reminder", i.e. password reminder, assuming you left your 'username' as a password-like string.  Now there was no limitation on what you could have as a username, I guess you could have "abc" if you wanted.  But here, your password reminder, is another story.  There's a drop-down box of Secret Questions, the usual sort - first pet, memorable place, etc. You have to pick one, there's no free entry.  And then you enter your answer to that secret question.

_Which must be at least 8 characters and include at least one number._

Geez, do you think there might be another authentication field that you might want to apply that restriction to instead?  But yeah, I'm fine, because I had a pet hamster called ROBOHAM-877.

So yay, the only vaguely secure string you're providing is your password _recovery_ answer, which is not needed to log you in at all, only to recover your bizarro-username in case you forget it, assuming you didn't just go with the flow and set your username to the same damn username you use everywhere else.

Identity.  Protection.  Fail.
