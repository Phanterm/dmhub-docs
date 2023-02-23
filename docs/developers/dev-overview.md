---
title: Overview
layout: home
parent: Development
nav_order: 1
---

# Overview

The Lua Gui system is DMHub's system for developing user interface elements. The entire user interface of DMHub is built using this system.

DMHub's Guis are made up of **User Interface Elements** often just called **Elements**. Elements are organized in a hierarchy, nesting inside each other. When you want to add a user interface component to DMHub, such as [Dockable Panels] you will have to write a function that returns a User Interface Element, usually this parent element will have many other Elements nested inside it. Elements always occupy a rectangular area, though may be styled to appear non-rectangular to users.

*Note: Examples on this page will include only the code for creating user interface elements. For the surrounding code to register a user interface, see the [Dockable Panels] page to be able to use the examples for yourself.*

## Starting Example

```
return gui.Panel{
	bgimage = "panels/square.png",
	bgcolor = "green",
	width = "100%",
	height = "auto",
	flow = "vertical",

	gui.Label{
		text = "Label A",
		textAlignment = "center",
		bgimage = "panels/square.png",
		bgcolor = "blue",
		width = "80%",
		height = 100,
		halign = "center",
		color = "white",
		fontSize = 24,
		vmargin = 10,
	},

	gui.Label{
		text = "Label B",
		textAlignment = "center",
		bgimage = "panels/square.png",
		bgcolor = "red",
		width = "80%",
		height = 200,
		halign = "center",
		color = "white",
		fontSize = 24,
		vmargin = 10,
	},

}
```

This produces a panel like this:

![image](https://cdn.discordapp.com/attachments/735956151547592804/995905270997864508/unknown.png)

Note that `"panels/square.png"` is a standard image available within DMHub. It is simply a flat white square. It's often a good idea to use panels with this simple square image and bright colors during development to clearly show which panel is which and understand why things are being laid out the way they are.

Both gui.Panel and gui.Label are examples of Elements. Panel is the most generic kind of element available, often used as a container for other elements. All other types of elements are sub-types of Panel and contain all of the properties that Panels do. A Label is simply a Panel with text displayed on it.

Panels without a bgimage ("background image") specified are invisible. They are still very often used to group other elements. A label without a bgimage is a text display with no background. We could easily re-write the above ode and remove the bgimage (and bgcolor) attributes to get this:

![image](https://user-images.githubusercontent.com/862626/178188310-c33f4e49-d6dc-47b3-853e-40d4cea1aa1d.png)

## Styles

In the example, many fields are repeated for the two labels. The fontSize, color, vmargin, width, and other fields are duplicated with identical values. This makes it excessively verbose to write code and frustrating to change.

Most fields that are applied to elements are considered *style fields*. Styling can be placed in a parent panel with nested panels inheriting the styling. The above example could be re-written like this to remove the need to repeat the styling for each label:

```
return gui.Panel{
	styles = {
		selectors = {"label"},
		textAlignment = "center",
		bgimage = "panels/square.png",
		width = "80%",
		height = 100,
		color = "white",
		fontSize = 24,
		vmargin = 10,
		halign = "center",
	},

	bgimage = "panels/square.png",
	bgcolor = "green",
	width = "100%",
	height = "auto",
	flow = "vertical",

	gui.Label{
		text = "Label A",
		bgcolor = "blue",
	},

	gui.Label{
		text = "Label B",
		bgcolor = "red",
		height = 200,
	},

}
```

See [[Styles]] for documentation on how to use styles.

*For the remainder of this page, some examples may not include styling information and just concentrate on logic*.

## Events

DMHub's user interface system is **event driven**. This means that you create a user interface and specify that code runs when certain **events** occur. An event may be something like a panel being clicked, an input being typed in, or a character's stats being modified. You can also generate your own events from code.

We could create a label and have it change every time the label is clicked:

```	gui.Label{
		text = "Click Me",
		click = function(element)
			element.data.clicks = element.data.clicks + 1
			element.text = string.format("You have clicked %d times.", element.data.clicks)
		end,
		data = {
			clicks = 0,
		}
	},
```

This example uses the **click** event to detect when the label is clicked. It also demonstrates how you can put permanent data inside the **data** section of an element. The data section allows you to store any data that you associate with the element.

See [[Events]] for a reference on built-in events.

## Generating your own events

You can use the **FireEvent** and **FireEventTree** functions to fire an event yourself.

```
local promptLabel = gui.Label{
	text = "Choose an attribute.",
	choose = function(element, attributeName)
		element.text = string.format("You chose %s.", attributeName)
	end,
}

return gui.Panel{
	promptLabel,
	gui.Label{
		text = "Choose Strength",
		click = function(element)
			promptLabel.FireEvent("choose", "Strength")
		end,
	},
	gui.Label{
		text = "Choose Dexterity",
		click = function(element)
			promptLabel.FireEvent("choose", "Dexterity")
		end,
	},
	gui.Label{
		text = "Choose Wisdom",
		click = function(element)
			promptLabel.FireEvent("choose", "Wisdom")
		end,
	},
}
```

Note how when firing the event you provide the name of the event to fire and any parameters you want. When handling an event, the element is always provided as the first parameter, and then the rest of the parameters that were sent when firing the event.

[Dockable Panels]: /docs/tutorials/tut-dockable-panel.html