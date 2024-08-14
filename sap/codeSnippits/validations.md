---
id: bk0m0l3nqkh23xd495o172
title: sap/codeSnippits/validations
desc: ''
updated: 1722969177
created: 1722969177
---
# sap/codeSnippits/validations

## About

code example for how to implement a validation in SAP
note the keys variable, tables that are appended too indicating
an error

to get a template of this add the validation to the behavior object
and then ctrl+1 to get the system to implement it for you :D

## Snippit

```
READ ENTITIES OF ZR_BEANS IN LOCAL MODE                                                                     
    ENTITY ZR_BEANS FIELDS ( BeanID type tastyness )                                                        
    WITH CORRESPONDING #( keys )                                                                            
    RESULT DATA(gross_beans).                                                                               
                                                                                                            
                                                                                                            
   IF LINES( gross_beans ) > 0 AND gross_beans[ 1 ]-Tastyness <= 5.                                         
       "tables start from 1 in abap -_-                                                                     
       DATA(message) = me->new_message(                                                                     
            id = 'Z_BEAN_ERROR_MESSAGE'                                                                     
            number = '001'                                                                                  
            severity = ms-error                                                                             
            v1 = 'lol every bean is gonna error on ya :D'                                                   
        ).                                                                                                  
        APPEND VALUE #( BeanID = gross_beans[ 1 ]-BeanID %tky = gross_beans[ 1 ]-%tky ) TO failed-zr_beans. 
        APPEND VALUE #( %msg = message %tky = gross_beans[ 1 ]-%tky ) TO reported-zr_beans.                 
```
