---
id: ckmbzbhys1sbkqbgh2mwo0
title: sap/ewm/additionalFunctions/serialNumber
desc: ''
updated: 1723734536
created: 1723734536
---
# sap/ewm/additionalFunctions/serialNumber

## About

unique number that identifies a product

> product number and serial number are a unique combination

serial numbers can be up to 30 characters in length in EWM, but
ERP compatibility requires an 18 character restriction.

apparently a BAdi exists that maps SAP EWM to ERP numbers
if required.

### Serial Number Profile

four character code created in customizing.

> created in cutomizing

determines business transactions and rules for creating serial numbers.

product master records that require serial numbers MUST have a serial number
profile assigned to them.

There are two different serial number profiles that are maintained and assigned to the material master data in ERP. They are:

1. LES serial number
2. Serial number maintained in view WM Excecution

\#1 only applies to ERP and is used for delivery documents
\#2 is used in serial numbers in SAP EWM (what you would expect from the name)

> From SAP S/4HANA 2020 on you can set up Harmonized Serial
> Number Profiles. This enables you to maintain the ERP and the
> EWM serial number settings in one LE serial number profile. This
> harmonization can be used for embedded EWM as well as for decentral EWM.
> -SAP


### Warehouse Dependence

serial numbers profiles can be defined globally for all warehouses of a client,
or indicated to be a warehouse specific serial number that only applies to a given warehouse

additionally you can indicate 4 different fields of requirements for a serial number

1. Document Items (A.)
2. Warehouse Number Level (B.)
3. Serial Numbers In Inventory (C.)
4. No serial number requirement (D.)

each of these have different (or no in the case of d) requirements
for how you serialize the item in the warehouse and what items need to 
be serialized. 

you can see the bellow graphic for where each of these are actually required
for use within the system

![serialNumberRequirements](./assets/serialNumberRequirements.svg)

TODO:
> as of now I am not yet sure if these are the direct cause of making a serial number
> warehouse dependent, or a seperate option in addition to warehouse dependence
> more research here is required

### Copying Rules For Serial Numbers

ERP and EWM share serial numbers back and fourth,
with ERP using 18 character serial numbers, and EWM 
being able to go up to 30.

EWM copies the serial numbers from the ERP System in both the goods receipt and goods issue processes.


#### Goods Reciept

EWM copies from ERP if an appropriate serial number profile
is configured for the product

note that you can make changes to copied serial numbers up until the goods
reciept posting

if there are NO serial numbers specified in ERP then you create one before
the goods reciept posting with the proper serial number profile

^ thus is proabably because its possible to recieve goods straight at a warehouse so
there will of course there will be no serial code

#### Goods Issue

EWM copies from the ERP outbound delivery into the internal outbound delivery
    if you have determined the serialization for the product in the product number profile,

you cannot make changes to the copied serial numbers in the goods issue process

if no serial numbers have been specified in the ERP outbound delivery, then you must specify
    the serial number before the goods issue posting using the serial number profile.

for "serial number requirement for document items" or "serial number requirement at warehouse number level"
    serial numbers can be entered during the confirmation of the warehouse task in the outbound delivery order

for "serial number requirement in inventory management"
    serial numbers have to be entered during the confirmation of the warehouse task
    and are copied to the outbound delivery order

according to SAP serial numbers are typically entered before the goods reciept
posting

---

## Provisional Serial Number

these begin with a $ and have 30 characters

they can be assigned automatically ?

in a deconsolidation work center, the provisional serial number must be replaced
with a final serial number

> provisional numbers do not live in the ERP system and instead live only in EWM,
> they are not copied nor do they touch ERP. Thats part of (mby all of) the reason why
> we use deconsolidation work centers
