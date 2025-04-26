---
layout: post
title: "POTA as Ingress"
date: 2025-04-25 00:00 +0000
image: /img/blog/2025/04/pota-ingress-small.png
slug: pota-as-ingress
description: "Please don't actually build this game?"
tags:
  - ham-radio
  - radio
  - amateur-radio
  - pota
---

[A conversation on fedi earlier today](https://mastodon.radio/@ian/114399079103764607) got me thinking about the idea of turning Parks on the Air into an [Ingress](https://ingress.com)-style game. The data is all out there&mdash;reference points with defined locations, "most recent activator" data; the POTA API itself is halfway there to the kind of server you would need to run the game.

I'm not actually going to build this game, and I'm not sure anyone should try to turn POTA into something as ultra-competitive as Ingress, but the idea of it [nerd-sniped](https://xkcd.com/356/) me until I had to code *something*. And this is what I made:

![Excerpt from a map with multiple triangles in various colours overlaid](/img/blog/2025/04/pota-ingress.png){: .center}
*It looks more "stained glass window" than "Ingress", but the idea is there!*

The code I wrote to generate this takes all activated parks in the UK, then calculates triangular areas between them using Delaunay triangulation. My vague recollection of Ingress gameplay from many years ago was that it worked something like this, with ownership of the points of a triangle giving control over that area. The code then figures out if the triangle is "controlled" by a "team", and then generates a KML output with the triangles coloured according to team control.

For this example, a "team" is defined by the first letter of the callsign. For UK activators this will be either "G", "M" or "2", coloured red, blue and yellow respectively. Overseas activators with different first letters have been grouped into "team 2" since 2 is the least common amongst UK activators. "Control" of a triangle is shown as a strong colour if a single team "controls" all three points around it by being the latest activators of each park. If only two points are controlled by a team, the colour is shown semi-transparent. A semi-transparent grey colour is used if there is no overall control, i.e. each point is controlled by a different team.

Here's the code:

```python
from datetime import timedelta
from time import sleep
import numpy as np
import simplekml
from requests_cache import CachedSession
from scipy.spatial import Delaunay

# Fetch list of parks in GB
print("Loading park list...")
session = CachedSession("cache", expire_after=timedelta(days=1))
parks = session.get("https://api.pota.app/program/parks/GB").json()

# Downselect only activated parks
activated_parks = list(filter(lambda park: park["activations"] != None and int(park["activations"]) > 0, parks))

# Look up each park and associate it with "team G", "team M" or "team 2 (and friends)" based on its last activator.
print("Querying park activators...")
count = 0
for park in activated_parks:
    response = session.get("https://api.pota.app/park/activations/" + park["reference"] + "?count=1")
    last_activator = response.json()[0]["activeCallsign"]
    if last_activator[0] == "G":
        park["team"] = "G"
    elif last_activator[0] == "M":
        park["team"] = "M"
    else:
        park["team"] = "2"

    # Don't kill the API, print some progress as this is gonna take us 10+ minutes
    if not response.from_cache:
        sleep(0.1)
    count += 1
    if count % 100 == 0:
        print(str(count) + "/" + str(len(activated_parks)) + "...")


# Run Delaunay triangulation to produce triangles
print("Performing Delaunay triangulation...")
park_lon_lat_list = list(map(lambda park: [park["longitude"], park["latitude"]], activated_parks))
points = np.array(park_lon_lat_list)
tri = Delaunay(points)
triangles = points[tri.simplices]

# For each triangle, find out which parks are at its corners. This is really inefficient and not very pythonic but it'll do
print("Associating park references with triangles...")
triangles_with_park_refs = []
for triangle in triangles:
    new_tri = {"points": triangle, "parks": []}
    for point in triangle:
        for park in parks:
            if abs(park["latitude"] - point[1]) < 0.000001 and abs(park["longitude"] - point[0]) < 0.000001:
                new_tri["parks"].append(park)
                break
    triangles_with_park_refs.append(new_tri)

# For each triangle, figure out what team it belongs to and colour it
print("Calculating team ownership...")
for triangle in triangles_with_park_refs:
    triangle["colour"] = simplekml.Color.changealphaint(100, simplekml.Color.grey)
    corner_teams = list(map(lambda park: park["team"], triangle["parks"]))
    if corner_teams.count("G") == 3:
        triangle["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.red)
    elif corner_teams.count("M") == 3:
        triangle["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.blue)
    elif corner_teams.count("2") == 3:
        triangle["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.yellow)
    elif corner_teams.count("G") == 2:
        triangle["colour"] = simplekml.Color.changealphaint(100, simplekml.Color.red)
    elif corner_teams.count("M") == 2:
        triangle["colour"] = simplekml.Color.changealphaint(100, simplekml.Color.blue)
    elif corner_teams.count("2") == 2:
        triangle["colour"] = simplekml.Color.changealphaint(100, simplekml.Color.yellow)

# Create KML object
kml = simplekml.Kml()

# Add park markers to KML
print("Adding markers to KML...")
for park in parks:
    point = kml.newpoint(name=park["reference"], coords=[(park["longitude"], park["latitude"])])
    point.style.iconstyle.icon.href = None

# Add triangle polygons to KML
print("Adding polygons to KML...")
for triangle in triangles_with_park_refs:
    # Join poly up
    poly = kml.newpolygon(outerboundaryis=[triangle["points"][0], triangle["points"][1], triangle["points"][2], triangle["points"][0]])
    poly.style.polystyle.color = triangle["colour"]
    poly.style.linestyle.color = simplekml.Color.black

# Save KML
print("Saving KML...")
kml.save("output.kml")
print("Done.")
```

I also did a version based on Voronoi polygons. Here, the code is simpler because each polygon corresponds only to a single park, and so can only have a single team colour. This version is probably less "tactical" from a game perspective, as you can no longer take down a large area of rival team control by "infiltrating" their region and claiming key nodes. But it does produce pretty patterns, and as expected, even more like a stained glass window than the Delaunay version.

![Excerpt from a map with multiple polygons in three different colours overlaid](/img/blog/2025/04/pota-ingress-voronoi.png){: .center}
*POTA map showing "team control" of Voronoi polygons*

Here's the code for this version:

```python
from datetime import timedelta
from time import sleep
import numpy as np
import simplekml
from requests_cache import CachedSession
from scipy.spatial import Voronoi

# Fetch list of parks in GB
print("Loading park list...")
session = CachedSession("cache", expire_after=timedelta(days=1))
parks = session.get("https://api.pota.app/program/parks/GB").json()

# Downselect only activated parks
activated_parks = list(filter(lambda park: park["activations"] is not None and int(park["activations"]) > 0, parks))

# Look up each park and associate it with "team G", "team M" or "team 2 (and friends)" colours based on its last activator.
print("Querying park activators...")
count = 0
for park in activated_parks:
    response = session.get("https://api.pota.app/park/activations/" + park["reference"] + "?count=1")
    last_activator = response.json()[0]["activeCallsign"]
    if last_activator[0] == "G":
        park["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.red)
    elif last_activator[0] == "M":
        park["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.blue)
    else:
        park["colour"] = simplekml.Color.changealphaint(200, simplekml.Color.yellow)

    # Don't kill the API, print some progress as this is gonna take us 10+ minutes
    if not response.from_cache:
        sleep(0.1)
    count += 1
    if count % 100 == 0:
        print(str(count) + "/" + str(len(activated_parks)) + "...")


# Run Volonoi polygon calculation to produce regions around each park
print("Performing Voronoi polygon calculation...")
park_lon_lat_list = list(map(lambda park: [park["longitude"], park["latitude"]], activated_parks))
points = np.array(park_lon_lat_list)
vor = Voronoi(points)

# Iterate through the parks, getting the region from the Voronoi results and then getting the points in lat/lon space
for park_i in range(len(activated_parks)):
    vor_region_index = vor.point_region[park_i]
    vor_points_indices = vor.regions[vor_region_index]

    # Reject regions outside the plot. Unfortunately the Voronoi algorithm won't be able to generate polygons for points
    # on the edge because their extent would be infinite.
    if vor_points_indices.count(-1) == 0:
        vor_points = vor.vertices[vor_points_indices]
        vor_points_list = vor_points.tolist()
        # Join poly up
        vor_points_list.append(vor_points_list[0])
        activated_parks[park_i]["poly"] = vor_points_list

# Create KML object
kml = simplekml.Kml()

# Add polygons to KML
print("Adding polygons to KML...")
for park in activated_parks:
    if "poly" in park and park["poly"] is not None:
        poly = kml.newpolygon(outerboundaryis=park["poly"])
        poly.style.polystyle.color = park["colour"]
        poly.style.linestyle.color = simplekml.Color.black

# Save KML
print("Saving KML...")
kml.save("output.kml")
print("Done.")
```

None of this is elegant, or the basis of a good game, or honestly even a good idea, but it did keep me out of trouble for a few hours!