---
id: hqvkdo3pfyzv6a3d83qh0v
title: sap/ewm/additionalFunctions/batch
desc: ''
updated: 1723734749
created: 1723734749
---
# sap/ewm/additionalFunctions/batch

## About

A batch describes a quantity or partial quantity of a certain
material or product that has been produced according to the same
recipe, and represents one homogenous, non-reproducible unit with unique specifications.

basically its a collection of things that are processed together, think all the grains of
rice in a jar bieng one batch


## Master Data

batches are master data and are managed in 
an sap ERP system and are distributed to EWM using
the CIF (core data interface) or ALE (idoc)

- CIF is for EWM business suite
- ALE is for decentralized EWM on S/4 HANA

the batch classification system is used to store these batches




the following snip is from SAP and helps illistrate the process

![batchSetup](./assets/batchSetup.svg)

### EWM Master Data Copy

interestingly both EWM and ERP store a copy of this particular master data,
however the data stored in EWM can change depending on the version of the software
that you are using.

1. in SAP S/4HANA based decentral EWM you have the same data transacitons as in ERP.
2. in SCM based decentralized EWM you have a seperate transaction for the display,
        maintenance or creation of a batch.

> In an embeded EWM system no seperate copy of the data exists,
> becuase that would be stupid :D

## Batch Level

this inidcates the organizational level at which this batch is made to be unique

the are three different levels for this

1. plant
2. material
3. client

> Up to SAP EWM 9.3, only the Material level and Client
> level were supported for batches. Since release 9.4, SAP EWM also
> supports the Plant level for batches.

---

## Creation Process

batch creation can happen at various times

1. before you create the inbound delivery in ERP
2. you can create a batch during the creation of the inbound delivery in ERP
3. Created In EWM, this will be auto copied to ERP via a remote function call

batch data is distributed and sent to the EWM system using the previously mentioned methods,
typically through an idoc (ALE)


diagrams from SAP to help follow the processes more are listed bellow
![ERPtoEWM](./assets/ERPtoEWM.svg)
![EWMtoERP](./assets/ewmBatchToERP.svg)

when copying data over from EWM to ERP you place the batch information in the inbound delivery,
there is limited inforamtion that can be placed here regaurding batches, info that can be placed
and copied over only includes

1. production date
2. shelf life expiration date
3. country of origin

other characteristics must be maintained in the batch record, which can be done in ERP.

> It very much seems like ERP is the prefered way to do it, and then in EWM
> you do it that way if you have too and its a bit clunkier

---

## Batch Determination

you can choose to mark batches to be sold,
you could also setup batch determination to automatically
mark a batch to be sold and sent out of the warehouse,

since batches include things like medicine it makes sense that you would
sell all of the items in a batch at once

batch determinations are configured in ERP and use key fields to search for batches
that match in the EWM system

SAP give the example of choosing customer and material as a "filter" example

batches can be determined in several ways

- determination in sales orders
- determination in deliveroes
- determination with EWM

the last one is intereting as EWM does NOT have the capibilities to perform batch determination,
instead you read in information about batch determination requirements from ERP, and determine
how best to fulfill those requirements in EWM


