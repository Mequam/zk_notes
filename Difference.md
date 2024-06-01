---
id: i0plcdfd8ofzikftd07t2ex
title: Difference
desc: ''
updated: 1665277615908
created: 1665253797760
---

___

> You're a villan, just not a super one.

> What's the difference?

> *Presentation!*

___

## Definition

The primary focus of integer calculus is the difference between terms of functions.

Concider the function.

$$y = mx$$

Many students begin learning algebra by analizing the terms in this sequance as we increase x by 1.

We can write this analysis using a table.

![alt](../assets/images/table_example.svg)

Of course in this case we set m equal to 1, which leads to a rather boring pattern :).

Setting m = 2 leads to some more interesting behavior.

![alt](../assets/images/2x_table.svg)

Typically, the first thing that students are taught when analizing such patterns is that the difference between each term is m, in our case 2! 

While this analysis is a fantastic way to teach linear functions, perhaps we can be more mathmatical with our statement. 

Concider what it means to say that to get the next term in the sequence, we add m.

This means that the *difference* between each term is m.

We can write that out more mathematically.

![alt](../assets/images/mx_difference.svg)

where f(x) is some term and f(x+1) is the **next** term.

This operation is **SO** common that it has a special name, delta, and a corresponding notation.

![alt](../assets/images/delta_of_f.svg)

Note that taking delta of f returns a NEW function, related but separate from f. We will call this function the **difference of f**.

Using this definition, it is very simple to show that the difference of mx is equal to m !

![alt](../assets/images/linear_diff_proof.svg)

Of course a "kind" simplification of f(x) is far from garenteed. While mx tends to behave "kindly" to us we could easily imagine a function where there is no such simplification on delta f

___

## Further Notation

For a multi variable function

![alt](../assets/images/multi_variable_difference.svg)

