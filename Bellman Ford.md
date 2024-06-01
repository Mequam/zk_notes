---
id: 658y69qe581h6ibmmd78yt7
title: Bellman Ford
desc: ''
updated: 1668279505542
created: 1668276704385
---

## About

The goal of the Bellman ford algorithm is equivilent to [[DataStructures.Graph.MinimalPath.Dijkstras]] algorithm, but the method used to get it has some notable drawbacks and benifiys

Firstly bellman ford is less efficient, it takes longer to compute then Dijkstras.

So why do we use it?

It turns out that Dijkstras fails when there are negative cycles in the graph. In such an event the algorithm will continue to spiral around forever, never reaching termination.

Bellman Ford aims to solve that problem.

## Algorithm

    1. Choose an ordering of edges
    2. Set the distance of every node to inf
    3. Repeat V - 1 times or until the table does not change each iteration where v is the # of verts
         Relax each edge.

Basically , the bellman ford algorithm has you going through each edge and asking the question, does this edge improve my path to the out node? If it does you save the new shortest distance to that node.

This is repeted **at most** v-1 times, but it could be less if you are lucky. Additionally the order that we traverse the edges in does not matter, so long as we are consistent in using our odrder.

## Remarks

In doing research I saw hints that Bellman Ford can be built **on top of** [[DataStructures.Graph.MinimalPath.Dijkstras]] but further research would be required to confirm this.

Additionally, you can modify this algorithm to detect infinit cycles.

If after the algorithm terminates, you run it agin and can improve the pathway to any node, you know that you have found a negative cycle.

## References

[Michael Sambol youtube](https://www.youtube.com/watch?v=obWXjtg0L64)

[William Fiset youtube](https://www.youtube.com/watch?v=lyw4FaxrwHg)
