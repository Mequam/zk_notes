---
id: co5rskutvvetd4hk08njse
title: sap/ewm/overview/binCord
desc: ''
updated: 1723647370
created: 1723647370
---
# sap/ewm/overview/binCord

## About

storage bins need data to know how to get them
this is called a bin cordinant

A bin coordinate is 18-characters in length, for example, the coordinate
01-02-03 would be a storage bin in aisle 1, stack 2,
and level 3. Note that the bin coordinate assigned to a storage bin is unique 
within the warehouse.


Define the bin coordinate structure or "coding" by assigning a unique
character to represent these components of the bin coordinates:

1. Aisle
2. Stack
3. Level
4. Bin subdivision
5. Bin depth

Use this coding to create templates to generate the storage bin
master data automatically.

> these appear to be ordered from another question I read later
> I would put the order to memory potentially.
> these might also be configured differently on different systems?
