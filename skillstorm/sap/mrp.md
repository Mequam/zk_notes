---
id: cvign6l1a4483mmsu4nmm3
title: skillstorm/sap/mrp
desc: ''
updated: 1720555302
created: 1720555302
---
# skillstorm/sap/mrp

## About

## MRP Concepts

### mrp group configs

spro -> materials management -> consumption based planning -> define / maintain mrp group

maximum mrp interval : 
    the amount of time for the system to go before running mrp
safety stock :
    amount of extra stock to have on hand for a given material
creation indicator : 
    do we create planned orders purchase requisitions or schedule lines
    for materials that should be purchased externally


### MRP T Codes

ME5A : list purchase requisitions in the system

MD0X : t codes to run mrp
    MD02 run for specific material

OMX3 - set a material ledger into a plant

CKM9 : query material master record info

### Mrp Field Settings

[mrp settings](https://help.sap.com/doc/saphelp_scm700_ehp02/7.0.2/en-US/4e/30c95360267614e10000000a174cb4/content.htm?no_cache=true)


## Purchase Requisiton Stuff

ME51N : create a purchase requisition for procurement

## Creating A Plant


[plant resource](https://community.sap.com/t5/enterprise-resource-planning-blogs-by-members/creation-of-new-plant-for-an-existing-company-code/ba-p/13437962)



### Plant Definition

Tcode: SPRO

Enterprise Structure -> definition -> logistics general -> define plant
this also gives you a list of plants


### Storage Location Defintion

spro -> Enterprise Structure -> materials management -> maintain storage loc.

spro -> enterprise structure -> definition -> materials management -> maintain storage loc.
