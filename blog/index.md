---
layout: default
title: Blog
comments: false
---

{% capture newest_post_year %}{{ site.categories.blog.first.date | date: "%Y" | plus: 0 }}{% endcapture %}
{% capture oldest_post_year %}{{ site.categories.blog.last.date | date: "%Y" | plus: 0 }}{% endcapture %}
{% capture year_links %}{% for i in (oldest_post_year..newest_post_year) reversed %}<a href="/blog/{{ i }}">{{ i }}</a> &nbsp; {% endfor %}{% endcapture %}

<main>
    <header>
        <h1>Blog</h1>
    </header>
</main>

<nav class="cardindex" style="margin-top:2em">
    <ul data-component class="card-list">
        {% for post in site.categories.blog limit:10 %}
        {% capture post-url %}{{ post.url | prepend: site.baseurl }}{% endcapture %}
        {% capture image-url %}{{ post.image | prepend: site.baseurl }}{% endcapture %}
        {% capture summary %}{{ post.content | markdownify | strip_html | truncatewords: 50 }}{% endcapture %}
        {% capture meta %}{{ post.date | date: "Written on %A %-d %b %Y" }}{% endcapture %}
        {% include card.html
            type="horizontal-left"
            title=post.title
            url=post-url
            image=image-url
            meta=meta
            description=summary
            readmore-text="Read more &raquo;" %}
        {% endfor %}
    </ul>
</nav>

<main>
    <nav>
        <h3>Blog Archives</h3>
        <p>Want more? Pick a year to jump into the blog archives:</p>
        <p>{{ year_links }}</p>
    </nav>
</main>
