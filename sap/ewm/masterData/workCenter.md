---
id: lecit409y4acjb1c5hzfla
title: sap/ewm/masterData/workCenter
desc: ''
updated: 1724184312
created: 1724184312
---
# sap/ewm/masterData/workCenter

## About

work centers are places where work is performed, similar to ts410

in a warehouse the work center is assigned to a storage type and to a storage bin in this storage type.


The storage type for the work center must have a storage type role of

- Work Center (E)
- Pick Point (B)
- Identification and Pick Point (C)
- staging area (I)

You can use a work center for the following processes or activities:

- Packing
- Deconsolidation
- Counting
- Quality inspection
- Value added services

the work center layout controls what activities can be performed in a work center except
packing, which can be done in ANY work center regaurdless of activitie type


## Inbound Outbound Sections

An inbound section is used if there is more then one
possible work center, but the specific work center can not be
determined directly. This is usually the case, as a work center
has no capacity. That means you can not control how much
work is sent to a work center. The work centers share
an inbound section, and the system sends the products or HUs
into the bin of this inbound section. You then move the
HU from the inbound section to the work center using drag
and drop at the work center.

The outbound section is
helpful when HUs have been processed, but
have not been moved
to the next storage type. By moving
them to the bin in the outbound section, you know that
they are not relevant for the work center anymore.


You can give several work centers the same inbound and/or outbound section.

> basically these appear to be interfaces that access one or more 
> work centers for arbitrary inputs into the system.
> more research would be nice here though


