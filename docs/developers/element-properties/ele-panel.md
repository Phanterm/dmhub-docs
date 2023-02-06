---
title: gui.Panel
layout: home
parent: Element Properties
grand_parent: Developers
has_children: true
nav_order: 1
---

# gui.Panel

## Properties

| Name | Type  |  Description |
|:-------|:-------------|:-------------|
| `id` | `string`| The unique ID of the element. Only set this to an ID that is unique. An ID will be auto-generated otherwise.|
| `idprefix`|`string` | *(write-only)*,  A prefix that is put in front of the element's ID when generating it.|
| `bgimage` |`string` (`nil`)| The background image used for this panel. If this is nil, the panel won't have a visible background. Can be set to `"panels/square.png"` to make a simple square.|
| `bgimageStreamed`| `string` | *(write-only)* Setting this sets the bgimage but makes the image get loaded in a stream in the background. This avoids DMHub hitching until the image is loaded, and means the panel will render with no image until the image is loaded. This is useful for loading a palette full of different images without causing a pause for the user while the images load.|
| `bgimageInit` |`boolean` | *(read-only)*, This returns true if the bgimage is loaded and currently rendering.|
| `bgimageWidth`| `number` | *(read-only)*, The width `in pixels` of the bgimage for this panel.|
| `bgimageHeight`| `number` | *(read-only)*, The height `in pixels` of the bgimage for this panel.|
| `bgimageAlpha`| `string`| An alternative image to use for its alpha channel instead of using bgimage's alpha channel.|
| `bgimageMask`| `string`| |
| `bgimageMaskRect`| `vector4` | *(write-only)*|
| `bgimageTokenMask`| `string`| | 
| `blocksGameInteraction`| `boolean` | *(default =* `true` *)* If this is true, when the mouse is over the panel, any game elements beneath cannot be interacted with. Setting this to false will make the panel not interfere with interacting with the game, meaning it is some kind of informational icon that the user can't interact with.|
| `classes`| `list of strings` | *(write-only)* A list of class names that this element has. Can also set to a single string.|
| `enabled`| `boolean` | *(read-only)*, True if the element is visible and in a normal state.|
| `escapeActivates`|`boolean`| If true, then pressing escape will trigger the 'click' event for this element.|
| `captureEscape`| `boolean`| If true, then pressing escape will trigger the 'escape' event for this element.|
| `escapePriority`| `number`| The priority this element has for handling escape events.|
| `events`| `table`| a table of event names to the functions for handling those events.|
| `monitorMod`| `string|nil`| The ID of the mod that this element is monitoring and will receive `refreshMod` events for.|
| `monitorAssets`| `boolean`| True if the element gets `refreshAssets` events when the game assets are updated.|
| `constrainToScreen`| `boolean`| Makes it so the element is always within the bounds of the screen. Useful for tooltips.|
| `floating`| `boolean`| Makes it so that this panel does not appear within the flow of its parent. Instead its position is determined only by its alignment and it can overlap its sibling elements.|
| `data`| `table`| An arbitrary table of user data that is kept with the element.|
| `root`| `panel`| The element that is at the root of this panel's hierarchy.|
| `parent`| `panel|nil`| The parent of this element.|
| `children` |`list of panels`| The children of this panel, in order.|
| `siblingIndex` |`integer` | *(read-only)*, The 1-based index of this element among its siblings. Determines its zorder relative to its siblings.|
| `selfStyle`| `table`| A table of all the style attributes set directly on this element. After an element is created, manipulating this table is the way to modify its styles directly.|
| `theme`| `string` | *(write-only)* The theme that this panel uses. **(PLACEHOLDER; Do not use this until we have a proper themes system in place.)**|
| `styles`| `list of styles`| A list of style tables, which will apply to this element and all nested children, targeting according to the `selectors` field of each styles table.|
| `x`| `number`| A x-offset to the position of this element. Use to change the position which the element is rendered|
| `y`| `number`| A y-offset to the position of this element. Use to change the position which the element is rendered|
| `translate`| `vector2`| equal to x,y in a vector.|
| `vscroll`| `boolean`| Whether this panel will have a vertical scrollbar used if the child elements exceed its area.|
| `vscrollLockToBottom`| `boolean`| Defaults the scrollbar to the bottom instead of the top.|
| `vscrollPosition`| `number`| The current position of the scrollbar.|
| `canFocus`| `boolean`| This element can be the subject of the input focus.|
| `hasFocus`| `boolean`| This element currently has the input focus.|
| `draggable`| `boolean`| If true, this element can be dragged by the user.|
| `canDragOnto`| `function(element,targetElement) -> boolean`| A function which should be provided if draggable is true. It should return true when the element can be dragged and dropped onto the target element.|
| `dragDelta`| `vector2` | *(read-only)*, The distance the element has been dragged from its original position.|
| `xdrag`| `number` | *(read-only)*, the x distance the element has been dragged from its original position.|
| `ydrag`| `number` | *(read-only)*, the y distance the element has been dragged from its original position.|
| `dragTargetPriority`| `number`| The priority of this element to be selected in drag-and-drop operations vs other possible items we can drop on. |
| `dragging`| `boolean` | *(read-only)*, Returns true if this element is currently being dragged.|
| `dragMove`| `boolean` | *(write-only; (default =* `true` *)* If false, then dragging this element doesn't actually move it. It just fires dragging events.|
| `dragBounds`| `vector4` | *(write-only)* A rectangle representing the constrained area the element may be dragged in.|
| `dragxwrap/dragywrap`| `boolean` | *(write-only)* If true, when the element is dragged to the edge of the bounds, it wraps to the other end of the constrained area.|
| `interactable`| `boolean`| If set to false, the panel does not get any interaction events such as click, press, or hover.|
| `monitor`| `string|nil`| The name of a DMHub setting that this element monitors the value of. The "monitor" event is fired when the setting changes.|
| `monitorValue`| `any`| The value of the DMHub setting that this element monitors. (Must have monitor set to the name of a setting).|
| `multimonitor`| `list of strings`| A list of strings that this element monitors the value of, the "monitor" event is fired when any of the settings change.|
| `valid`| `boolean` | *(read-only)*, Returns true if the element hasn't been destroyed.|
| `tooltip`| `panel`| The tooltip panel that is shown over this panel. Generally used within the `hover` or `linger` events to display a newly-constructed tooltip panel over this panel.  You can set this to a text string rather than an entire panel and DMHub will generate a default-styled tooltip panel containing the text. Once the mouse is moved away from the panel, the tooltip is automatically destroyed.|
| `tooltipParent`| `panel`| The panel which will parent tooltips shown from this panel. By default tooltips will be parented by the panel that creates them but this can be used to specify that a different panel will be used.|
| `popup`| `panel`| The popup panel that is shown over this panel. A popup is very similar to a tooltip, except a popup doesn't disappear just when you move your mouse away, only when you press escape or click away from it. A popup is designed to be interactable and has its own hierarchy independent from the panel that creates it. You might use a popup panel to show a mini editor for something when you click on it. The alignment of a popup is used to determine its positioning relative to its parent.|
| `popupPositioning`| `panel|string`| Controls how a popup is positioned. It can be set to "panel" to set it relative to this panel, to "mouse" to set it at the mouse position when it was created, or to a specific panel.|
| `value`| `any`| The 'value' this panel has. This is useful for any element that is designed to edit some kind of value. For instance, a color picker would have the value of the color. You can set the `GetValue` and `SetValue` functions which are called to get and set the value.|
| `GetValue`| `function(element) -> any`| A function which gets the 'value' this panel is editing. This is used if you want to make your own type of panel that edits some type of value. |
| `SetValue`| `function(element, any)`| A function which is set when the value is set.|

## Functions

| Name | Default |  Description |
|:-------|:-------------|:-------------|
| `Get(string elementid)` | `panel|nil`| Searches the hierarchy this element is in and finds the element with the given ID, returning it.|
| `FindParentWithClass(string classid)` | `panel|nil`| Given the name of a class, looks at its parent, and it's parent's parent, and so forth all the way up to the root. The first element with the given class will be returned, or nil if none is found. This is useful if you want to e.g. find a "dialog" element and fire an event on it.|
| `GetChildrenWithClass(string classid)` | `list of panels`| Given the name of a class, returns a list of all children that have the given class. Does not recurse, only gets immediate children.|
| `GetChildrenWithClasses(list of strings)` | `list of panels`| Given a list of classes, returns a list of all children that have all those classes. Does not recurse, only gets immediate children. A class id can be preceded with a ~ to indicate 'not that class'. e.g. `element.GetChildrenWithClasses{"rules", "~hidden"}`|
| `GetChildrenWithClassRecursive(string classid)`| `list of panels` | Given the name of a class, returns a list of all children that have the given class. Recurses through the entire hierarchy below the element it is called on.|
| `SetAsFirstSibling()` | None | Makes this element the first among its siblings. Puts it first in any flow, and will appear below its siblings.|
| `SetAsLastSibling()` | None | Makes this element the last among its siblings. Puts it first in any flow, and will appear above its siblings.|
| `IsDescendantOf(panel otherElement)` | `boolean` | Returns true if the element it is called on is a direct or indirect child of `otherElement`.|
| `AddChild(panel element)` | None | Adds the given element as a new child.|
| `RemoveChild(panel element)` | None | Removes the given panel as one of our children. The child panel will be destroyed.|
| `DestroySelf()` | None | Destroys the element. Removes it from its parent.|
| `Unparent()` | None | Remove this element from its parent without destroying it. This element should immediately be added to another parent to avoid leaving it orphaned.|
| `FireEvent(string eventName, ...)` | None | Fires the given event name on this panel. May specify any number of additional arguments to include in the arguments list.|
| `FireEventTree(string eventName, ...)` | None | Fires the given event name on this panel and on all child panels, recursively through the whole hierarchy. May specify any number of additional arguments to include in the arguments list.|
| `FireEventTreeVisible(string eventName, ...)` | None | Similiar to FireEventTree but only affects elements that are visible and not collapsed or hidden.|
| `ScheduleEvent(string eventName, number delay, ...)` | None | Fires the given event name on this panel. Don't fire it now though, fire it after `delay` seconds. May specify any number of additional arguments to include in the arguments list.|
| `SetClass(string classid, boolean set)` | None | Sets or removes the given class name (based on the `set` value for this element.)|
| `HasClass(string classid)` | `boolean`| Returns true if the element is a member of the given class.|
| `SetClassImmediage(string classid, boolean set)`| None | Sets or removes the given class name `based on the 'set' boolean` for this element. The class is set immediately, meaning any transition times on styles affected by this change are ignored and the change takes place immediately instead.|
| `SetClassTree(string classid, boolean set)` | None | Sets or removes the given class name `based on the 'set' boolean` for this element and all its nested child elements.|
| `SetClassTreeImmediate(string classid, boolean set)` | None | Sets or removes the given class name `based on the 'set' boolean` for this element and all its nested child elements. The class is set immediately, meaning any transition times on styles affected by this change are ignored and the change takes place immediately instead.|
| `PulseClass(string classid)` | None | Sets and then removes a given class. This is useful for styles that have transition times. It allows you to create effects like flashing or highlighting a panel briefly.|
| `PulseClassTree(string classid)` | None | Sets and then removes a given class on this element and all nested child elements.|
| `FloatTooltipNearTile(Location tileloc, string tooltip)` | None | Makes a textual tooltip with default tooltip styling appear near the given tile location. The tooltip will be removed when the user moves the mouse away or another tooltip is created.|
