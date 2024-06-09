---
id: 2vht9kupp8et8s62dmgg4e
title: math/continualDerivatives
desc: ''
updated: 1717957508
created: 1717957508
---
# math/continualDerivatives


# Spunk Math!

## About

what follows is a silly mathmatical definition of continus derivation
for practice, learning and fun ; even if it tends to not be the most practicle piece of work :).

Im not the best speller in the world, and im writing this in neovim (shoutout to my vim folks)
without a spell checker, so I kindly request that you take the math for the logic and not for spelling :).


## Definitions

There are many differnt math functions who we can take the derivative of. Often, we can take
derivatives many times from a given function. Despite this ubiquaty, the derivative is only
defined for integer functional composition ; you can't take 1/2 derivatives. Even though this
is definitly true in the raw sense of a derivative, could we not have a little fun trying
anyways? Even if our answer is a little silly at the end, there could be techniques and fun
tricks to learn along the way! So lets jump in!

## Slipin' n' Slidin' Functions

While there are certainly many different ways you could go about trying to do this,a good starting
point would be to concider exponential functions.

![axOrex.svg](./assets/axOrex.svg.svg)

In such functions when we take their derivative, we can notice that it is equivilent to sliding the function to the left or
right on it's graph. That is to say, that every consecutaive derivation of the function shifts it to the left by a constant amount!

![expSlipinSlide](./assets/expSlipinSlide.svg)
![2xSlipSlideGraph](./assets/2xSlipSlideGraph.svg)


we call the constant j that we need to shift the graph f by to take its derivative the *slipin slide* of
f.

That is.

![slipSlideDef](./assets/slipSlideDef.svg)

Not every function has a slipin' slide. For example y = mx+b very clearly does not differentiate
down to a shifted version of itself. Other functions have very obvious slipin' slides.
cos and sin for example have a slipin slide of pi/2 respectivly, indeed they are in some sense the same
function that we slip and slide around.


> An interesting note of these is that they also serve as shiftable integration if you shift
> the graph in the other direction. In fact I would conjecture that any graph with a slipin'
> slide could be continualy integrated or derived in either direction.

## The Continus Nonsense

For functions that do have a slipin' slide, it feels very natural to call a translation of 1/2 slipin' slide
in x the functions 1/2 derivative.

Indeed this is the foundational definition that we will be using for this idea and the primary "silly" idea
that we will be using.

![continusDerivativeDefinition](./assets/continusDerivativeDefinition.svg)


Thats all fine and dandy for functions that have slipin' slides, but for any other function we are dead
in the water for taking it's continus derivative. This is an unaceptable state of affairs to be in, as I would
muchly like to be able to take half derivatives of y=x, indeed it seems almost silly that such a simple function
can't be differtiated in this form.

If we could potentially take the continus derivatives of polynomial functions, we could use taylor exapansion on more complicated
functions to get their continual derivative, so they seem a prime candidate to try attacking next!

> Note that this assumes that we can distribute real powered derivatives in the same way we can
> for integer powered derivatives. This is an assumption I have yet to prove, if anyone has an idea
> on how you could prove that (or even if you could given these definitons) It would be very curious to see
> the proof!


## A Different Perspective

Perhaps if we could make polynomials somehow "look" like exponentials, we could use the slipin' slides that we had
already seen in order to take the continual derivative of any polynomial!

We are already a little bit of the way their given the definition of e^x as a taylor series.

![taylorEX](./assets/taylorEX.svg)

If we could just get a continus integration of any of these terms, we could integrate our way up through powers
to get the continual derivative/integral of any polynomial!

It turns out there is a way to isolate a single term from this infinit expansion!


## A Really Complicated Way To Write One

Concider what happens when we add the following sum together:

![infSumEx](./assets/infSumEx.svg)

Notice how we cancel every other polynomial term! Then dividing by 2 re-normalizes the sum to include the previous terms!
Certainly we are closer to iscolating one term, we have removed an infinit number of other ones! Of course the only problem
with that is there is still an infinit number of terms left :).

But perhaps this idea has promise, is there a way we could perform the same simplification again and cancel out even more terms
from the sum!

It turns out we can! We just need to use rotation/imaginary numbers to get the cancelation we are looking for!

![infSumExI](./assets/infSumExI.svg)

this cuts another half of the terms out!

This begs the question of wether or not we can keep going with this technique, inserting and dividing the sum at every step?
what we would need next is a way to cancel every other 4th power, so a number that is -1 at odd powers of 4 and 1 at even powers of 4.

We can use the imaginary unit circle to find our mystery number!

![NextRotationNumber](./assets/NextRotationNumber.svg)

This gives us the following equation!

![nextStepRotationNumber](./assets/nextStepRotationNumber.svg)

Since we are halfing the number of terms each time, the angle we need to cancel out each term also halfs at every step!
We can use this fact to create an iterative summation of each iteration of the above process.

![ClosedFormWIPProof](./assets/ClosedFormWIPProof.svg)

From here we can take the limit of the process as we do it more and more up to infinity. Since the only term that never gets
removed as we perform more and more operations, the only surviving term is one!

![complex1](./assets/complex1.svg)

## Putting It Together

Since we can write 1 as a sum of exponential functions, we can now theoreticaly translate each inner exponential function
by a proportion of its slipin' slide to take the continus integral of 1, and therfore integrate up to any polynomial!

Bellow is the derivation of the slipin' slide for e^mx

![exponentialSlipinSlide](./assets/exponentialSlipinSlide.svg)

Using this we can get the final equation to represent our continual integration!

![continusDerivationOfOne](./assets/continusDerivationOfOne.svg)

> Note that to get polynomials, we place in negative values of r
> to integrate one up the the desired power


## Note

For negative inputs, the continus derivative of a polynomial appears to return a complex number, this has the effect of 
making the left side of the graph rotate around the real-imaginary axis, perfectly hitting the real real plane when we 
take an integer integration value.

You can see this very strongly in the blend file of the function.

---

## Code Examples

### Computation

the following python code can compute the continual integral or derivative of 1

```python
import cmath as m

def integrate_one(amount : float, x : float,accuracy : int = 8)->complex:
    return derivate_one(-amount, x,accuracy)

def derivate_one(amount : float, x : float,accuracy : int = 8)->complex:
    ret_val : complex = 0
    delta_angle : float = 2*m.pi/(2**accuracy)
    for i in range(2**accuracy):
        t = m.e**(delta_angle*i*1j)

        ret_val += m.e**(t*(x+amount*m.log(t)/t))
    
    return ret_val/(2**accuracy)
```

### Graphing

bellow are two graphing programs that display the results of this computation

graphing y verses x for more and more integration from 0-3

```python
import matplotlib.pyplot as plt
import continual_derivation as cde

detail = 100
start = 0
end = 3

delta = (end-start)/detail



for i in range(detail):
    plt.plot([x for x in range(20)],[cde.integrate_one(delta*i+start, x,10).real for x in range(20)])


plt.plot([x for x in range(20)],[cde.integrate_one(2, x,10).real for x in range(20)])
plt.plot([x for x in range(20)],[x**2/2 for x in range(20)],"r--")

plt.plot([x for x in range(20)],[cde.integrate_one(3, x,10).real for x in range(20)])
plt.plot([x for x in range(20)],[x**3/6 for x in range(20)],"b--")

plt.show()
```


graphs the real and imaginary values of continual integration from 0 to 50 at x = -10

```python
import continual_derivation as cde
import turtle

# graph the integration of 1 continual in the imaginary space

t = turtle.Turtle()
t.speed(0)

detail = 10000
start = 0
end = 50

delta = (end-start)/detail


scale=1/10 #for the size of the graph

print(("derivation amount","real","imaginary"))
for i in range(detail):
    point = cde.integrate_one(delta*i+start, -10)*scale
    print((delta*i+start,point.real,point.imag))
    t.goto(point.real,point.imag)

input("press enter to exit")

```
