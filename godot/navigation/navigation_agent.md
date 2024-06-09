---
id: 7x5aeqlx570vh44thale9m
title: godot/navigation/navigation_agent
desc: ''
updated: 1717599931
created: 1717599931
---
# godot/navigation/navigation_agent

## About

godots navigation system provides several built in functionalities that can be used to save
time while developing

the navigation agent is a convinent node that contains the necessary functions to move around
a navigation world without colliding undesired objects.

see [godot nav agent docs](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html#class-navigationagent2d)
for more information

## Methods

### Get Next Path

```gdscript
nav_agent.get_next_path_position()
```

returns a vector2 that is the next point in the nav path

### Get Full Nav Path

```gdscript
nav_agent.get_current_navigation_path()
nav_agent.get_current_navigation_path_index()
```

the above functions returns a packed vector2 array and the bellow function returns the navigation agents
current index into that array as it is traversing the world

