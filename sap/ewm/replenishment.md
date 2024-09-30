---
id: ms6txedca5eplrtib8tb0p
title: sap/ewm/replenishment
desc: ''
updated: 1724334708
created: 1724334708
---
# sap/ewm/replenishment

## About

To ensure that you have adequate stock on hand for picking,
you can use the replenishment process to fill picking bins from
one or more reserve storage types.

basically as far as I can tell replenishment is about moving goods where
they are needed in the warehouse so that you have the necessary amount
in any given location.

## Used quantities

I see three main metrics come up again in usage with these algorithms

- minimum stock quantity
- maximum stock quantity
- replenishment quantity

minimum and maximum stock quantity are used when stock can't get bellow a certain 
threshold,

as far as I can tell replenishment quantity is used in addition to min and max when
we want to replenish BEFORE we hit minimum quantity.

## Replenishment Types

For each storage type you define the allowed replenishment types. There are four basic methods of replenishment:

- Planned replenishment
- Automatic replenishment
- Order-related replenishment
- Direct replenishment


### Planned Replenishment

in planned replenishment, we replenish items only when the stock is bellow a minimum quantity and
replenish up to a maximum quantity in the system

### Automatic Replenishment

the system runs repleneshment in the bacground when a new warehouse order is generated

the main difference between this and planned replenishment is that automated replenishment
runs automatically in the background when we confirm a new warehouse task

### Order Related Replenishment

this is used when we NEED to keep stock on hand for future orders
when the stock level drops bellow the required stock quantity in the
system, we order more.

Note that in this method the system rounds up not down, so it is possible
to go over the maximum quantity

### Direct Replenishment

we replenish in response to an exception of stock not bieng there
