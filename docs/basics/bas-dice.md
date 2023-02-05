---
title: Dice Rolling
layout: home
parent: Basics
nav_order: 1
---

# Dice Rolling

There are plenty of places in DMHub which invite you to enter a dice rolling formula. For instance, in the chat you can type `/roll 1d6` to roll a six-sided die. When specifying the damage of a weapon, you can provide a dice roll formula.

Basic dice rolling follows a format familiar to tabletop role playing games:

`1d6`, `3d6+1`, `1d20`, `1d20+1d4+1` are all valid rolls.

## Abbreviating Rolls

Generally if you only type part of a word, DMHub will guess what you mean. So if you type

`1d20 adv`, DMHub will guess you mean `1d20 advantage`.


## Keep & Drop

Sometimes you want to roll dice and only count some of the dice, the highest or the lowest. These examples work:

`2d20 keep 1` rolls 2d20 and only counts the highest one.
`4d6 keep 3` rolls 4d6 and only counts the highest 3.
`4d6 drop 1` rolls 4d6 and drops the lowest 1. This is the same as `4d6 keep 3`.
`4d6 keep low 3` rolls 4d6 and only counts the lowest 3.
`4d6 drop low 1` rolls 4d6 and drops the lowest 1, keeping the highest 3. This is the same as `4d6 keep 3`.

You can abbreviate a little further:

`2d20k1` is the same as `2d20 keep 1`.
`2d20kl1` is the same as `2d20 keep low 1`.

## Advantage & Disadvantage

Advantage and Disadvantage are designed to be used specifically with d20 games that have advantage and disadvantage to characters when rolling d20's.

`1d20 advantage` is equivalent to `2d20 keep 1`.
`1d20 disadvantage` is equivalent to `2d20 drop 1`.

`advantage` and `disadvantage` are specifically designed so you can enter them into a roll modifier to correctly modify a d20 roll for d20 systems.

For instance, suppose you had a character who was going to roll a dexterity saving throw, but they have a Bless applied to them. Bless is a feature offering them advantage on dexterity saving throws, so what would happen?

Their basic dice roll would look perhaps like this:

```
1d20 + 4
```

Bless adds this:

```
1d4
```

And their feature offering them advantage adds this:

```
advantage
```

DMHub will combine the modifiers to give a roll like this:

```
1d20 + 4 + 1d4 advantage
```

`advantage` applies specifically to d20 rolls, so this will be equivalent to:

```
2d20k1 + 4 + 1d4
```

{: .important }
> Note that the d4 part of the roll is not modified by the advantage. Having both `advantage` and `disadvantage` cancel each other out.
> Having multiple instances of `advantage` or `disadvantage` do not stack.

## Advdice

Normally having advantage means that you roll 2 dice and choose the highest. You can use `advdice` to change the number of dice rolled:

```
1d20 advantage advdice 3
```

This will roll 3 dice and choose the highest result. Using `advdice` when you don't have advantage has no effect. So, if a creature rolls 3 dice whenever they roll with advantage, you would put `advdice 3` on all their rolls.

## Exploding

You can add the `exploding` modifier to a dice roll to make it so whenever a die lands on its top-most face, an additional die of that type is rolled and added to the result.

## Critical Hits

Normally on an attack roll, DMHub considers a natural 20 on the d20 a critical hit. The keyword `critical` can control how high the roll needs to be to be considered a critical hit.

```
1d20 + 4 critical 18
```

This will roll `1d20+4`, but if 18, 19, or 20 are shown on the d20, it will be considered a critical hit.

Note that if a critical hit is rolled, it is automatically considered a hit, even if the roll is beneath the target's armor class.

The keyword `autocrit` *(added in 0.0.318)* makes any hit a critical hit, but does not change a miss into a hit.

```
1d20 + 4 autocrit
```

This roll will be a critical hit if it is above the target's armor class. Otherwise, the attack will miss like normal.

## Rerolling

You can specify `reroll` to re-roll dice that are equal to or lower than the given number. For instance:

```
1d20 reroll 1
```

This rolls a d20, and rerolls if 1 is shown on the dice. 

```
3d6 reroll 2
```

This rolls 3d6, and rerolls any dice if 1 or 2 are shown.

{: .important }
> Using reroll only rerolls dice once.

## Minroll

Sometimes a dice roll has a minimum value for the roll. For instance, the Rogue's **Reliable Talent** feature turns any d20 roll on a skill check of 9 or less into a 10. You can achieve this with `minroll`:

```
1d20 minroll 10
```

Note that the modification only applies to the raw dice numbers. Here's another example: 

```
1d20 + 4 minroll 10
```

This will make the d20 have a minimum of 10, meaning that after our added bonus of 4, the roll is guaranteed to be at least 14. Think of `minroll` as working very similar to `reroll`, except that instead of rerolling, the roll will always have a minimum result of the value we use with `minroll`.

## D20s are Special

D20s are given special treatment by some modifiers in DMHub. For instance, modifiers like `reroll` and `minroll` will check to see if any of the dice in your roll were d20s. If it finds one, DMHub will assume these modifiers automatically think that is the die they apply to.

This keeps things working as they should. For instance, if you have a Halfling (with **Halfling Luck** allowing them to reroll 1s) who is also under the effects of Bless (allowing them to roll an additional 1d4), you might end up with a roll like this:

```
1d20 + 1d4 reroll 1
```

DMHub will makes sure it's the d20 that gets the reroll. Meanwhile, a roll of 1 on the d4 will stick.

## Autosuccess and autofailure
*Added in 0.0.237*

Many types of rolls have clear "success" and "failure" outcomes. Sometimes an ability might cause you to automatically succeed or fail at a roll. Adding the keywords `autosuccess` or `autofailure` cause these types of rolls to automatically succeed or fail. The dice will not roll and the appropriate result will be shown instead.

## Extra Dice

The `extradie` keyword (`extradice` also works) adds an extra die to the dice with the most faces in the roll. This is useful for abilities that let you roll an extra die of any type used in a damage roll.

For instance:

```
2d8 + 1d4 extradie
```

Is equivalent to:

```
3d8 + 1d4
```

## Categories (Damage Types)

A single dice roll can provide multiple results in different categories. An example of this is if you had a magical long sword that did an extra 1d6 fire damage whenever it hit. Rather than having two damage rolls, you can use one roll like this:

```
1d8 + 4 [slashing] 1d6 [fire]
```

This will do 1d8 + 4 slashing damage, as well as 1d6 fire damage.

## Changing Damage Types

*Added in 0.0.241*

A damage type can be modified using this syntax:

```
1d8 + 4 [slashing] [slashing->piercing]
```

This will change the slashing damage normally associated with this attack into piercing damage. So it is equivalent to:

```
1d8 + 4 [piercing]
```

The type change can appear anywhere in the roll. This is useful for allowing effects to add to a roll and change the damage types.

## Modifying Rolls

Some places in DMHub allow you to modify rolls. For instance, a Barbarian's **Rage** ability might add 2 damage to your attack damage. Anywhere you can modify a roll simply assumes you are going to add to the end of the roll.

The dice roll that ends up being used might have been modified several times, with each modifier appending to the end of the roll. To allow flexible modifications, DMHub's dice rolling syntax is designed with that in mind and allows combinations of commands, applying sensible rules.

For example, let's say you were rolling an attack with a `1d20+4` roll, but a modifier (perhaps the effects of the **True Strike** spell) gave you advantage. At the same time, you happened to be using a ranged weapon while an enemy was next to you, so you also had disadvantage at the same time. In this scenario, your roll might end up looking like this:

`1d20+4 advantage disadvantage`

DMHub would understand this, and apply the rules of having both advantage and disadvantage on your roll (which gives neither advantage or disadvantage).

## Altering Rolls

*Added in 0.0.214*

Sometimes you want to modify a roll, but don't simply want to add some more dice or a modifier or a qualifier like `advantage`. Instead, you want to actually alter the roll entirely. For instance, DMHub handles critical hits by having a global rule that applies a modifier to all damage rolls that are critical hits. The default critical hit behavior is to double the dice used in the roll. To do this, we need the modifier to actually alter the roll, so for example, a 2d6 becomes a 4d6.

The way we achieve this is by using `alter`. This is best explained with some examples:

| Old Result        | Using `alter`          | New Result          |
|:-------------|:------------------|:------------------|
|`2d6 + 4 alter "(count*2) d faces + modifier"` | is equivalent to | `4d6 + 4`|
|`1d4 + 3d8 + 5 alter "(count+1) d faces + modifier"` | is equivalent to | `2d4 + 4d8 + 5`|
|`3d6 + 2d4 + 2 alter "(count + (1 when index = 1)) d faces + modifier"` | is equivalent to | `4d6 + 2d4 + 2`|
|`1d8 + 2 alter "count d 4 + modifier"` | is equivalent to | `1d4 + 2`|

The text in the quotes accepts some special [Goblin Script] which recognizes `count` (the number of dice), `faces` (the number of faces on the dice) and `modifier` (the constant number added), as well as `index` (which set of dice within the roll we are referring to). The Goblin Script is run for each type of dice in the roll, and replaces the dice sets.

By using `alter`, we can make powerful alterations to dice rolls that aren't possible by any other means.