---
id: xcq343ealox3cm39feh7ds
title: sap/ewm/additionalFunctions/qualityInspection
desc: ''
updated: 1723737298
created: 1723737298
---
# sap/ewm/additionalFunctions/qualityInspection

## About

quality inspection is enabled in decentralized EWM via the 
quality inspection engine or (QIE) 

## QIE (Quality Inspection Engine)

the quality insepction engine provides quality inspection in a
decentralized warehouse management environment.

the QIE provides services to trigger the following tasks:

- Inspection
- Creation of samples and calculation of sample size
- Printing of work papers
- Recording inspection results
- Decision about quality and quality-control levels

QI consumer refers to some system that uses QI functionality
these are usually external systems

the QI consumer can also be a part of a consumer system like
SAP EWM

these systems send requests to the QIE

> the QIE system is external to the standard ERP system
> it can connect to an external ERP system for complete
> QM functionality


### WAS (Web Application Server)

this is the development platform that QIE uses.

QIE is technically designed as an add on to other external systems
the add on is mandatory for the EWM. E.G. its a required add on.

---

## Quality Checks

quality checks can be performed at different stages.

- when the transportation unit is unloaded
- when the pallet is routed to an inspection area
- in set intervals for products in the warehouse


### Inspection Object Type

the kind of inspection done is controlled by the inspection object type

this determines how the QIE creates inspection documents and which documents
for any given object


SAP *helpfully -_-* provides a list of inspection object types that
can exist in the system

- Preliminary Inspection Inbound Delivery (1)
- Preliminary Inspection Handling Unit (2)
- Counting Inbound Delivery (2)
- Q-Inspection Returns Delivery
- Q-Inspection Product/Batch Inbound Delivery
- Q-Inspection Product/Batch Warehouse-Internal
- Defect Processing (3)

(1) this inspection object type is only available in SCM based
EWM up to SAP EWM 9.5.

(2) these inspection object types are only available in a decentral
EWM, but not in embedded EWM.

(3) this inspection object type is only available in embedded EWM.


### Inspection Rule

Another requirement for inspections is an inspection rule. An inspection rule
describes an inspection in further detail, for example:

- What shall be inspected, for example, a material, a delivery type,
    or deliveries from a specific vendor?
- How shall the inspection be performed, for example, on a sample
    or with 100% inspection?

In embedded EWM, it is not necessary anymore to use inspection rules.

Inspection rules contain paramaters that affect the way they are used

- type of inspection
- possible decision, follow up action
- checking criteria

---

## Connection To ERP Systems

sap recomends that for more complex process requirements, you connect
the QIE to an ERP system, they provide SAP QM for this purpose

typically the ERP system will send a usage decision to the QIE which
will then trigger a request response indicating how to followup on that
information

![sapQIEERPconnection](./assets/sapQIEERPconnection.svg)

---

## Implicit Verses Explicit Counting

SAP EWM provides two kinds of counting for use with quality inspection

1. implicit
2. explicit

implicit is performed by the system when a warehouse task is processed

where as explicit is performed by a work center to actually count the
materials


