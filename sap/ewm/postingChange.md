---
id: qkr764479i7nqi4l9zumnw
title: sap/ewm/postingChange
desc: ''
updated: 1724332810
created: 1724332810
---
# sap/ewm/postingChange

## About

A posting change is a change in quant characteristics.

think unrestricted stock to quality inspection stock


## Process

these posting changes can be made from ERP or EWM.

ERP creates posting changes from the tcodes

- MIGO
- MB1B
- VLMOVE

once the process is created an outbound delivery order is
generated in ERP. ERP exports this order as a warehouse
request posting change in the EWM system

from here several different documents can be generated based
on what I belive to be configuration of the system.

See the following graphic provided by SAP for an overview.

![posting change overview](./assets/images/postingChangeDiagram.png)


## Settings

Based on settings in the warehouse process type, the posting change can be posted directly during creation of the warehouse request, or a warehouse task can be created for the posting change. The field Post. Change in Bin has the options:

- Posting Change always in Storage Bin:
For this the system requires a source determination based on the available information (like the WPT) and triggers a posting change immediately.
- Posting Change never in Storage Bin (Create Warehouse Task):
    The system requires a WT for the posting change. If you
    do not enter the source and / or the destination bin,
    the system requires a source (picking) and / or destination (putaway)
    determination accordingly.
- Posting Change According to Storage Type Setting: In the storage type a similar field is available. Here the options are:
    - Posting Change Always in Storage Bin
    - No Posting Change in Storage Bin (Create Warehouse Task)
    - Posting Change According to Mixed Storage Setting.
        If the posting change would create a mixed storage and
        it is allowed, no WT is required. If mixed storage is
        not allowed, a

## Creation From EWM

you can create posting changes from EWM in addtion to ERP and the process follows the bellow
diagram

![posting change EWM](./assets/images/postingChangeFromEWM.png)

## Stock Movement

similarly stock movements can be created in ERP and if they are relevent to the EWM they 
can be covnerted into an outbound delivery order in the system.

you can see the process this follows in the bellow diagram

![stock movement](./assets/images/stockMovement.png)

## Two Step Stock Transfer

you can set up a two step stock transfer that is initilized from ERP

the process for performing this transfer is shown in this delightfully unhelpful document

![twoStepStock](./assets/images/twoStepStockTransfer.png)

---

## Internal Stock Transfer (WR)

these can be created by

- Ad Hoc Movement
- Replenishment
- Rearangement

and they trigger

- warehouse tasks


### Adhoc Movements

these are movements that you create without a reference to a proceding document

you can create a warehouse task or an internal stock transfer that is warehouse
request

you can create document types and item types for warehouse requests



