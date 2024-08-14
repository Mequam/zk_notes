---
id: 490fg5sbqdpdqe9g7b1ls2
title: sap/ewm/outline/packingSpec
desc: ''
updated: 1723650789
created: 1723650789
---
# sap/ewm/outline/packingSpec

## About

determines how a given product is stored and packaged in the SAP system

for example they can determine how much of a product goes into a pallet,
so when we recive more of a product, we can automatically make
quant/amount type to place in the pallet


they can be used for specifically

- palletization
- picking HU's


## Fields

packing specifications have a set of fields that are used to 
store data

Header
    The name of the packaging specification, the user who created it,
    and its status.
Contents
    The name of the product to be packed or the number
    of another packaging specification.
Level
    The level associated with the packaging specification. (A packaging specification can
    have one or more levels).
Element Group
    The element group associated with the packaging specification. (A packaging specification
    can have one or more element groups. An element group can
    have one or more elements. Element groups can be re-used.)
Element
    A packaging material and/or a work step.


## Packaging Material

these are materials that are used to package a product,
think pallets

these must be defined as products using fields unique to thier purpose
including max packing weight and max volumne

## Work Step

instructions for a warehouse worker on how to apply specific
step of packaging specification, these are assigned to packaging
elements


## Packaging Specification Determination and the Condition Technique

Packaging specifications are stored using the 
Integrated Product and Process Engineering
(iPPE) database engine. To determine if a packaging specification is to
be applied, the condition technique is used.

Packaging specification determination is used in following processes:

- During automatic packing in goods receipt processing (inbound delivery)
- Determining packaging material in warehouse order creation
- Determining packaging material in delivery processing (goods issue)
- Determining packaging material during consolidation
- Slotting
- During other internal warehouse processes, for example, palletization, 
    determining unit of measure, and so on.



