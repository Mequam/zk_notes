---
id: mi5zn5bwjtyffmptf5o7fz
title: python/turtle
desc: ''
updated: 1717245905
created: 1717245905
---
# python/turtle

## About

turtle is a python lirary that lets you move around a point on the screen, 
leaving a trail behind as you do. The following simple example will draw a 
snowflake fractal on the screen


## Examples

### Quick Start

```python
"""
This is the Template Repl for Python with Turtle.

Python with Turtle lets you make graphics easily in Python.

Check out the official docs here: https://docs.python.org/3/library/turtle.html
"""

import turtle

# def hello(current_count):
#   print(current_count)
#   if current_count > 0:
#     hello(current_count - 1)

# hello(10)

# while True:
#   print("hi")

t = turtle.Turtle()

t.penup()

t.forward(-100)

t.pendown()

#go as fast as you can
t.speed(0)


def snowflake(snow_flake_id, size, s=t.forward):
    def draw_line():
        if snow_flake_id == 0:
            s(size)
        else:
            snowflake(snow_flake_id - 1, size/3, s)

    draw_line()

    t.left(45)

    draw_line()

    t.right(2 * 45)

    draw_line()

    t.left(45)

    draw_line()


def circle(snow_flake_id, size, s=t.forward):
  for c in ['red', 'green', 'blue', 'orange']:
      t.color(c)
      snowflake(snow_flake_id, size, s)
      t.right(90)


circle(3,100/(11))
input()
```

### Key Input Example

```python
import turtle


t = turtle.Turtle()

def up():
    t.forward(100)

turtle.onkey(up, ' ')

turtle.listen()
turtle.mainloop()
```

### Position Reading

```python
import turtle

t = turtle.Turtle()

x,y = t.pos()
```
