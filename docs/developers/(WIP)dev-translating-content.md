---
title: Translating DMHub Content
layout: home
parent: Development
nav_order: 6
published: false
---

# Translating DMHub Content

DMHub allows anyone to translate content into languages as defined from the [Compendium]. 

## Basic Functionality

In order to make anything done in Lua translatable for DMHub is to just wrap any strings that will be displayed to the user in ``tr()``. For example, let's look at the following label:

```
gui.Label{
    text = "Quest Tracker"
}
```

Translating this is a simple matter. Set the ``text`` property equal to ``tr()``, and place your text from before inside of the parenthesis. It should look something like this:

```
gui.Label{
    text = tr("Quest Tracker")
}
```

{: .warning }
Do not put strings into tr if they are used internally like ID's, class names, etc. They are for things meant to end up on UI.

Once you've done this, you can go to the Compendium and 
