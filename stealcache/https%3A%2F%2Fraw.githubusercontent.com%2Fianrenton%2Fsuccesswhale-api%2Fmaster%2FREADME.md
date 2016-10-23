
This package provides API functions for the "SuccessWhale" social network clients (currently supporting Twitter only since Facebook's change in API policy). Clients include the [SuccessWhale version 3 web interface](https://github.com/ianrenton/SuccessWhale) and the Android client [OnoSendai](https://github.com/haku/onosendai).

SuccessWhale's main selling point is that it provides customisable, blended feeds from across a user's social network accounts -- for example, you can create a feed that combines "mentions" from two of your Twitter accounts with "notifications" from Facebook.

In providing an API for SuccessWhale, I am opening this system up for others to use -- for example to build mobile apps. (Now that TweetDeck has been discontinued, very few mobile or desktop apps offer any kind of cross-service feed merging.)

The API is a Ruby application built on Sinatra and Rack. It comes in a handy Heroku-flavoured wrapper. This is my first time writing Ruby, so I'm sure there are many inefficiencies -- patches, bug reports and constructive criticism are all welcome.

This application runs at [https://api.successwhale.com](https://api.successwhale.com).

Important Info
--------------

* [API documentation](docs/index.md) - explains how to use all the API calls
* [Licence](LICENCE.md) - BSD 2-clause licence

Installation
------------

If you want to run the SuccessWhale API on your own server, this section is for you. (If you just want to play around with the SuccessWhale web client, you don't need your own copy of the API server &mdash; you can use mine at `api.successwhale.com`.)

First of all, install the dependencies. If you don't have ruby and ruby-gems installed on your computer, you'll have to get them first. I recommend "RVM" for managing your ruby environment on Windows, or your native package manager on Linux.

With those installed, `git clone` this repository into a directory on your computer. `cd` into the directory. Run `gem install bundler` if necessary, then `bundle install` to install all of the SuccessWhale API's dependencies.

You will then need to set up a mySQL server. (That's all we support at the moment, but if you'd like to fork the code and add support for something like postgres, I would love to pull it in.)  A query to populate the tables is included as `setup.sql`.

Next, rename `sample.env` to `.env` and fill in the values inside. If you haven't already, you will need to create an app on all the services (e.g. Twitter and Facebook) that you want to use, and make a note of the access tokens so that you can enter them in `.env`.

Twitter needs read/write permissions, and access to your direct messages if you want to see them within SuccessWhale. (Facebook needs the following permissions for full functionality: `status_update, read_stream, publish_stream, manage_notifications, user_groups, offline_access`. Since the API change in 2015 Facebook has not granted read_stream permissions to thied-party apps, rendering our Facebook support unusable, but the code remains in there in case Facebook reverses its decision.)

Your SuccessWhale API is now ready to run. You can run a development instance with Foreman (`foreman start`) or push it to a Heroku instance with the environment vars you set (`heroku create`, `git push heroku master`, `heroku plugins:install git://github.com/ddollar/heroku-config.git`, `heroku config:push`).
