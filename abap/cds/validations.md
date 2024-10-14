---
id: 7t3ad6snn1beztvddcblis
title: abap/cds/validations
desc: ''
updated: 1728920726
created: 1728920726
---
# abap/cds/validations

## About

validations are custom hooks that can run in abap to determine if data that you enter
into a cds application is valid or not,

they use the EML framework for communicating to the RAP back end what should and should
not be saved

## Examples

you need to configure validations in both the behavior of the RAP application
and the abap program that is performing the validations, hence the seperation of
examples bellow

### Behavior

the following is behavior implementing a validation on a given objects create;

you can also set validations on other hooks in the system, allowing for more varied syntax

check [validations](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abapeml_response.htm)
for more info regaurding this subject


```cds behavior
define behavior for ZRWH_GROUP_PERSON //alias <alias_name>
implementation in class ZBP_WH_GROUP_PERSON unique
persistent table zwh_group_person
draft table zwh_g_person_d
etag master last_changed_at
lock dependent by _TEAM
authorization dependent by _TEAM
{


    field ( numbering : managed )
    inv_person_id;

    field ( readonly )
    teams_id,
    vorna,
    nachn;

    validation teams_id on save { create; }



    field ( mandatory )
    pernr;

  update;
  delete;

  association _TEAM { with draft; }
}
```

### ABAP

note that these classes need to be ascociated with the entity in order to work,
in abap development tools the quick fix should hopefully take care of this for you
after you create the validation in the behavior

> validations are created in the "LOCAL TYPES" tab

```ABAP
CLASS lhc_zrwh_group_person DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS teams_id FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZRWH_GROUP_PERSON~teams_id.

ENDCLASS.

CLASS lhc_zrwh_group_person IMPLEMENTATION.

  METHOD teams_id.

      DATA: tbl_read TYPE TABLE FOR READ RESULT zrwh_group_person,
      lt_teams_id TYPE ZWH_TEAM_ID.

      " Read relevant sales order data
      READ ENTITIES OF zrwh_team IN LOCAL MODE
      ENTITY ZRWH_GROUP_PERSON
      FIELDS (  teams_id ) WITH CORRESPONDING #(  keys )
      RESULT tbl_read
      FAILED DATA(tbl_failed).


      DATA team_member_count TYPE I.
      DATA member_limit TYPE I.



      LOOP AT tbl_read ASSIGNING FIELD-SYMBOL(<itr>).

"determine how many members this team has
          SELECT COUNT( * )
          FROM zwh_group_person
          WHERE teams_id = @<itr>-teams_id
          GROUP BY teams_id
          INTO @team_member_count.
          ENDSELECT.

"get the maximum member limit for this team
          SELECT member_limit
          FROM zwh_teams
          WHERE teams_id = @<itr>-teams_id
          INTO @member_limit.
          ENDSELECT.

"correct if over the limit

        IF team_member_count >= member_limit.

            "failed instances
            APPEND VALUE #( %tky = <itr>-%tky ) TO failed-zrwh_group_person.

            "further information
            APPEND VALUE #( %tky = <itr>-%tky
                            %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'group membership is full! Remove members to add more!'
                                )

                            ) TO reported-zrwh_group_person.

          ENDIF.
      ENDLOOP.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
```


---

## Links

[validations](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abapeml_response.htm)
