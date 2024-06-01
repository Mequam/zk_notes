---
id: rwp9yubiprfnn2564d0qtxc
title: Multi Variable Visualization
desc: ''
updated: 1664320796316
created: 1664319383554
---
## References

- [[calc3.multiVariable]]
- [[calc3]]


---

1.
    ## Domain Coloring

    1. ### Ideas
    one of the ways that we can visualize a multi variable function, is by assigning all numeric outputs of our function with a single color

    We then color the entire domain by the corisponding color from our mapping
    
    > we call such a mapping a density plot 
    2. ### Pragmatics
        We can graph these in sage using a density partialEvaluation
        
        we use the function *density_plot()* in order to create a domain coloring of a function in sage
2.
    ## Contour Plot

    1.
        we can draw a line through all points where the function has a constant value

        > this is only going to work for you if the function is continous

        this should remind you of geography
    2. ### Sage Graphing
        we can use the contour_plot()
        function in order to use this technique in sage

        > the function takes a fill=False argumetn to turn OFF filling

        we can use labels=True to enable labaling of the plot
3.
    ## Surface plot
    given that the function takes two inputs, we could graph its output as a hight, centered over a 2d point

    this will give us a surface which we can interact with

> Note that we could use all techniques in our vizualization at the same time 
