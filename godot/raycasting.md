---
id: inx9wc5tlillrbmgc1jnk1
title: godot/raycasting
desc: ''
updated: 1717878274
created: 1717878274
---
# godot/raycasting

## Quick Reference

```gdscript
func _physics_process(delta):
    var space_state = get_world_2d().direct_space_state
    # use global coordinates, not local to node
    var query = PhysicsRayQueryParameters2D.create(Vector2(0, 0), Vector2(50, 100))
    var result = space_state.intersect_ray(query)
```

The result is a dictionary. If the ray didn't hit anything, the dictionary will be empty. If it did hit something, it will contain collision information:

```gdscript
if result:
    print("Hit at point: ", result.position)
```
The result dictionary when a collision occurs contains the following data:

>{
>   position: Vector2 # point in world space for collision
>   normal: Vector2 # normal in world space for collision
>   collider: Object # Object collided or null (if unassociated)
>   collider_id: ObjectID # Object it collided against
>   rid: RID # RID it collided against
>   shape: int # shape index of collider
>   metadata: Variant() # metadata of collider
>}


> this is taken straight from the godot docs
> [godot docs](https://docs.godotengine.org/en/4.0/tutorials/physics/ray-casting.html)

## About

raytracing is a technique in games where you point a line from one point to another and
ask the question if anything collides on the way there. It has many applications from AI
design to weapon design and is a standard technique to be able to do in a game engine.
