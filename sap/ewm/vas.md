---
id: urfc7q8g5lkq6lvl96ynha
title: sap/ewm/vas
desc: ''
updated: 1723643684
created: 1723643684
---
# sap/ewm/vas

## About

these are tasks that are performed by warehouse workers that "add value"
to a product along the supply chain

> they are created with reference to an outbound delivery order
> or the required packing specifications
> per sap test question -_-

### Examples

- assembling products
- packing products
- labeling products
- oiling products

---

## VAS Order

this is the centeral document that controls value added services
from the EWM perspective

it contains the configuration information necessary to tell
employees how to perform the value added service.

they are created with reference to an inbound delivery or an outbound
delivery

for info on internal and outbound deliveries checkout the bellow links

[skillstorm/sap/outboundDelivery](../../skillstorm/sap/outboundDelivery.md)
[skillstorm/sap/outboundDelivery](../../skillstorm/sap/outboundDelivery)

[sap/ewm/overview/ErpEwmDifferences](overview/ErpEwmDifferences.md)
[sap/ewm/overview/ErpEwmDifferences](overview/ErpEwmDifferences)




### Contents

1. order header
2. list of VAS activities
3. items
4. Auxiliary products

### Order Creation

the order can be created manually or automatically.

automatic order generation works under the following circomstances

1. when the warehous request document is created
2. for an inbound process, when the goods reciept posting is made


## VAS Data

The VAS data from the VAS order can be viewed or
printed for employees in a VAS work center. VAS data can
also be viewed in the warehouse management monitor.

You can record the auxiliary products and the quantities used for
the value-added services performed at work centers. 

Examples of auxiliary products
used in VAS processing are products such as packaging materials, strapping,
shrink wrap, hangers, labels, and miscellaneous supplies.

Consumption can be
recorded for all auxiliary products in the system if:

- Consumption has been set for auxiliary products required for value-added
    services
- A storage bin has been assigned in the VAS work
    center for the auxiliary products

## storage control variations

VAS vary depending on the storage control variation that you are using

see 

[sap/ewm/additionalFunctions/processOrientedStorageControl](additionalFunctions/processOrientedStorageControl.md)
[sap/ewm/additionalFunctions/processOrientedStorageControl](additionalFunctions/processOrientedStorageControl)

and

[sap/ewm/additionalFunctions/LayoutOrientatedSC](additionalFunctions/LayoutOrientatedSC.md)
[sap/ewm/additionalFunctions/LayoutOrientatedSC](additionalFunctions/LayoutOrientatedSC)

for different storage controls within the system

process oriented storage control uses handling unit tasks for movement
in the warehouse

additionally it requires you to use HU for the tasks in the warehouse

