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

## External Verses Internal Steps

As a prerequisite, the complete storage process is defined in customizing.

SAP delivers predefined internal steps. These are not changeable and they
define the storage process type. Examples of internal steps are: loading,
unloading, counting, packing, deconsolidation, putaway, and staging. The sequence of internal
steps is predefined for each incoming or outgoing process or internal movement.

You can define as many external steps as you want. External
steps must be assigned to a corresponding internal step. The external
step can optionally detail the destination storage bin.

### List Of Internal Steps
- loading
- unloading
- counting
- packing
- deconsolidation
- putaway
- staging


---

## storage process (order?) determination

The storage process is determined depending on the direction of the
warehouse request. For inbound movements, the storage process comes directly from
the warehouse process type determined in the warehouse request. For outbound
delivery orders, the storage process is part of the warehouse order
creation rule (which is explained in a separate unit).

You
can enter process steps to a storage process only in a specific sequence.

For the putaway process, this is as follows (the list shows the internal process steps):

1. Unload
2. Count
3. Deconsolidation
4. Quality inspection
5. Value-added service (VAS)
6. Putaway

For the stock removal process, this is as follows:

- Remove from stock
- Value-added services (VAS)
- Pack
- Stage
- Load

