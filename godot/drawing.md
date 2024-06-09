---
id: 6c1lstfxqpmifsux6tq9b3
title: godot/drawing
desc: ''
updated: 1717599730
created: 1717599730
---
# godot/drawing

## About

there are several different ways to get godot to draw information on the screen
inside of gdscript you can use the \_draw method insde of CanvasItem objects to request
drawing.

Baring the draw method shaders can be used to get the desired shape on the screen.

see [godot drawing docs](https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html) for
more complete information

## Techniques And Functions

### Lines

to draw lines on a canvas2d object you an use the 

```gdscript
#item is a valid canvas item
item.draw_line(from : Vector2,to : Vector2,color : Color,width : float)
```
