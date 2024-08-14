---
id: 3k28gmmliv2o39we6xnn01
title: sap/ewm/processes/purchaseOrder
desc: ''
updated: 1723657512
created: 1723657512
---
# sap/ewm/processes/purchaseOrder

## About

these are the processes that we use to get goods into the warehouse


1). purchase Order
1.5). ASN
2). inbound delivery


![purchaseEWMProcess](./assets/purchaseEWMProcess.svg)

## Purchase Order

used to procure an item from the ERP side of things

When you create the purchase order, you must define whether you
expect a shipping notification from your supplier or not. Define this
using a confirmation control key (in our training system this is
“ANLI”) which is set at each purchase item level. You can
pre-define the control key either in shipping customizing, the information 
record, or in vendor master data.

If the confirmation control key is set, an inbound delivery document
must be created. The inbound delivery is based on the purchase
order. If the confirmation control key is set but the inbound
delivery not yet created, it is not possible to post a goods
receipt.

## Inbound Delivery

manditory to use the purchased material in a decentralized
ewm system, connected back to the purchase order

> these can be created manually when goods arrive

they contain the following information from a purchase order
(among others)

- Material to arrive
- Quantity of that material to arrive
- Plant and storage location

the process for copying this over is a little trickier than you would
initially think as there are two inbound delivery documents.

See the bellow screenshot for details

![inboundDeliveryProcess](./assets/inboundDeliveryProcess.svg)

### Inbound Delivery Notifications

this contains all data copied from the inbound delivery document in the

ERP system these only exist in external EWM not in embeded
and in external you can configure the system to skip them if you
want to

## ASN (advanced shipping notification)


usually sent from a  vendor to the warehouse over edi,

when it arrives the system generates an inbound delivery document

can contain the HU for the given operation


