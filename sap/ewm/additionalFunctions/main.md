---
id: lqxwkv302sga436eybg12x
title: sap/ewm/additionalFunctions/main
desc: ''
updated: 1723671266
created: 1723671266
---
# sap/ewm/additionalFunctions/main

## About

## Process Oriented Storage Control

according to SAP warehouse motions are rarely a single
task from A to B, they often involve complex movements

additional examples of process steps
that may be required in warehouse movements

see bellow for more info

[sap/ewm/additionalFunctions/processOrientedStorageControl](processOrientedStorageControl)
[sap/ewm/additionalFunctions/processOrientedStorageControl](processOrientedStorageControl.md)


---

## Layout Oriented Storage Control

this is used when products do not travel directly from source
to storage, but have to move around the warehouse

basically instead of thinking of the PROCESS of materials,
we think about the physical location materials have to go through


[sap/ewm/additionalFunctions/LayoutOrientatedSC](LayoutOrientatedSC.md)
[sap/ewm/additionalFunctions/LayoutOrientatedSC](LayoutOrientatedSC)

---

## Serial Number

unique number that identifies a product

> product number and serial number are a unique combination

serial numbers can be up to 30 characters in length in EWM, but
ERP compatibility requires an 18 character restriction.

apparently a BAdi exists that maps SAP EWM to ERP numbers
if required.

[sap/ewm/additionalFunctions/serialNumber](serialNumber.md)
[sap/ewm/additionalFunctions/serialNumber](serialNumber)

---

## Batch Management

A batch describes a quantity or partial quantity of a certain
material or product that has been produced according to the same
recipe, and represents one homogenous, non-reproducible unit with unique specifications.

basically its a collection of things that are processed together, think all the grains of
rice in a jar bieng one batch

[sap/ewm/additionalFunctions/batch](batch.md)
[sap/ewm/additionalFunctions/batch](batch)

---

## Quality Inspection


quality inspection is enabled in decentralized EWM via the 
quality inspection engine or (QIE) 

[sap/ewm/additionalFunctions/qualityInspection](qualityInspection.md)
[sap/ewm/additionalFunctions/qualityInspection](qualityInspection)

---


## Goods reciept example

note the routing like nature used here, I think that would imply
your using the Process Oriented Storage Control here to determine where
things go, but more research needed

1. transportation Unit arives at door
2. a task is created to move the HU from door to GR staging area
3. multiple products in HU => send to deconcolidation work center
4. put away task

![taskRouteExample](./assets/taskRouteExample.svg)

## Picking Example


![warehousePickingRoutingExample](./assets/warehousePickingRoutingExample.svg)
