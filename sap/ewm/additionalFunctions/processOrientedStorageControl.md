---
id: uq6dx53o32xtq1hvsgmzn8
title: sap/ewm/additionalFunctions/processOrientedStorageControl
desc: ''
updated: 1723730760
created: 1723730760
---
# sap/ewm/additionalFunctions/processOrientedStorageControl

## About

### Reasoning

according to SAP warehouse motions are rarely a single
task from A to B, they often involve complex movements

additional examples of process steps
that may be required in warehouse movements

- Counting
- Quality Inspection
- Deconsolidation (unpacking into individual HUs)
- Value-added services
- Packing

you can really get a feel for why SAP would say this
from the following graphic

![warehouseTaskExample](./assets/warehouseTaskExample.svg)


### Definition

it is for this reason you can define paths for products to follow
using process oriented control

you can see examples of this in the bellow task
![processExample](./assets/processExample.svg)

### Handling Unit Warehouse Tasks

these are manditory for moving a product to an interim storage location

In a putaway process the final WT is a product warehouse
task, in a picking process the first WT is a product
warehouse task. All other WTs are handling unit warehouse task.

when using Process Oriented Storage Control you can either have the
last bin in the process selected automatically, or dynamically during
the movement of the goods

if it is selected you can have the system reserve that bin to prevent
other goods from filling up that space.


