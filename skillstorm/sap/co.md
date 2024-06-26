---
id: he7009gi3nfid9mq84ebm6
title: skillstorm/sap/co
desc: ''
updated: 1718811404
created: 1718811404
---
# skillstorm/sap/co

## About


[management accounting](./skillstorm/sap/managementAccounting.md)

Controlling Accounting

this is designed primaraly for internal decision making
where as fi [skillstorm/sap/fi](fi) is concered with legal requirements


this is all about collecting revenue and expenses by areas of responsibility


- not limited by contry
- have controlling objects that represent areas of responsibility that incure
    costs revanues or both

---

## Organizational Levels

### Company Code

- indipendent accounting unit, must have at least one
- usually exists only in one country
- has a 4 character alphanumeric code
    this code is used in many different sections of sap

### Segments

TODO: there might be different versions of these

these represent a specific aspect inside of one business
for accounting

each of these can have different risk and revenu streams

- international accounting standards (IAS)
- organizational unit, dimension for reporting purposes

(US GAAP) : segament that follows us guidelines and standards
these each track their own performance

---

## Controlling Area

represents seperate unit of cost accounting

crucial for internal cross control and management
encompases one or more company codes

- this allows cross company code cost accounting
- must use the same chart of account and fiscal calendar
    basically everyone has to start and stop metrics at the same time

---

## GL Account Master Records

broken into two segments

### Chart of Accounts Segment

contains description of the given account indicating whether its
a p&l account or balance sheet account and consolidation account number
used to balance intercompany transactions

### Company Code Segment

contains values specific to how a company code will manage the account


## Account Groups

you can clasify the GL accounts into user-defined segments

each account group determines the number range within those segments

Field status options
- suppress (not displayed)
- required
- dispplay (read only)
- optional

## Reconciliation accounts


summarizes and controls subledger accounts

> we don't post direcetly to the GL instaed post to the subledger
> accounts which post into reconciliation accounts automatically

GL only contains what the reconciliation accounts post


