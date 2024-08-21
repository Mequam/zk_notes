---
id: 51f5wk56emuulj0oao9six
title: sap/ewm/integration/docStructure
desc: ''
updated: 1724103341
created: 1724103341
---
# sap/ewm/integration/docStructure

## About

sap has some very particular options for how documents are set up
in this version, the following diagram does a good job of giving a high level overview of the
provided information

![overview](./assets/sapEWMDocumentConfigurationOverview.png)

## EWM Delivery Document Integeration

TODO: figure out exactly what these delivery documents actually are

contains all data required to document and control a business process,
various documents are used in processing to conntrol the processes.

In EWM, delivery documents represent various delivery processes in the system.
In delivery processing, a series of service profiles on header
and item level are used to determine how the documents and
items are processed in SAP EWM. They also define the business
scope of the documents, that is, what functions are required in
the business processes.


like most SAP documents, it contains a header
and items under the header

these documents are about the delivery of goods

### use with ERP

these can be changed from the ewm side or the erp side of things

ERP has limiting changes, whereas EWM can allways make changes to the document
after it is distributed

documents can be

1. copied
2. changed
3. split
4. confirmed

and there is a corrisponding message for each that travels between
the EWM and or ERP

> When EWM is connected to a S/4HANA system, certain fields in
> outbound deliveries can still be changed depending on the processing status
> in SAP EWM. For details see the “What’s New in SAP Extended Warehouse Management 9.5” on the SAP Help portal.

> Changes can always be done from the EWM side. A pick
> denial in an SAP EWM can result in delivery changes from
> the SAP EWM system to the SAP ERP system. Delivery splits
> in SAP EWM can also result in delivery document data to
> exchange between the SAP EWM system and the SAP ERP system.
> Another example is sending confirmations of deliveries from EWM for follow-on
> functions in SAP ERP (for example goods receipt or goods issue).

### Document Header

General data and data that is relevant for inbound and outbound delivery documents, posting changes, and internal stock transfers is contained in the delivery header. This data is valid for the entire document and includes:

- Goods receiving office or shipping office
- Scheduling data (for example, shipping or delivery date)
- Weights and volumes for the complete delivery
- Ship-from party, sold-to party, and goods recipient numbers

### Document Items

In the delivery document, items contain information related to individual products within the delivery.

The following are examples of item-related information:

- Product/material number
- Delivery quantity
- Weight and volume for item
- Location-related information such as goods receiving point or unloading point
- Dates such as goods receipt or picking date
- Tolerances for over and under delivery quantities

---

## Document Categorization

each section of the document is categorized by 

1. document category
2. document type

and 

1. item category
2. item type

for items and headers respectivly
document objects are made up of TWO of these in unique combinations

see [sap/ewm/documentCats](../documentCats.md)
see [sap/ewm/documentCats](../documentCats)

for more info on document categories

[sap/ewm/integration/documentTypes](documentTypes.md)
[sap/ewm/integration/documentTypes](documentTypes)

for more info on document types

### Combined Naming Convention

examples of document types combined with document categories can
be found bellow

type, category -\> name
INB,IDR-\>Inbound Delivery Notification
INB,PDI-\>Inbound Delivery
OUTB,ODR-\>Outbound Delivery Request
OUTB,PDO-\>Outbound Delivery Order
OUTB,FDO-\>Outbound Delivery
SRPL,WMR-\>Replenishment
SWHI,WMR-\>Stock Transfer
TWPR,POR-\>Posting Change Request
TWPR,SPC-\>Posting Change


a combination of document type and category is given a special name
in the sap system, you can also configure your own comvinations

SAP also has several pre defined combinations of item category and item type,
but they do not list them in the learning journey

see [sap/ewm/integration/itemCats](itemCats.md)
see [sap/ewm/integration/itemCats](itemCats)

and 

[sap/ewm/integration/itemTypes](itemTypes.md)
[sap/ewm/integration/itemTypes](itemTypes)

for more info on item categorization

---

## Service Profile

In EWM, delivery documents represent various delivery processes in the system.
In delivery processing, a series of service profiles on header and
item level are used to determine how the documents and items
are processed in SAP EWM. They also define the business scope
of the documents, that is, what functions are required in the business processes.

[sap/ewm/integration/serviceProfile](serviceProfile.md)
[sap/ewm/integration/serviceProfile](serviceProfile)



