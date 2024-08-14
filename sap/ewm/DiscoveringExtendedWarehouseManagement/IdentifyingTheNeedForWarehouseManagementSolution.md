---
id: zzk50wolnj4myl4mkpqumo
title: sap/ewm/DiscoveringExtendedWarehouseManagement/IdentifyingTheNeedForWarehouseManagementSolution
desc: ''
updated: 1723556836
created: 1723556836
---
# sap/ewm/DiscoveringExtendedWarehouseManagement/IdentifyingTheNeedForWarehouseManagementSolution

## About

you can break down SAP's warehouse products by category


### private cloud edition and on premise edition

these offer extended warehouse management as either a decentralized system
that is seperate from the main SAP ERP system, or as a system embeded inside of SAP ERP
both options utilize S4 HANA as the primary database, in the case of the decentralized
there are two hanna databases involved


resons to use decentralized warehouses

1. decentralized is prefered for high volume warehouses as it has seperate downtimes from the main ERP system
2. decentralized allows you to connect multiple erp systems into one system
3. dedicated performance for the warehouse system seperate from main ERP

reasons to use the embeded system

1. one system so data redundency is greatly reduced
2. direct access to master data from the warehouse system
3. direct read and write of actual data

## SAP S4 HANA public cloud editon

this only contains the embeded warehouse management and a standalone solution
is NOT provided


