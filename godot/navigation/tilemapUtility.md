---
id: 3nayck21wzmgqszj015yqm
title: godot/navigation/tilemapUtility
desc: ''
updated: 1718118914
created: 1718118914
---
# godot/navigation/tilemapUtility

## About

you can use a tile map to set up navigatable regions with tiles

different navigation layers can be used for connectivity purposes
see [navigationLayers](https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationlayers.html)
for more information

only layers that tiles that are in the same layer will be connected, and navigation agents can be set up to only travel through
the given layers.


## Configuration

You can add navigation layer configurations in the tilemap settings in the inspector

[tileMapDifferentLayers](./assets/images/godot_tilemap_nav_layer.png)

each of these layers gets a set mask that it uses for navigation, you can then set the mask
of an individual tile in the paint section of the tile set tab in godot

[tileMapNavLayer](./assets/images/tileMapNavLayer.png)

Specifically click on the rectangle section telling you what the navigation layer is.


## Code Examples

from the godot docs:

```gdscript
func change_layers():
	var region: NavigationRegion3D = get_node("NavigationRegion3D")
	# enables 4-th layer for this region
	region.navigation_layers = enable_bitmask_inx(region.navigation_layers, 4)
	# disables 1-rst layer for this region
	region.navigation_layers = disable_bitmask_inx(region.navigation_layers, 1)

	var agent: NavigationAgent3D = get_node("NavigationAgent3D")
	# make future path queries of this agent ignore regions with 4-th layer
	agent.navigation_layers = disable_bitmask_inx(agent.navigation_layers, 4)

	var path_query_navigation_layers: int = 0
	path_query_navigation_layers = enable_bitmask_inx(path_query_navigation_layers, 2)
	# get a path that only considers 2-nd layer regions
	var path: PoolVector3Array = NavigationServer3D.map_get_path(
		map,
		start_position,
		target_position,
		true,
		path_query_navigation_layers
		)

static func is_bitmask_inx_enabled(_bitmask: int, _index: int) -> bool:
	return _bitmask & (1 << _index) != 0

static func enable_bitmask_inx(_bitmask: int, _index: int) -> int:
	return _bitmask | (1 << _index)

static func disable_bitmask_inx(_bitmask: int, _index: int) -> int:
	return _bitmask & ~(1 << _index)
```
