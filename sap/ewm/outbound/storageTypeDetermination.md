---
id: 0lm7yfuxbfq8fghzxt4r64
title: sap/ewm/outbound/storageTypeDetermination
desc: ''
updated: 1724266940
created: 1724266940
---
# sap/ewm/outbound/storageTypeDetermination

## About

When creating warehouse picking tasks for goods issues, the system determines
the source bins of the quantities of the product to be
picked. The system must first, however, determine the storage types which
are to be considered for stock removal.

## Storage Type Search Sequence

this contains a list of storage types that the system should
search for removable stock.

Instead of a list, it can also contain a storage type
group. This group also contains a list of storage types. The
difference is as following:

- When the storage types are assigned to the storage type search
    sequence, they have a sequence number. This means that the system
    searches in the storage types one by one, uses the sort
    criteria from the stock removal rule, and stops when enough stock
    has been found. So not all storage types might be considered.

- In a storage type group the system first assembles
    the information of all the relevant quants in the included storage
    types and then applies the stock removal rule.

An additional parameter in the storage type search sequence controls whether
stock in transportation units (TUs) is to be considered.
