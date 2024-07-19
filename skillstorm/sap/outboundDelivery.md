---
id: 1ybnsvu655xdkfni8yv0by
title: skillstorm/sap/outboundDelivery
desc: ''
updated: 1719493459
created: 1719493459
---
# skillstorm/sap/outboundDelivery

## About

theese contain all data required for triggering and monitoring the complete
outbound activity


### Goods Issue Posting

when the goods issue is posted in SAP extended warehouse management


### Warehouse Tasks

1. picking : getting stuff from storage
2. putaway : moving recived stuff to designated positions
3. internal movements : transfer of goods from one location to another
4. goods receipt postings : records receipt of goods into the warehouse
5. goods issue postings : removal of the goods



---


## Picking and Colelctvie Process

all about prepareing or providing goods for delviery to the customer

often involves using a printout of a picking list

### Collective Processing

introduce picking via collective 
process by selecting work list form 
all outbound deliveries ready for entry

## Goods Issue

When these guys get posted they integrate with many other modules
in SAP


1. updates quantities in Inventory Management
2. updates value change in stock account (FI) debit COGS (cost of goods sold)
3. creates additional accounting docs for CO
4. updates billing due list
5. updates statuses in all associated sales docs
6. generates a material ledger doc
7. creates delivery process

### Quality Management Integration

goods are inspected upon delivery

can include specific instructions for inspection

basically when we get stuff with a goods issue we intigrate
into a quality management automatically

> this is also where customer complaints are managed
