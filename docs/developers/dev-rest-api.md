---
title: REST API
layout: home
parent: Development
nav_order: 6
---

# REST API

DMHub's REST API allows you to query a DMHub game for some information about the game. It could be used to develop a web site which displays character sheets for characters in a game, or a Discord bot which can bridge between Discord and DMHub.

## Security

A bot can access a DMHub game's information if it has the invitation code to the game (also known as the "gameid"). An important TODO item is to make it so a bot has to be authorized by the game's DM before it can access the game.

## Querying Characters in a Game

The most basic query is to get a list of characters in a game and basic information about them. We just need to provide the gameid of the game:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf``

The `pretty` parameter can be used to give formatted results to make it easier for a human to understand:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&pretty=true``

With a character's ID, you can get detailed information about the character. To do this, set a `type` parameter to `character`, then the `id` equal to the character's key:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=character&id=8db03e11-1cf9-4cf6-bd16-72adbcf816b7&pretty=true``

Note that a character's data will include a lot of references to other objects, in the form of ID's. You can query these objects. For instance, consider the classes section:

```
  "classes": [
    {
      "classid": "a95d3b62-1ee8-46cb-bcb4-f5716cf47116",
      "level": 1
    }
  ],
```

You can query information about the class by setting `type` to `class` and then using the classid you see here as the id:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=class&id=a95d3b62-1ee8-46cb-bcb4-f5716cf47116&pretty=true``

Likewise, you can query information about the type of currency a character is holding:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=currency&id=abddfb45-e61f-4bfd-aee7-a07cba596aa9&pretty=true``

## Data Tables

You can find the available types of data using this query: ``https://us-central1-dmtool-cad62.cloudfunctions.net/query?type=objects&pretty=true``

You can query all available objects of a given type easily. For instance, you can get all currencies in DMHub like this:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?type=currency&pretty=true``

You don't have to specify a game id when querying objects like this, however if you do specify a game id the result set will include custom/homebrew objects in that game. For instance, to query currencies including custom currencies added in a game:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=currency&pretty=true``

You can do a similar query for any type of object. For instance,

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?type=class&pretty=true``
``https://us-central1-dmtool-cad62.cloudfunctions.net/query?type=race&pretty=true``
``https://us-central1-dmtool-cad62.cloudfunctions.net/query?type=item&pretty=true``


## Calculating a Character's Information

It is important to understand how DMHub treats and handles character data if one wants to display it to a user properly. In the character data, we see some attributes like this:

```
  "baseAttributes": {
    "cha": 16,
    "con": 14,
    "dex": 14,
    "int": 16,
    "str": 6,
    "wis": 11
  },
```

It is tempting to see these familiar looking attributes and want to render them directly to the user. However, these are the **base** attributes -- usually chosen from rolls, points buy, or a standard array when first creating the character. They do not include any bonuses from a character's race, class advancement, items carried, or any other source.

The final numbers for attribute scores like these are calculated by the DMHub client to display to users, and the final numbers are not stored in the database. It is a TODO to incorporate logic in the API to allow "rendering" of final values that a user might see as the correct stats of their character.

It is possible, though, to calculate the correct stats from the data the API makes available. Races, backgrounds, and classes all have lists of **character features** they apply and these character features detail the benefits they bestow upon the character. The DMHub client calculates all the features that should apply to a character and applies them, and a client of this API could do the same thing. For classes, naturally only the features that the character has attained a high enough level for should be used.

## Choices

Sometimes a character feature entails a choice of several possible sub-features to use. e.g. from ``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=race&id=25d73c11-9d8e-4bea-a63e-07589f6e9f48&pretty=true`` there is this section:

```      {
        "allowDuplicateChoices": true,
        "description": "Choose one attribute",
        "guid": "b1140855-d162-48b4-aaf8-e20b598196ba",
        "name": "Ability Score Increase +2",
        "numChoices": 1,
        "options": [
          {
            "canHavePrerequisites": true,
            "description": "",
            "guid": "66863881-4849-4081-8bae-70571552272e",
            "modifiers": [
              {
                "attribute": "str",
                "behavior": "attribute",
                "description": "",
                "guid": "3b5293d7-e3fd-4119-9a5f-7ddc19ad66e5",
                "name": "Strength",
                "source": "Half-Elf Race Feature",
                "sourceguid": "a925eadb-c1fa-4ff7-ae50-d7733c7e9ac0",
                "value": 2
              }
            ],
            "name": "Strength",
            "source": "Fairy Race Feature"
          },
          {
            "canHavePrerequisites": true,
            "description": "",
            "guid": "d621cd10-4475-496e-aa2e-6b6033651318",
            "modifiers": [
              {
                "attribute": "dex",
                "behavior": "attribute",
                "description": "",
                "guid": "7716614b-4243-4ecf-afa4-90eb86c6a1c6",
                "name": "Dexterity",
                "source": "Half-Elf Race Feature",
                "sourceguid": "1749cfb0-db19-4706-b0b6-9125cbd4cb22",
                "value": 2
              }
            ],
            "name": "Dexterity",
            "source": "Fairy Race Feature"
          },
          ...snipped for brevity...
        ],
        "prefab": "6a4000ec-415d-42e6-8e6a-0ff3c8147fe7",
        "source": "Fairy Race Feature"
      },
```

Note that this choice has an id ("guid"), and each option within it has an id ("guid"). When we encounter a choice like this in a character's feature selection, we can refer back to the character data (e.g. ``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&type=character&id=8db03e11-1cf9-4cf6-bd16-72adbcf816b7&pretty=true`` ) and look at the `levelChoices` field:

```
"levelChoices": {
    "42202b03-c6cf-4c50-af7d-c546c79f4084": [
      "687ac8b3-7240-4038-aadd-d514e13d343c"
    ],
    "8808914f-59ad-4458-9b12-1e6508d67e3b": [
      "e4bdef7a-45f5-4b96-bc5e-a5c59f54d65f"
    ],
    "8a329cfc-f80c-48bf-94f6-46ffadd414e2": [
      "14ad1c76-b5e7-4c86-89f7-e26b051514c8"
    ],
    "b1140855-d162-48b4-aaf8-e20b598196ba": [
      "2b8f0196-749a-4e7c-bea7-3ef9e1d9e6a3"
    ],
    "cc4ef59f-90c4-4258-98a5-32fc47e05694": [
      "230179cf-52a4-4f0d-9ceb-7eaadba6dc3a",
      "a34eff7e-aa9d-4605-bd8f-e4447aeb8573",
      "9ec7177f-aea3-4426-a200-a6fabcfe605c"
    ],
    "duplicate-skills-choice": [
      "insight"
    ]
  },
```

We will see here that when confronted with the attribute choice from the race (id = `b1140855-d162-48b4-aaf8-e20b598196ba`) the player chose the choice with id = `2b8f0196-749a-4e7c-bea7-3ef9e1d9e6a3` so that is what we should use.

## Images

Images or icons are referenced at various places for portraits of characters, images of icons, and so forth. An image can be looked up using a url like this:

``https://us-central1-dmtool-cad62.cloudfunctions.net/query?gameid=LittleEpicTemperamentalElf&pretty=false&type=image&id=43ce7308-9074-4d5b-a1e7-d52812839351``

This will provide a url that can be used to get the actual image data (png or jpeg).