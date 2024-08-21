---
id: 17s7h2ozusvdop7mkyma10
title: sap/ewm/processes/ppf
desc: ''
updated: 1723658482
created: 1723658482
---
# sap/ewm/processes/ppf

## About

Post Processing Framework

follow up mo

provides tools to 

- plan
- start
- monitor

which offer functionality for 

- printing
- sending emails 
- sending faxes
- starting workflows 
- starting badis
- starting business addins

converts inbound delivery notification into inbound delivery


## Connection To Warehouse Tasks

for each warehouse request item, the ppf may create a warehouse tasks
automatically in the background, if not you can create one manually

see [sap/ewm/overview/warehouseTasks](../overview/warehouseTasks)
see [sap/ewm/overview/warehouseTasks](../overview/warehouseTasks.md)

## Connection to service definition

Message/output control for delivery processing uses Post Processing Framework (PPF). The
PPF is a Basis component that generates actions from the data
of an application according to an action definition (for example, the
printing of a delivery note). PPF provides the tools for scheduling,
starting, and monitoring actions. Actions are saved in an action profile,
which is linked to the document type.
