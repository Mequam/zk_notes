---
id: 6gfjl1ico01t14e215q8o8d
title: Bi-Nomial Therom
desc: ''
updated: 1665284511682
created: 1665277997136
---

## Definition

![alt](../assets/images/binomialtherom.svg)

___

## Proof

Consider Simply $$(x+y)^{n}$$

We can re-write this as a two term product

![alt](../assets/images/binomial_therom_proof_step_1.svg)

In turn we can distrubte this accross x and y to get

![alt](../assets/images/binomial_therom_proof_step_2.svg)

fig. 2

Now concider the green term in the above equation. Notice how the X in that term will increase the power of every x inside of $$(x+y)^{n-1}$$ by exactly 1.

The same is true for the red term, but with y.

Now concider terms in the form $$x^{a}y^{b}$$. Concider graphing a point for these terms at (a,b). 


![alt](../assets/images/binomial_therom_proof_step_3.svg)

What will happen to this point as we increase the power of n?

Well there will be a copy of our point in the green component of the sum in fig 2. and a copy of our point in the y component of the sum in fig 2.

![alt](../assets/images/binomial_therom_proof_step_4_inside_of.svg)

and we just showed that every term inside of the green part of the equation would have the value of a in creased by 1, and every term inside of the red part of the equation have the value of b increased by 1.

> So our point is duplicated, and its dupicates move one unit to the right and one unit up

![alt](../assets/images/binomial_therom_proof_step_move_points.svg)

Now when the duplicates of two different points land on the same spot, it means that after we increase the value of n, BOTH of those points have the same powers of x and y, **so we add their products together.**

> This means that at every point, the constant, $$c$$, multiplying $$x^{a}y^{b}$$ will be the sum of the two previous points whos duplicates end on (a,b)

This is exactly the property that we saw in pascells triangle. Where every point is the sum of two adjacient points in the previous row.

> f(a,b) = f(a-1,b) + f(a-1,b-1)

Whats more, since $$(x+y)^{0}=1$$ we have a base clause for the pattern to start from.

This means that the costants of each term, must be the numbers found in the rows of [[pascells triangle|IntegerCalc.PacalsTriangle]]!

Since the [[triangle follows combinatorics|IntegerCalc.PacalsTriangle#combinatorics]] we can compute the desired sum by simply walking along the line $$y = -x$$ and taking the posotive (a,b) in that line times the combinatoric.

Writing this in summation notation the equation pops right out!

![alt](../assets/images/binomialtherom.svg)


___

## TODO: 

this page needs more cleaning, got tired finishing this so the later explanations of the proof are lacking

