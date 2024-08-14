---
id: w8xex76o318wgikq48g0pe
title: sap/ps/projTable
desc: ''
updated: 1722868611
created: 1722868611
---

# sap/ps/projTable

## About
contains info about the project table in SAP

## Useful fields

MANDT : project client
pspnr : project id of type "ps_intnr"
PLFAZ : planned completion date
PLSEZ : planned finish date
CPCURR : custom project currency
pspid : project definition (name?)
post1 : project description
vbukr : company code for the project
bprof : budget profile
verna : name of person responsible

## Data Types
```
ps_intnr : numeric type 8
```

## Joins

the jcds table potentially contains data baout the completion
dates of a project and can be acessed by joining on the objnr field of the project
