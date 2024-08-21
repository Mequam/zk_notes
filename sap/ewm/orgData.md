---
id: jaolc8s64jnafkovbh2cov
title: sap/ewm/orgData
desc: ''
updated: 1724167782
created: 1724167782
---
# sap/ewm/orgData

## About

contains information about the organizational elements inside of EWM


The warehouse structure in warehouse management is divided hierarchically and consists of the following elements:

## Warehouse number

The warehouse number is a four-character code that represents a single warehouse or warehouse complex.

## Storage type

A storage type represents a physical storage area in an individual warehouse. The technical, spatial, and organization characteristics are set in the customizing settings.

## Storage section

Each storage type can be divided into one or more storage sections. Storage bins with specific common attributes, such as storage bins for fast moving items that are close to the goods issue zone, are assigned to one storage section.

## Storage bin:

In each storage type you have one or several storage bins.
The coordinates of the storage bin indicate the exact position in
the warehouse in which products can be stored.

## Activity area:

An activity area is a logical grouping of storage bins. It
can refer to a storage type, or it can represent a group
of bins from several storage types. You can either assign storage
bins manually to the activity areas, or if there is a 1:1
relationship between storage type and activity area, you can have the
system generate the activity area and the assignment.
