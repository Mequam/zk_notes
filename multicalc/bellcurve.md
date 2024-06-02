---
id: tvtym0mydy3v0lk1t30i3i
title: multicalc/bellcurve
desc: ''
updated: 1717300585
created: 1717300585
---
# multicalc/bellcurve

## About

equations in the form A^x make a bell curve shape when 0 < A < 1 and you take the
interplex of the function. You can see a proof for that bellow. 

this means theres probably some connection between a bell curve probablilty and
multiplication which is kinda neeto :).


## Proper standard distrobution

interestingly enough not every value of A will be a valid standard distrobution
as the area under the graph will range from infinity to zero (although you could 
rescale the graph), delightgully however, there is one value of A where the graph
defaults to anormal distrobution mu=0, std=1/sqrt(2pi)

the value for A that makes that true turns out to be e^-2pi, and the proof for that
can be seen bellow

![standardDevWithA](./assets/standardDevWithA.svg)

## Images

![multi bell definition](./assets/multi_bell_definition.svg)

