# Spelunky Inventory and Radar Hack

This is a hack for Spelunky that I've been building for my Abstractions
Distraction, 'Video Game Hacking - Memory Introspection for Fun'.

## Motivation
I built this hack purely as an educational resource to introduce people to Cheat Engine and how to
get into hacking games. I believe that the balance of spelunky is

## Version
This project is built aroung the GoG version of Spelunky. I haven't
tested it with the Steam version so I'm sorry if it doesn't work for
you there. Given that this tool makes the game easier and it doesn't
disable network connections to the high score charts, I have no intention of porting it.

## EXE
In order to run the `SpelunkyInventoryCheat` executable in `bin/`, start
it up after you've chosen a character and are in the lobby. It will open
two windows - a radar and an inventory book. You can use the book to
give yourself any inventory items in the game, as well as adjust your
life, bombs, and ropes.

## Radar
The radar will show you the current positions of all enemies on the map
(minus ones that have yet to spawn from pots or in-game triggers),
including yourself and damsels. The colors are as follows:

* white - the player
* green - damsel
* red - enemy
* grey - dead body

The radar currently does not distinguish between hired hands or other
characters, but in the big picture aren't they more enemy than ally?

Unfortuantely, the radar does not work properly with levels that are not
standard size (like the lobby and worm). If you're able to find the
appropriate memory flag that determines when you're on one of these
special levels please let me know and I'll work on updating it!

## Cheat Table
In addition to the executable, if you have [Cheat Engine](http://www.cheatengine.org/)
then you can load the cheat table `Spelunky.CT` manually. In addition to
all of the inventory positions there are many other experimental entries
that I haven't created an interface for yet. Please play around with
them and have fun exploring!

*note*: while there are inventory flags for wearable items like the
jetpack and cape, these are only flags in the players inventory and will
not create the actual items until you enter a new level.

## Patches
The cheat table also contains a few scripts that you can patch into the
game to change the way it plays. For the 'spawn item on bomb' patch, after
you enable it you must set the `spawnItem` flag to 1 and then enter an
item ID into the `itemId` value. See `notes/item-ids` for a list of ID
that I've discovered so far. Then, whenever you use use a bomb you will
instead create the corresponding item.

I'll let you figure out what the rest of the patches do by their names.

### Related Resources
* [lightning talk slides](https://github.com/jackiekircher/video-game-hacking-at-abstractions)
* [x85 assembly reference slides](https://github.com/jackiekircher/video-game-hacking-at-abstractions)
