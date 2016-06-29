
"A Thousand Words" was a community site where users post short stories inspired by user-submitted pictures. I made for my wife, but it never took off. It should be fully functional, but it was written a long time ago so the quality of the code is probably somewhat lacking.

Install on Heroku
-----------------

* Set up a MySQL database somewhere
* Run:

```
    git clone https://github.com/ianrenton/athousandwords.git
    cd athousandwords
    cp sample.env .env
```
* Edit `.env` in your favourite editor
* Run:

```
    heroku apps:create
    heroku config:push
```
Since Heroku is read-only, uploading pictures involves adding them to the repo, committing it and pushing it. It would be nice in future to support automatic upload to Amazon S3 or something.
