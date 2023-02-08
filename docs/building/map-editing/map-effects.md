---
title: Effects Editor Panel
layout: home
parent: Map Editor
grand_parent: Creating in DMHub
has_children: true
nav_order: 5
---

# Effects Editor Panel

The effects panel is perfect for when you're touching up your map with
visual details that don't share space with terrain or buildings. This
panel retains the brushes used by other panels, and comes with a couple
of example effects. From the base panel you can adjust the effect's
size, opacity, and blend type.

There are two methods for adding new effects. The first is through an
image asset, not unlike a terrain. The second allows the use of objects
in order to create the effect image.


<!-- <img src="Images/effect-horror-1.png" style="width:30em" /> -->


## Image Effect Brushes

From the Effects Panel, clicking on the **+** symbol with the map icon
will prompt you to upload a new image. Afterward, you'll be shown the
properties for your new effect, where you can tweak to your liking.
There are two properties unique to effects: **Layer** and **Alpha**.

### Layer

Where in the visual hierarchy this effect is drawn. Effects can be set
to draw above terrain, floors, walls, objects, or creatures.

### Alpha

Determines how the alpha is set from the image. **Blend** will use a
standard alpha channel method. With Threshold , the alpha value of the
effect on the map sets the threshold. If the alpha value of the pixel on
the texture is above the threshold, then the pixel is drawn at 100%
opacity. Otherwise it's drawn at 0%.

## Object Effect Brushes

<!--l0.52 ![image](Images/effect-object.png){width="52%"}-->

In DMHub, any images you upload as objects may be used to create unique
effect brushes. Click on the **+** symbol with the brush icon in the
corner to open the object brush configuration menu. From here, you can
click on the Objects panel to search for and drag over any objects you'd
like to use.

After dragging over at least one object, the window will populate with a
ton of options and a preview window. There are three central properties
applied to the entire effect.

The **Seed** determines how the objects are distributed when they are
initialized, and can be refreshed at any time. Adjust **Object Count**
to determine the total number of objects displayed for the brush, and
**Spread** to affect how close or far apart they are from one another.

The remaining settings can be set individually for every object in the
effect, allowing you to have a great deal of control over the sorts of
effects you can create.

### Frequency

Adjust how often the selected object will appear in the effect.

### Base Scale

Sets the starting size for the selected object.

### Random Scale

Randomizes the size for each instance of the selected object from its
base value.

### Random Rotation

Randomizes the rotation for each instance of the selected object.

### Random Hue

Randomizes the hue for each instance of the selected object.

### Random Saturation

Randomizes the saturation value for each instance of the selected
object.

### Random Brightness

Randomizes the brightness value for each instance of the selected
object.

### Height

Sets the base height for the selected object.

### Random Height

Randomizes the height for each instance of the selected object from its
base value.


<!-- <img src="Images/effect-horror-2.png" style="width:32em" /> -->
