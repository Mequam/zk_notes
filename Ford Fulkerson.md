---
id: 9ymkk84e1a9ae9et4z9781m
title: Ford Fulkerson
desc: 'a minimal flow path algorithm'
updated: 1668360372740
created: 1668284679568
---

## About

the goal of the Ford Fulkerson algorithm is to find a maximum flow on a [[DataStructures.Graph.FlowGraph]]


That is, from the source of a graph to the sink of a graph, what is the largest flow that can be placed.


## Algorithm

We start with a flow graph with directed verticies that each have a given capacity.

we start with a flow graph.

![alt](./assets/images/ffflow_start.svg)


using this graph, we find a path to the sink from the source

![alt](./assets/images/flow_path_first.svg)

We push the maximum possible flow through this path.

![alt](./assets/images/max_flow_push.svg)

But notice, how do we know that we picked a good path to send flow to, since there are lots of possible paths it very well could be the case that the path we picked was sub optimal.

To fix this fff algorithm uses somthing called an *augmented flow path* in this path. We make a seperate graph where arrows in the graph represent the remaining capacity of flow to travel along a direction. Critical is the fact that we represent back flow as flow which can be undone in this scond graph.

Bellow is a aughmented path of the graph above, where the cyan arrows represent back flow that can be undone, and the purple arrows represent forwards flow that can continue in the graph.


Notice how the cyan edges each have a backflow value of 3, as we sent only 3 flow through the network.

![alt](./assets/images/augmented_path.svg)

We then run the algorithm on this graph until we cannot find a path from the source to the sink with backflow or forwards flow.


## Example

![alt](./assets/images/FFF_EXAMPLE.svg)

note that the maximal flow in this graph is 19
