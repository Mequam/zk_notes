---
id: kp5banswr3w6cvlkzoogzi
title: sap/ps/abapTables
desc: ''
updated: 1722523867
created: 1722523867
---
# sap/ps/abapTables

## About

misclanious information about working with the tables in the ps systems database

## Database Tips

the internal database tables used in ps can be found in


```txt
cn_psp_opr
```

clnt(3) is the client data type

### Database Tables

prhi : contains edge information from wbs elements (graph structure I think)
prps : wbs element master data

this is the key that links the two tables, prhi (edge) and prps (master) of wbs elements,
taken from the prhi table if you wanted to list off the wbs and see the connections you would
need to join on this field

```abapdb
  @AbapCatalog.foreignKey.label : 'Internal WBS element number (database key)'
  @AbapCatalog.foreignKey.keyType : #KEY
  @AbapCatalog.foreignKey.screenCheck : true
  key posnr : ps_posnr not null
    with foreign key [1,1] prps
      where mandt = prhi.mandt
        and pspnr = prhi.posnr;
```

## Links

useful links of abap tables for project systems

[usefulTables](https://sap4tech.net/sap-ps-tables-relationship/)
[moreUsefultables](https://erp-top.com/project-system/)
