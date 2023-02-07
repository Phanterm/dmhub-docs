---
title: FAQ
layout: home
parent: Resources
nav_order: 1
search_exclude: true
---

# Frequently Asked Questions

## 1. What is DMHub?

DMHub is a desktop app which includes a 2D map editor and virtual tabletop all in one. With DMHub, you can create a map, and then immediately play on that map.

DMHub includes character building and character sheets, will calculate combat rolls and spells and abilities for you.

DMHub is still a work in progress, but we have a lot done already. It is created by a group of friends who love playing D&D and have been using it to play throughout the pandemic. We are focusing on building it for ourselves, and we think it's a blast to play with. We are now offering it to others in the hope you might enjoy it too.

## 2. How do I try it out?

DMHub is in beta right now. You can download it from https://dmhubapp.com/ . It's available for PC and Mac.

## 3. Can I invite my friends to the Discord?

Yes! You might want to so you can play with them using DMHub. DMHub is openly available so please tell anyone who you want to all about it.

## 4. Do we need a server to play together?

No. DMHub stores your games in the cloud. You can create a game using DMHub, which will have an invite code attached to it. Give this invite code to your friends and they can join. No servers needed.

## 5. Do I have to pay for this?

No! However, we do have a [Patreon] and would love your support. ❤️

You get several benefits for supporting us as well!

We always intend for DMHub to support robust free options. We want everyone who would enjoy it to be able to have access to it, regardless of ability or willingness to pay.

## 6. What kind of limits are there on using DMHub?

The limits we place on DMHub are generally due to costs or restraints we ourselves have.

Firstly, DMHub is an open platform, like Google Docs or YouTube. You can upload what you want to it! Please make sure you only upload things you have the right to do so. We want to respect the wishes of publishers of table top RPG's in particular, and hope to have a great relationship with them. Most publishers have a fan content policy so you can refer to it to see what you can do with their content.

It does cost us some money to store things in the cloud, so we do have some limits on how much you can upload. We don't put any limits on your core game data, like characters, spells, and so forth, but we do limit media files -- images, audio, and video. You can upload up to 200MB per month, with a maximum file size of 10MB. By supporting us on Patreon though, these limits are greatly increased!

## 7. Do you have a tutorial?

There is an in-app tutorial for basic functionality and you should check out our [YouTube] channel -- lots of things still aren't covered so well though, so feel free to ask questions!

## 8. Have you thought about doing X?

Maybe! But tell us anyway over in **#feature-suggestions** on our [Discord].

Even if you've seen it mentioned before, the more people that voice need for a feature, the more we will take note! 


## 9. DMHub runs slowly on my computer.

There are some things you can do about this! By default DMHub runs on the absolute maximum graphics settings and you can turn them down. Go to Settings -> Graphics and try turning some of the options off.

Start by turning off MSAA and High Definition, and turn off Camera Filters and HDR Rendering if things are still slow.

If DMHub uses too much RAM for your computer, try turning off High Definition Textures and restart the app.

You can get a big performance increase by using these settings. If it's still too slow, please tell us about the performance you're getting. We are looking to improve the performance and would like to hear about your experiences. 

## 10. What are the recommended specs for DMHub?

DMHub is an in-development app which we are still optimizing. We recommend that you have at least 8GB of memory on your computer, and if you have an integrated GPU, we recommend that you use the graphics settings to turn off the high-end graphics features (see question 9). 

## 11. What is the most helpful way to report bugs in DMHub?

It is often very helpful to us when users report bugs they come across when using DMHub. Generally bugs are best reported in bug-reports by creating a new thread in which you place all the information about the bug you encountered.

When reporting a bug, generally we are hoping to get enough information to fix the bug. The absolute best thing we can get when you report a bug is a set of reproduction steps that could allow anyone to make the bug happen on their computer.

If you want to be especially helpful, please try to find a set of minimal steps required to create the bug.

Oftentimes a bug occurs in your game, but you may be unsure if it would easily occur in a brand new game. In this case, to solve the bug we will want to look at your game. Please provide the invite code to your game and specify where in your game (map name, location in the map, etc). Understand that a DMHub developer will enter your game in order to reproduce the problem. You can message me the invite code privately if you prefer that. As an alternative to us coming into your game, you can share the parts of your game causing the problem in a private module ( Tools -> Publish a module... ). This is a good way to do it if you want to continue with your game and destroy the elements causing the bug.

If a bug seems specific to your machine, and we may not be able to reproduce it, the next best thing to reproduction steps is providing the log file. Generally the log file is entirely unnecessary if you provide reproduction steps, but if it can't necessarily be reproduced elsewhere, make the bug occur on your machine, and then send the log file, before you have exited DMHub and right after the bug has occurred. DMHub's log file is located here:

`C:\Users\<your username>\AppData\LocalLow\Sodapods\DMHub\Player.txt`

The DMHub updater has its own log files, found in

`C:\Users\<your username>\AppData\Local\SusSyntax\DMHub\stable\Logs`

On Mac the log files are located under the Library folders:

DMHub log file: `Library/Logs/Sodapods/DMHub/Player.log`

Launcher log file: `Library/Logs/SusSyntax/DMHub/stable/Logs `

## 12. Are there a list of keyboard shortcuts?

Yes. Check out [Keyboard Shortcuts].

## 13. What is DMHub's long-term plan for monetization?

The long term plan is for us to earn money from a few sources:

1. While DMHub will always be free, users will be able to pay a subscription to gain some additional benefits. In fact, they can already do this by supporting us on Patreon. These benefits will focus on expanding limits like bandwidth quotas that we put on accounts to control our costs, on giving prestige benefits like Discord roles, and some cosmetics. We won't paywall features important for playing an RPG.
1. We hope to have an in-app marketplace where content creators can sell their content and we collect a share of proceeds.

Overall our philosophy behind monetization is that we do hope to eventually make enough money to be able to pay our core team, but we only want to do so if it can be achieved in a user-friendly way. We also want to foster an environment where everyone feels like they are welcome in the DMHub community and that DMHub is never a "product that stops being fun if you don't pay".

## 14. What is DMHub's tech stack?

The tech stack is Unity/C# with Lua on top (looking at migrating to Luau). When I say this, I don't mean that Lua is just a tip of an iceberg where a little modding is done; a lot of the code is written in Lua -- the entire UI, most of the rules systems, etc. I would say these days I do about 80% of coding of DMHub in Lua.  Low-level performant stuff like the vision & lighting system, pathfinding, map rendering, map editing primitives, etc are done in C#.

The backend uses Google Cloud/Firebase with a mostly "serverless" approach.

## 15. Is DMHub Open Source?

The Lua code is Open Source (MIT License). The C# core is not currently Open Source.

## 16. I modified a spell in DMHub. If DMHub updates that spell in an update will it override my changes?

No, it won't.

We know that you might want to customize items in your game's compendium such as spells, inventory items, or classes, and that your changes might be very important to your game and wouldn't want them overwritten by DMHub's changes.

If you change a compendium item in your game, perhaps you modify Magic Missile to just use one die to deal damage, your game gets its own copy of Magic Missile. If we changed Magic Missile in an update -- perhaps by adding a new animation for it -- your game will ignore that change, and just use your own copy of Magic Missile that was made when you modified the spell.

You can always review which compendium items you have modified by going to Tools -> Compendium -> Manage Mods. Here you can revert any items that you have changed and go back to using DMHub's version of them.

[YouTube]: https://www.youtube.com/channel/UC4fkkbmy9Kj9UWJTnXowNVw
[Discord]: https://discord.com/invite/DP8EQ4vUhd 
[Patreon]: https://www.patreon.com/dmhub