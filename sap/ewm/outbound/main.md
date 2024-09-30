---
id: oimxelleotui5psscb42yt
title: sap/ewm/outbound/main
desc: ''
updated: 1724260982
created: 1724260982
---
# sap/ewm/outbound/main

## About

this section is about processes that occure as goods leave the warehouse

## Goods Issue

the goods issue process follows the given document creation steps


ERP
    1. Sales Order
    2. Outbound Delivery
EWM
    3. Outbound Delivery Request
    4. Outbound Delivery Order
    5. Outbound Delivery

> Note that inbound delivery notigfication is replaced with outbound delivery request

### Outbound Delivery Order

this is the main document that is used in EWM and contains EWM relevent information
for the given system

other warehouse outbound delivery tasks are created referencing this order in the system.

the outbound delivery order can be configured to be created by the ppf framework,
the outbound delivery

see bellow for more details on the ppf
[sap/ewm/processes/ppf](../processes/ppf.md)
[sap/ewm/processes/ppf](../processes/ppf)

---

## Warehouse Process Type

When the outbound delivery order is created, the system determines a warehouse process type for each line item.

The warehouse process type is determined for each outbound delivery order
item during activation of the outbound delivery request. The warehouse process
type is then used in the picking warehouse task.

The following settings are required by the goods issue process:

- Warehouse Process Type 2 (stock removal)
- Activity: PICK (or any activity you have defined for process category 2)

Optional settings include the following:

- SI Controls: C (new stock identification)
- Automatic Wave Determination: Yes (if working with picking waves)
- Rough Picking Determination: Yes (if picking waves are defined by storage
    type or for the order-related replenishment)
- Destination Storage Type/Bin:
    normally used to specify the final destination location from where the goods are staged or loaded

---

## Stock Removal Strategy

determines how we pick stock from storage to send out,
I think this is probably the most relevent when your stock is
not highly cerialized stock, like your picking ONE bottle from a group
as apposed to like a specific magic card from a set of cards

the end result of this process is

1. storage type where the goods are picked from
2. stock removal rule that sorts goods by quant we want to pick

these are determined from paramaters in

- outbound delivery order
- warehouse product master
- haz material subset master
- packing specification

basically the stock removal strategy written as a haskell function would
look like the following

outbound delivery order -> warehouse product master -> haz mat submaster \
-> packing spec -> (storage type, stock removal rule)

### Stock Removal Strategy Input Paramaters

these are a list of paramaters provided by SAP that change how the system
chooses its stock removal strategy

- Warehouse number :
    This is the only mandatory parameter. The warehouse request has the warehouse on the header level.
- 2 Step Picking flag:
    This is used for the allocation step in the 2 step picking process.
- Stock Removal Control Indicator:
    This indicator is taken from the warehouse product master. This indicator
    is normally used when a product has special picking, packing, processing, and/or staging requirements.
- Warehouse Process Type (Group):
    This is taken from the ODO.
- Quantity Classification:
    This is taken from a packaging specification or an alternative unit of measure.
- Stock Type (group):
    This is taken from the ODO.
- Type - Sales Order Stock or Project Stock:
    This is taken from the ODO.
- Stock Usage:
    This is taken from the ODO.
- Hazard Rating - 1 and 2 :
    This is taken from the hazardous ratings for the product in the ODO. 

### Access Strategy

if you use many paramaters in your stock removal strategy the system can be slowed
down as it has to run calculations for each object you indicated in the stock removal 
strategy

Access Strategies are designed to help with this problem

im not sure I quite understand these yet so im going to incliude the sap text on the matter bellow

FROM SAP:

Note that the number of these indicators/parameters used in the actual
EWM application can have a performance effect on the search. For
example, if you use the stock removal control indicator from the
product master, and there are products with different stock types, or
products that are managed in special stocks (such as sales order
stock), the number of required entries in the storage type search
sequence table could be large.

To reduce the number of entries, define an access strategy for
the storage type search sequence determination table. The system uses this
strategy to search using the following logic:

1. The system checks whether there is a group assignment for the following entries:
    - Warehouse process type
    - Stock type 

2. If the group assignment for these entries exists, the system uses
    the group code to read the storage type search sequence determination table.
    The system attempts to read a completely qualified entry, in other
    words, all relevant parameters from the outbound delivery order, all indicators
    from the warehouse product and, where available, from the dangerous goods
    master in the storage type search table.
    If the system cannot
    find any entry in the storage type search table, it attempts
    to re-read this table using the access strategy.

---

## Storage Type Determination

When creating warehouse picking tasks for goods issue, the system determines
the source bins of the quantities of the product to be
picked. The system must first, however, determine the storage types which
are to be considered for stock removal.


see bellow for more details

[sap/ewm/outbound/storageTypeDetermination](storageTypeDetermination.md)
[sap/ewm/outbound/storageTypeDetermination](storageTypeDetermination)


---

## Stock Removal Strategies

method used to determine the bins
from which to pick one or more quants
of a product from stock.

this occures after the system has
determined storage type from the storage
type search process

the search for quant occures within a
storage type or within a storage type
group

see 

[sap/ewm/outbound/stockRemovalStrategies](stockRemovalStrategies.md)
[sap/ewm/outbound/stockRemovalStrategies](stockRemovalStrategies)

---

## Direct Outbound Delivery Order

there are certain times when the standard outbound delivery processes
need to be expidiated for whatever reason, 

in such circomstances direcft outbound delivery orders can be used
to bypass standard steps that exist in the system and get through the process
faster.

you can perform this action under the following circomstances

- Pickup:

    When goods are to be directly picked up by the customer
    or a carrier without the usual sales order processing in ERP,
    direct outbound delivery orders are beneficial.

- Immediate deliveries:

    For urgent shipments where goods need to be immediately dispatched without
    waiting for the standard sales order process, direct outbound delivery orders
    come in handy.

- Kit to stock or reverse kitting:

    When products are assembled or disassembled in the warehouse (kitting or
    reverse kitting) and need to be sent out without going through
    the usual sales process, direct outbound delivery orders are used.

- Scrapping:

    If goods are determined to be unsellable, defective, or obsolete and
    need to be removed from inventory immediately, a direct outbound delivery
    order can be created to manage the scrapping process.
