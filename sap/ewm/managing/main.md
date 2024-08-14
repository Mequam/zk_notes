---
id: 29us0tgp331nynie652him
title: sap/ewm/managing/main
desc: ''
updated: 1723669066
created: 1723669066
---
# sap/ewm/managing/main

## About


## SAP EWM Warehouse Management Monitor

central tool to keep warehouse managers informed about
the current situation in the warehouse

contains alert monitoring capabilities

## Measurement Services

these can be used to define key figures for the warehouse.
that are supported by the system.



### TMS (taylored measurement service)

based on a BMS that we choose
we add special selction criteria to the BMS by creating a selection varient
(think where clause in sql?) 

the end result of that is a key figure in the unit of the warehouse


### CMS (calculated management service)

reuse of a tailored measurement service to build more complex formulas

A measurement service:

- Can be evaluated (reported)
- Returns a numeric value. In the case of non-numeric values, 1 is returned
- Can be used in the Easy Graphics Framework (EGF) or by other KPI reporting 
    tools
- Contains functionality to evaluate and list results
- Can be used to trigger alerts


these can be made of mathmatical methods combining TMS's together into
an expression which will then be evaluated

see bellow to get an example of the layout from SAP

![cmsConnectionExample](./assets/cmsConnectionExample.svg)

## Measurement Services

can be scheduled to run in the background and displayed in the warehouse 
cockpit where they automatically refresh

## KPI (key performance analytics)

With the Warehouse KPIs - Operations app, you can view an
overview of key performance indicators (KPIs) relevant to 
your warehouse operations,
for example, the total number of open warehouse tasks to be
processed on the current date. On the overview page, you can
see different types of KPI cards. As a warehouse clerk, these
cards help you to better manage and process your daily tasks.


---


just some stuff that needs more research that I didn't want
to have to go find again

//TODO: more of this

![managementProgramLayout](./assets/managementProgramLayout.svg)


