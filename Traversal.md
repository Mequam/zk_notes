---
id: mvamtum01ad2gnsb46nwauu
title: Traversal
desc: ''
updated: 1670602537576
created: 1664733537709
---
# Tree Traversals

---
## General

there are breadth first search
and depth first search traversals

### Breath First Search
    
    these searches search through all
    nodes on the same levele of the tree first before moving onto the next level

    >   these are typically implimented with a queue
    
    There is top down left right traversal and top down right left traversal.

### Depth First Seach
    these searches go all the way to the last level of the tree, before starting at the top of the tree again and continuing down

    > these are typically implimented with recursion
 
    we tend to notate these with 
    the order in wich we do them

    concider LVR

    this means 
    
        1. go to the left node
            run LVR on it
        2. visit the current node
        3. go to the right node
            run LVR on it
    
    we can make any number of these visitation algorithms by changing the order of LVR to RVL or VLR or LRV, there are 6 total



## Naming Convention
note that you might here these called 

1. inorder 
1. postorder
1. preorder

these follow the same convention as [[DataStructures.PolishNotation]] with L **allways** before R

so inorder is equivilent to [[DataStructures.PolishNotation]] a+b so we have LVR

## Inorder Traversal

this is simply LVR traversal
