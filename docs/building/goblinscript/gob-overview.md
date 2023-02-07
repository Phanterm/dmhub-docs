---
title: Overview
layout: home
parent: Goblin Script
grand_parent: Building in DMHub
nav_order: 1
---

# Overview

Certain fields within DMHub accept a **Goblin Script**. You can tell if a field is a Goblin Script field because it has a small goblin icon next to it.

![Goblin Scripts in action](https://cdn.discordapp.com/attachments/785947581331013632/995508827988434984/unknown.png)

Click on the goblin icon to find some information specific to that field.

A Goblin Script input may be given a very simple input. For instance, a simple number like the 1 for Target Count in the above picture. It is also common to have [[Dice Rolling]] in a Goblin Script, like the value for Damage. However, Goblin Scripts may also be more complex, calculating things like upcasting  rules and other criteria.

## What is a Goblin Script?

A Goblin Script is a simple formula. It is designed to be natural and readable. So you might enter something like `Proficiency Bonus + Dexterity Modifier + 3` and have it recognized, mirroring the kinds of formulas that many role playing source materials tend to use.

The purpose of a Goblin Script is always to **answer a question** that DMHub has when it is trying to automate a role play. The question might be "how many creatures can this spell target?" or "how much damage does this attack do?" or "can this creature be targeted by this spell?"

Note that Goblin Script cannot **do** anything. Its purpose is **only** to answer questions. DMHub may modify things as a result of Goblin Script's answer, but a Goblin Script formula is there just to answer questions and nothing else.

When DMHub uses a Goblin Script, the Goblin Script will always produce an answer, also known as a _result_. Different Goblin Scripts want different types of answers. Here are the three main types of answers that different Goblin Scripts want:

- A **true or false** answer. This is for cases where Goblin Script asks something like "is this creature affected by the spell?"
- A **dice roll**. This is for things like "how much damage does this attack do?"
- A **number**. This is for things like "how much armor class does this creature have?"

Note that any time a dice roll is wanted as an answer, it is okay for the Goblin Script to just answer with a simple number. However, if a number specifically is wanted, a dice roll won't be allowed. You cannot use a dice roll to calculate a creature's Proficiency Bonus, for instance. You should click on the goblin icon next to the Goblin Script to work out what kind of answer that Goblin Script should produce.

## Subjects and Fields

A Goblin Script always has a **subject**. Usually the subject is a creature. For instance, for Goblin Scripts used to calculate spells, the creature casting the spell is normally the subject of a Goblin Script. The subject of a Goblin Script is important, because you can use all of that subject's fields within that Goblin Script.

For instance, for an attack damage roll you might have the Goblin Script `2d6 + Strength Modifier`. The `Strength Modifier` part of this Goblin Script is accessing that field of the creature using the attack. You can click on the goblin icon to see what the subject of any Goblin Script is along with all the fields that subject has available.

Note that the way to think of fields is that when a Goblin Script is used, the field's name is simply replaced with the numeric value of that field. For instance, `2d6 + Strength Modifier` might have Strength Modifier replaced by 3, giving `2d6 + 3`.

Note that Goblin Script is not case sensitive and also ignores spaces in field names. You can use `Strength Modifier` or `Strength modifier` or `strength modifier` or `StrengthModifier`. Or even `StReNGtH MoDIfIer`. Please don't, though.

In addition to the fields provided by the subject of the spell, a Goblin Script may have access to *additional fields* depending on what kind of Goblin Script it is. Many Goblin Scripts involving spellcasting provide the **Upcast** field, for instance, which tells you how many levels higher than required the spell slot to cast the spell was. This would allow you to use a Goblin Script like `2d6 +  Upcast d6`. This would result in `2d6` if a 1st level spell slot was used, `3d6` if a 2nd level spell slot was used, 4d6 if a 3rd level spell slot was used, and so forth.

Some additional fields may be complete objects, not simply numbers. For instance, when calculating an attack you might have access to the **Target** of the attack as well as the actual **Attack** information. As an example, the 5e spell *Toll the Dead* from *Xanathar's Guide to Everything* does 1d8 damage if a creature is not missing any hitpoints, but 1d12 damage when it is. You could use this Goblin Script:

```
1d8 when Target.Hitpoints = Target.Maximum Hitpoints else 1d12
```

Once again, by clicking on the goblin icon you can see the additional fields available for that Goblin Script as well as which fields are available within those fields.

You can always use the **Self** field to access the subject of a Goblin Script. So, saying `Proficiency Bonus + Strength Modifier` is the same as `Self.Proficiency Bonus + Self.Strength Modifier`.

## Arithmetic and logic

Goblin Script allows for basic arithmetic and logic.

`+`, `-`, `*`, and `/` will perform basic arithmetic. Note that `*` is necessary to multiply, and `/` will **round down** when used. 

`<`, `>`, `<=`, `>=`, `=`, and `<>` are all used for comparing values and producing a true or false answer. `<>` means "not equal to", you can use `!=` or `~=` instead, which some programming languages use for "not equal to".

You can use **and** and **or** for basic logic. For instance, in a spell that can only target Undead or Fiends you might use this Goblin Script:

```
type = "Undead" or type = "Fiend"
```

This example also demonstrates how **text** rather than numeric fields are sometimes used in Goblin Script.

As demonstrated in the Toll the Dead example above, you can use **when** to make something occur under certain conditions. For instance, to make a Divine Smite do more damage to fiends and undead you might use,

```
2d8 + 1d8 when target.type = "Undead" or target.type = "Fiend"
```

A **when** operation is in the form `value when condition` and it produces a result of *value* when *condition* is true, and *zero* otherwise. So the above Goblin Script would boil down to,

```
2d8 + 1d8
```

OR

```
2d8 + 0
```

Depending on whether or not the target is an undead or fiend. If you don't want a when to result in a zero if the condition is false, you can use **else** to specify a different value. For instance, the above Goblin Script could be re-written like this:

```
3d8 when target.type = "Undead" or target.type = "Fiend" else 2d8
```

Note that yet another way to write it would be,

```
2d8 when target.type <> "Undead" and target.type <> "Fiend" else 3d8
```

Goblin Script also allows you to use **is** and **is not** to compare text. In this case you don't need the quotes around the value you are comparing to.

```
3d8 when target.type is Undead or target.type is Fiend else 2d8
```

You can use **not** to turn true to false and false to true. For instance, creatures have the Unarmored field. If you want to see if a creature is armored, you can use,

```
not Unarmored
```

## Sets and Has

Some fields are **sets** rather than being numbers or text. A set is much like a text field, but there can be multiple items in a set, not just one.

For instance, creatures have the **Conditions** field which is the set of all the conditions the creature currently has on it. You can use the **has** and **has not** operators to see if something is in a set. For instance,

```
Conditions has "Poisoned"
```

to see if a creature is poisoned.

## Order of Operations and Parentheses

In elementary school, we all had to puzzle over what `1+2x3` is. Is it 9 or is it 7? It's 7, because multiplication is done before addition.

Goblin Script has a lot more operations than the kind of arithmetic we did in elementary school, so there is an entire list of what goes before what. We try to make it *make sense* as much as possible, so don't worry about remembering the entire list or anything like that. You can use parentheses to group things, which is a great idea whenever you're not sure about the order of operations.

Formulas like this one, to express whether a Rogue's Sneak Attack ability activates can combine logic and parentheses and whatnot:

```(attack.finesse or attack.ranged) and (have advantage or (target.next to another enemy and not have disadvantage))```

For reference, the order of operations Goblin Script uses is as follows, from the lowest precedence to the highest precedence:

- `not`
- `+ -`
- `when else`
- `or`
- `and`
- `= <> <= >= < >`
- `* /`
- `is has`
- `.`

Note that `+` and `-` are **very low precedence** in Goblin Script, compared to most programming languages. Most languages make `or` and then `and` the lowest precedence operators, but Goblin Script's choice is very deliberate, as it allows formulas like this:

```
1d8 + 1d8 when level >= 7 + 1d8 when level >= 13 + 1d8 when level >= 17
```

To be written naturally without parentheses.
