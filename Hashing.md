---
id: ejxoe45ffuuem9rgr865p9z
title: Hashing
desc: ''
updated: 1669054768072
created: 1669053133564
---

## About

We usually compare keys when searching through collections to find values. For example [[DataStructures.BinaryTrees]].

But note that we do not HAVE to, we can compute the position of the key in the table using some mathmatical funciton to INSTANTLY snap to the keys location.

There are lots of ways to do this, and most of them are called hash algorithms.

## Sub Ideas

### Folding

Often when keys are folded they are broken down into smaller keys, hashes are performed on those keys, and then those hashes are combined.

for example ssn could do 

123-456-789 and break the number apart by - and combine them together.
