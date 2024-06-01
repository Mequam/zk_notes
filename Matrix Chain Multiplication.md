---
id: 3gsjd2pzus3pjwp7gq813i0
title: Matrix Chain Multiplication
desc: ''
updated: 1668183519726
created: 1667842354396
---

## About

what follows is an algorithm for efficiently 
multiplying together matrixies

## Algorithm

note that matrix multiplication can be processed in any order (parenthasis don't matter)

![alt](./assets/images/matrix_multiplication_algo_lema.svg)

while the order does not determine the outcome of thte multiplication **it does** effect how many multiplications need to be performed effect how many multiplications need to be performed.

![alt](./assets/images/matrix_multiplication_algo.svg)

the algorithm uses two tables, with table m keeping track of the minimum
required for the multiplication and table s keeping track of the minimum value of k required for the multiplication.

## Example

![alt](./assets/images/matrixMultiplicationAssign.jpg)
