---
title: Creating a Dockable Panel
layout: home
parent: Tutorials
has_children: true
nav_order: 1
---

# Creating a Dockable Panel

DMHub's main game screen consists of two **docks** on the left and right side of the screen which **panels** can be docked with, and a game area in the center.

![A typical view of a DMHub game with an empty map area in the center](https://cdn.discordapp.com/attachments/735956151547592804/995881311342432336/unknown.png)

A Dockable Panel is a panel which can be added to the docks and remain permanently on screen during gameplay. Mods can easily add new dockable panels that users can add to their in-game UI.

## Registering a Panel

A dockable panel can be registered with DMHub by using the DockablePanel.Register function. A "Hello world" dockable panel looks like this:

```
DockablePanel.Register{
	name = "Hello",
	content = function()
		return gui.Label{
			text = "Hello, World.",
			halign = "center",
			valign = "center",
			width = "auto",
			height = "auto",
		}
	end,
}
```

This produces a basic panel like this:

![A hello world panel](https://cdn.discordapp.com/attachments/735956151547592804/995897817128255589/unknown.png)

The DockablePanel.Register function accepts a number of additional optional parameters:

 - `dmonly` (boolean): if true, only the DM can access this panel.
 - `icon` (string): the icon to show in the menu for the panel. This will normally be given in the form `mod.images.iconid` where `iconid` is the name you gave the icon in your mod's Images tab within the compendium.
 - `minWidth` / `maxWidth` (number): the minimum and maximum width of your panel. If these values are the same, your panel will be a fixed size.
 - `vscroll` (boolean): if true, your panel will automatically have a vertical scrollbar added to it if its contents exceed the available space.

{: .important }
> Note that while a dockable panel may have a varying height, it will always have the same width. DMHub has a fixed width for dockable panels to make it easier to design attractive interfaces with a fixed width in mind.

The main effort in writing a dockable panel is in writing the `content()` function, which must return a DMHub user interface element (that itself may contain more sub-elements). See [[Lua Gui]] for documentation on how to create user interface elements.