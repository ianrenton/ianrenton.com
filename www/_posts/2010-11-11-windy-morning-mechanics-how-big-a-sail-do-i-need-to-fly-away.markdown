---
author: Ian
comments: true
date: 2010-11-11 12:32:26
layout: post
slug: windy-morning-mechanics-how-big-a-sail-do-i-need-to-fly-away
title: 'Windy Morning Mechanics: How Big a Sail do I Need to Fly Away?'
wordpress_id: 11320

categories:
- Maths
- Science
tags:
- Classical Mechanics
- Forces
- Mathematics
- Maths
- Mechanics
- Newtonian Mechanics
- Sail
- Wind
---

I recall walking to school in a hurricane in what must have been 1989 or 1990, grabbing onto a nearby fence to hold myself steady, wondering how strong the wind would have to be to pick me up off the ground.  In the intervening 20 years I never did work it out.  It's a windy day today, so, to the Classical-mechanics-mobile!

It seems intuitive to me that the answer to the exact question posed by my five-year-old self is "really bloody strong", and that a better question might be "how much surface area would I need, positioned at the optimum angle and given a certain wind speed, to counteract my weight?".  Or alternatively, "I'm off down to the workshops, how big a sail do I need to make myself?".

Let's start with the pressure on a surface due to the wind, ignoring any issues of aerodynamic flow.  [Bernoulli's equation](http://en.wikipedia.org/wiki/Bernoulli's_principle) gives us a pressure differential, {% math display: inline %}dp{% endmath %}, by:

{% math %}
dp = \frac{v^{2}}{2}\rho
{% endmath %}

Where {% math display: inline %}v{% endmath %} is the velocity of the air, and {% math display: inline %}\rho{% endmath %} its density.

The force, {% math display: inline %}F{% endmath %}, exerted by the wind on a solid of area {% math display: inline %}{A}_{p}{% endmath %} perpendicular to it would then be:

{% math %}
\begin{aligned}
F &= dp {A}_{p} \\
&= \frac{v^{2}}{2}\rho {A}_{p}
\end{aligned}
{% endmath %}

Assuming the wind is blowing horizontally, in order to generate the maximum amount of lift, the sail should be at 45° to the wind.  In this configuration, half the force exerted on the sail will push it in the direction of the wind, and half will push it up.

However, tilting the sail by 45° ({% math display: inline %}\pi/4{% endmath %} radians) reduces the area which it presents to the oncoming wind.  The area presented to the wind, {% math display: inline %}{A}_{p}{% endmath %}, as a factor of its true area, {% math display: inline %}A{% endmath %}, is given by:

{% math %}
\begin{aligned}
{A}_{p} &= A\,sin(\frac{\pi}{4}) \\
&= \frac{\sqrt{2}}{2}\,A
\end{aligned}
{% endmath %}

Substituting this into our force equation, we get that:

{% math %}
F = \frac{\sqrt{2}}{2}\,\frac{v^{2}}{2}\,\rho\,A
{% endmath %}

Or to simplify,

{% math %}
F = \frac{A\,{v^{2}}\,\rho}{2\sqrt{2}}
{% endmath %}

As mentioned earlier, only half that force is upwards, the other half being in the direction of the wind.  So the vertical component of the force, {% math display: inline %}{F}_{v}{% endmath %}, is:

{% math %}
{F}_{v} = \frac{A\,{v^{2}}\,\rho}{4\sqrt{2}}
{% endmath %}

This force is being employed to lift a mass {% math display: inline %}m{% endmath %} in Earth's gravity {% math display: inline %}g{% endmath %}, so we have that:

{% math %}
m\,g = \frac{A\,{v^{2}}\,\rho}{4\sqrt{2}}
{% endmath %}

Rearranging this for the sail area required gives us:

{% math %}
A = \frac{4\sqrt{2}\,m\,g}{ {v^2}\,\rho}
{% endmath %}

Numbers time!  If we assume a bored software engineer of mass ({% math display: inline %}m{% endmath %}) 80 kg, Earth's gravity ({% math display: inline %}g{% endmath %}) of 9.8 m/s<sup>2</sup>, air density ({% math display: inline %}\rho{% endmath %}) of 1.2 kg/m<sup>3</sup>, and the Met Office's current estimate of wind speed ({% math display: inline %}v{% endmath %}), 54 miles per hour or 24.14 m/s, our answer is:

{% math %}
\begin{aligned}
A &= \frac{4\sqrt{2}\times80\times9.8}{24.14^2\times1.2} \\
&= 6.3\,\text{m}^2
\end{aligned}
{% endmath %}

That's quite a bit bigger than what I could achieve with bat-style wings between my arms and body, but not _totally_ unachievable.

For my 20 kg five-year-old self, that area would be four times less, at 1.6 m<sup>2</sup>.

### Part 2

Since we've got this far, we might as well check out my "really bloody strong" hypothesis for how strongly the wind would need to be blowing to enable our engineer to take off unaided.

Rearranging the equation for wind speed gives us:

{% math %}
v = \sqrt{\frac{4\sqrt{2}\,m\,g}{A\,\rho}}
{% endmath %}

Our engineer has a surface area (from behind) of approximately 1.5 m<sup>2</sup>, so all other things being equal, the wind speed, {% math display: inline %}v{% endmath %}, required is:

{% math %}
\begin{aligned}
v &= \sqrt{\frac{4\sqrt{2}\times80\times9.8}{1.5\times1.2}} \\
&= 49.6\,\text{m}/\text{s} \\
&= 110\,\mathrm{mph}
\end{aligned}
{% endmath %}

This is well into hurricane territory on the [Beaufort scale](http://en.wikipedia.org/wiki/Beaufort_scale), although still a way short of the [fastest wind speed ever recorded](http://www.mountwashington.org/about/visitor/recordwind.php).

As for my five-year-old past self, if I had quarter the mass and the same density, I also had around {% math display: inline %}{(\frac{1}{4})^{\frac{2}{3}}} = 0.4{% endmath %} times the surface area.  The air speed required to lift me off the ground at that age would have been:

{% math %}
\begin{aligned}
v &= \sqrt{\frac{4\sqrt{2}\times20\times9.8}{0.4\times1.5\times1.2}} \\
&= 39.2\,\text{m}/\text{s} \\
&= 87.7\,\mathrm{mph}
\end{aligned}
{% endmath %}

Also comfortably in hurricane territory, though not quite as outrageous as 110 mph.  Maybe if, back then in 1989, I'd stretched my coat out and angled back at 45°...

_Thanks to Tam Coton for correcting my original error in the final section._
