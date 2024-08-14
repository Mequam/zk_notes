---
id: syd1dzzpdq427e7n4ly3e1
title: sap/ewm/DiscoveringExtendedWarhouseManagement/ProcessingAGoodsReciept
desc: ''
updated: 1723557559
created: 1723557559
---
# sap/ewm/DiscoveringExtendedWarhouseManagement/ProcessingAGoodsReciept

## About

## Posting Goods Reciepts for Purchase Orders

inbound delivery documents are used for the put away of information in the SAP system

these inbound delivery documents need to be synced between the warehouse management system and our local system

there are also aparently "LE inbound delivery doucments" and "EWM inbound delivery docs" that get converted back and forth
(e.g. if one is made first the other will be made after using the prior)

### Inbound Delivery

there are two kinds of inbound delivery types in the SAP system

1. LE delivery : logistics execution inbund delivery in the ERP system, sends info to EWM
2. EWM delivery : enterprise warehouse management document

the EWM document is the basis for creating the warehouse tasks for putaway and creating a goods reciept

the LE can be created automatically or manually, in both cases the inbound delivery is replicated.
can also be created at time of reciving products manually in EWM.


> basically these can be made a variaty of ways,
> but they both are converted back and forth between eachother


> NOTE LE = logistics execution

---

## Packing During Goods Receipt

packing occures when goods arrive at the warehouse

### Packing Information

- packing infromation can be from a supplier with a shipping notification
- packing information can create a handling unit (HU)
- HU information is copied from the inbound delivery

if no packing information is recieved you can enter it manually while running through physical goods
reciepts

> the master data record "packaging specifications" contains info on HU and other packing information


packing specs may also be generated automatically if preconfigured (this includes the HU)
these are typically used for pre existing conditions from how suppliers want their goods
packaged so the supplier does not have to constantly specify packing information

---

## Creating Warehouse Tasks For Putaway

### What Is A Warehouse Task?

warehouse tasks are created for the phyiscal movements in a warehouse

these become grouped into warehouse orders

warehouse tasks contain all necessary info to move an object

1. what should be moved (hu or product)
2. from what storage bin to where

they MAY, but do not have to, be created with reference to an existing document like a GR
^ they usually have no reference for internal movements


### Warehouse Orders

warehouse orders represent a work package that a warehouse employee should excecute at a 
specific section in time. Basically their a thing that needs to get done in the warehouse.

warehouse tasks are grouped into warehouse orders based on warehouse order creation rules

a warehouse order contains [1..] tasks (see minecraft distance notation)

### Warehouse Order Creation Rules

warehouse order creation rules define which warehouse tasks should be grouped together

this can be based on 

1. source or destination storage type
2. limit the number of tasks that can be assigned to one order
3. specify the maximum weight an order can contain
4. specify the maximum time a task in the order can have


---

## Processing Warehouse Orders

warehouse orders are allways processed by a resource

### Resources

these are just things in the warehouse that can move goods
they could be 

1. persons
2. automated machines

they are used to fulfull a warehouse task

warehouse orders may be assigned to a resource in several different ways

1. automatically using a queue (system assignment)
2. manually from a worker / manager
3. manual selection from the user that IS the resource


### Queues


A warehouse queue is a logical file to which warehouse processing is assigned tasks

basically its the queue for warehouse tasks

warehouses can have more than one queue, inbound and outbound queues are given as an example
from SAP

### Types Of Mobile Devices

not necessarily phones or handheld, could be larger devices attached to work vehicles,
mobile phones are THE example tho.

### Quality Management

HU is moved to quality inspection work center
or HU is inspected at the goods reciept area

the choice between these two options depends on warehouse size
and capacity.

could happen in goods reciept area (staging area) and
typically is performed early on in the process when the 
goods arrive to the warehouse

after QA goods are moved to their storage area.




