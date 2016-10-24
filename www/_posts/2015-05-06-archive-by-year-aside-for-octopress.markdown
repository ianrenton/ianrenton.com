---
layout: post
title: "\"Archive by Year\" Aside for Octopress"
date: 2015-05-06 22:16
comments: true
categories: 
- Software
tags:
- Octopress
- Ruby
- Liquid
---

*(Note: This code is designed for Octopress 2. My website now uses Octopress 3&mdash; the Jekyll plugin works just the same, but Octopress 3 sites can use the `jekyll-archives` gem to generate proper archive-by-year pages so should not need the bookmark 'hack' shown in the first code block.)*

One thing that's annoyed me since migrating my website from Wordpress to Octopress years ago has been the lack of an "archive by year" widget for the sidebar. The Wordpress widget that fulfills this function lists each month and year, with the number of posts in that month, and each one is a link to a page that shows all the posts from that month.

As you may notice on the left-hand side of each page, I decided to recreate something similar in Octopress.

There are a couple of differences between the WordPress implementation and my Octopress implementation:

1. Octopress doesn't generate pages that show all posts from a particular month (or year). It does generate an "archive" page with links to all posts in order, which is what I've used as a destination for each link.
2. Partly as a result of this (and partly because I've been blogging far too long), I decided to stick with one link per year rather than one link per month.

My first modification was to the "archives" page. To this I simply added a named `a` tag to each year title (see line 12 below). This allows each year title to be used as a bookmark and linked to appropriately.

**source/blog/archives/index.html**

```html
---
layout: page
title: Blog Archive
footer: false
---

<div id="blog-archives">
{% for post in site.posts reverse %}
{% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
{% unless year == this_year %}
  {% assign year = this_year %}
  <h2><a name="{{ year }}"></a>{{ year }}</h2>
{% endunless %}
<article>
  {% include archive_post.html %}
</article>
{% endfor %}
</div>
```

The code that generates the widget (or "aside", in Octopress parlance) can't be written in a single `.html` file using Liquid tags as it is too complex. Thus I implemented it by defining a new Liquid tag called `archive`, as follows.

**plugins/archive_tag.rb**

```ruby
module Jekyll
  class ArchiveTag < Liquid::Tag
    def render(context)
      html = ""
      yearData = Hash.new
      
      # Get range of years for which there are posts
      posts = context.registers[:site].posts
      firstYear = posts[0].date.year
      lastYear = posts[posts.size-1].date.year
      
      # Build up a map of {year => number of posts that year}
      for year in firstYear..lastYear
        yearData[year] = posts.select{ |post| post.date.year == year }.size
      end
      
      # Build the html items
      yearData.sort.reverse_each { |year, numPosts|
        if numPosts > 0
          html << "<li class='post'><a href='/blog/archives##{year}'>#{year} (#{numPosts})</a></li>"
        end
      }
      
      # Write out the html
      html
    end
  end
end

Liquid::Template.register_tag('archive', Jekyll::ArchiveTag)
```

The final piece of the puzzle is to create an aside to display the new tag, which is done simply as follows:

**source/_includes/asides/archive.html**

```html
<section>
  <h1>Archive</h1>
  <ul id="archive">
    {% archive %}
  </ul>
</section>
```

Adding `asides/archive.html` to the `default_asides` section in Octopress' `_config.yml` adds the new aside to each page.

The end result is just like the one you can see in the sidebar of every page on this blog: a list of each year for which there are posts, in descending order, suffixed by the number of posts made that year. Each item in the list is a link to the main "archive" page, jumping straight to the bookmark for that year.

This code is in the public domain so feel free to use it on your own blog and modify it however you like!
