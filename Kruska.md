---
id: wiu5zif86bs6y7ua4rh6fze
title: Kruska
desc: ''
updated: 1668284226639
created: 1668279718877
---


## About

the goal of kruskals algorithm is to create a minimum spanning tree (or forest) of a given weighted graph.

## Algorithm

Select the lowest weighted edge of the graph, if that edge maintains the tree structure of the graph, include it, otherwise discard it.

Repeat this foreach edge until you have a tree.

## Remarks

the idea here is very simple, as kruskals algorithm follows a greedy approach that works suprisingly well, having complexity of 2log(V) where V is the verticy count.
