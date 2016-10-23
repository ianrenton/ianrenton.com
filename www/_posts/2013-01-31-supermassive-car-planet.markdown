---
author: Ian
comments: true
date: 2013-01-31 13:49:56
layout: post
slug: supermassive-car-planet
title: Supermassive Car Planet
wordpress_id: 13436
latex: true
categories:
- Maths
- Science
tags:
- Astrophysics
- BBC
- Black Holes
- Brian Cox
- Journalism
- Physics
- Science
- Science Reporting
- Space
- Supermassive Black Holes
---

I love the way the BBC tries to make everything so _relateable_ to everyday human experience. Case in point: [this article about a new technique for measuring the mass of supermassive black holes](http://www.bbc.co.uk/news/science-environment-21259221). In order to convey just how heavy these things are, the caption on their first picture relates it to something we all understand -- the mass of a family car.

![](https://files.ianrenton.com/sites/blog/2013/01/wpid-blackhole.png){: .center}

Unfortunately, in making the unit relateable, they make the actual number involved _un_-relateable to a ridiculous extent. Can anyone reading the article visualise what "six billion trillion trillion family cars" would look like?

No? Me neither. But by the power of mathematics, we will in a couple of minutes.

### Q1. What if we covered the entire surface of the Earth with cars?

The surface area of the Earth, [according to Wolfram Alpha](http://www.wolframalpha.com/input/?i=surface+area+of+the+Earth+in+metres), is:

{% math %}
A_{earth} = 5.1\times10^{14}\,\text{m}^2
{% endmath %}

Assume that a family car is approximately five metres long and two metres wide. So the area taken up by one car is:

{% math %}
A_{car} = 5\times2 = 10\,\text{m}^2
{% endmath %}

Our six billion trillion trillion cars would take up:

{% math %}
\begin{aligned}
A_{allcars} &= 6\times10^{35}\times A_{car} \\
&= 6\times10^{36}\,\text{m}^2
\end{aligned}
{% endmath %}

Clearly this is much larger than the available surface area of the Earth. So in order to fit the cars onto the Earth's surface, how many do we need to stack on top of each other?

{% math %}
\begin{aligned}
n_{stack} &= \frac{A_{allcars}}{A_{earth}} \\
&= \frac{6\times10^{36}\,{m}^2}{5.1\times10^{14}\,\text{m}^2} \\
&= 1.18\times10^{22}
\end{aligned}
{% endmath %}

That's still not a number we can really relate to. In fact we've created a very odd structure here, because we are imagining cars stacked up squarely one on top of another -- so as they get further from the surface, the stacks get further and further apart until there ends up being a lot of empty space between them. Earth ends up as a tiny dot at the centre of a bizarre [spiny sea-urchin](http://en.wikipedia.org/wiki/Diadema_antillarum) effect of family cars.

A better question might be:

### Q2. What if we crammed as many cars onto the planet as possible?

Now we're no longer talking about neat stacks of cars, just about cramming them in wherever possible. Rather than area, then, we must consider the volume of the family car:

{% math %}
V_{car} = 5\times2\times1.5 = 15\,\text{m}^3
{% endmath %}

Now if we were to have six billion trillion trillion of those, they would take up:

{% math %}
\begin{aligned}
V_{allcars} &= 6\times10^{35}\times V_{car} \\
&= 9\times10^{36}\,\text{m}^3
\end{aligned}
{% endmath %}

If we were to pack those around the Earth, how far out would they reach? We need to add {% math display: inline %}V_{allcars}{% endmath %} to the volume of the Earth, then find the radius of that spherical volume:

{% math %}
\begin{aligned}
r_{sphere} &= \frac{3}{4\pi}\times\sqrt[3]{V_{allcars}+V_{earth}} \\
&= \frac{3}{4\pi}\times\sqrt[3]{9\times10^{36}+1.083\times10^{21}}\,\text{m} \\
&= 4.966\times10^{11}\,\text{m}
\end{aligned}
{% endmath %}

Still a pretty big number, but we can relate that to a few other measurements that people may be a little more aware of:

{% math %}
\begin{aligned}
r_{sphere} &= 4.966\times10^{11}\,\text{m} \\
&= 77857\,\text{times the radius of the Earth} \\
&= 714\,\text{times the radius of the Sun} \\
&= 3.3\,\text{times the distance from Earth to the Sun} \\
\end{aligned}
{% endmath %}

So with this many cars piled onto the Earth, the resulting car-planet would fill the entire solar system from the Sun out to the asteroid belt between Mars and Jupiter.

Unfortunately for the people of Earth, this is somewhat of a moot point. The mass of these cars is significantly greater than any approximation of the [Jeans mass](http://en.wikipedia.org/wiki/Jeans_instability#Jeans_mass), an important quantity in the physics of star formation. This means that placing all these family cars together in space would cause them to collapse in on themselves, growing hotter and denser until fusion reactions ignite -- we would have created our own star.

But the average family car is composed of heavy elements such as iron, not the hydrogen and helium that a star needs to shine. It would rapidly reach the end of its life, exploding in a gigantic supernova and collapsing back in again to form -- rather obviously when you think about it -- a black hole.

Another black hole of this mass in the Milky Way galaxy would tear it apart, throwing billions and billions of stars out into the endless night of the cosmos.

So.

It's a lot of cars. 

Bonus questions:

### Q3. Roughly how many cars are available to be rolled up in a Katamari level?

Significantly fewer than {% math display: inline %}6\times10^{35}{% endmath %}. This is a safety limit imposed by the developers to ensure the safety of mankind.

### Q4. Could Brian Cox save us from this terrible fate?

Yes. He would gaze wistfully into the black hole, resulting in it feeling vaguely embarrassed and going off to bother another part of the universe instead.
