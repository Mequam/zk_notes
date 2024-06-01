---
id: g17ficg5yu9l8wshu4wf066
title: Heap
desc: ''
updated: 1665783359394
created: 1665783359394
---

___ 

## About

Generally, heaps are used when we need to queue data. That is, efficiently store insert and delete ordered data.

> Note that heaps are a tree based structure.

1. Every level in a heap tree is fully filled **except** potentially the last level
2. Every node in a level at the heap, is less than the nodes in the previous heap

## Insertion

Insertion in a heap is fairly straight forward as you mearly swap with the nodes above your current node if it invalidates the heap property.

The insertion algorithm is as follows

1. insert in the **left most** free leaf 
2. continue to swap that value with its parent as long as the heap property is invalidated

heat property here bieng that every level in the tree is "less than" the previous level.

## Deletion

We can only delete the maximum node in the heap, as the heap is a representation of a queue structure, and queues can only remove their top value.

When you delete the top node, you replace it with the last node in the tree, and then perform repeating swaps on the new value. 

> Note that you allways swap the new root node with the "greater" child or the child which most exemplifies the order imposed on the heap

[deletion example](https://youtu.be/NEtwJASLU8Q?t=1294)



