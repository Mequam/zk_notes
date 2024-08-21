---
id: be046qg15rd1pw4qin8m71
title: sap/ewm/masterData/dataTransfer
desc: ''
updated: 1724184887
created: 1724184887
---
# sap/ewm/masterData/dataTransfer

## About

contains info about the transfer of data from ERP to EWM
from SAP

this is very similar to the bellow links, except coming straight from an SAP
source

[sap/ewm/overview/ErpEwmDifferences](../overview/ErpEwmDifferences.md)
[sap/ewm/overview/ErpEwmDifferences](../overview/ErpEwmDifferences)


## Two Kinds Of Data

SAP provides two kinds of data that can be sent over in the transfer

1. master data
2. transactional data

## Different Names

some data gets a different name from ERP to EWM

ERP -> EWM

material master -> product
customer vendor -> location / scu business partner
plant shipping point -> location / scu

## CIF

core integration framework (also called qRFC)

this is used to send inforamtion from ERP into EWM


## ALE

ALE / IDOC is used to transfer data to a decentralized EWM system that is running
the S/4 HANA database

The following master data is distributed via ALE:

- Materials
- Customers
- Vendors and Carriers
- Addresses
- Batches
- Class system: Characteristics master
- Class system: Classes master
- Class system: Classification master


The initial master data transfer for the different objects is triggered manually.

- Characteristics with transaction BD91
- Classes with transaction BD92
- Materials with transaction BD10
- Batches with transaction BD90
- Customers with transaction BD12
- Vendors with transaction BD14

After that you use change pointers to create IDocs for transferring
master data changes. This can be done manually, but it is
expected that you automate this by scheduling the program RBDMIDOC with
variants for the different message types.


