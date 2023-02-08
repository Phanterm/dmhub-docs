---
title: Terrain Editor Panel
layout: home
parent: Map Editor
grand_parent: Creating in DMHub
has_children: true
nav_order: 3
---


<!-- <!-- <img src="Images/map-memory.png" style="width:10cm" /> -->

# Terrain Editor Panel

In DMHub, there are two \"channels\" when it comes to painting on your
map. The first is terrain. The second are buildings. Each have special
rules that affect how they work. By default, the Terrain Panel is
located on the right side of the screen, represented by the panel icon
of a mountain. DMHub is already loaded with plenty of great terrain
images to help get you started.

{: .tip }
> To fill the map's background, select a terrain you like and click
> the **Fill** button to say adios to the cold void!. If you want it back,
> press **Clear** to reset the background.


## Editing Terrain Tilesheets

To create a new terrain, click on the **+** icon at the end of the
terrain list. To edit an existing terrain, right-click on it and select
**Edit Tilesheet...**. This will bring up the **Tilesheet Properties**
window. You can also select **Duplicate Tilesheet** to create a new
instance of it, **Delete Tilesheet** to delete it, and **Get Tilesheet
Image** to instantly download that tilesheet's associated terrain image
to your machine.

From the **Tilesheet Properties** window, you have a number of options
at your disposal to customize your terrain. If you ever want to undo
your changes, click **Undo Changes** before closing the window.
Likewise, if you want to revert all values to their default state, click
**Default Values**.

{: .warning }
> Any changes you make to terrain will update all instances of it
> currently used throughout all maps across the **entire campaign**. It is
> therefore recommended to make a new copy of any terrain before you begin
> editing it.

#### Description

The name of this asset as it appears in the editor.

#### Scale

Sets the magnification of the image.

#### Hue Shift

Shifts the hue of the existing image from a value of 0 (default) to 1.

#### Saturation

Saturates or desaturates color within the image.

#### Brightness

Determines light and dark brightness for the image.

#### Contrast

Determines the visual ratio of different light and dark tones for the
image.

#### Is Water

Flags the terrain to be treated as water. Creatures on this terrain will
use the current rules for traveling in water.

#### Difficult Terrain

Flags the terrain to be treated as difficult terrain. Creatures on this
terrain will use the current rules for traveling in water.

#### Distortion Effect

Applies a distortion animation to the current terrain image with
adjustable parameters.

-   Horizontal: Controls the amount of horizontal distortion in the
    animation.

-   Vertical: Controls the amount of vertical distortion in the
    animation.

-   Scaling: Adjusts the magnitude of the distortion.

-   Speed: Adjusts the rate of distortion.

#### Movement

Scrolls the terrain image along a horizontal and vertical direction.

