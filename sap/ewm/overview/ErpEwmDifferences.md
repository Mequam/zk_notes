---
id: l8x3uzucsqhsx4vdkxo7s8
title: sap/ewm/overview/ErpEwmDifferences
desc: ''
updated: 1723645821
created: 1723645821
---
# sap/ewm/overview/ErpEwmDifferences

## About


since these are distributed systems, some master data lives in ERP
and some in EWM

this represents my current understanding of the deliniation
of that master data

[sap/ewm/overview/outlineMasterData](outlineMasterData.md)
[sap/ewm/overview/outlineMasterData](outlineMasterData)

for an overview of ewm features
[sap/ewm/overview/ewm](ewm.md)
[sap/ewm/overview/ewm](ewm)

---

## ERP

in tab order of assignment
```
warehouse number
    storage location
        plant
```

## EWM

```
warehouse number
    forms (storage types)
        storage bin
    storage sections
        storage bin
```

storage bin's are assigned to both storage sections
everything is assigned a warehousen umber

whats more is that this warehouse number is connected to the ERP
system which will have a corrisponding (potentailly different) warehouse
number

---

## Master Data Link

master data can occasionally be copied from the ERP system into the
EWM system, there are slightly different names when this occures

- ERP -> EWM
- plant and shipping point -> location / SCU
- customer and vendor -> location / SCU and business partner
- material master -> product
- ASN -> (advanced shipping notification)
- ppf -> post processing framework (used in EWM)
- SCM -> supply chain management
- CRM -> Customer Resource Management ?
- tms -> taylored management service
- bms -> basic measurement service
- CMS -> calculated management service
- VDM -> virtual data model
- KPI -> key performance analytics
- WT -> warehouse task
- HU -> handling unit
- LE -> logistics execution

---

## Inbound Delivery

inbound delivery confirmation is sent from the EWM to the ERP system
so that any changes to the inbound delvery document are reflected in both
systems

Inbound Delivery With the status "Execution Completed" is the basis
for the Proof of Delivery document generated in ERP


