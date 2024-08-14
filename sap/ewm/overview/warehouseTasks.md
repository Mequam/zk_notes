---
id: 84es3nmm1pggnroaw6j34m
title: sap/ewm/overview/warehouseTasks
desc: ''
updated: 1723664812
created: 1723664812
---
# sap/ewm/overview/warehouseTasks

## About

contains info about warehouse tasks activities and orders


## Warehouse Activities

A warehouse request enables the processing of warehouse activities.


Warehouse activities are:

- Picking
- Putaway
- Posting changes
- Stock transfers (within warehouse)
- Scrapping

These are performed using warehouse tasks and these documents are created
with reference to the respective Warehouse Request. Using the Warehouse 
Management Monitor, you can display and supervise all documents that are based
on a Warehouse Request.

> this seems to imply that you can have requests for each of the 
> different warehouse activities, need to double check this

## Warehouse Tasks

Warehouse tasks are used to execute good movements in the warehouse, 
and these movements may be physical or just stock changes.

- Picking
- Putaway
- Internal movements
- Posting changes
- Goods receipt postings
- Goods issue postings

The warehouse task is a document that tells the warehouse worker what to do,
for example, move x pallets of product y to storage bin abc.

Warehouse tasks are created when products are received, issued, moved,
or counted.

warehouse tasks are grouped by warehouse orders,
see the bellow graphic for more information

![warehouseTaskLayout](./assets/warehouseTaskLayout.svg)


often warehouse tasks will reference previously created documents,
like warehouse request items, but they don't have too. 

You can make a warehouse task without a reference doc if
you are moving stock from one bin to another bin in the system

## Warehouse Orders

grouping of warehouse tasks


warehouse orders can be created automatically following a set of rules
that you can see listed in the bellow graphic and per the following steps
from SAP

1. Warehouse tasks are grouped together according to the activity area
    in which they are sorted, using predefined rules.
2. For each activity area, one or more warehouse order creation
    rules are defined.
3. The warehouse order creation rules are applied until each warehouse
    task is assigned to one warehouse order. Filters and limits are
    used as necessary.
4. If rules cannot be used, an SAP-supplied standard rule is applied.

![warehouseOrderCreationRules](./assets/warehouseOrderCreationRules.svg)


### Warehouse Order Creation Rules

Filters and limit values: Control which warehouse tasks, and how many
warehouse tasks, SAP EWM groups into a warehouse order.

Sort rules: When SAP EWM applies a warehouse order creation rule,
it sorts the warehouse tasks according to the sort rule. Individual warehouse order creation rules can contain sort rules.

In addition to sort rules and filter and limit values, warehouse
order creation rules can also contain parameters for packing and consolidation groups.

Consolidation groups: During warehouse order creation, consolidation groups determine warehouse tasks
that are permitted to be bundled together.

In order to be processed, every warehouse task has to be
assigned to a warehouse order. If SAP EWM has applied all
user-defined warehouse order creation rules for the search sequence, and 
unassigned warehouse tasks still remain, the system uses a remainder rule.

Remainder rules: Create warehouse orders for any remaining warehouse tasks. 
SAP EWM summarizes these warehouse tasks per activity area, queue, and
consolidation group.

Standard rules: Group tasks per activity area, queue and delivery. If
the system cannot find a warehouse order creation rule for an
activity area, SAP EWM applies this rule.



