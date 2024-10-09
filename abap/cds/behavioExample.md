---
id: zzbqiqnqvrqi3zx3fazmtv
title: abap/cds/behavioExample
desc: ''
updated: 1728331009
created: 1728331009
---
# abap/cds/behavioExample

## About

a behavior determines what a service can do

note that you can contain more than one behavior in a given file,
and also project behaviors into behavior projections

## Example

```Behavior
managed;
strict ( 2 );
with draft;

define behavior for ZR_WH_ACCIDENT alias Accident
implementation in class ZBP_WH_ACCIDENT unique
persistent table zwh_accident
draft table zwh_accident_d
etag master local_last_changed_at
lock master total etag last_changed_at
authorization master ( global )

{
  field ( numbering : managed )
  accident_id;

  field ( readonly )
  accident_id,
  local_created_at,
  local_created_by,
  last_changed_at,
  local_last_changed_at,
  local_last_changed_by;

  field ( mandatory )
  description,
  start_date;

  association _InvolvedPersonnel { create ( features : instance, authorization : update ); with draft; }

  create;
  update;
  delete;

  validation validate_dates on save { create; field start_date, end_date; }

  draft action Edit;
  draft action Activate optimized;
  draft action Discard;
  draft action Resume;
  draft determine action Prepare;

  mapping for zwh_accident corresponding
    {
    }
}

//this has something to do with the behaviors bieng defined
//as child relationships
//not quite sure what that means yet but its here as an example

define behavior for ZR_INV_PERSON alias InvolvedPersonnel
implementation in class Zbp_INV_PERSON unique
persistent table ZINV_PERSON
draft table ZINV_PERSON_d
lock dependent by _Accident
authorization dependent by _Accident
etag master local_last_changed_at
{

  field ( numbering : managed )
  inv_person_id;

  field ( readonly )
  inv_person_id,
  accident_id,
  local_created_at,
  local_created_by,
  last_changed_at,
  local_last_changed_at,
  local_last_changed_by;

  field ( mandatory )
  pernr;

  update;
  delete;

  association _Accident { with draft; }

}
```
