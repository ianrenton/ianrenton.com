---
layout: post
title: Look Mum, I made an AI!
date: 2023-03-04 14:07 +0000
tags:
  - ai
  - markov
  - mastodon
  - twitter
---

All the cool kids are making AI these days, and probably dooming the human race or whatever, so I made one too.

Caveat: might just be a Markov chain bot?

Ten years ago (ten years?!) [I took part](https://ianrenton.com/blog/nanogenmo-a-50-000-word-target-i-can-meet/) in something called [NaNoGenMo](https://github.com/dariusk/NaNoGenMo)&mdash;National Novel Generation Month. An alternative to its much more famous counterpart NaNoWriMo, NaNoGenMo eschewed the sloppy process of human imagination and instead asked its nerdy participants to generate novels automatically instead. What a fun silly idea, we thought. Our programs will generate a bunch of nonsense, but why not?

Fast forward to 2023, where Amazon's self-published section being flooded with ChatGPT spam will no doubt be recognised as the first horseman of the Large Language Model Apocalypse.

Anyway, back then Markov Chain language processing was pretty hard to use, so for [my script](https://github.com/ianrenton/NaNoGenMo) I chose to do some manual regex parsing to extract sentences and phrases, then combine them in a semi-random way that aimed to reproduce the paragraph and dialogue flows of a real book. The result was just as unintelligible as I hoped for, and I promptly forgot all about it.

This morning, I came across a link to [Markodon](https://sam.pikesley.org/projects/markodon/) and thought I'd give it a shot. It takes in a Twitter archive, and becomes a Mastodon bot that posts Markov Chain output based on your tweets.

I was up and running in about 10 minutes. And what surprised me most is how easy it is to do stuff like that these days&mdash;injesting a corpus of text and generating output is one line of code using the [markovify](https://pypi.org/project/markovify/) library in Python. Honestly, between parsing tweets into a useful format, applying Markov chains to generate output, and using Mastodon's API to post... parsing the tweets looks like the hardest part.

I wanted to take things a step further and incorporate a bunch of my other writing into the text corpus as well. Luckily for me I've never really deleted anything major that I've posted online&mdash;I've put some effort into migrating the blog posts here from website to LiveJournal to WordPress to Jekyll over the years, and likewise all my projects, my old fiction, Film Review by the Numbers etc. is all still here.

Getting a text-based output of a Jekyll site is a fairly well-trodden road, mostly by folks looking to generate search indexes. A pretty simple Liquid template gave me everything I needed:

```liquid
{% raw %}{% for post in site.posts %}
  {{ post.content | markdownify | strip | strip_html }}
{% endfor %}{% endraw %}
```

That resulted in all the blog posts, line by line, with HTML removed. I then repeated the same for the other categories I use here, such as `hardware` and `filmreviews` in place of `posts`, to grab the rest. I merged the whole thing into a single file, since Markovify isn't going to care about any context.

I did belatedly realise that there were a lot of post sub-headings in the file, mostly from the bigger hardware build guides that can have several sections per page. There were a lot of tables, too, which with their HTML stripped just rendered as one cell per line. Rather than go back and attempt anything fancy in Liquid, I simply removed any lines less than 30 characters long with a regex:

```regex
^.{0,30}((\r?\n)|$)
```

I have archives from my days on Facebook and Instagram too, but chose not to include them&mdash;I used a cross-posting client for many years so Facebook is going to have a lot of overlap with Twitter, and Instagram is of course not focussed on text anyway. 

The result was a file of around 5.5MB. Can it be that I've contributed less than six megs of information to the internet in all this time? (And most of it Twitter shite too?) That all my textual content produced over two decades fits in a file smaller than the last cat photo I posted?

Regardless, Markovify handles it well and generates an output in less than five seconds on a 6th gen Core i5, when running from scratch (not caching the generated model). Very impressive!

The result of this morning's shenanigans is [@ian_ebooks](https://botsin.space/@ian_ebooks). A cron job posts every 3 hours, and I'll do my best not to boost it much as I know it'll only be me that finds it funny!