---
id: l2l4k8vwcuzztzquskpoqe
title: sap/codeSnippits/testClass.abap
desc: ''
updated: 1722957416
created: 1722957416
---
# sap/codeSnippits/testClass.abap

## About

this is a test class example for an SAP abap unit test

make sure to swap out the template gaurds gaurds


## Code Snippit
```
class <your class> definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check.
endclass.


class <your class> implementation.

  METHOD first_test.
    "example equals assertion for editing
    "cl_abap_unit_assert=>assert_equals( 
    "    exp = abap_true
    "    act = abap_true
    "    msg = 'true is not true, we have bigger problems than this bug'
    ").
  ENDMETHOD.
ENDCLASS.
```
