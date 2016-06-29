
A small application which renders a text-editor-like web interface, where each 'file' is generated from a local or remote markdown file.

Uses [Redcarpet](https://github.com/tanoku/redcarpet/) to transform each file using GitHub Flavoured Markdown.

Both the application as well as the local markdown files (in `markdown/`) are contained within the same [git](http://git-scm.com/) repository. You can also supply a set of remote markdown files which will be fetched by the application. This is primarily designed to build a website from multiple `README.md` files from your GitHub projects.

### Using this application on Heroku ###

To make immediate use of this project one only needs to execute the following commands:

```
    git clone git://github.com/ianrenton/github-readme-website.git mywebsite
    cd mywebsite
    heroku create --stack cedar mywebsite
    git push heroku master
    heroku open
```

### Other ins-and-outs ###

- To run the application locally: `foreman start`
- The list of remote markdown files to fetch is stored in `web.rb`.
- The template file exists in `views/index.erb` and can be modified to your liking.
