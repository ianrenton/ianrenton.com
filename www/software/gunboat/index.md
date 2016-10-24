---
layout: software
title: "Gunboat"
comments: true
githublink: https://github.com/ianrenton/gunboat/
---

Gunboat is a slow-paced 2D shooter written in Java and JoGL.  It is far from finished, but you can try out the current development version anyway.

### Downloads

Gunboat requires [Java](http://java.sun.com) 1.6 and [JoGL](https://jogl.dev.java.net).  Install Java as usual, and make sure the JoGL binaries (.dll files for Windows, .jnilib for Mac OS X, .so for Linux) are on the system path.  (You can just put the libraries in the Gunboat directory if you like.)

Download Gunboat itself [here](http://www.onlydreaming.net/files/Gunboat/Gunboat.zip), and unzip it anywhere you like.  Run "java -jar dist/Gunboat.jar" to run the game.  Gunboat.bat (Windows) or Gunboat.sh (Mac) will do this for you.

### Online Version

I have done some work on an [online browser-based version of Gunboat](http://www.onlydreaming.net/files/gunboatonline/index.html).  (Requires Google Earth plugin.)  However, it's in its very early stages (you can't shoot, there aren't any enemies...).  I'm not sure if I'll continue with it - one on had, level design has suddenly become very easy!  On the other hand, ick, Javascript.  Source code for it is [here on GitHub](https://github.com/ianrenton/GunboatOnline).

The rest of this page largely refers to the offline version, as it has many working gameplay components that the online version does not.

### Gameplay

In Gunboat, you are a small ship tasked to defend your harbour against an attacking Navy.  You can move freely around, and enemy ships will arrive in the harbour in waves.  (Sometimes, allies will arrive to help you as well.)  You must defeat all the enemies in each level to progress.

Your ship always appears at the bottom middle of your screen.  Around it is a coloured ring, which represents your health.  This will contract and change colour from green to red as you take damage.  Attached to the right side of your ship is a British flag, representing your ship's alleigance.  Allies may have other flags, and enemies will always have a different flag to yours.  Every ship has both a flag and a health ring.

At the top of your screen is your HUD.  On the left, your weapon loadout is displayed.  The yellow reticle represents your currently-selected weapon, though you can have up to 5 in each slot.  On the right, your speed, heading and radar are displayed.  Speed and Heading are fairly self-explanatory.  The radar has two modes that you can switch between.  The default shows a map of the entire harbour, with other vessels appearing on it.  Red are enemies, yellow allies, blue crates, and the green dot is you.  The other radar mode, which you can toggle to at will, is a close-in radar.  This only shows ships close to you, and thus gives higher detail.  "Up" on this radar is in front of your ship, as opposed to the map view, where Up is always North.

### Controls

The game is played with both keyboard and mouse.  The controls are:

  * **Move Mouse:** Aim
  * **Mouse Buttons:** Fire Primary (Left) / Secondary (Right) Weapon
  * **WSAD:** Change speed / heading
  * **Q:** Switch primary weapons
  * **E:** Switch secondary weapons
  * **R:** Switch radar modes
  * **C:** Switch camera angles (Follow, Above, Bird's-Eye, Bridge)
  * **H:** Show/hide HUD  (Might be useful on machines without 3D acceleration.)
  * **N:** Give yourself a Nuke  (Cheat mode for testing only. Has no icon. Like a homing missile but faster, more agile, instakills, infinite ammo.)

### Ship Types

  * **Frigate (e.g. Type 23):** This is the player's ship, although you will encounter this ship many times as both ally and enemy.  It is fast and normally quite weak, and can carry a wide range of weapons.  Yours has specially reinforced armour, so it has much more health than normal.
  * **Marine Landing Craft:** These tiny vessels are very fast, and sneak in close to their targets.  Their machine-gun is weak, but left unchecked they can do considerable damage.  They are easy to destroy.
  * **MCMV (e.g. Sandown class):** The Mine Countermeasure Vessel is frequently found accompanying larger fleets.  It is weak and poorly-armed.
  * **Destroyer (e.g. Daring class):** These large vessels are tougher than frigates, and have multiple weapon mounting points.  They usually have a combination of guns, torpedoes and anti-air weapons.
  * **Aircraft Carrier (e.g. Invincible Class):** Aircraft carriers are huge, heavily armoured and largely unarmed.  Their strength lies in their ability to launch aircraft.  A mixture of anti-air and anti-surface weapons is advised for taking out a carrier.
  * **Landing Platform Dock (e.g. Albion class):** Much like the carrier, the LPD's strength lies in the smaller vessels that it can launch - in this case, landing craft.  It is also more heavily armed and armoured than a carrier.
  * **Battleship (e.g. HMS Vanguard):** Relics of a bygone age, these vast ships were designed to take on other battleships on the high seas.  They are slow and unmanouverable, but have lots of armour and have lots of weapon mounting points.  (These are boss-type enemies!)
  * **Supply Ship:** Supply ships are weak and unarmoured, and usually drop interesting pick-up items.  Be warned, though, they usually come with a powerful escort!
  * **Submarine: (e.g. Astute Class)** Submarines lurk below the surface, attacking with torpedoes, anti-ship and anti-air missiles.  Specific weapons are required to take out submarines, but they are lightly-armoured.
  * **Helicopter (e.g. Lynx):** The helicopter, a slow but manouverable aircraft, is generally used to drop depth charges.
  * **VTOL Aircraft (e.g. Harrier):** The VTOL (Vertical Take-Off and Landing) aircraft is fast and manouverable, and can launch anti-ship missiles, anti-air missiles and torpedoes.  However, it has very limited ammunition.
  * **Standard Aircraft (e.g. F35):** These aircraft can only be launched from carriers.  In addition to a limited supply of missiles, they also have a minigun.  They are extremely fast, but not very maneuverabe.

### Weapons

  * **Vickers 4.5-inch Mark 8:** The standard frigate deck gun, this weapon fires quickly and does a fair amount of damage.
  * **Vickers .303 Machinegun:** This tiny weapon does little damage and has a very limited range.  It fires very quickly, but is extremely inaccurate.  It can hit aerial targets as well as surface ones.
  * **Twin QF 5.25-inch Mark 1:** This is essentially the same as the 4.5-inch gun, except that there are two barrels per mounting point.
  * **Twin BL 15-inch Mark 1:** One of the highest-caliber naval guns ever put into service by the Royal Navy, this weapon fires slowly but over a long range, and the projectiles are extremely damaging.  Not much survives a hit with two 15-inch rounds.
  * **Naval Laser Prototype NDEW-1:** This experimental direct-energy weapon fires rapidly, has a long range, and deals a lot of damage.  However, over-use of this weapon will cause it to explode and damage your ship!
  * **RGM-84 Harpoon Missile Launcher:** This weapon, standard equipment for frigates, fires anti-ship missiles.  They are slow, but turn in mid-flight to hit the nearest enemy ship.  They deal extreme amounts of damage.  This weapon has limited ammunition.
  * **Tomahawk Missile Launcher:** This weapon fires bigger and better missiles.  They are faster, more manouverable, and cause more damage than their standard variant, but with even more limited ammunition.
  * **Sea Wolf Missile Launcher:** This is the anti-air equivalent of the standard anti-ship missile launcher.  Its missiles move and home faster, to keep up with flying targets.
  * **Naval Railgun EMG Mod 0:** Though not particularly damaging and with an average fire rate, this weapon's strength is that it hits almost instantly, so there is no need to lead the target.
  * **Standard Torpedoes:** Torpedoes are slow and damaging, much like anti-ship missiles, except that they do not home on a target.  Their strength is that they can hit submerged targets such as submarines as well as surface ships.
  * **Sting Ray Homing Torpedoes:** Homing torpedoes sacrifice some of their warhead space for their homing mechanism, and thus deal less damage.
  * **Depth Charges:** These weapons are dropped near your ship rather than fired, and they do not move.  They only hit submerged targets - however, any submarine that gets lured onto the depth charge is instantly destroyed.
  * **DS 30B 30mm Anti-Air Gun:** This is the standard anti-air weapon.  Much like the 4.5-inch gun, it fires quickly and deals moderate damage.
  * **Flak Cannon:** This weapon deals extreme damage to airborne enemies.  However, its rate of fire is very low.
  * **Phalanx CIWS:** Not strictly a weapon, the Phalanx will not shoot at enemies.  Rather, it is an automated turret that will shoot down any enemy missiles within a certain radius of your ship.  It only lasts a limited time.
  * **Shield Generator:** An experimental device, the shield generator creates an electromagnetic force-field around your ship.  It deflects all incoming projectiles, but it only lasts for a very limited time.

### Other In-Game Items

  * **Health Crate:** Sometimes enemy ships will drop health crates when they're destroyed.  Steer your ship over these crates (marked with a red H) to restore some of your health.
  * **Weapon Crate:** Enemy ships with interesting weapons may sometimes leave their weapon behind in a crate.  (Supply ships drop random weapon crates.)  Steer your ship over them to pick up the weapon, and add it as an option in either your primary or secondary slot.
