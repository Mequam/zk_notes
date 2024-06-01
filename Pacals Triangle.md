---
id: mttmgcfmo554bjhagbvifwf
title: Pacals Triangle
desc: ''
updated: 1665283742598
created: 1665267272264
---

> WOW BABY A TRIPPLE!

___

## Introduction
Pascals triangle is a (highly) useful construct of numbers studied by Blaise Pascal.

Its definition is as follows.

> the first row is 1,
> for every other row
1.  apply two ones to the ends of the row.
2.  each other number in the row is the sum of adjacent numbers in the previous row

this definition is much easier to see visualy.

![alt](../assets/images/pascell_example.svg)

Note the colors here are chosen arbitraily to make the addition property of the tirangle more obvious.

___

## Combinatorics

A perhaps not so obvious fact about the triangle is its connection to combinatorics.

It turns out that combinatorics have the strange property that

![alt](../assets/images/combinatorics_pascalls_pascalls_property.svg)

this fact results from properties of the factorial function, and is fairly straightforward to derive algebraically. 

A Proof is provided bellow


![alt](../assets/images/proof_of_combinatorics_pascall.svg)

Lets think about what this property means. Treat n as a row. Concider treating n as a "row" and r as a "column"

![alt](../assets/images/row_column_combinatorics.svg)

when you do that, you see the the combinatoric equation has the strange property, that EVERY combinatorics is the sum of two adjacent elements in the previous row.

![alt](../assets/images/combinatorics_pascalls_pascalls_property.svg)

This taken with the fact that (0 x) is equal to 1 and we get an and we form an induction proof that every number in pascells triangle can be computed with the output of a corisponding combinatoric equation.


Wonderfly these equations are "0 indexed". We can use this as a natural "coordinent system" for the numbers inside of pascalls triangle. 

The following is the triangle created from combinatorics for reference. Note the one to one color mappings with the triangle displayed previously in this section.

![alt](../assets/images/pascell_example_comb.svg)

> This means that for every corrisponding fact about pascals triangle, there is an equivilent fact about the combinatorics function

this fact will prove supreimly useful in further proofs

## Differences

Concider the diagonal rows of the triangle. Colored seperately in the bellow picture.

![bno](../assets/images/pascalls_triangle_rows.svg)

Notice that because of the additive property of pascells triangle, each row is the sum of the row to the left, starting from 1.

bellow is the above row graph, with the **differences** of each row written in small numbers inbetween the larger ones and lines drawn in for the addition of the last term.

> Notice how the differences will allways share a color with the previous row

![alt](../assets/images/pascalls_triangle_rows_differences.svg)

> This means that the
 [[IntegerCalc.Difference]] of a row in pascals triangle is the **previous row**

and equivilently

![alt](../assets/images/combinatorics_triangle_feature.svg)

