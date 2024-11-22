---
id: 38i50b83c4o4bajsmqn139
title: abap/functions
desc: ''
updated: 1729090993
created: 1729090993
---
# abap/functions

## About

abap functions import and export in odd ways,
bellow is a function definition

## Definition

```
FUNCTION zcreate_random_uuid
  IMPORTING
    random_generator TYPE REF TO cl_abap_random
  EXPORTING
    uuid_out TYPE string.
```
