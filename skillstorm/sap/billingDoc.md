---
id: ouoyi0wxmza5mr65s14t6b
title: skillstorm/sap/billingDoc
desc: ''
updated: 1719493799
created: 1719493799
---
# skillstorm/sap/billingDoc

## About

these are about billing the customer, but are internal documents
stored on the company

billing doc is internal
invoice is an external version that we send to the customer

## Billing Process
1. create invoices
2. create credit and debit memos
3. cancel previously posted docs
4. automatically trasnfers billing document data to AR

## Billing Document

1. created using data from sales order and delivery doc
2. delivery items can be used as references for billing doc

## Billing document functions

SD document that generates invoices
data source for FI to monitor and process customer payments



> you can combine selveral deliveries into one billing document
> combined documents must have the same payer, billing date
> and destination country

natrually these invoices can be created online or in background jobs


---

## Document Structure

### Header

contains billing date related to entier document
payer and billing date

### Billing document items

- Details of materials
- billing quantities
- net values for each item

---

## Consequences of Billing Doc Generation

when saved the system generates all required accounting docs
automatically

after saving billing doc other accounting docs get created
in

- controlling
- profitability analysis
- market segment analysis
- consolidation

### following data

- all related sales, delivery and billing docs
- sales statistics in sales information system
- debit customer receivables account


