---
id: rv2213qnm9y3lb29w5xa6w
title: abap/types
desc: ''
updated: 1722001068
created: 1722001068
---
# abap/types

## About

## Date Time Stuff

subtracting two dates gives the number of days between them

date time format uses

YYYMMDD

### Internal representation

dates are converted to 


### Offset and Length with date fields

you can use abap string manioulation syntax
to pull out year month and day from a date

```
var_date(4) "year
var_date+4(2) "month
var_date+6(2) "day
```

### Timestamp fields

type utclong
- represents a timestamp
- format YYYY-MM-DDTHH:MM.sssssssZ

the current time stamp comes from 

usefull functions
```
utc_long_current
utc_long_add
utc_long_diff : returns decfloat32 value * double check
```

## static methods

```
cl_abap_context_info
```

contains info about current date timezone and the context
that the program is currently running in
