---
layout: software
title: "Twixt"
comments: true
githublink: https://github.com/ianrenton/twixt/
---

A simple PHP flat-file pastebin for Twitter.

Ever started replying to someone on Twitter, knowing as you did it that there's no
way you could fit it all into 140 characters? Did it drag on into two, three, four
tweets, cluttering up everyone's list? Twixt can help.

Having done just that several times, I was after a simple, disposable way of
putting more than 140 characters up somewhere on the internet that I can link from
a single tweet. Thus, I created this simple PHP script. Give it a block of text,
and it'll generate you a unique web page and grab you an is.gd short URL for it.

You can try it out at [http://twixt.successwhale.com](http://twixt.successwhale.com), or download and run it on
your own web server.

If you'd like to run this from your own server, you can get the source code from
GitHub. To run it, you'll need a web server that can run PHP, and the directory the
script sits in must be writable by whatever user you run your web server as.

API
===

Twixt also provides an API for use by applications such as my own SuccessWhale.
To use it, simply provide it with a properly URLEncoded “tweet” argument, for
example:

`http://twixt.successwhale.com/index.php?tweet=Hello%20World`

Twixt will return an HTTP 302 redicrect to the text-format output page of is.gd's “shorten” API, which will be either an HTTP 200 OK containing the shortened URL, or an HTTP 500 Internal Server Error containing the error message.

If you prefer not to use is.gd, you can also supply the `raw` parameter with value `true`, like so:

`http://twixt.successwhale.com/index.php?tweet=Hello%20World&raw=true`

This will return either an HTTP 200 OK containing the URL, or an HTTP 500 Internal Server Error containing the error message. This URL will not be shortened, so it will be based on the path on which you are running twixt, e.g. `http://twixt.successwhale.com/1.htm`. You can then pipe this through a shortening service of your own, if you like.

Status
======

Twixt is currently at version 1.2.

Twixt is mature, released software, and as far as I know there are no major bugs
that affect it. If you find any bugs or would like to request any new features,
please add an issue on GitHub.
