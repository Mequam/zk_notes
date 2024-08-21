---
id: 92n5xjjrlvv18u23g9rha8
title: sap/ewm/overview/outlineMasterData
desc: ''
updated: 1723645223
created: 1723645223
---
# sap/ewm/overview/outlineMasterData

## About

see 
[sap/ewm/overview/masterData](masterData.md)
[sap/ewm/overview/masterData](masterData)

section overview from the learning journey

## Plant

A plant is a location where goods are produced (manufacturing plant)
or stored (distribution center) and where services are provided. 

A plant is assigned to a company code, which is a Financial Accounting
organizational unit.

Storage locations are assigned to a plant and keep
the stock in view of inventory management. Because of this, at
least one storage location is necessary.

## Storage Location

single location where we store goods

this does NOT contain substructures as those are stored in 
the EWM system using the warehouse number not in the ERP system

---

## Warehouse Number

this represents the physical warehouse, and is the main warehouse object
used in the EWM system

every warehouse number has a substructure that maps the spatial
relationship in the warehouse complex in detail.

### SCU - supply chain unit

in EWM each warehouse number must be assigned a supply chain unit or (SCU)
theses have to have the business attribute INV - Warehouse

SCU is a physical or oganizational unit that is used within a logistics
process

SCU contains essential information such as country region and time zone.

> the timezone of the warehouse from the SCU is used
> when displaying all date and time fields

### Forms (storage type)

these are also called storage types and include

- various types of racks
- any open storage space
- goods receipt areas
- goods issue areas

they are represented as a group of warehouse bins with similar
characteristics

## Storage Bins

lowest level of organizational structures assigned to a 
storage type and storage section (if there is one).

also have a Storage bin type, not to be confused with storage type it
indicates things like the size and nature of the bin.


storage bins are the physical location where goods are stored

these can be assigned a type (form)

you can define addtional attributes for a storage bin including:

- Storage bin type:
    Used to indicate the relative size of a bin and/or actual bin dimensions.
- Bin access type:
    Used to control how a bin is accessed by resources.
- RF verification field:
    Used in (radio frequency) RF scanning to verify that the
    correct bin is being accessed.
- Geo-coordinates of storage bin:
    Used by SAP EWM to compute distances between the bins in goods movements.
- Capacity checking attributes (max weight, volume, total capacity):
    Used to control the amount of product to be stored in a bin.
- Fire containment section:
    Used in product hazardous material reporting.

> storage bin types are limited to bieng 18 characters


additonaly storage bins can recive a cordinent for access
see bellow for more details

[sap/ewm/overview/binCord](binCord.md)
[sap/ewm/overview/binCord](binCord)

## Storage Type

phyiscal or logical subdivision of a warehouse complex

characterized by:

- warehouse techologies
- space required
- organizational form or function


these are represented by a 4 character code defined when customizing 
SAP EWM.

### Storage Type Role

storage type roles give settings for putaway removal or goods movement.
These are attached to a storage type

[sap/ewm/overview/storageTypeRole](storageTypeRole.md)
[sap/ewm/overview/storageTypeRole](storageTypeRole)

## Storage Section

A storage section is an organizational subdivision of a storage type.
It joins storage bins that have similar attributes. This information is
then used during the putaway process. The criteria for joining these
bins (or the attributes of the bins) can be defined in any way, for example:


- Heavy parts
- Bulky parts
- Hazardous materials with certain characteristics
- Fast-moving items
- Slow-moving items



## Linkage Of ERP to EWM systems

to activate warehouse management in The ERP system
we link pplant and storage locations to warehouse numbers



## Activity Area

warehouse activities ocure in activity areas. Storage bins are logically
grouped into activity areas to make sorting easier.


basically you would want storage bins that need to be accessed faster in
a specific area of the warehouse

- putaway
- picking
- physical inventory

are examples of tasks that can occure in activity areas

## Packing Specification

determines how a given product is stored and packaged in the SAP system

## Product Master Data

stored in the EWM to link to a master record (see [sap/ewm/overview/ErpEwmDifferences](ErpEwmDifferences.md))

contains

- product properties
- product unit of measure
- product classification

---

## Seperation of ERP and EWM

since these are distributed systems, some master data lives in ERP
and some in EWM

[sap/ewm/overview/ErpEwmDifferences](ErpEwmDifferences.md)
[sap/ewm/overview/ErpEwmDifferences](ErpEwmDifferences)


