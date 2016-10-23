
A site for connecting constituents with their MPs. Ran at http://westminsterhubble.com from 2010-2013. Now defunct due to lack of use, and open sourced.

Install on Heroku
-----------------

```
git clone https://github.com/ianrenton/westminsterhubble.git
cd westminsterhubble
cp sample.env .env
vi .env
heroku apps:create mywestminsterhubbleapp
heroku config:push
git commit -a -m "If anything has changed..."
git push heroku master
```
