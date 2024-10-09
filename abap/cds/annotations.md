---
id: xlhv7maqxyam0b95shvdrr
title: abap/cds/annotations
desc: ''
updated: 1728484302
created: 1728484302
---
# abap/cds/annotations

## About

these are used to determine what fields are displayed in a fiori application,
they do a lot of different things, you can find documentation about them at the following link

[sap annotations](https://help.sap.com/docs/SAP_NETWEAVER_750/cc0c305d2fab47bd808adcad3ca7ee9d/f8af07bb0770414bb38a25cae29a12e9.html?version=7.5.3)

## Examples

basic example to get an attribute to display in a fiori app

```
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
@UI.multiLineText: true
```
