---
author: Ian
comments: true
date: 2012-10-08 21:10:47
layout: post
slug: rainy-evening-statistics-when-to-harvest-sloes
title: 'Rainy Evening Statistics: When to Harvest Sloes?'
wordpress_id: 13239
latex: true
categories:
- Maths
- Science
- Seasonal
tags:
- Harvest
- Maths
- Probability
- Sloe Gin
- Sloes
- Statistics
- Weather
---

This morning I half-heartedly posted on Facebook:

> Today's Game Theory problem: pick an ideal date for picking sloes, bearing in mind current warm/wet weather predictions for October and a population density of 10000/sq.mi. of other potential sloe pickers. (10 marks)

Well, I'm bored, so let's get our geek on.  [Again.](http://blog.ianrenton.com/windy-morning-mechanics-how-big-a-sail-do-i-need-to-fly-away/)

## The Weather

I live in one of the warmest parts of Britain, on the south coast with temperatures continuously moderated by sea breezes from the south-west.  Frosts here are rare outside of December and January, and although the long-range forecast suggests "some chilly nights (are) possible" for the end of October and beginning of November, that's unlikely to bring actual frost to us.

(Case in point, [2010's impressive snowfall](http://news.bbc.co.uk/1/hi/8447023.stm). See that tiny bit of snow-less grey right on the south coast? That's us.)

So, although traditionally sloes are supposed to be picked after the first frost of Autumn, we cannot expect that to happen for a couple of months yet.  But will the sloes last that long?

The good news is, mild wet weather is good for letting the sloes ripen.  The longer they are left on the plant, the juicier they are.  We don't want to pick them too early as they will be bitter, but leaving them as long as possible has its own risks.  Namely:

## The People

The longer the sloes stay on the bush, the greater the change that nasty thieving hobbitses other people will make off with them.  We can follow the example of the [Drake Equation](http://en.wikipedia.org/wiki/Drake_equation) to estimate the likelihood of this.

"My" sloe bush is in a relatively busy part of town.  Naturally, I shan't say where!  But I would estimate that something like a thousand people a day walk past this bush.  Let's call that the passer-by rate, $$R$$.  Our other important factors are $$f_n$$, the fraction of passers-by that will notice and identify the sloe bush, $$f_h$$, the fraction of passers-by that will want to harvest sloes, $$f_r$$, the fraction of passers-by who will identify sloes as ripe, and $$N$$, the number of helpings of sloes on the bush.

A reasonable set of estimates may be $$f_n = 0.01$$ (the bush is quite well hidden), $$f_h = 0.1$$ (a reasonable proportion of people will make sloe gin given the chance), and $$N = 1$$ (for there are only 200-300 accessible sloes).  $$f_r$$ is trickier as it depends on the ripeness of the sloes themselves and thus will increase with time, but we can go for a reasonable guess that 50% of people think they're ripe, so $$f_r = 0.5$$.

This gives a total probability that the sloes will be harvested, per day, as:

$$
\begin{eqnarray}
P_h &=& R \cdot f_n \cdot f_h \cdot f_r \cdot N\\

&=& 1000 \cdot 0.01 \cdot 0.1 \cdot 0.5 \cdot 1\\

&=& 0.5
\end{eqnarray}
$$

A worrying 50% probability that the sloes will be taken on any given day!

## In Conclusion

I think it's pretty clear that I need to get out there and grab myself some sloes before anyone else does!
