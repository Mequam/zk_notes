---
id: f4jip8c8m9ny95vp0t5416
title: sap/ewm/rfid
desc: ''
updated: 1724424192
created: 1724424192
---
# sap/ewm/rfid

## About

infastrucfture for radio identification of items

- Decouples business logic from the physical presentation of application data on
    a selected presentation device, and enables personalized menus and screens
- Supports a large variety of device sizes, device types, and data entry types

## Tag Types

RFID tags are used to identify items, there are two kinds of tags in the system

- active tags
- passive tags

active tags use a battery and are emitters of signals,

whereas passive tags use em waves from the scanner to echo back
their radio frequency when scanned

active tags have a longer range, but requrie battery change,
where as passive tags do not need to be changed, but have a smaller
range as a result

## Connection To The SAPConsole

Character-based devices are linked to the system through SAPConsole. SAPConsole operates
on a Windows NT/Windows 2000 platform and interacts with the RF
terminals connected to it.

## ITSmobile

The system uses ITSmobile for connecting browser-based devices. ITSmobile uses the
ITS template technique to do this. This technique is based on
the concept that an HTML template for visualization in the browser
is provided for every screen (dynpro) of the application. You can
include dynamic content or data in the templates at runtime using
HTMLBusiness (HTMLB).

ITSmobile is delivered with a new template generator that allows you
to generate the templates of simple screens directly. You can then
change these further to meet your requirements. You can also create
a completely new template generator or create a new template generator
based on the one delivered.

## Bar Code Support

SAP supports GS1-128 bar code types


## RF SCreem Manager

this is used to customize the apearance of RF screens

---

## Standard RF Provided Functionalities From SAP

- Logon
- Logoff
- Recovery
- Work execution transactions for the following warehouse processes (examples):
    - Picking
    - Putaway
    - Unloading
    - Deconsolidation
    - Physical inventory
    - Replenishment

### Recovery Steps

During logon, the system checks with the content provider whether the
user is logged on as a resource, and if so, whether
they were interrupted during WO execution. The system checks whether a specific
WO assigned to the resource was stopped before completion. If yes,
and if the WO can be locked, the system finds the
WO's data and displays the screen of the relevant step to
continue the process.


---

## Navigation Techniques

For mobile devices you can use

1. menu navigation
2. transaction navigation

### Menu Navigation Options

1. standard navigation
2. direct navigation
3. virtual navigation


## Transaction Navigation

When in the screen for a particular logical transaction, you may
be required to enter data, validate existing data, or a combination
of both.

When data entry is required, the input field
is open. Enter the data by scanning bar codes or typing.
If you enter data manually, choose Enter.

After all input
fields on the screen are filled in, one of the following
actions occurs:

- If the Skip Shortcut indicator is set, the
    posting (for example, warehouse task (WT) confirmation) is triggered automatically.
- If the Skip Shortcut indicator is not set, you will automatically be
    redirected to the Shortcut field.

You can invoke functions by
choosing the corresponding function key pushbutton, or entering the function key
in the Shortcut field. Where necessary, you enter exception codes in
the Shortcut field (for example, for differences).
