---
id: ur9onnmhvbb075nuu4liuqf
title: Variable Difference
desc: ''
updated: 1665542355769
created: 1665542355769
---
> Hmm. This Plate must not be calibrated to someone of your... generous... ness. I'll add a few zeros to the maximum weight

-GLaD0S
___

## Definition

![alt](../assets/images/variable_diff_equation.svg)

## About

We have previously seen how to take efficient differences of functions that are one unit apart.

While this is moderatly useful, it is often desireable to get the differnce of a function when changing x **by more than 1**.

The trick to doing this is to realize that increasing the distance we sample from is **equivilent** to decreasing the size of the function.


changing the sample rate 

![alt](../assets/images/smaple_graph.svg)

is the same as expanding the function

![alt](../assets/images/smaple_graph_expand.svg)

we can represent this mathmatically

![alt](../assets/images/scale_over_a.svg)

of course if we evaluate the difference of $$f(ax)$$ we don't get $$f(x+a)-f(x)$$ we end up  with an unwanted factors of a front of x.

So in order to get the function we want, we re index!

![alt](../assets/images/scale_re_index.svg)

