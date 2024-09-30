---
id: ni6nabv4lwagk90k3g6643
title: sap/tcode
desc: ''
updated: 1719258667
created: 1719258667
---
# sap/tcode

## About

just a place to plop transactionCodes that I find useful for sap

see se93 to search more about tcodes


## Transaction Codes

- /n cancel current transaction
-  fs00 gl account central edit
- /nfd03 -customer display initial screen
- fs10n : balance display
- BP : fid and search for business partners
- ME21N : creates a purchase order
- MB51 : view material documents (test this)
- vf03: invoice/financial doucments
- rsa1 : business warehouse modeling
- rsd1 : look at / activate characteristics
- rsd2 : look at / activate key figures
- rsattr : change heirarchy, TODO: more research required here
- LISTCUBE : query an info cube
- MM01 : create a new material
- MM02 : edit an existing material

## Profit / Cost Center Accounting

KE51 : create a profit center
KS01 : create a cost center
KSH2 : edit a standard cost heirarchy
KSH1 : create a new cost center group


## Removing Locks

sm12 : look at the contents of different tables in the app
       you can search your user name then delete the entry
       to resolve lock bugs here

## database

se16n : look at views or table informations
se11 : see the contents of a table in the sap gui

## Project Systems

CJ20N : opens up the project builder in sap gui
VL01N : create an outbound delivery
OVX6 : assign plants to sales organizations and distribution channels
SPRO, search division, find assign division to business area : assign a given division to a business area
OVXG : connect sales organizations distribution channels and divisions
/n/UI2/FLP : open fiori launchpad
VOV4 : create an item category in the system
OX10 : see all plants stored in the system
0184 : open the table for item type determination
