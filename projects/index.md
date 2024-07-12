---
comments: false
layout: custompage-withheadfoot
title: Projects
redirect_from:
  - /hardware
  - /software
  - /websites
---

<main>
<header>
  <h1>Projects</h1>
</header>

<article>
  <p>Welcome to the projects area of my site. Here you'll find build diaries, explanations, photos and videos of all the hardware I've built or hacked together by cramming computers inside childrens' toys; software I've written for them and for other purposes; various websites I've made over the years, and so on.</p>

  <p>More recent projects are shown at the top of the list, with old and long-since discontinued projects towards the bottom.</p>
  <p></p>
</article>
</main>

<nav class="cardindex" style="margin-top:2em">
  <ul data-component class="card-list">
  	{% include card.html
  	type="horizontal-left"
  	title="The “Worked Everything, Everywhere, All at Once” Award"
  	url="/projects/worked-everything-award"
  	image="/projects/worked-everything-award/headline-small.png"
  	image-alt="A geographic display with lots of highlighted circles and points"
  	description="Scamming my way to Imaginary Ham Radio Points using a hacky GeoPandas script."
  	readmore-text="Read more &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Big Mouth Phatt Bass"
  	url="/projects/big-mouth-phatt-bass"
  	image="/images/250/big-mouth-phatt-bass.jpg"
  	image-alt="A Big Mouth Billy Bass with wires sticking out of the back"
  	description="To quote Winston Churchill, “No hour of life is wasted, that is spent making a Billy Bass play techno.” Big Mouth Phatt Bass is a Billy Bass hack using an ESP32 microcontroller to sync the fish motion to a variety of new songs."
  	readmore-text="Read more &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Plane/Sailing Portable"
  	url="/projects/planesailing-portable"
  	image="/images/250/planesailing-portable.jpg"
  	image-alt="A small stack of Raspberry Pi zero hardware and an SDR dongle"
  	description="“Plane/Sailing Portable” is a tiny RTL-SDR-based receiver for ADS-B, AIS and APRS signals, which can feed web-based tracking services and the main Plane/Sailing system to improve coverage."
  	readmore-text="Read more &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Home Meteogram Display"
  	url="/projects/meteogram"
  	image="/images/250/meteogram.jpg"
  	image-alt="A wide screen showing a meteogram and other weather/calendar information"
  	description="My home Meteogram display is a passive weather and calendar display that lives in the kitchen and provides a customised weather forecast for the coming days on an ultra-wide screen."
  	readmore-text="Read the build guide &rarr;"
  	url2="https://github.com/ianrenton/home-meteogram-display"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Plane/Sailing"
  	url="/hardware/planesailing"
  	image="/images/250/planesailing.jpg"
  	image-alt="A military tactical software display showing symbols representing boats and planes"
  	description="“Plane/Sailing” is my home tracker for aircraft, ships and more! It receives radio signals via antennas on my house, processes them to share with popular tracking websites, and displays the combined results on a website using military symbology."
  	readmore-text="Read the build guide &rarr;"
	url2="https://planesailing.ianrenton.com/"
	readmore-text2="See it running &rarr;"
	url3="https://github.com/ianrenton/planesailing"
	readmore-text3="View the front-end source code &rarr;"
	url4="https://github.com/ianrenton/planesailing-server"
	readmore-text4="View the back-end source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Hypixel Skyblock Bazaar Flipping Calculator"
  	url="https://bazaarflip.ianrenton.com/"
  	image="/images/250/bazaarflip.png"
  	image-alt="A table of data about Minecraft items"
  	description="A quick weekend project to help my kid make money in the Hypixel Skyblock Minecraft server, this simple JavaScript tool has rapidly become the most searched-for of all my software."
  	readmore-text="Visit the website &rarr;"
	url2="https://github.com/ianrenton/Skyblock-Bazaar-Flipping-Calculator"
	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="USV-01 “Harry Paye”"
  	url="/hardware/usv-01"
  	image="/images/250/usv.jpg"
  	image-alt="USV-01, a Raspberry Pi-controlled model boat"
  	description="USV-01 “Harry Paye” is an off-the-shelf remote control boat refitted as a testbed for an autonomous navigation system, capable of speeds up to 40 knots."
  	readmore-text="Read the build guide &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Radio Shack"
  	url="/hardware/radioshack"
  	image="/images/250/radio.jpg"
  	image-alt="A VHF radio tuned to 145.5 MHz"
  	description="My Radio Shack page has a few details of my current radio setup, including the hardware for Plane/Sailing and general Ham Radio equipment. "
  	readmore-text="Read more &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="2EØUXV 'Random Shit I Found in my Shed' Antenna"
  	url="/hardware/radioshack/2e0uxv-random-shit-i-found-in-my-shed-antenna"
  	image="/hardware/radioshack/randomshitantenna5.jpg"
  	image-alt="A UHF Yagi antenna with radio attached"
  	description="The first antenna I built, costing precisely £0.00."
  	readmore-text="Read more &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Web 3.1"
  	url="https://ianrenton.github.io/web3point1/"
  	image="/images/web3point1.png"
  	description="A brief attempt to recreate some Windows 3.1 styles and interactions on the web using HTML, CSS and JavaScript. 'Ah,' you ask, 'but can it run DOOM?' Yes it can."
	readmore-text="Visit the website &rarr;"
	url2="https://github.com/ianrenton/web3point1"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="WSPRnet Information System"
  	url="https://ianrenton.github.io/wspr_crt/"
  	image="/images/wsprcrt.png"
  	description="A prototype for a display of WSPRnet data with an 80s-style user interface. It currently only shows pre-canned data but may be implemented properly with live data when time allows. "
  	readmore-text="See it running &rarr;"
	url2="https://github.com/ianrenton/wspr_crt"
	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Plane/Sailing 1983"
  	url="http://planesailing1983.ianrenton.com/"
  	image="/images/planesailing1983.jpg"
  	description="I developed the code and style of the 'WSPRnet Information System' into a live frontend for Plane/Sailing with the same retro aesthetic."
  	readmore-text="See it running &rarr;"
	url2="https://github.com/ianrenton/planesailing1983"
	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Flight Tracker"
  	url="/hardware/flight-tracker"
  	image="/hardware/flight-tracker/hw.jpg"
  	description="I built my own ADS-B receiver to track flights taking off from the nearby airport, using a Raspberry Pi and an SDR dongle. This was the predecessor to Plane/Sailing's hardware."
  	readmore-text="Read the build guide &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="U.M.I.D. 1090 (Unnecessary Military Interface for Dump1090)"
  	url="https://github.com/ianrenton/umid1090"
  	image="/hardware/flight-tracker/sw2.png"
  	description="A web-based display for ADS-B flight tracking software Dump1090, using military symoblogy. It was designed for my first flight tracker and is the predecessor to Plane/Sailing's software."
  	readmore-text="View the source code &rarr;"
	url2="https://flightmap.ianrenton.com/"
	readmore-text2="See it running &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Roast Dinner Timing Chart"
  	url="https://ianrenton.github.io/roastdinner/"
  	image="/images/250/roast.jpg"
  	image-alt="A knife cutting into a roast chicken"
  	description="Some Javascript magic to help you cook the perfect Sunday roast. Simply select your ingredients and a time to serve, and it will generate you a list of timed steps."
  	readmore-text="Visit the website &rarr;"
	url2="https://github.com/ianrenton/roastdinner"
    readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Linux on Linx 1010B Tablet"
  	url="/guides/install-linux-on-a-linx-1010b-tablet"
  	image="/images/250/linx.jpg"
  	image-alt="A Linx 1010B tablet running Ubuntu"
  	description="A guide on how to install Linux, plus a few bonus operating systems, on the low-cost Linx 1010B Windows tablet."
  	readmore-text="Read the guide &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Over-Engineered Cat Deterrent"
  	url="/hardware/catscarer/"
  	image="/hardware/catscarer/catscarer1.jpg"
  	description="Something that I sketched out and might build eventually."
  	readmore-text="See the sketches &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="All-Terrain Pi"
  	url="/hardware/atp"
  	image="/images/250/atp.jpg"
  	image-alt="All-Terrain Pi, a Raspberry Pi-controlled ATV toy"
  	description="The All-Terrain Pi is a “off-road” remote control toy fitted with a Raspberry Pi, with live video streaming, controllable by touch/tilt input from a smartphone, and capable of running programs written in Scratch."
  	readmore-text="Read the build guide &rarr;"
	url2="https://github.com/ianrenton/All-Terrain-Pi"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Quadcopter"
  	url="/hardware/quadcopter"
  	image="/images/250/quad.jpg"
  	image-alt="A quadcopter fitted with a Raspberry Pi, sat on grass"
  	description="Because the Raspberry Tank was confined to just the two boring dimensions, I built a quadcopter and put a Raspberry Pi on that too. It features live video streaming and is switchable between remote and autonomous control."
  	readmore-text="Read the build guide &rarr;"
	url2="https://github.com/ianrenton/quadcopter"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Fun with Playbulb"
  	url="/blog/fun-with-playbulb/"
  	image="/blog/2015/playbulb.jpg"
  	description="I developed some example code for controlling a Playbulb LED light from your computer via Bluetooth, and setting the colour according to mailbox status or weather."
  	readmore-text="Read the blog post &rarr;"
	url2="https://github.com/ianrenton/playbulb-tools"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Lego Turtle"
  	url="/hardware/lego-turtle"
  	image="/images/250/turtle.jpg"
  	image-alt="Lego Turtle, an Arduino-controlled Lego Mindstorms robot"
  	description="The Lego Turtle is an Arduino microcontroller retro-fitted onto an old Lego Mindstorms kit. It features a built-in interpreter for simple Logo programs loaded via the serial port."
  	readmore-text="Read the build guide &rarr;"
	url2="https://github.com/ianrenton/legoturtle"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Sea Battle"
  	url="https://ianrenton.github.io/SeaBattle/"
  	image="/images/250/seabattle.jpg"
  	image-alt="A bunch of minimalist-looking ships moving around in a top-down view"
  	description="A quick-and-dirty 2D RTS game inspired by the unit customisation mechanics of Warzone 2100."
  	readmore-text="Read about it &rarr;"
	url2="https://github.com/ianrenton/SeaBattle"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="NaNoGenMo 2014"
  	url="https://github.com/ianrenton/NaNoGenMo/"
  	image="/images/nanogenmo.png"
  	description="My 2014 NaNoGenMo entry was a generator of semi-random 50,000-word novels based on fanfiction."
  	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Gecko Cam"
  	url="/hardware/geckocam/"
  	image="/hardware/geckocam/geckocam.jpg"
  	description="Our pet gecko has an instrumented and automated vivarium. The Gecko Cam page explains the hardware and software setup."
  	readmore-text="Read the build guide &rarr;"
	url2="http://rimbaud.renton.es/"
	readmore-text2="See it running &rarr;"
	url3="https://github.com/ianrenton/geckocam"
  	readmore-text3="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Raspberry Tank"
  	url="/hardware/raspberry-tank"
  	image="/images/250/tank.jpg"
  	image-alt="The Raspberry Tank, a model Tiger tank shown with a camera and sensors fitted"
  	description="The Raspberry Tank was possibly the first tank-like robot powered by a Raspberry Pi, way back in 2012. It’s smartphone- or laptop-controlled, streams video from its webcam, fires plastic pellets and can navigate autonomously."
  	readmore-text="Read the build guide &rarr;"
	url2="https://github.com/ianrenton/raspberrytank"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Dorset Constructorium"
  	url="/websites/constructorium/"
  	image="/images/constructorium.png"
  	description="I set up and ran the website for the Dorset Constructorium, a local hackerspace that is now discontinued."
	readmore-text="Read about the website &rarr;"
	url2="/blog/the-constructorium-story/"
  	readmore-text2="Read about the Hackerspace &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Can I Call It...?"
  	url="http://cici.onlydreaming.net/"
  	image="/images/cici.png"
  	description="'Can I Call It...?' is a utility that helps you name your new project, by finding any existing software packages that already have that name."
	readmore-text="Visit the website &rarr;"
	url2="http://ianrenton.github.io/canicallit/"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="SuccessWhale"
  	url="https://github.com/ianrenton/SuccessWhale/"
  	image="/images/successwhale.png"
  	description="SuccessWhale was a multi-column Twitter, Facebook and LinkedIn client. It offered advert-free feeds, completely customisable columns, multiple account support, and more."
	readmore-text="View the front-end source code &rarr;"
	url2="https://github.com/ianrenton/successwhale-api/"
  	readmore-text2="View the back-end source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Daily Promise"
  	url="/websites/dailypromise/"
  	image="/images/dailypromise.png"
  	description="Daily Promise was a '1-bit' activity tracker that allows you to make 'promises' and keep track of how many days in a row you kept them. It ran for a couple of years, but only ever had around a dozen users."
	readmore-text="Read about it &rarr;"
	url2="http://ianrenton.github.io/DailyPromise/"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="A Thousand Words"
  	url="/websites/athousandwords"
  	image="/images/1kw.png"
  	description="'A Thousand Words' was an attempt at a fiction-writing community where contributors would post a photo and encourage others to use it as an idea for short stories."
	readmore-text="Read about it &rarr;"
	url2="https://github.com/ianrenton/athousandwords"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Westminster Hubble"
  	url="/websites/westminsterhubble/"
  	image="/images/hubble.png"
  	description="Westminster Hubble was a website that tracked UK Members of Parliament, both their activities at Westminster and on social media. It was developed with an old school friend, but it didn't take off and we released the source code to the public."
	readmore-text="Read about it &rarr;"
	url2="https://github.com/ianrenton/westminsterhubble"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Disqus to HashOver"
  	url="https://github.com/ianrenton/disqus-to-hashover"
  	image="/images/disqus2hashover.png"
  	description="A quick and dirty Java application that converts blog comments in a Disqus export into HashOver's file structure."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Boardwalk"
  	url="/websites/boardwalk/"
  	image="/images/boardwalk.png"
  	description="I formerly designed and ran the website for Boardwalk, a local dog walking service that operated in the Bournemouth and Poole area."
	readmore-text="Read about it &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Github README Website Generator"
  	url="https://github.com/ianrenton/github-readme-website"
  	image="/images/githubreadme.png"
  	description="Software that generates a website for your other software, based on README.md files in your GitHub repositories."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Yet Another Single File Photo Gallery"
  	url="http://ianrenton.github.io/yasfpg/"
  	image="/images/yasfpg.png"
  	description="A simple bit of PHP that presents photos on a filesystem via an attractive web interface."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="FaceFinder"
  	url="https://ianrenton.github.io/Facefinder"
  	image="/images/facefinder.png"
  	description="A 'who's who' page designed for corporate intranets. Two versions are available, one standalone that uses a PHP script and a flat file structure, and one that integrates with Microsoft SharePoint."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Twixt"
  	url="https://github.com/ianrenton/Twixt/"
  	image="/images/twixt.png"
  	description="A simple pastebin for Twitter that was integrated with SuccessWhale."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Pokemon Review"
  	url="http://pokemonreview.tumblr.com/"
  	image="/images/pokemonreview.png"
  	description="A Tumblr where I coped with my kid's Pokemon obsession by posting weird 'reviews' of the bizarre critters. Occasionally sweary."
	readmore-text="Visit the website &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="The Marvellator"
  	url="http://marvellator.onlydreaming.net/"
  	image="/images/marvellator.png"
  	description="A script that generates random silly comic book titles."
	readmore-text="Visit the website &rarr;"
	url2="https://github.com/ianrenton/Marvellator"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Terrible Fanfiction Idea Generator"
  	url="http://fanfic.onlydreaming.net/"
  	image="/images/fanficidea.png"
  	description="Another silly random generator script. This one generates terrible scenarios to use as the basis for fanfiction. "
	readmore-text="Visit the website &rarr;"
	url2="https://github.com/ianrenton/fanficidea"
  	readmore-text2="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Cobb's Quay Weather"
  	url="https://github.com/ianrenton/Cobbs-Quay-Weather"
  	image="/images/cobbs.png"
  	description="A script that grabbed the data behind a Flash-based weather monitoring interface and presented it as plain HTML for use on sailor's phones."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Telegraph Fantasy Football Team Picker"
  	url="http://ianrenton.github.io/TelegraphFantasyFootballTeamPicker/"
  	image="/images/tffpicker.png"
  	description="Automatically picked optimum teams for the Telegraph's Fantasy Football game, around 2009-2012. This scraped the stats web pages from the game as there was no proper API; eventually I stopped playing fantasy football and thus stopped fighting the website's frequently changing markup."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Premier League Fantasy Football Team Picker"
  	url="http://ianrenton.github.io/PremierLeagueFantasyFootballTeamPicker/"
  	image="/images/plffpicker.png"
  	description="Automatically picked optimum teams for the Premier League's Fantasy Football game, around 2009-2011. This scraped the stats web pages from the game as there was no proper API; eventually I stopped playing fantasy football and thus stopped fighting the website's frequently changing markup."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Iridium9601Sim & CrapTerminal"
  	url="https://ianrenton.github.io/Iridium9601Sim"
  	image="/images/iridium9601sim.png"
  	description="Iridium9601Sim is a variant of my CrapTerminal Java serial terminal app with some helpful shortcuts for use with Iridium 9601 SBD modems."
  	readmore-text="View Iridium9601Sim source code &rarr;"
	url2="https://ianrenton.github.io/crapterminal"
  	readmore-text2="View CrapTerminal source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Type X29"
  	url="https://github.com/ianrenton/TypeX29"
  	image="/images/typex29.png"
  	description="Type X29 is an experimental 1D 'bullet hell' shooter. It's playable, but only just."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Gunboat"
  	url="https://github.com/ianrenton/Gunboat"
  	image="https://ianrenton.com/images/gunboat.png"
  	description="Gunboat was a 3D naval shooter game, through which I tried to teach myself OpenGL. Some basic graphics work and controls were in place, but the game was never finished."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="War of the Roses"
  	url="https://github.com/ianrenton/WarOfTheRoses"
  	image="/images/waroftheroses.png"
  	description="An attempt at making a strategy RPG, which never got very far."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="MusicMan"
  	url="https://github.com/ianrenton/MusicMan"
  	image="/images/musicman.png"
  	description="An attempt at a music player and music library manager. It had some basic functionality but never compared with the likes of Winamp and Foobar."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="The Dorset Card Game"
  	url="/images/dorset.png"
  	image="/images/dorset.png"
  	description="A brief attempt at making a trading card game based on the undeniably best county in the world."
	readmore-text="Visit the page &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Dynamic Democracy"
  	url="/websites/dyndemo/"
  	image="/images/dyndemo.png"
  	description="An experiment in crowd-sourced policy-making and my first foray into online community-building."
	readmore-text="Read about it &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Business Processes Wiki"
  	url="http://bpw.ianrenton.com/"
  	image="/images/bpw.png"
  	description="Your useful guide to getting started at your soulless office job! A parody of business processes."
	readmore-text="Visit the website &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="RPG Dice Roller"
  	url="https://ianrenton.github.io/RPGDiceRoller"
  	image="/images/diceroller.png"
  	description="My first Python project was a simple RPG Dice Roller with support for different systems such as D&D, World of Darkness, Shadowrun etc."
	readmore-text="View the source code &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="Fred the Plant"
  	url="http://fredtheplant.ianrenton.com/"
  	image="/images/fred.png"
  	description="A doodle that a friend and I drew in our school days that we briefly resurrected on the Web."
	readmore-text="Visit the website &rarr;" %}

  	{% include card.html
  	type="horizontal-left"
  	title="This Website"
  	url="/websites/design-history"
  	image="/images/mmwp.png"
  	description="My website has gone through a bunch of design changes in its 25+ year history. The majority are now (thankfully!) lost to time, though some have been collected from the Internet Archive for self-indulgent reasons."
	readmore-text="View its history &rarr;" %}
  </ul>
</nav>
