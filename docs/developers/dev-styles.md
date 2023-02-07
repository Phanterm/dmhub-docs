---
title: Styles
layout: home
parent: Development
nav_order: 4
---

# Lua Styles

Any UI Element created in Lua has *styles* applied to it to influence its appearance and layout. Styles may be applied directly on the element:

```
gui.Label{
    text = "Hello",
    bgimage = "panels/square.png",
    bgcolor = "red",
    color = "white",
    halign = "center",
    valign = "center",
    width = 200,
    height = 80,
}
```

Other than `text`, every field set on this label is a style field. Repeating all of these fields for every label is tedious, and often the remain the same. Having just two or three labels which use this same styling would be very tedious. An element may contain a `styles` field which specifies a list of styles that are considered for every element nested within it. For example,

```
gui.Panel{
    flow = "vertical",
    styles = {
        {
            selectors = {"label"},
            bgimage = "panels/square.png",
            bgcolor = "red",
            color = "white",
            halign = "center",
            valign = "center",
            width = 200,
            height = 80,
        },
    },
    gui.Label{
        text = "Hello",
    },
    gui.Label{
        text = "Goodbye",
    },
}
```

Note the important `selectors` field within the style. It specifies that we only apply this styling to elements with the "label" class. Labels automatically have the "label" class, but you can devise your own classes whenever you want to. For instance, if we wanted to have a list of labels, and some of those labels are considered headings, which are larger, we could do this:

{: .note }
`selectors` and `classes` are interchangeable.

```
return gui.Panel{
	width = "100%",
	height = "auto",
	flow = "vertical",

	styles = {
		{
			selectors = {"label"},
			width = "auto",
			height = "auto",
			color = "white",
			fontSize = 16,
			vmargin = 2,
			halign = "left",
		},
		{
			selectors = {"label", "heading"},
			fontSize = 20,
			bold = true,
		},
	},

	gui.Label{
		classes = {"heading"},
		text = "Heading A",
	},

	gui.Label{ text = "Item 1", },
	gui.Label{ text = "Item 2", },

	gui.Label{
		classes = {"heading"},
		text = "Heading B",
	},

	gui.Label{ text = "Item 1", },
	gui.Label{ text = "Item 2", },
	gui.Label{ text = "Item 3", },

}
```

Note that "heading" is not a name provided by DMHub, it is just a class we made up for this example. Using this code displays this:

![image](https://user-images.githubusercontent.com/862626/178192507-6056e57a-85d5-40ad-8994-e2b7ae1aecaa.png)

Note that styles don't just apply to immediate children, but to *all* nested children and sub-children within the hierarchy. When a selector has multiple classes specified, it will only apply to elements that have all of those classes.

When designing a new user interface for DMHub, it's a good idea to think about the classes you will want to have for different types of elements you will have. You can style theses classes and then easily change the style to quickly get a very different look for your user interface.

## Dynamically changing classes

The classes that an element has are not fixed when the element is created. They may be changed by various events that occur and if they do change, the styling of the element is recalculated based on the new classes. A class that DMHub automatically applies is "hover" which is applied to an element when the mouse cursor is hovering over the element. It is very common to use this to make elements change their appearance when the mouse moves over them.

```
return gui.Panel{
	width = "100%",
	height = "auto",
	flow = "vertical",

	styles = {
		{
			selectors = {"label"},
			width = "auto",
			height = "auto",
			color = "white",
			fontSize = 16,
			vmargin = 2,
			halign = "left",
		},
		{
			selectors = {"label", "hover"},
			color = "yellow",
		},
	},

	gui.Label{ text = "Item 1", },
	gui.Label{ text = "Item 2", },
	gui.Label{ text = "Item 3", },
	gui.Label{ text = "Item 4", },
	gui.Label{ text = "Item 5", },
	gui.Label{ text = "Item 6", },
	}
```


When the user places the cursor over one of these labels, its color turns to yellow:

![image](https://user-images.githubusercontent.com/862626/178193753-5ea1ae8f-0096-4e67-a840-1bb1d83523a3.png)

You can add or remove a class to an element yourself. For instance, we might decide that certain elements can be "selected" by clicking on them. Here we have an example where whenever the label is clicked it toggles whether it is selected on or off, and it is displayed in a different color if it is selected:


```
return gui.Panel{
	width = "100%",
	height = "auto",
	flow = "vertical",

	styles = {
		{
			selectors = {"label"},
			width = "auto",
			height = "auto",
			color = "white",
			fontSize = 16,
			vmargin = 2,
			halign = "left",
		},
		{
			selectors = {"label", "hover"},
			color = "yellow",
		},
		{
			selectors = {"label", "selected"},
			color = "red",
		},
	},

	gui.Label{
		text = "Click Me",
		click = function(element)
			element.SetClass("selected", not element.HasClass("selected"))
		end,
	},
}
```

## Colors

Colors are specified in html format, such as `"#ff0000"` or `"#ff0000ff"` for red. `"red"` also works as do some other named colors.

### bgcolor

This is the color used for the panel's "background", specified by `bgimage` in the panel's definition. Note that if you want the bgimage to be displayed as-is you should set bgcolor to white.

### borderColor

This is the color of the border around the panel.

### color

The color to use for text and other foreground elements.

### selectedColor

The color to use for text that is selected/highlighted

## Control settings

### selectors (list of strings or string)

A single class or list of classes. The style will only apply to panels that have all these classes.

Examples
```
selectors = {"hover"} --this style will only apply when this panel is hovered by the mouse
selectors = {"button","pressed"} -- this style will only apply to button panels and only when they are being pressed
selectors = {"~hidden"} --this style will only apply when this panel is not hidden 
```

There are some built-in classes applied by dmhub, but you can also use the `SetClass()` function to apply whether or not a class applies to a panel.

These are the built-in classes:

- hover: occurs when the mouse is over the panel
- press: occurs when the mouse is over the panel and the mouse button pressed (about to trigger a click)
- focus: occurs when the panel has input focus
- drag-target: occurs when a panel is being dragged and this panel is a potential target for the drag
- drag-target-hover: occurs when a panel is being dragged and is currently over this target panel
- dm: occurs on all panels if the user is the DM of the game.
- player: occurs on all panels if the user is a regular player and not the DM of the game.
- button: applied to all button panels
- dropdown: applied to all dropdown panels

These classes are recognized in the standard style sheets and control the visibility of panels.
- hidden: set this class on a panel to make it hidden. It will be inactive and won't be visible on screen. It will still take up space.
- collapsed: This is very similar to hidden, but the panel will not take up space in the layout.

In the below example, we make a panel which changes color when the mouse is hovered over it.

```
gui.Panel{
    bgimage = 'panels/square.png',
    styles = {
        {
            bgcolor = "red",
            width = 400, height = 400,
        },
        {
            selectors = "hover",
            bgcolor = "green",
        },
    }
}
```

### inherit_selectors (boolean, default=false)

If true, the panel will use selectors that apply not only to it, but to all of its parents.

### priority (integer, default = 0)

Higher priority styles take priority over lower priority ones. This allows you to place a style in a panel at the very 'top' and apply a style which overrides all styles below.

In the following example, we could put this style in a dialog if all buttons in that dialog were to be turned red.

```
styles = {
    {
        selectors = {'button'},
        priority = 10,
        bgcolor = 'red',
    }
}
```

### transitionTime (number, default = 0)

When this style is applied or removed, how long it transitions in or out.

In the following example, we change the panel's color when it is hovered, but do so very slowly, the panel will change slowly from blue to red.

```
gui.Panel{
    bgimage = 'panels/square.png',
    styles = {
        {
            bgcolor = "blue",
            width = 400, height = 400,
        },
        {
            selectors = "hover",
            transitionTime = 5, --takes 5 seconds.
            bgcolor = "red",
        },
    }
}
```

### easing (string)

The type of curve to use for transitionTime. See https://easings.net/ for a list of easings.

### hidden (number)

Whether the panel is hidden. If 0 it is not hidden, if 1 completely hidden. 0.5 means 50% hidden.

### collapsed (number)

Whether the panel is collapsed. If 0 it is not collapsed, if 1 is completely collapsed. A number between means it is proportionally scaled down, so it becomes smaller and smaller until it disappears completely.

## Text

### fontSize (number or percentage)

The size of the font to use for any text used by this panel.

Examples:

```
fontSize = 38, --point 38 font.
fontSize = "60%", --reduce font to 60% of the size it was going to be otherwise.
```

### textAlignment (string)

The alignment of any text within the panel. Common options are Left, Right, Top, Bottom, Center, TopLeft, BottomLeft, etc. See https://docs.unity3d.com/Packages/com.unity.textmeshpro@2.0/api/TMPro.TextAlignmentOptions.html for a complete list of possible options.

### textOverflow (string)

How to handle text that doesn't fit inside the panel's area (when not using auto-sizing or wrapping). Can be any of the following:

- Ellipsis	
- Linked	
- Masking	
- Overflow	
- Page	
- ScrollRect	
- Truncate	

### textWrap (bool)

If true, text that exceeds the horizontal area of the panel will wrap to the next line. If false, text won't wrap and the `textOverflow` handling will be used instead.

### bold / underline / italics (bool)

These bool values apply these attributes to any text.

### uppercase (bool)

If true, text will be displayed entirely using uppercase characters.

### characterLimit (number)

Limits the number of characters that will be rendered for this element. When creating editable labels, it is **strongly advised** to include a character limit of some kind.

## Layout

### width / height (number or string)

The width and height of the panel. As a percent is the percentage of its parent.

Examples:

```
width = 40, --this panel is 40px wide
width = "40%", --this panel takes up 40% of its parent's width
width = "auto", --this panel has its width automatically calculated from any text and its children
width = "50%+8", --this panel has a width of 50% of its parent's width, plus 8px
width = "50% height", --this panel's width is 50% of its height
```

### halign (string)

Controls whether the panel is aligned to the left, right, or center

### valign (string)

Controls whether the panel is aligned to the top, bottom, or center

### flow (string)

Controls how the panel's children are arranged. May be `none`, `vertical`, or `horizontal`

### wrap (bool)

If true, when the children exceed the panel's area in the flow direction given, the panels will wrap to form new 'rows'.

### pad / hpad / vpad (number)

Sets a panel's padding, either horizontal, vertical, or both. Padding is the space between the edge of the panel and any content, such as children or text.

### margin /  hmargin / vmargin (number)

Sets a panel's margin, either horizontal, vertical, or both. The margin is the amount of space inserted between a panel and its parent, as well as a panel and its siblings when using a vertical or horizontal flow.

### brightness (number, default=1)

How bright this panel appears. A value of 1 is 100% brightness, and a value of 0 is 0% (will appear black). The value may be over 1, and sufficiently bright panels may shine.

### hueshift (number, default=0)

A value to shift the hue used to display this panel.

### saturation (number, default=1)

A number to multiply the panel's saturation by

### inversion (number, default = 0)

A value to invert the colors of the panel.

### opacity (number, default = 1)

How opaque the panel appears, 0 makes the panel completely transparent.

### imageRect (rectangle, default = {x1 = 0, y1 = 0, x2 = 1, y2 = 1})

This specifies the area of the bgimage to use.

In this example we only display the left half of the bgimage

```
imageRect = { x1 = 0, x2 = 0.5, y1 = 0, y2 = 1 }
```

### rotate (number)

Rotate the panel by this number of degrees.

### translate (position, default = {x = 0, y = 0})

Number of pixels to move the panel from the position it would otherwise appear in.

### scale (number, default = 1)

The panel will appear scaled by this amount. UI layout will not be affected.

### uiscale (number, default = 1)

The panel will appear scaled by this amount. UI layout will be affected and surrounding panels may move if this changes.

### pivot (position, default = {x = 0.5, y = 0.5})

The position in the panel that it 'pivots' from. This is the point it will rotate around, and be scaled around. 

### borderWidth (number, or rectangle)

The width of the border. It is usually specified as a simple number, but you can specific it with x1/x2/y1/y2 to specify a different border width for each edge.

Examples:

```
borderWidth = 2, --a 2px wide border
borderWidth = {x1 = 0, y1 = 0, x2 = 0, y2 = 2}, --a 2x wide line will appear at the bottom of the panel

### borderColor (color)

The color of the border.

### bgslice (number, or rectangle, default = 0)

This specifies how the bgimage is stretched to fill the panel. By default it is just stretched evenly across the panel, but if you specified a value of 0.1, that would indicate that the left/right/bottom/top of the bgimage is the 'border' and should be constant size regardless of the size of the panel. The inner portion will be stretched to fill the panel.

### cornerRadius (number or rectangle, default = 0)

This indicates if the corners of the panel should be rounded rather than sharp. Normally specified as a number, but can be a rectangle to specify each edge having a different radius.