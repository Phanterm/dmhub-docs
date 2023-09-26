---
title: Saving & Loading Data
layout: home
parent: Development
nav_order: 3
published: false
---

#### dmhub.GetModLoading()

{% apileaf gui.Tooltip
| (string text) 
| A tooltip panel, typically called with the<code>hover</code> or <code>linger</code> functions.
| linger = gui.Tooltip("A summary of this quest that your players will see.")
| (from QuestTracker.lua) 
%}

{% apileaf tr
| (string text)
| Populates the property associated with this string in the Translations menu in the Compendium, allowing translation into multiple languages. 
| linger = gui.Tooltip = tr("A summary of this quest that your players will see.")
| (from QuestTracker.lua) 
%}

