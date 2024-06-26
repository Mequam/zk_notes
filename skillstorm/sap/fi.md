---
id: d0bausrvxgsjla6d8dx5z3
title: skillstorm/sap/fi
desc: ''
updated: 1718809620
created: 1718809620
---
# skillstorm/sap/fi

[meeting2](./skillstorm/meeting2.md)

## About

perform financial reporting and profitablity analysis

## Important Tasks


---

## General Ledger (GL)

sub ledger -> reconciliation account -> General ledger

contains records of all accounting related transacitons to specific GL accounts
managed at company code level with the goal to create P&L and Balance Sheet

structured based on chart of accounts

every general ledger account recives a unique account number

these are classified as income statmetns
or ballance sheets


companies can have more than one ledger to keep track of and contain things
these ledgers will allways follow the countries laws and tax requirements

the GL has one leading ledger per company code

> there are several sources that the general ledger uses for information 
> that are more specific than the general ledger itself
> thse are sub ledgers and listed bellow

### Accounts Payable (AP)
- business transactions related to suppliers
- procure-to-pay business process

### Accounts Recivable (AR)
- transactions related to customers
- order-to-(pay/cash) business processes

### Asset Accounting (AA)
- current and non current (fixed) assets

the idea here is to record and track all fixed assets
includes aquisitions depritiations transfers and displosal of assets

### Bank Ledger (FI-BL)
- record cash flows to and from bank accounts


### The Posting Key

every document line item contains one posting key

controls the following foreach doc

1. account type
2. type of posting (credit or debit)
3. additional fields that are required or optional

common keys include

1. 40 Debit
2. 50 Credit
3. 31 Accrual/Deferral 
4. 01 Customer Invoice
5. 09 Customer Payment
6. 70 Vendor Invoice
7. 75 Bendor Payment


## Balance Display (FS10N)

Overview of saved transactions for an account
