---
id: cl9ikjhans2o1v3r97l5mx7
title: multi variable limits
desc: ''
updated: 1664923046020
created: 1664919804755
---

___

## About

similarly to limits in the single variable case,
for mutliple variables we say a limit is the vector s.t. we can allways pick a smaller delta value around that vector and $$f(x,y,z)$$ will allways be within that sphere



___

## Generalization To Higher Dimensions

inputs of our multi variable functions are coming from $$R^{n}$$ and get maped into some other space $$R^{o}$$

we can generalize the definition of a limit to work on any set of points.


if someone gives some interval distance for our output. The limit of a function is the output in $$R^{o}$$ s.t. for any given distance from that output, we can choose a set of points closer to (a,b,c) and generate an output with LESS distance to the target point

> for any E>0 there is d > 0
s.t. $$abs(f(x,y,z))-L<E$$

___

## Special Cases

1. ### Limits Don't Exist
with single variables there are a few ways for limits not to exist
    1. f goes to infinity
    2. f is not continous

there are (presumably) other ways for this to be the case when working with more than one variable

concider

> $$f(x)=sin(pi/x)$$

> $$lim(x->0)(f(x))$$

at x = 0 the function has infinit frequency

this function will be zero at all points x = 1/n where n is an element of Z

2/(4k+1) gives us all ones

in fact we can find any point sequence
that will be equal to ANY number between 0 and 1

this means that the limit is not defined

similar behavors can happen with multi variable functions

___

## Partial Functions And limits

concider $$f(x,y)=xy/(x^2+y^2)$$

this is undefined when (x,y)->(0,0)

so what is lim(f)((x,y)->(0,0))


> we can analize this using the partial functions

if we take lim(f(x,0))(x->0)

we get a straight line every where but when x=0

so the limit (of the partial function) is 0

the same is true for the partial function of y

**however**

we can approach 0,0 from the diagonal direction, as apposed to straight from the x from the x partial or straight from the y on the y partial

we can notate that with
lim(f(x,x))(x->0)

when we evaluate this we get 1/2 !
that doesn't match up! whats worse, if we approach from the negative regions of the graph, we can make the function output -1/2

___

### Line Maddness



what if we plug in ANY line that goes through the origin?


we can use the equation for the line to do this!

lim(f(x,mx))(x->0)

lets evaluate!


when we do that we find that the limit cannot exist because we can set the limit to ANY value from -1 to 1
