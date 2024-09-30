---
id: 4w0uo9wbqhptkylsdbqvvz
title: sap/tables
desc: ''
updated: 1722892466
created: 1722892466
---
# sap/tables

## About

list of tables and their usage in the sap system

both of these tables contain change log information
about documents in the sap system one is for line items the other for 
headers, idk which tho so play with them for usage

CDHDR 
CDPOS
## List of tables

t001w : contains a list of plants
MARD : contains a list of materials in plants
    - LABST : contains the count of the item in the plant
    - WERKS : plant id where the stock of the item is to be stored
    - MATNR : material number
MATDOC : presumably replacement table for mard
    - WERKS : plant id where stock is stored?
    - LGORT : activity are (ROS / AFS)
    - bukrs : company code
    - lgort\_sid : activity area
    - menge: amount / quantity in stock
    - [obnoxious add riddled link](https://www.se80.co.uk/sap-s4-hana-tables/?name=matdoc)

