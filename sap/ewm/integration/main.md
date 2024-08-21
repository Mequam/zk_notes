---
id: 6ivaxryhc828z55p23hyxz
title: sap/ewm/integration/main
desc: ''
updated: 1724103422
created: 1724103422
---
# sap/ewm/integration/main

## About

## Delivery Document

contains all data required to document and control a business process,
various documents are used in processing to conntrol the processes.

like most SAP documents, it contains a header and items underneiht the header

delivery documents contain SIGNIFICANT amounts of actegorizations, I would
highly recomend using the link bellow if you want more



[sap/ewm/integration/docStructure](docStructure.md)
[sap/ewm/integration/docStructure](docStructure)

## Service Profile

[sap/ewm/integration/serviceProfile](serviceProfile.md)
[sap/ewm/integration/serviceProfile](serviceProfile)


## Successor Documents

as far as I can tell these are documents created from other documents inside
of the system

these get their type from 

source doc category + source doc type + target doc category = target doc type

delivery document type and item type determinations can be found in customizing under

- goods reciept
- goods issue
- internal warehouse processes

### Item Type Determination

there is also a section about item type determination that SAP is quite vauge on

the following graphic is provided by them indicating item types

![item type determination](./assets/images/itemTypeDetermination.png)

TODO: the heck is a hierarchy type?

---

## Mapping ERP to EWM

ERP document types have to get mapped to EWM document types

sap uses the following for document type determination

business system + erp doc type + initiator comm chain = ewm delivery document type


