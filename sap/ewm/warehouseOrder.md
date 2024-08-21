---
id: ibzgyxk9jll79ts1x7dh7c
title: sap/ewm/warehouseOrder
desc: ''
updated: 1724276049
created: 1724276049
---
# sap/ewm/warehouseOrder

## About

these are the primary documents in SAP EWM
they represent an order for an employee to perform

I think they might be related to the document structure that we previously looked at

[sap/ewm/integration/docStructure](integration/docStructure.md)
[sap/ewm/integration/docStructure](integration/docStructure)

## Creation Steps

1. - Wave release/Warehouse task creation:

    The process begins when the system releases a wave and creates warehouse tasks or when warehouse tasks are directly created, with or without a reference to a warehouse request.

2. and 3 - Grouping:

    The system sorts single task items and groups them by activity area. Which activity area is used for this (source or destination), is controlled by the warehouse process type.

4. - WOCR determination:

    The system determines warehouse order creation rules based on the activity
    area and the activity from the warehouse process type. As soon
    as SAP EWM applies a WO creation rule, it sorts the
    warehouse tasks according to these sort rules. Sorting is used by
    warehouse order creation to sort the warehouse tasks that are assigned
    to a warehouse order. A maximum of 15 sort fields can
    be configured for each warehouse task sorting rule.

5. - Apply item filters:

    The system applies item filters, which check an individual warehouse
    task for the defined filter criteria. Examples of filters include minimum/maximum
    weight, volume, processing time, and route. SAP EWM checks whether the
    given item filter fits. If the filter fits the warehouse task,
    SAP EWM continues processing for the warehouse task. If it does
    not fit, SAP EWM stops processing the warehouse task and goes
    to the next task in sequence.

6. and 7 - Consolidation group and subtotal filters:

        SAP EWM determines the consolidation group based on customizing settings that
        indicate the items that can be packed and shipped together in
        a system-guided process (step 6). This means that in the putaway
        process, you can work with distributive putaway, or the products can
        be packed together.

        The system can apply a filter on
        the subtotal level (step 7), such as limits set in Customizing.

8. - Apply limits and create warehouse order:
    The system creates the warehouse order (step 8). The warehouse order
    is the work package that is assigned to the user for
    execution. The size of the warehouse order is controlled by defining
    limits, like how many items or how much weight the warehouse
    order should contain. Within a warehouse order, the system can again
    sort the warehouse tasks. For a picking process the system also
    can create pick HUs.

9. - Use the next WOCR:

    This process continues using the next warehouse creation rule until all items
    have been processed.


## Warehouse Order Creation Rule

several profiles control the warehouse creation process

here is an SAP bonified list of creation rules

- Creation category: Set the WO creation category, such as consolidation
    group, pick path, pick-pack-pass, load and unload, or physical inventory.
- Item filter: Define item filters in Define Filters for WO Creation Rules.
- Subtotal filter: Define the subtotal filter in Define Filters
    for WO Creation Rules. WO creation uses the subtotal filter for
    consolidating group rules and comparing the values defined here with the
    corresponding subtotals at consolidation group level.
- Limit: Define the limit
    for the size of a WO under Define Limit Values for
    the Size of a WO.
- Inbound Sorting: Choose one of
    the sort sequences defined in Define Sort Rules for Warehouse Tasks
    for inbound sorting. EWM uses this sort sequence at the beginning
    of WO creation.
- WO Sorting: 
    Choose one of the sort
    sequences defined under Define Sort Rules for Warehouse Tasks for sorting
    within a WO.
- Packing Profile: Choose a packing profile in
    Define Packing Profile for WO Creation to define the required pick-handling
    units.
- Ship.Pack.Profile: Choose Ship.Pack.Profile to define specific shipping handling units
    in WO creation.
- Preparation Time: This is the time required
    by an employee to prepare the processing of a warehouse order.
    This could include, for example, fetching the necessary paperwork or creating
    handling units.
- Dest.Stor: Define the destination storage type, storage section,
    and storage bin of the work center to which the WTs,
    which have been grouped using the current WO creation rule, should
    be taken.
- Storage Process: Defines the storage process in process-oriented
    storage control for outbound processes. For picking, enter a packing station
    as the destination for a WT by entering the destination storage
    type, destination storage section, and destination storage bin.
- Determine WkCtr:
    This indicator specifies that a work center should be determined for
    WOs constructed using this WO creation rule. This indicator is only
    effective if the WO creation rule is defined without a storage
    process.

## Sort Profile

these configure the order in which tasks are sorted in the warehouse and assigned to
a warehouse tasks

the sequence nubmer defines the sequence of the sort criteria

the sort field

## Item and Subtotal Filters

filters for warehouse creation rules use filters on warehouse tasks that are not yet 
assigned to a warehouse order

## Limit Paramaters Profile

information used to control the size and scope of the warehouse profile

using this task you can limit the quantitative properties on a given warehouse task / order
After warehouse order creation has checked the values for the
maximum limits, it checks the values for the minimum limits. If
these limits are not reached, the system cannot process the WTs
using the current warehouse order creation rule. If necessary, the system
processes these warehouse tasks using different WOCRs according to the search
sequence for warehouse order creation rules for each activity area and/or
activity type.

You can configure the Limit Parameters profile in
Customizing for SCM Extended Warehouse Management in Extended Warehouse Management → Cross-Process
Settings → Warehouse Order → Define Limit Values for the Size
of a Warehouse Order.

## Packing Profile

this determines pick handling units for warehouse tasks
The following fields comprise the packing profile:

- Packing mode:
    Choose either simple algorithm, complex algorithm, or the use of a BAdI.
    With the simple algorithm, you can only define one packaging specification
    with one packaging material per packing profile. The complex algorithm uses
    multiple possible packaging specifications to determine the optimum pick handling units
    from the various packaging materials, and their number.
- Sorting:
    Specify the sort sequence that you previously defined in Define Sort
    Rules for Warehouse Tasks. Before determining the pick-handling units, warehouse order
    creation sorts the WTs according to this predefined sort sequence.
- Create HUs:
    Select this indicator if you want EWM to create the proposed
    handling units automatically. Do not set this indicator if EWM should
    propose the packaging material, but should not create the HU.
- Split WT During Packing:
    Select this field if you want EWM to
    split warehouse tasks during determination of a packing proposal for optimum
    filling of a handling unit. Choose Do Not Split, if EWM
    should not split warehouse tasks. Choose WT Split, if EWM should
    partially split a warehouse task that is too large for the
    largest given packaging material type. Choose Always Split, if EWM should
    always split warehouse tasks to fill pick handling units as completely
    as possible.
- Skip WT:
    Select this indicator if EWM should
    skip a warehouse task that no longer fits into the pick
    handling unit. EWM then continues processing from the next warehouse task.
- Check LWH:
    Select this if you want EWM to
    take length, width, and height into consideration when determining a packing
    proposal for the warehouse order.

## Warehouse Order Creation Rules

In customizing, you can see an overview of a WO creation
rule, including information about the following settings that you have defined:

- Filter at item level (in Define Filters for WO Creation Rules)
- Filter at subtotal level (in Define Filters for WO Creation Rules)
- Limit values (in Define Limit Values for the Size of a WO)
- Inbound sorting (in Define Sort Rules for Warehouse Tasks)
- WO sorting (in Define Sort Rules for Warehouse Tasks)
- Pick-HU packing profile (in Define Packing Profit for WO Creation)
- Shipping HU packing profile (in Define Packing Profile for WO Creation)

### Pre Defined

SAP EWM contains two predefined warehouse order creation rules. These rules can not be customized and are used as fallback.

-     The WOCR UNDE is used for warehouse tasks which are left when the customer defined WOCRs have been processed.
-     The WOCR DEF is used if no WOCR is assigned to the activity area / activity or the warehouse process type.


