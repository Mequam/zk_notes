---
id: r63abdy2eu1b3bl0l5h2y3n
title: determinent
desc: ''
updated: 1668649219930
created: 1668647854551
---

## About

the determinent represents how a given matrix transformation transforms area in the vector space. 

In other words, it is the area of the transformation of a unit square into a new vector space.


## Computation

The determinent can be computed recursivly by adding the sub matri


![alt](./assets/images/determinent_example.svg)



Basically you travel along a given row or collumn and add and subtract the [[matrixAlgebra.submatrix]] your current element times that element.

Note that the top left corner of the matrix is "posotive" in the sum sequence and all other elements of the matrix inherite their "posotivity" as a result. You can think of it like white and black on a chess board.

![alt](./assets/images/determinent_chessboard.svg)


> an implimentation of this recursive approach in haskell can be found here:
> [vector.hs](./assets/code/vector.hs)

#### 3d trick

in 3d there is a convinent trick to compute the determinent **as a human** and abstract away a lot of the tedius recursion.


Theres a lot of versions of this involving copying things down in differnet ways, but the following is a convinent one is from [geeks for geeks](https://www.geeksforgeeks.org/trick-to-calculate-determinant-of-a-3x3-matrix/) and works wonderfly.

![alt](./assets/images/determinent3d_trick.svg)
