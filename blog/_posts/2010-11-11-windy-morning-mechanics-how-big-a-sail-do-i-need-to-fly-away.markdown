---
comments: true
date: 2010-11-11 12:32:26
layout: post
slug: windy-morning-mechanics-how-big-a-sail-do-i-need-to-fly-away
title: 'Windy Morning Mechanics: How Big a Sail do I Need to Fly Away?'

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

Let's start with the pressure on a surface due to the wind, ignoring any issues of aerodynamic flow.  [Bernoulli's equation](http://en.wikipedia.org/wiki/Bernoulli's_principle) gives us a pressure differential *dp*, by:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>dp = (v<sup>2</sup>/2) &rho;</em></div>

Where *v* is the velocity of the air, and *&rho;* its density.

The force, *F*, exerted by the wind on a solid of area *A<sub>p</sub>* perpendicular to it would then be:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
F = dp A<sub>p</sub><br/>
&nbsp;&nbsp;&nbsp;= (v<sup>2</sup>/2) &rho; A<sub>p</sub>
</em></div>

Assuming the wind is blowing horizontally, in order to generate the maximum amount of lift, the sail should be at 45° to the wind.  In this configuration, half the force exerted on the sail will push it in the direction of the wind, and half will push it up.

However, tilting the sail by 45° (*&pi;/4* radians) reduces the area which it presents to the oncoming wind.  The area presented to the wind, *A<sub>p</sub>*, as a factor of its true area, *A*, is given by:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
A<sub>p</sub> = A sin(&pi;/4)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= (&radic;<span>2</span>/2) A
</em></div>

Substituting this into our force equation, we get that:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>F = (&radic;<span>2</span>/2) (v<sup>2</sup>/2) &rho; A</em></div>

Or to simplify,

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>F = (A v<sup>2</sup> &rho;) / (2 &radic;<span>2</span>)</em></div>

As mentioned earlier, only half that force is upwards, the other half being in the direction of the wind.  So the vertical component of the force, *F<sub>v</sub>*, is:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>F<sub>v</sub> = (A v<sup>2</sup> &rho;) / (4 &radic;<span>2</span>)</em></div>

This force is being employed to lift a mass *m* in Earth's gravity *g*, so we have that:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>m g = (A v<sup>2</sup> &rho;) / (4 &radic;<span>2</span>)</em></div>

Rearranging this for the sail area required gives us:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>A = (4 &radic;<span>2</span> m g) / (v<sup>2</sup> &rho;)</em></div>

Numbers time!  If we assume a bored software engineer of mass (*m*) 80 kg, Earth's gravity (*g*) of 9.8 m/s<sup>2</sup>, air density (*&rho;*) of 1.2 kg/m<sup>3</sup>, and the Met Office's current estimate of wind speed (*v*), 54 miles per hour or 24.14 m/s, our answer is:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
A = (4 &radic;<span>2</span> &times; 80 &times; 9.8) / (24.14<sup>2</sup> &times; 1.2)<br/>
&nbsp;&nbsp;&nbsp;= 6.3 m<sup>2</sup>
</em></div>

That's quite a bit bigger than what I could achieve with bat-style wings between my arms and body, but not *totally* unachievable.

For my 20 kg five-year-old self, that area would be four times less, at 1.6 m<sup>2</sup>.

### Part 2

Since we've got this far, we might as well check out my "really bloody strong" hypothesis for how strongly the wind would need to be blowing to enable our engineer to take off unaided.

Rearranging the equation for wind speed gives us:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>v = &radic;<span>((4 &radic;<span>2</span> m g) / (A &rho;))</span></em></div>

Our engineer has a surface area (from behind) of approximately 1.5 m<sup>2</sup>, so all other things being equal, the wind speed, *v*, required is:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
v = &radic;<span>((4 &radic;<span>2</span> &times; 80 &times; 9.8) / (1.5 &times; 1.2))</span><br/>
&nbsp;&nbsp;= 49.6 m/s<br/>
&nbsp;&nbsp;= 110 mph
</em></div>

This is well into hurricane territory on the [Beaufort scale](http://en.wikipedia.org/wiki/Beaufort_scale), although still a way short of the [fastest wind speed ever recorded](http://www.mountwashington.org/about/visitor/recordwind.php).

As for my five-year-old past self, if I had quarter the mass and the same density, I also had around *(1/4)<sup>2/3</sup> = 0.4* times the surface area.  The air speed required to lift me off the ground at that age would have been:

<div style="display: inline-block; margin: 0px 15%; margin-bottom: 1em;"><em>
v = &radic;<span>((4 &radic;<span>2</span> &times; 80 &times; 9.8) / (0.4 &times; 1.5 &times; 1.2))</span><br/>
&nbsp;&nbsp;= 39.2 m/s<br/>
&nbsp;&nbsp;= 87.7 mph
</em></div>

Also comfortably in hurricane territory, though not quite as outrageous as 110 mph.  Maybe if, back then in 1989, I'd stretched my coat out and angled back at 45°...

_Thanks to Tam Coton for correcting my original error in the final section._
