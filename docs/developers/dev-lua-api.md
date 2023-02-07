---
title: Lua API
layout: home
parent: Development
nav_order: 2
---

# Lua API

DMHub's Lua API is a collection of interfaces that DMHub makes available to Lua mods.

## dmhub Interface

### EvalGoblinScriptDeterministic
`dmhub.EvalGoblinScriptDeterministic((string) script, (table) symbols, (number) default, (string) description)`

This runs the GoblinScript given as the script parameter. The GoblinScript is expected to be deterministic, meaning no dice rolls.

- **script**: The GoblinScript to execute
- **symbols**: The subject of the GoblinScript along with any additional fields.
- **default**: The value that will be returned if the GoblinScript has an error or cannot be executed.
- **description**: A description of the GoblinScript being run, used for debugging purposes.
- **return value**: This function returns a number, which is the result of running the script. 

Examples:

- `dmhub.EvalGoblinScriptDeterministic("Wisdom Modifier + 2 * upcast", GenerateSymbols(castingCreature, { upcast = 4 }), 0, "Calculate healing for sample spell")`

### EvalGoblinScript
`dmhub.EvalGoblinScript((string) script, (table) symbols)`

This runs the GoblinScript given as the script parameter. The GoblinScript may include dice rolls. It will evaluate the parts that it recognizes resulting in a simple number or a dice roll.

- **script**: The GoblinScript to execute
- **symbols**: The subject of the GoblinScript along with any additional fields.
- **return value**: This function returns a string, which is all of the parts of the script input that could be recognized as GoblinScript evaluated. Parts of the string that are not GoblinScript are left untouched.

Examples:

- `dmhub.EvalGoblinScript("4d6 + Upcast d6", GenerateSymbols(castingCreature, { upcast = 4 })` would result in `"4d6 + 1d6"`. You could call `dmhub.NormalizeRoll` on the output to reduce it down to `"5d6"`

{: .note }
> Dice rolling syntax such as `1d20 + 4 advantage` is **not** part of 
> GoblinScript. It is a separate dice rolling language. Dice rolls can be 
> executed with functions like `dmhub.Roll` and `dmhub.RollInstant`.