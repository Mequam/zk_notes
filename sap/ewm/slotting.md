---
id: a95xyfvxaamui87qk02iao
title: sap/ewm/slotting
desc: ''
updated: 1724340578
created: 1724340578
---
# sap/ewm/slotting

## About

Slotting is the process of determining a storage concept for a product
by setting the storage parameters that control (mostly) the putaway of
the product. The slotting process can use a variety of data
to determine the putaway control parameters, such as the following:

- Product data, which is not warehouse specific
- Packaging data
- Demand forecasts


## Storage Paramaters


During slotting, the system determines control parameters and stores them in the product master.

The main parameters are as follows:

- Putaway control indicator (and, optionally, stock removal control indicator)
- Storage section indicator
- Storage bin types

All these parameters a determined using the condition technique. The storage
bin types can also be determined with storage bin type determination rules.

Besides the described parameters, the system can also determine maximum, minimum,
and minimum replenishment quantities (all for the replenishment process), and assign
fixed bins.


## Storage Bin Determination Rules

there are two settings for determining storage in slotting

1. storage condition techniques
2. storage bin determination rules

this is configured by paramaters at the storage type level for slotting


### Condition Technique

as far as I can tell this technique uses different metrics of the product
as conditions to determine where the product is slotted into in the system


### Determination Rules

The following storage bin type determination rules are available:

- Maximum Weight
- Capacity Factor: Material
- Simple Volume Check
- Simple Dimension Check
- Dimension Check with Z-Axis Rotation
- Dimension Check with Rotation and Tilt
- Weight Check and Simple Volume Check
- Weight Check and Simple Dimension Check
- Weight Check and Dimension Check with Z-Axis Rotation
- Weight Check and Dimension Check with Rotation and Tilt

For using storage bin type determination rules it is necessary to
maintain the relevant data (like dimensions) in the bin type.

---

## Slotting Process

slotting can be run manually or as a background job

The requirement/demand data can come from SAP Advanced Planning and Optimization
(APO). SAP EWM stores this information locally in the product master
on the Slotting tab, in the Requirement/Demand Data screen area. You
can also define these local attributes in EWM using data from
other sources. To do this, you have several processing options in
the product master, for example, manual input or mass maintenance.

One consideration when using APO planning data is that the integration of
SAP APO and SAP EWM is part of the Service Parts
Management (SPM) solution. SAP APO and SAP EWM manage requirement data
at different organizational levels. SAP APO performs planning processes for locations
of the Plant type. SAP EWM stores requirement data at the
warehouse number level. Slotting assumes that a 1:1 relationship exists between
the APO location and the EWM warehouse number. If the relationship
is not 1:1, you can use Business Add-Ins (BAdIs) for the
conversion.

## Save Options

The exact values that are updated when the results are updated
depend on the save mode that you chose when you activate
slotting. The save options are as follows:

- Do Not Save Results:
    Use this option if you have performed slotting interactively and you
    want to analyze the results. If you have performed slotting in
    the background, you can analyze the log, but you cannot see
    the results directly.
- Save Results:
    Depending on the storage bin and stock situations, it can be
    useful to save the results of slotting as planned values only
    in the product master. The system only keeps the planned values
    for a possible activation, and does not use them in storage
    processes.
- Save and Activate Results:
    The system updates the result of slotting in the fields for
    both the planned values and the active values in the product
    master. These new values are then available immediately for all storage
    processes.

You can use the fix indicator in the warehouse product to fix all
product attributes that can form the results of slotting. In this
case, the system does not overwrite these attributes during slotting.
