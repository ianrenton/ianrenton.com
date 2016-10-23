
Facefinder is a quick script I wrote in my lunch hour that makes a page of the names and faces of everyone I work with, to help new starters figure out who everyone is.

It comes in two varieties, a PHP script and an ASP page for Microsoft Office Sharepoint Services (MOSS) 2007.

I apologise profusely for the use of tables - I couldn't find a way of rendering it nicely in both IE and Firefox/Chrome/etc. without them!



### Using the PHP Script




  * [Download the PHP version from GitHub](https://github.com/ianrenton/Facefinder/tree/master/Standalone-PHP/).


  * Unzip the contents, and put them on a web server that can run PHP.  (I've tested it on Apache and IIS with PHP 4.something.)


  * Add photos of everyone in the `photos/` directory, in the "Firstname Lastname.ext" format.  JPEG, GIF and PNG are supported.  Ideally, crop them to a 300x300 square, but at least resize them to 300 by something.  (If you need to batch resize, I recommend [IrfanView](http://www.irfanview.com/) for the job on Windows boxes.)


  * Navigate to `http://yoursever/facefinder/index.php` and see the result!





### Using the MOSS 2007 page




  * [Download the MOSS 2007 version from GitHub](https://github.com/ianrenton/Facefinder/tree/master/MOSS2007-ASP/).


  * Unzip the contents, and put them in a document library on SharePoint.


  * Load the page in your web browser, and see the result!


  * If you don't see anything, maybe SharePoint doesn't have a proper list of users in it.  On our intranet we pull the list from Active Directory as a nightly job; this is configurable somewhere within the Site Services admin panel.


  * If you see names but no pictures, none of the users has a picture set.  On our intranet we get users to set their own pictures via their "My Site", but if you don't use "My Sites" you'll have to find another way of getting them in.





### Troubleshooting




I've never tried deploying these outside of our intranet, so for all I know it might fail completely for you.  Hopefully it doesn't, but if it does, leave a comment below or [e-mail me](mailto:ian@ianrenton.com) and I'll see if I can help you out.
