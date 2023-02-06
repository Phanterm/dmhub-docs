---
title: Events
layout: home
parent: Developers
nav_order: 2
---

# Lua gui Events

This is a list of all the built-in **events** that are generated for DMHub's Lua gui system.

## Generic Panel Events

All panels receive the following events:

| Event  |  Description |
|:-------|:-------------|
| `hover(element)` | Fired when the mouse enters the area of this panel. This is not fired if the panel has `interactable = false`. | 
| `dehover(element)` | Fired when the mouse leaves the area of this panel. | 
| `press(element)` | Fired when the mouse button is depressed while the mouse is over this panel. | 
| `unpress(element)` | Fired when the mouse button is released while the mouse is over this panel. | 
| `click(element)` | Fired when the mouse button is depressed and released while the mouse is over this panel. | 
| `rightClick(element)` | Fired when the right mouse button is depressed and released while the mouse is over this panel. | 
| `linger(element)` | Fired when the mouse cursor has remained still over this panel for 400ms. | 
| `think(element)` | Fired every `thinkTime` seconds. You can set the `thinkTime` parameter to any value. e.g. `thinkTime = 0.1` on the panel will make the panel receive a `think` event every 0.1 seconds. | 
| `create(element)` | Fired when the panel is created, after it has been assigned to a parent. | 
| `destroy(element)` | Fired when the panel is destroyed. | 
| `change(element)` | Fired when the value associated with this panel changes. The criteria for this depends on the subtype of the panel. `gui.Label` and `gui.Input` fields fire change when their text is changed. `gui.Dropdown` fires change when the selected item changes. | 

## Opt-in Panel Events

These are events available to `gui.Panel` elements which opt-in to them.

| Event  |  Description |
|:-------|:-------------|
| `escape(element)` | (`captureEscape=true`) Fired when the escape button is pressed. Only one active panel will receive this event, according to the `escapePriority` parameter, or the most recent element to be created if all elements which capture escape have equal `escapePriority`. | 
| `refreshAssets(element)` | (`monitorAssets=true`) Fired whenever the game's asset data changes. This includes any change to compendium data such as classes, races, items, spells, etc. | 
| `refreshGame(element)` | (`monitorGame=path string`) Fired when any of the game data within the data path that monitorGame is set to changes. Example values for `monitorGame`: `mod.GetDocumentSnapshot("mydocument").path` to monitor a document, `/characters/{tokenid}` to monitor changes to a character or `/characters` to monitor all characters. `/` to monitor all changes to the game. | 
| `dropfiles(element, paths)` | (`dragAndDropExtensions=list of strings`) Fired when files are dragged from the user's file system and dropped onto this panel. Only fired for file extensions which appear in the `dragAndDropExtensions` property. | 

## Input Events

`gui.Input` elements receive the following events:

| Event  |  Description |
|:-------|:-------------|
|`edit(element)`|Fired whenever the text of the input field is edited. You can set editlag to a small lag factor (e.g. 0.2) to make this event batch multiple keystrokes made within that interval into one event.|
|`change(element)`|Fired when the input is changed and editing is completed.|
|`submit(element)`|Fired when enter is pressed while in this input.|
|`deselect(element)`|Fired when the input loses focus.|
|`uparrow / downarrow / tab(element)`|Fired when the up arrow or down arrow or tab are pressed while this input is focused.|
