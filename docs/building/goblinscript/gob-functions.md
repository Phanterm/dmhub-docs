---
title: Functions
layout: home
parent: Goblin Script
grand_parent: Building in DMHub
nav_order: 2
---

# Functions

Goblin Script provides some functions for things that cannot be done with familiar operators:

- Max and Min. These find maximum and minimums of values. For instance, it is quite common in 5e rules for e.g. a Paladin to have "A number of charges equal to their Charisma modifier, with a minimum of 1".

We could express this in Goblin Script:

`max(1, Charisma Modifier)`

You can provide any number of values and Goblin Script will provide the maximum of all of them. For instance, if you wanted to know how fast a creature could move using its fastest movement type, you could use,

`max(Walk Speed, Fly Speed, Swim Speed, Burrow Speed, Climb Speed)`

- Friends. This discovers if two creatures are friends of each other. For instance, if you wanted to see if a creature casting a spell is friends of the creature it is targeting,

`Friends(Self, Target)`

Note the use of the Self field to get the subject of the Goblin Script. Note how this function requires you to provide it with creatures and not simply numeric values like most operations tend to.

- LineOfSight. This discovers if one creature is considered to have line of sight to another creature. This is also intended to convey the concept of "cover".

`LineOfSight(Self, Target)`

The result of this function is 1, 0.5, 0.25, or 0 depending on if there is no cover, half cover, three quarters cover, or full cover.