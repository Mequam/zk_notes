---
id: znewagijmmlem642zkfwoj
title: abap/fieldSymbols
desc: ''
updated: 1722525276
created: 1722525276
---
# abap/fieldSymbols

## About

Field symbols in ABAP are akin to pointers in the C language, offering a dynamic approach to memory allocation. Unlike traditional variables, field symbols do not hold any memory themselves; instead, they serve as pointers to specific memory locations. In this blog post, we will delve into the concept of field symbols, exploring their functionality and benefits within the ABAP programming language.
Field Symbol as a Variable
In the following program, we are assigning (Inline declaration) a field symbol. This means that <v_maktx> does not hold any memory allocation, but it points to the value of MAKTX from the MAKT table. Using field symbols always improves the performance of the program since we are working with dynamic memory.

PARAMETERS: p_matnr TYPE matnr.

DATA dref TYPE REF TO data.
CREATE DATA dref TYPE makt-maktx.
ASSIGN dref->* TO FIELD-SYMBOL(<v_maktx>).

SELECT SINGLE maktx FROM makt INTO <v_maktx>
  WHERE matnr = p_matnr
    AND spras = sy-langu.

IF sy-subrc = 0.
  WRITE: / 'Description-', <v_maktx>.
ENDIF.

Range with Field Symbol
DATA: rtab TYPE RANGE OF mara-matnr,
      wtab LIKE LINE OF rtab.

SELECT matnr FROM mara INTO TABLE @DATA(t_mara)
  WHERE mtart = 'ZFRT'.

IF sy-subrc = 0.
  SORT t_mara.
  wtab-sign   = 'I'.
  wtab-option = 'EQ'.

  LOOP AT t_mara ASSIGNING FIELD-SYMBOL(<w_mara>).
    wtab-low = <w_mara>-matnr.
    APPEND wtab TO rtab.

    WRITE:/ wtab-sign,
          3 wtab-option,
          6 wtab-low.
    CLEAR: wtab-low, <w_mara>.
  ENDLOOP.
ENDIF.

arijit_dutta_0-1706289764683.jpeg

Field Symbol as a Work Area
TYPES: BEGIN OF ts_mara,
         matnr TYPE mara-matnr,
         ernam TYPE mara-ernam,
         mtart TYPE mara-mtart,
         matkl TYPE mara-matkl,
       END OF ts_mara.

PARAMETERS: p_matnr TYPE matnr.

DATA dref TYPE REF TO data.
CREATE DATA dref TYPE ts_mara.
ASSIGN dref->* TO FIELD-SYMBOL(<wa_mara>).

SELECT SINGLE matnr ernam mtart matkl
  FROM mara INTO <wa_mara>
  WHERE matnr = p_matnr.

IF sy-subrc = 0.
  ASSIGN COMPONENT 'MATNR' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<matnr>).
  ASSIGN COMPONENT 'ERNAM' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<ernam>).
  ASSIGN COMPONENT 'MTART' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<mtart>).
  ASSIGN COMPONENT 'MATKL' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<matkl>).
  WRITE: / <matnr>,
           <ernam>,
           <mtart>,
           <matkl>.
ENDIF.

Field Symbol as an Internal Table
TABLES: mara.
TYPES: BEGIN OF ts_mara,
         matnr TYPE mara-matnr,
         ernam TYPE mara-ernam,
         mtart TYPE mara-mtart,
         matkl TYPE mara-matkl,
       END OF ts_mara.

SELECT-OPTIONS s_matnr FOR mara-matnr.

DATA dref TYPE REF TO data.
CREATE DATA dref TYPE TABLE OF ts_mara.
FIELD-SYMBOLS <it_mara> TYPE STANDARD TABLE.
ASSIGN dref->* TO <it_mara>.

SELECT matnr ernam mtart matkl
  FROM mara INTO TABLE <it_mara>
  WHERE matnr IN s_matnr.

IF sy-subrc = 0.
  LOOP AT <it_mara> ASSIGNING FIELD-SYMBOL(<wa_mara>).
    ASSIGN COMPONENT 'MATNR' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<matnr>).
    ASSIGN COMPONENT 'ERNAM' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<ernam>).
    ASSIGN COMPONENT 'MTART' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<mtart>).
    ASSIGN COMPONENT 'MATKL' OF STRUCTURE <wa_mara> TO FIELD-SYMBOL(<matkl>).
    WRITE: / <matnr>,
             <ernam>,
             <mtart>,
             <matkl>.
  ENDLOOP.
ENDIF.

Field Symbol in Multiple Tables
TABLES: ekko.
TYPES: BEGIN OF ts_ekko,
         ebeln TYPE ekko-ebeln,
         lifnr TYPE ekko-lifnr,
       END OF ts_ekko.
DATA wa_ekko TYPE ts_ekko.
FIELD-SYMBOLS <it_ekko> TYPE STANDARD TABLE.

TYPES: BEGIN OF ts_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         werks TYPE ekpo-werks,
         lgort TYPE ekpo-lgort,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
       END OF ts_ekpo.
DATA wa_ekpo TYPE ts_ekpo.
FIELD-SYMBOLS <it_ekpo> TYPE STANDARD TABLE.

TYPES: BEGIN OF ts_lfa1,
         lifnr TYPE lfa1-lifnr,
         name1 TYPE lfa1-name1,
       END OF ts_lfa1.
DATA wa_lfa1 TYPE ts_lfa1.
FIELD-SYMBOLS <it_lfa1> TYPE STANDARD TABLE.

TYPES: BEGIN OF ts_makt,
         matnr TYPE makt-matnr,
         spras TYPE makt-spras,
         maktx TYPE makt-maktx,
       END OF ts_makt.
DATA wa_makt TYPE ts_makt.
FIELD-SYMBOLS <it_makt> TYPE STANDARD TABLE.

TYPES: BEGIN OF ts_out,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         maktx TYPE makt-maktx,
         werks TYPE ekpo-werks,
         lgort TYPE ekpo-lgort,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
         lifnr TYPE ekko-lifnr,
         name1 TYPE lfa1-name1,
       END OF ts_out.
DATA wa_out TYPE ts_out.
FIELD-SYMBOLS <it_out> TYPE STANDARD TABLE.

DATA: dref TYPE REF TO data.
FIELD-SYMBOLS <where> TYPE any.

INITIALIZATION.
  SELECT-OPTIONS s_ebeln FOR ekko-ebeln.

START-OF-SELECTION.

  CREATE DATA dref TYPE TABLE OF ts_ekko.
  ASSIGN dref->* TO <it_ekko>.
  SELECT ebeln lifnr
    FROM ekko INTO TABLE <it_ekko>
    WHERE ebeln IN s_ebeln.

  IF sy-subrc = 0.
    CREATE DATA dref TYPE TABLE OF ts_ekpo.
    ASSIGN dref->* TO <it_ekpo>.
    ASSIGN 'ebeln = <it_ekko>-ebeln' TO <where>.

    SELECT ebeln ebelp matnr werks
           lgort menge meins
      FROM ekpo INTO TABLE <it_ekpo>
      FOR ALL ENTRIES IN <it_ekko>
      WHERE (<where>).

    IF sy-subrc = 0.
      CREATE DATA dref TYPE TABLE OF ts_makt.
      ASSIGN dref->* TO <it_makt>.
      ASSIGN 'matnr = <it_ekpo>-matnr' TO <where>.

      SELECT matnr spras maktx
        FROM makt INTO TABLE <it_makt>
        FOR ALL ENTRIES IN <it_ekpo>
        WHERE (<where>)
          AND spras = sy-langu.
    ENDIF.

    CREATE DATA dref TYPE TABLE OF ts_lfa1.
    ASSIGN dref->* TO <it_lfa1>.
    ASSIGN 'lifnr = <it_ekko>-lifnr' TO <where>.

    SELECT lifnr name1
      FROM lfa1 INTO TABLE <it_lfa1>
      FOR ALL ENTRIES IN <it_ekko>
      WHERE (<where>).
  ENDIF.

  SORT: <it_ekpo> BY ('EBELN'),
        <it_ekko> BY ('EBELN'),
        <it_makt> BY ('MATNR'),
        <it_lfa1> BY ('LIFNR').

  IF <it_ekpo> IS ASSIGNED.
    CREATE DATA dref TYPE TABLE OF ts_out.
    ASSIGN dref->* TO <it_out>.
    LOOP AT <it_ekpo> INTO wa_ekpo.
      wa_out-ebeln = wa_ekpo-ebeln.
      wa_out-ebelp = wa_ekpo-ebelp.
      wa_out-matnr = wa_ekpo-matnr.
      wa_out-werks = wa_ekpo-werks.
      wa_out-lgort = wa_ekpo-lgort.
      wa_out-menge = wa_ekpo-menge.
      wa_out-meins = wa_ekpo-meins.

      IF <it_ekko> IS ASSIGNED.
        READ TABLE <it_ekko> INTO wa_ekko
        WITH KEY ('EBELN') = wa_ekpo-ebeln
        BINARY SEARCH.

        IF sy-subrc = 0 AND <it_lfa1> IS ASSIGNED.
          READ TABLE <it_lfa1> INTO wa_lfa1
          WITH KEY ('LIFNR') = wa_ekko-lifnr
          BINARY SEARCH.

          IF sy-subrc = 0.
            wa_out-lifnr = wa_lfa1-lifnr.
            wa_out-name1 = wa_lfa1-name1.
          ENDIF.
        ENDIF.
      ENDIF.

      IF <it_makt> IS ASSIGNED.
        READ TABLE <it_makt> INTO wa_makt
        WITH KEY ('MATNR') = wa_ekpo-matnr
        BINARY SEARCH.
        IF sy-subrc = 0.
          wa_out-maktx = wa_makt-maktx.
        ENDIF.
      ENDIF.

      APPEND wa_out TO <it_out>.
      CLEAR: wa_out, wa_makt, wa_ekko, wa_ekpo, wa_lfa1.
    ENDLOOP.
  ENDIF.

  IF <it_out> IS ASSIGNED.
    WRITE: /  'PO',
           15 'Item',
           24 'Material',
           40 'Description',
           75 'Plant',
           81 'S.Loc.',
           87 'Qty',
          105 'UoM',
          110 'Vendor',
          121 'Name'.
    ULINE.
    LOOP AT <it_out> INTO wa_out.
      WRITE: /  wa_out-ebeln,
             15 wa_out-ebelp,
             24 wa_out-matnr,
             40 wa_out-maktx,
             75 wa_out-werks,
             81 wa_out-lgort,
             87 wa_out-menge,
            105 wa_out-meins,
            110 wa_out-lifnr,
            121 wa_out-name1.
    ENDLOOP.
  ENDIF.


arijit_dutta_1-1706289852859.jpeg
Field Symbol modifies ITAB automatically
TABLES: ekbe.
TYPES: BEGIN OF ts_ekbe,
         ebeln TYPE ekbe-ebeln,
         ebelp TYPE ekbe-ebelp,
         zekkn TYPE ekbe-zekkn,
         vgabe TYPE ekbe-vgabe,
         gjahr TYPE ekbe-gjahr,
         belnr TYPE ekbe-belnr,
         buzei TYPE ekbe-buzei,
         bwart TYPE ekbe-bwart,
         budat TYPE ekbe-budat,
         menge TYPE ekbe-menge,
         matnr TYPE ekbe-matnr,
         werks TYPE ekbe-werks,
         maktx TYPE makt-maktx,
       END OF ts_ekbe.
FIELD-SYMBOLS: <wa_ekbe> TYPE ts_ekbe,
               <it_ekbe> TYPE STANDARD TABLE.

TYPES: BEGIN OF ts_makt,
         matnr TYPE makt-matnr,
         spras TYPE makt-spras,
         maktx TYPE makt-maktx,
       END OF ts_makt.
FIELD-SYMBOLS: <wa_makt> TYPE ts_makt,
               <it_makt> TYPE STANDARD TABLE.

DATA: dref    TYPE REF TO data,
      wa_ekbe TYPE ts_ekbe.

SELECT-OPTIONS s_ebeln FOR ekbe-ebeln.

START-OF-SELECTION.
  CREATE DATA dref TYPE TABLE OF ts_ekbe.
  ASSIGN dref->* TO <it_ekbe>.
  SELECT ebeln ebelp zekkn vgabe
         gjahr belnr buzei bwart
         budat menge matnr werks
    FROM ekbe INTO TABLE <it_ekbe>
    WHERE ebeln IN s_ebeln
      AND matnr NE ' '.

  IF sy-subrc = 0.
    CREATE DATA dref TYPE TABLE OF ts_makt.
    ASSIGN dref->* TO <it_makt>.
    ASSIGN 'matnr = <it_ekbe>-matnr' TO FIELD-SYMBOL(<matnr>).
    SELECT matnr spras maktx
      FROM makt INTO TABLE <it_makt>
      FOR ALL ENTRIES IN <it_ekbe>
      WHERE (<matnr>).

    IF sy-subrc = 0.
      SORT <it_makt> BY ('MATNR').
    ENDIF.
  ENDIF.

  WRITE: / 'PO',
        12 'Item',
        18 'Material Doc.',
        32 'Year',
        38 'Movement',
        48 'Date',
        60 '        Quantity',
        80 'Material',
       105 'Description'.
  ULINE.

  IF <it_ekbe> IS ASSIGNED.
    LOOP AT <it_ekbe> ASSIGNING <wa_ekbe>.

      IF <it_makt> IS ASSIGNED.
        READ TABLE <it_makt> ASSIGNING <wa_makt>
        WITH KEY ('MATNR') = <wa_ekbe>-matnr
        BINARY SEARCH.
        IF sy-subrc = 0.
          <wa_ekbe>-maktx = <wa_makt>-maktx.
        ENDIF.
      ENDIF.

      wa_ekbe = <wa_ekbe>.
      WRITE: / wa_ekbe-ebeln,
            12 wa_ekbe-ebelp,
            18 wa_ekbe-belnr,
            32 wa_ekbe-gjahr,
            38 wa_ekbe-bwart,
            48 wa_ekbe-budat,
            60 wa_ekbe-menge,
            80 wa_ekbe-matnr,
           105 wa_ekbe-maktx.
    ENDLOOP.
  ENDIF.


arijit_dutta_2-1706289888067.jpeg
Field Symbol using Object Oriented
TABLES mara.
FIELD-SYMBOLS: <it_mara> TYPE STANDARD TABLE,
               <it_makt> TYPE STANDARD TABLE.

INITIALIZATION.
  SELECT-OPTIONS s_matnr FOR mara-matnr.

CLASS mat DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ts_mara,
             matnr TYPE mara-matnr,
             mtart TYPE mara-mtart,
             matkl TYPE mara-matkl,
             maktx TYPE makt-maktx,
           END OF ts_mara.
    TYPES: BEGIN OF ts_makt,
             matnr TYPE makt-matnr,
             spras TYPE makt-spras,
             maktx TYPE makt-maktx,
           END OF ts_makt.
    DATA dref TYPE REF TO data.
    METHODS: mara, makt, output.
ENDCLASS.

CLASS mat IMPLEMENTATION.
  METHOD mara.
    CREATE DATA dref TYPE TABLE OF ts_mara.
    ASSIGN dref->* TO <it_mara>.

    SELECT matnr mtart matkl
      FROM mara INTO TABLE <it_mara>
     WHERE matnr IN s_matnr.
  ENDMETHOD.

  METHOD makt.
    IF <it_mara> IS ASSIGNED AND <it_mara> IS NOT INITIAL.
      CREATE DATA dref TYPE TABLE OF ts_makt.
      ASSIGN dref->* TO <it_makt>.
      ASSIGN 'matnr = <it_mara>-matnr' TO FIELD-SYMBOL(<matnr>).

      SELECT matnr spras maktx
        FROM makt INTO TABLE <it_makt>
        FOR ALL ENTRIES IN <it_mara>
        WHERE (<matnr>)
          AND spras = sy-langu.
    ENDIF.
  ENDMETHOD.

  METHOD output.
    FIELD-SYMBOLS: <wa_mara> TYPE ts_mara,
                   <wa_makt> TYPE ts_makt.

    IF <it_makt> IS ASSIGNED.
      SORT <it_makt> BY ('MATNR').
    ENDIF.

    IF <it_mara> IS ASSIGNED.
      LOOP AT <it_mara> ASSIGNING <wa_mara>.

        IF <it_makt> IS ASSIGNED.
          READ TABLE <it_makt> ASSIGNING <wa_makt>
          WITH KEY ('MATNR') = <wa_mara>-matnr
          BINARY SEARCH.
          IF sy-subrc = 0.
            <wa_mara>-maktx = <wa_makt>-maktx.
          ENDIF.
        ENDIF.

        WRITE: / <wa_mara>-mtart,
                 <wa_mara>-matkl,
                 <wa_mara>-maktx,
                 <wa_mara>-matnr.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA material TYPE REF TO mat.
  CREATE OBJECT material.
  CALL METHOD: material->mara,
               material->makt,
               material->output.


arijit_dutta_3-1706289939957.jpeg
Field Symbol in Control Break Statement
Using a field symbol instead of a regular work area keeps the table's value unchanged, preventing it from converting into asterisks and zeros in the corresponding fields.

TABLES ekpo.
FIELD-SYMBOLS: <it_ekpo> TYPE STANDARD TABLE.

INITIALIZATION.
  SELECT-OPTIONS s_ebeln FOR ekpo-ebeln.

CLASS pur DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ts_ekpo,
             ebeln TYPE ekpo-ebeln,
             ebelp TYPE ekpo-ebelp,
             txz01 TYPE ekpo-txz01,
             ktmng TYPE ekpo-ktmng,
             meins TYPE ekpo-meins,
             netpr TYPE ekpo-netpr,
             peinh TYPE ekpo-peinh,
           END OF ts_ekpo.
    DATA dref TYPE REF TO data.
    METHODS: ekpo, output.
ENDCLASS.

CLASS pur IMPLEMENTATION.
  METHOD ekpo.
    CREATE DATA dref TYPE TABLE OF ts_ekpo.
    ASSIGN dref->* TO <it_ekpo>.

    SELECT ebeln ebelp txz01
           ktmng meins netpr peinh
      FROM ekpo INTO TABLE <it_ekpo>
      WHERE ebeln IN s_ebeln.
  ENDMETHOD.

  METHOD output.
    FIELD-SYMBOLS: <wa_ekpo>  TYPE ts_ekpo,
                   <flag>     TYPE char1,
                   <subtot>   TYPE any,
                   <subprice> TYPE any,
                   <grandtot> TYPE any,
                   <grandpr>  TYPE any.

    IF <it_ekpo> IS ASSIGNED.
      CREATE DATA dref TYPE p DECIMALS 2.
      ASSIGN dref->* TO <subtot>.
      CREATE DATA dref TYPE p DECIMALS 2.
      ASSIGN dref->* TO <grandtot>.
      CREATE DATA dref TYPE p DECIMALS 2.
      ASSIGN dref->* TO <subprice>.
      CREATE DATA dref TYPE p DECIMALS 2.
      ASSIGN dref->* TO <grandpr>.
      CREATE DATA dref TYPE char1.
      ASSIGN dref->* TO <flag>.

      LOOP AT <it_ekpo> ASSIGNING <wa_ekpo>.

        AT NEW ('EBELN').
          <flag> = 'X'.
        ENDAT.

        IF <flag> = 'X'.
          WRITE: / <wa_ekpo>-ebeln,
               12  <wa_ekpo>-ebelp,
               20  <wa_ekpo>-txz01,
               45  <wa_ekpo>-ktmng,
               60  <wa_ekpo>-meins,
               65  <wa_ekpo>-netpr,
               80  <wa_ekpo>-peinh.

        ELSE.
          WRITE: /12 <wa_ekpo>-ebelp,
                 20  <wa_ekpo>-txz01,
                 45  <wa_ekpo>-ktmng,
                 60  <wa_ekpo>-meins,
                 65  <wa_ekpo>-netpr,
                 80  <wa_ekpo>-peinh.
        ENDIF.

        <subtot>   = <subtot>   + <wa_ekpo>-ktmng.
        <grandtot> = <grandtot> + <wa_ekpo>-ktmng.
        <subprice> = <subprice> + <wa_ekpo>-netpr.
        <grandpr>  = <grandpr>  + <wa_ekpo>-netpr.

        AT END OF ('EBELN').
          WRITE: / '==================================================',
                 / 'Subtotal',
                 50 <subtot>,
                 70 <subprice>.
          CLEAR: <subtot>, <subprice>.
        ENDAT.

        AT LAST.
          ULINE.
          WRITE: / 'Grand Total',
                 50 <grandtot>,
                 70 <grandpr>.
        ENDAT.

        CLEAR <flag>.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA po TYPE REF TO pur.
  CREATE OBJECT po.
  CALL METHOD: po->ekpo,
               po->output.




arijit_dutta_5-1706290324802.jpeg
 

 

arijit_dutta_6-1706290324807.jpeg
 

Object Oriented ALV using Field Symbol
TABLES ekpo.
FIELD-SYMBOLS: <it_ekpo>   TYPE STANDARD TABLE,
               <it_out>    TYPE STANDARD TABLE,
               <it_fcat>   TYPE STANDARD TABLE,
               <wa_layout> TYPE lvc_s_layo.
DATA: obj_con TYPE REF TO cl_gui_custom_container,
      obj_alv TYPE REF TO cl_gui_alv_grid.

INITIALIZATION.
  SELECT-OPTIONS s_ebeln FOR ekpo-ebeln.

CLASS pur DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ts_ekpo,
             ebeln TYPE ekpo-ebeln,
             ebelp TYPE ekpo-ebelp,
             txz01 TYPE ekpo-txz01,
             ktmng TYPE ekpo-ktmng,
             meins TYPE ekpo-meins,
             netpr TYPE ekpo-netpr,
             peinh TYPE ekpo-peinh,
           END OF ts_ekpo.
    DATA dref TYPE REF TO data.
    METHODS: ekpo, output, field_catalog.
ENDCLASS.

CLASS pur IMPLEMENTATION.
  METHOD ekpo.
    CREATE DATA dref TYPE TABLE OF ts_ekpo.
    ASSIGN dref->* TO <it_ekpo>.

    SELECT ebeln ebelp txz01
           ktmng meins netpr peinh
      FROM ekpo INTO TABLE <it_ekpo>
      WHERE ebeln IN s_ebeln.
  ENDMETHOD.

  METHOD output.
    FIELD-SYMBOLS: <wa_out>  TYPE ts_ekpo,
                   <wa_ekpo> TYPE ts_ekpo.

    IF <it_ekpo> IS ASSIGNED.
      CREATE DATA dref TYPE ts_ekpo.
      ASSIGN dref->* TO <wa_out>.
      CREATE DATA dref TYPE TABLE OF ts_ekpo.
      ASSIGN dref->* TO <it_out>.

      LOOP AT <it_ekpo> ASSIGNING <wa_ekpo>.

        AT NEW ('EBELN').
          <wa_out>-ebeln = <wa_ekpo>-ebeln.
        ENDAT.

        <wa_out>-ebelp = <wa_ekpo>-ebelp.
        <wa_out>-txz01 = <wa_ekpo>-txz01.
        <wa_out>-ktmng = <wa_ekpo>-ktmng.
        <wa_out>-meins = <wa_ekpo>-meins.
        <wa_out>-netpr = <wa_ekpo>-netpr.
        <wa_out>-peinh = <wa_ekpo>-peinh.

        APPEND <wa_out> TO <it_out>.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD field_catalog.
    DATA lv_col TYPE i VALUE IS INITIAL.
    FIELD-SYMBOLS <wa_fcat> TYPE lvc_s_fcat.
    CREATE DATA dref TYPE lvc_s_fcat.
    ASSIGN dref->* TO <wa_fcat>.

    CREATE DATA dref TYPE TABLE OF lvc_s_fcat.
    ASSIGN dref->* TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'EBELN'.
    <wa_fcat>-reptext   = 'Purchase Order'.
    <wa_fcat>-no_zero   = 'X'.
    APPEND <wa_fcat> TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'EBELP'.
    <wa_fcat>-reptext   = 'Item'.
    APPEND <wa_fcat> TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'TXZ01'.
    <wa_fcat>-reptext   = 'Description'.
    APPEND <wa_fcat> TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'KTMNG'.
    <wa_fcat>-reptext   = 'Quantity'.
    APPEND <wa_fcat> TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'MEINS'.
    <wa_fcat>-reptext   = 'UoM'.
    APPEND <wa_fcat> TO <it_fcat>.

    lv_col = lv_col + 1.
    <wa_fcat>-col_pos   = lv_col.
    <wa_fcat>-fieldname = 'NETPR'.
    <wa_fcat>-reptext   = 'Price'.
    APPEND <wa_fcat> TO <it_fcat>.

    CREATE DATA dref TYPE lvc_s_layo.
    ASSIGN dref->* TO <wa_layout>.
    <wa_layout>-zebra      = 'X'.
    <wa_layout>-cwidth_opt = 'X'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA po TYPE REF TO pur.
  CREATE OBJECT po.
  SET SCREEN 0100.
  CALL METHOD: po->ekpo,
               po->output,
               po->field_catalog.

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'PF_100'.
  SET TITLEBAR 'T_100'.

  IF <wa_layout> IS ASSIGNED AND
     <it_out>    IS ASSIGNED AND
     <it_fcat>   IS ASSIGNED.

    IF obj_con IS INITIAL.
      CREATE OBJECT obj_con
        EXPORTING
          container_name              = 'ZSR_TEST'
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          OTHERS                      = 6.
    ENDIF.

    CREATE OBJECT obj_alv
      EXPORTING
        i_parent          = obj_con
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    CALL METHOD obj_alv->set_table_for_first_display
      EXPORTING
        i_save                        = 'A'
        i_default                     = 'X'
        is_layout                     = <wa_layout>
      CHANGING
        it_outtab                     = <it_out>
        it_fieldcatalog               = <it_fcat>
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
  ENDCASE.

ENDMODULE.
