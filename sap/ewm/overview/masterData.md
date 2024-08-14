---
id: zclx5pqttlo8j6a5m35w61
title: sap/ewm/overview/masterData
desc: ''
updated: 1723643171
created: 1723643171
---
# sap/ewm/overview/masterData

## About

contains several sections of master data information


BAPI : business application programming interfaces
    these are the primary way that applications send information
    to and from a EWM system and an ERP system

## SAP EWM

the primary sap warhouse management solution

can be standalone or embeded

the primary functions of EWM are as follows
- Inventory management at storage bin level   
- Storage bin determination for incoming goods 
- Stock removal for outgoing goods 
- Stock transfers
- Physical inventory management

> when decentralized, ERP focuses on inbound/outbound delivery
> EWM focuses on warehouse specific tasks (storage bin management among others)


the embeded EWM systm is still concidered decentralized, as the system
itself is decentralized (I think this is odd :/)


## Additional Functions For Warehouse Management

there are various extra functions provided by ewm in addition
to those previously stated

- Slotting
- Consolidation and deconsolidation
- Cross-docking
- Yard management 
- Complex internal routing
- Value-added services (VAS)
- Labor management
- Radio frequency identification
- Kit-to-stock / Kit-to-order

see warehouse management monitor
[sap/ewm/warehouseManagementMonitor](../warehouseManagementMonitor)
[sap/ewm/warehouseManagementMonitor](../warehouseManagementMonitor.md)


## EWM for complex supply chain networks

the product is designed for warehouses or distribution centeres with

- High throughput of various goods with differences such as:
    - Size
    - Weight
    - Serial number
    - Country of origin
    - Batch
    - Valuation
- Complex cross-docking and order-fulfillment requirements
- Detailed packaging and shipping logistics requirements



[sap/ewm/overview/deploymentOpt](deploymentOpt)
[sap/ewm/overview/deploymentOpt](deploymentOpt.md)

## Common Master Data Objects

you can use different warehouse management solutions in PARALLEL
for our ERP system

using different combinnations of warehouse master data you 
can manage your inventory differently

- plant : place we make stuff
- storage location : place we keep stuff
- warehouse number : phyiscal warehouse representation

these are given slots on the learning journey

for centralized

1. IM 
    inventory management, used with just plant and storage location
2. Lean WM
    warehouse number and define it as lean WM
    you have no stock in bin levels, but can create transfer orders for 
    picking and putaway for fixed beans
3. WM
    warehouse number + warehouse structures strategies, full 9 yards

for decentralized 

4. WM (LES)
5. EWM
6. SAP HANA EWM
7. non SAP EWM solution

[sap/ewm/overview/les](les.md)
[sap/ewm/overview/les](les)


