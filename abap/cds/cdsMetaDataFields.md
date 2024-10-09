---
id: x5bq969gxc87q5sv06jsse
title: abap/cds/cdsMetaDataFields
desc: ''
updated: 1728397559
created: 1728397559
---
# abap/cds/cdsMetaDataFields

## About

cds views must have certain metadata fields
enabled in order to properly work with the ABAP
ODATA system

note that these fields go in the database table of the cds view section

bellow is an example of those fields as well as a table definition

## Example

note that the comments in this example will error if pasted into 
a technical environment and are there soly to make reading easier for you
remove them if you want to run this code for some reason

```
@EndUserText.label : 'group person draft table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zwh_g_person_d {

  //table data fields
  key client            : abap.clnt not null;
  key inv_person_id     : sysuuid_x16 not null;
  pernr                 : persno not null;

  //begin metadata fields
  local_created_by      : abp_creation_user;
  local_created_at      : abp_creation_tstmpl;
  local_last_changed_by : abp_locinst_lastchange_user;
  local_last_changed_at : abp_locinst_lastchange_tstmpl;
  last_changed_at       : abp_lastchange_tstmpl;

}
```
