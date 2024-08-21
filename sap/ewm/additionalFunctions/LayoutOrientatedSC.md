---
id: igtf60evzfgyusj4o8huii
title: sap/ewm/additionalFunctions/LayoutOrientatedSC
desc: ''
updated: 1723730947
created: 1723730947
---
# sap/ewm/additionalFunctions/LayoutOrientatedSC

## About

this is used when products do not travel directly from source
to storage, but have to move around the warehouse

basically instead of thinking of the PROCESS of materials,
we think about the physical location materials have to go through


## Sample Putaway Process Flow

1. Unloading at door
2. Counting at the counting station
3. Identification of goods at the ID point
4. Putaway in the high-rack storage area

notice the focus on position, a process based look would follow more of bellow

1. Unloading at door
2. Counting at counting station
3. Putaway in the high-rack storage area



## Fields That Must Be Maintained In LOSC

Maintain the following fields for layout-oriented storage control:

    Maintain the source or destination storage type settings to control whether the storage control is applicable while receiving or issuing the goods, and whether the product movement is executed via an identification or pick point.

    Select the Whole HU indicator if you want to differentiate between moving a complete handling unit, an empty handling unit, or a partial handling unit withdrawal.

    Select HU type group to specify that a specific HU type, for example wire baskets or boxes, should always be moved via some specific intermediate storage type.

    Select the Intermediate Storage Type to specify the stock movement via an intermediate location, for example an identification or pick point.

    Optionally select an Intermediate Storage Section and/or an Intermediate Storage Bin to specify in more detail to where the product should be moved. If the intermediate storage section or bin is not defined, the defined putaway strategies are used to find the necessary data.

    Define the Warehouse Process Type to create the warehouse task for the intermediate storage location, and to specify which activities should be performed during warehouse task processing.

    If the intermediate storage type is an identification point, the system does not use the warehouse process type.
