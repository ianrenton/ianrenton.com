---
comments: true
date: 2012-10-08 21:10:47
layout: post
slug: rainy-evening-statistics-when-to-harvest-sloes
title: 'Rainy Evening Statistics: When to Harvest Sloes?'
latex: true
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

"My" sloe bush is in a relatively busy part of town.  Naturally, I shan't say where!  But I would estimate that something like a thousand people a day walk past this bush.  Let's call that the passer-by rate, *R*.  Our other important factors are *f<sub>n</sub>*, the fraction of passers-by that will notice and identify the sloe bush, *f<sub>h</sub>*, the fraction of passers-by that will want to harvest sloes, *f<sub>r</sub>*, the fraction of passers-by who will identify sloes as ripe, and *N*, the number of helpings of sloes on the bush.

A reasonable set of estimates may be *f<sub>n</sub> = 0.01* (the bush is quite well hidden), *f<sub>h</sub> = 0.1* (a reasonable proportion of people will make sloe gin given the chance), and *N = 1* (for there are only 200-300 accessible sloes).  *f<sub>r</sub>* is trickier as it depends on the ripeness of the sloes themselves and thus will increase with time, but we can go for a reasonable guess that 50% of people think they're ripe, so *f<sub>r</sub> = 0.5*.

This gives a total probability that the sloes will be harvested, per day, as:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
P<sub>h</sub> = R &times; f<sub>n</sub> &times; f<sub>h</sub> &times; f<sub>r</sub> &times; N<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 1000 &times; 0.01 &times; 0.1 &times; 0.5 &times; 1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= 0.5
</em></div>

A worrying 50% probability that the sloes will be taken on any given day!

## In Conclusion

I think it's pretty clear that I need to get out there and grab myself some sloes before anyone else does!
