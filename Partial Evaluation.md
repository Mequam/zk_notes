---
id: 3kdtwg4vo3gkxmi1p9i55lm
title: Partial Evaluation
desc: ''
updated: 1664319989286
created: 1664318976226
---

1. 
    ## Basics
    consider
    > f(x,y,z) = xS2y+xzS2-yz
    
    we can set x = 2 when we do this we get
    
    > x=2 => f(y,z) = 4y+2zS2-yz

2.
    ## Multi evaluation
    
    We can chain this indefinitly with any number of variables
    
    consider

    x=2,y=1 =>
    
    > f(2,1,z) = 4+2zS2-z

    this is by far easier to work with in order to perform operations on because we are much more familier with multi variable functions

3.
    ## Partial Functions
    we call all functions  g that are generated from setting x y or z constant a ***partial*** function of f

