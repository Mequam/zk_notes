---
id: 7nnatmq690biwkxj26rw2d
title: sap/ewm/kit
desc: ''
updated: 1723747136
created: 1723747136
---
# sap/ewm/kit

## About

A kit is a list of products that are always delivered together. Examples of kits include the following entities:

- Groups of materials used to repair a piece of machinery
- Groups of materials used for assembly tasks
- Add-on products for other products
- Displays or assortments of products to sell in a retail store

interestingly kits are NOT master data, instaed kit information comes from
outbound delivery items from other SAP ERP systems.

## Components

- Kit header, which represents the finished kit
- Kit component, which represents a product in the kit
SAP EWM does not support "nested kits" (which are kits within kits).

The following rules apply to kits:

- A kit is always delivered in full to a customer.
- The kit header and kit components are always scheduled for the same date.
- All components for the kit must come from the same warehouse.
- Kit prices are always calculated at the header level.
- A kit header and the kit components have a quantity ratio
    to each other. This is defined by the kit structure.

## Kit To Order Process

The kit-to-order process, in its simplest form, consists of the following steps:

1. A sales order is created for the kit header in SAP CRM or in SAP ERP.
2. SAP EWM creates a warehouse request (outbound delivery order). This process
    triggers the kit-to-order process.
3. The kit components are picked and assembled into the finished kits.
4. The system confirms the delivery and the goods issue is posted for the kits.
5. The sales order is updated and the billing is triggered for the order.

