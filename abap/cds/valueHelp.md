---
id: qh9nsh5szwm1x7v6ez23jd
title: abap/cds/valueHelp
desc: ''
updated: 1728413168
created: 1728413168
---
# abap/cds/valueHelp

## About

value help is used to auto suggest values for the user inside of an application

it is a core UI feature of SAP and highly recommended if not manditory for any 
useful user product

## Example

place this somewhere in your cds view

```cds
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: 'ZAPET_VH_PERSON',
          element: 'pernr'
        },
        useForValidation: true
      }]
      pernr
```

name is the name of a cds element that we want to target to get the value help from,
we can make a cds element to pull from a local table if we want to use value helps from
SAP internal sysstems
