---
id: 7iubgde3obwjjeoi6jhki0
title: skillstorm/sap/procurement
desc: ''
updated: 1718975121
created: 1718975121
---
# skillstorm/sap/procurement

## About

this is all about getting products into the business

the name for this business process has changed multiple times in the history of sap

purchase to pay
source to pay


procurement processes are about handaling actual goods and moving objects around

## Steps

can be automated or manually set

TODO: study these

1. purchase requisition pr
2. RFQ's                        - request for quotations, send an external request for costs MRR
3. create po                    - purchase order
4. Monitor purchase Orders
5. Goods Receipt                - verify the quality and quantity of items, should match PO
6. Verify Invoice               - enter the given invoice and compare it with the purchase order and goods reciept
7. Make Payments                - make payments (process the payment through)

po's can be created manually or system can automate that process

this is performed by manufactoring after invoice is verified THEN everything is payed

### PR

purchase requisition that starts the initial process of setting up a purchase order for the company,
you CAN skip this before and go straight to a PO.

purchase requeisitions can be converted into RFQ's, POs, or outline argreements

These are typically created internally

### PO

purchase order these are created after the PR and contain any terms or extra conditions that we may have 
made with the vendor

these are designed to send information out to other vendors

#### Issue Messages

all purchase docs can be issued as mesages
can issue messages immediately or issue later,
basically how are you sending the purchase order to the vendor

these can be issued imedietly upon PO submission


### Ariba Network

cloud based platform that is used to collaborate with trading partners,
send electronic transactions and otherwise get documents where they need to go!

### Verify Invoice

this is poerformed by a human to verify purchase order and goods reciept against the invoice


## Foreign Trade

this is new to s/4 HANA

- Part of standard materials management (MM)

the idea here is that it helps manage and streamline foreign trade activities
the idea here is to make the workflow seemless

not available in on premise s4 hana, those use GTS instead

GTS is a more advanced version of forieng trade

## SAP Global Trade Services (GTS)

GTS more advanced version of the Foreign Trade System
often used in local systems

this is an app, you can open and use it

## Materials Management (MM) & Inventory Management (IM)

uses the MATDOC to store all material document data in one location
enabaling real time inventory

MATDOC is short for material doc

IM is part of MM, they are in the same module

MM is about procurement
IM is what's on hand

## Material Ledger for Inventory Valuation

You have to use a material ledger for storing stuff in MM and IM


there are several different techniques that are used here

1. flexible valuation methods for multiple currencies
2. parallel accounting standards
3. statistical moving average price



---

## Organization Levels - Purchasing

1. client
2. company code
3. purchasing org / purchasing group
4. plant - not necessarily manufacturing, just a phyisical place
5. storage location - these are unique at the plant level, think plants as folders storage locations as files

see [system wide concepts](./skillstorm/sap/systemWideConcepts.md) [skillstorm/sap/systemWideConcepts](systemWideConcepts)


---

### Purchasing Organization splits

purchasing organizations can be placed at different levels in the company depending on what exactly
they are keeping track of and managing

#### Cross Company Code Purchasing Organization

these guys are a modification of purchasing organizations that do not have a single company and instead are only under the client

for example

when a purchasing order is created, the pruchasing organization gets asked for the company code that it is purchasing for,
since the purchasing organization. They are assigned to a client, not an individual company.

So alphabet has a cross company code purchasing organization.

They still buy for specific companies, but when making a PO they have to put in their company.

#### Cross Plant Purchasing Organization

purchasing organization that is procuring specifically over 
several plants within the given company

#### Plant Specific Purchasing Organization

have authority over a single plant


---

> we combine material master records with 
> vendor masster records in the PO

## Material Master Record

centeral source of truth for what materials are where

1. client level data
2. plant level data
3. storatge area level data


## Vendor Master Record

seperate from material master record,

- main record for vendor information
- maintained in business partner (BP) master data, which combines vendors and customers

includes different kinds of data

general data (client level)
accounting data (company code level)
purchasing data (purchasing organization level)


## Inco Terms

international comercial terms published by the icc to get everyone on the same page

## Outline Agreement

long term purchasing contract,framework that sets the terms and conditions for future
procurment actions for the process to be streamlined

---

## Consumables Verses Stock Materials

Consumables are items that are used as soon as you get them
the accounts associated with consumable materials are debited when goods receipt or invoice is posted

Stock Materials stay around for a little while

thesea re set in the account assignment

---

## Goods Receipt (GR)

created when the goods are delivered by the vendor AFTER a PO

this is posted to warehouse stores

further accounting documents are created for valuated GR items

if the goods receipt is not validated no accounting documents are created

> basically if we don't spend money on the given good reciepts
> we do not create accounting docs for it!

### Stock Type

consumable materials are non valuated

- must choose a stock type for valuated Gr.s
- Use type 101 for all valuated stock

there are different types of stock

- unrestricted use stock (no usage restrictions)
    materials are available for immediate use with no restrictions
- quality inspection stock (used for quality control, no withdrawls possible for consumption)
    materials need to be inspected for quality
- blocked stock (no withdrawls possible)
    when quality finishes this indicates there are issues and damages



quantities of an item are based on organizational level
1. storage area (equivilent to storage location): all items in a single storage area
2. plant: all items in all storage areas
3. company code: All items in all plants
4. client: All items in all company codes


### Movement Codes

101 for valuated stock
102 would move and cancel the goods reciept
    basically you need to recieve it again
103 Goods Receipt for PO into blocked stock

### Goods Movement Documents

created as soon as the system posts goods movmenets

proof of transaction serves as proof that the products have been moved

once a goods movment document has been posted you CANNOT change the movement codes of the goods stocks


## notes on integration

- purchase requisition
    Management Accounting
- purchase order
    Management Accounting
- goods reciept
    Inventory Management
    Financial Accounting
    Management Accounting
    Warehouse Management
    Update PO History
- invoice reciept
    Financial Accounting
    Management Accounting
    update PO History
- payment
    financial accounting
    management accounting
