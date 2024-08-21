---
id: eit1i8kr1lpa8o42maykbz
title: sap/ewm/integration/serviceProfile
desc: ''
updated: 1724163787
created: 1724163787
---
# sap/ewm/integration/serviceProfile

## About

In EWM, delivery documents represent various delivery processes in the system.

In delivery processing, a series of service profiles on header and
item level are used to determine how the documents and items
are processed in SAP EWM. They also define the business scope
of the documents, that is, what functions are required in the business processes.

there are two types of service profiles in EWM

1. System profiles
2. customer profiles


## System Profiles

System profiles are predefined in the EWM system and cannot be
changed. They contain configuration settings used as default options in the
various delivery document processes. Internally, system profiles are linked to the
document categories for profiles related to document headers, and to the
item categories for profile settings related to document items.

## Customer Profiles

these are used to configure your processes and are allways linked to system profiles

SAP provides several customer profiles automatically for common tasks that need
to be excecuted


> this is akin to external and internal tasks
> in process oriented control


---

## List Of Existing Profiles On Header or Item Level

- Action profile (only on header level)
- Status profile
- Text profile
- Field control profile
- Partner profile
- Date profile
- Incompletion profile
- Quantity offsetting profile
- Reference document category profile
- Process profile
- Process code profile (only on item level)


SAP has particularly long winded responses for all of these,
which I have included bellow for fast lookup in the future

### Action Profile (for Post Processing Framework (PPF))

Message/output control for delivery processing uses Post Processing Framework (PPF). The
PPF is a Basis component that generates actions from the data
of an application according to an action definition (for example, the
printing of a delivery note). PPF provides the tools for scheduling,
starting, and monitoring actions. Actions are saved in an action profile,
which is linked to the document type.

In addition to
printing-related actions, actions can include:

- Activating delivery documents such as inbound delivery notification or outbound delivery requests
- Posting goods issue or receiptNote

The action profile on header level is the
only service profile, which is not based on a system profile.


## Status Management

Status management controls business transactions used
to process a delivery document by assigning one or more statuses to the document.

Status profiles are assigned to delivery types and item types. A status
profile contains status types that describe a process in the overall
processing life cycle of a delivery document such as a goods
receipt status, an unloading status, or a putaway status. Each status
type has one or more valid status values assigned to it
such as Yes/No, Not started/In Process/Completed. The status value allows or
disallows a business transaction. A business transaction can set a new
status value.

## Text Management

Text management allows texts to
be received via delivery documents from the SAP ERP system and
processed within SAP EWM delivery documents. New texts can also be
created and saved within EWM delivery documents, and you can display,
change, or delete texts. Text management supports texts at the delivery
header and item level.

In SAP EWM, text types representing particular notes such as “shipping
instructions” and “preferred carrier” are defined. Text profiles group text types
for a particular delivery header or item. Within the text profile,
the access sequence for each text type indicates the source of
the text. Text profiles used to specify texts for delivery headers
are assigned to the document type; whereas, text profiles used for
delivery item texts are assigned to the item type.

### Field Control

Delivery documents contain a multitude of fields that contain
the data used and required in delivery processing. In addition to
status management, field control determines which fields are displayed and changed
during delivery document processing. The fields that appear in the delivery
header and item structures are determined and controlled by the field
control function.

Delivery processing uses field control during the following
events:

- The creation of a document or document item
- When switching between display mode and change mode
- After data is changed in a document

All fields in a delivery document
are defined in the system as components of structures. Every component
in the structure is uniquely identified by the logical field name,
and can be addressed directly. In the field attributes assigned to
the fields, the system defines the processing characteristics of each field.
The list of assigned fields and their field attributes for a particular
document type or item type is assigned to a system profile.
The field attributes in the system profile cannot be changed, however,
you can create new field names by using the system profile.
The assignment to the delivery document type or item type is
done using the field control profile. A field control profile contains
all the allowed fields and their attributes for a particular document
or item type. Every field control profile is assigned to a system
profile.

SAP provides predefined logical field names, system profiles, and
field control profiles for all of the standard delivery processes.

### Partner Processing

Partner processing is used to maintain partner information in
the header and/or item data in EWM delivery documents. Partner processing
configuration begins with the creation of partner roles. The partner role
is used to represent a role or a function in the
business process. Examples of possible partner roles are: 

- supplier
- receiving office
- ship-to recipient
- warehouse

Partner roles are identified by a 

- key
- description
- role category

The role category defines the
nature and use of the partner identified by the partner role.
The following role categories are available:

- Business partner
- Location
- Organizational unit

Partner roles are assigned to partner
profiles. The partner profiles are assigned to the document types and
item types where they are used. SAP has created predefined partner
profiles for the standard EWM delivery documents. These profiles are the
partner processing system profiles and cannot be changed. In these profiles
SAP has defined the partner profiles with mandatory and optional partner
roles.

## Date Types

The date types system function configures
the various dates related to delivery processing in SAP EWM. The
dates that are supported by the system are defined as date
types. Note that the date always includes the time. The EWM
application functions determine the supported date types. As a rule, the
EWM date types should match the date types defined in configurable
process scheduling. Examples of date types include: delivery date, goods issue
date, start of loading, end of loading, and pick/pack start.

Date
profiles are pre-configured in the EWM system for all of the
standard delivery types and item types. Each date profile is assigned
to a system profile. Contained within the date profile are the
date types that are to be used in the delivery type
or item type to which the profile is assigned. If you
do not define a date profile for a document type or
    an item type, the settings from the system profile are used
    automatically.

## Incompleteness Check

Use the incompleteness check to ensure
that all relevant fields in a delivery document have been filled.
The incompleteness check uses the logical field names assigned to the
system profile of the field control for its check. To set
up the check, create an incompletion profile that contains every mandatory
input and output field that must be filled in order to
process the document. These fields are defined by their logical field
names. Each field contained within the incompletion profile is assigned a business
action code such as “Save”, “Goods Issue”, or “Check”. The action
codes determine when the field is checked for completeness.

The
incompletion profile is assigned to the document or item type, to
which it will be applied. Pre-configured incompleteness profiles and settings are
provided by SAP for the standard processes in delivery processing.

### Quantity Offsetting

In delivery processing, you use quantity offsetting to calculate
the open quantities for a document, or to calculate specific quantities
such as requested quantity and reduced quantity.

You execute quantity offsetting
at the item level of a delivery document. To execute quantity
offsetting automatically, use a quantity offsetting profile. The quantity offsetting profile
contains the quantity calculation and the quantity offsetting rules to be
used to calculate the desired quantities. The quantity offsetting profile is
assigned to the delivery document type and the delivery document item
type.

### Reference Documents

In the reference documents service profile
configuration, the allowed preceding document references are configured. Within the system
and customer profiles, the permitted reference documents are defined using reference
document category codes. The reference document customer/system profiles are assigned to
the document categories where they will be used. SAP provides a pre-configured
set of profiles for the standard EWM delivery document and item
categories.

### Process Management and Control

SAP EWM uses the
process management and control function to control whether certain processes or
functions are permissible for a delivery type or item.

The
following process indicators can be set for the delivery header control:


- Manual creation - controls whether a document can be created manually in SAP EWM
- Deletion of warehouse request with follow-up documents - 
                                controls whether you can delete warehouse requests after the
                                creation and cancellation of successor documents
- Preceding document - allows
    reference to a preceding document
- Production - allows processes for
        production such as kit-to-stock or goods receipt from production
- Scrapping - allows subprocesses for scrapping
- Pickup - allows process for
        sales without transportation processing
- Invoice before goods issue - allows 
        an invoice to be created before the goods issue
- Correction delivery - allows posting of differences to the stock to be
    cleared using a correction delivery document
- Communication to SAP ERP - for
    the advanced production integration the system can use the goods movement
    interface only
- Goods receipt mode - when the system communicates the
    goods receipt to SAP ERP
- Unique ASN number - you can
    use this field to control whether the system checks if the
    advanced shipping notification (ASN) number is unique for the ship-from party
    and business system or not

Note:
The last two
controls can also be set in settings which reference the SAP
ERP system. As these settings are not available in an embedded
SAP EWM, they were added to the process indicators.

At
the item level the following process indicators can be set:

    Create
- manually - an item can be created manually in a delivery
    document without reference to a line item in a preceding document
- Invoice before GI - allows the billing of a line
    item before its goods issue posting

Like other system functions,
process management and control contains SAP pre-created system profiles for the
standard delivery categories and item categories.

### Process Codes

Process codes are used to control particular exceptional situations, for example, when
a delivery quantity is larger or smaller than the actual quantity
delivered.

Each process code profile is assigned to a system
profile. The process code profile determines which process codes have been
assigned in the corresponding system profile. If you want to change
the process codes assigned to a business process, you can define
a new process code profile for a system profile.

SAP
has defined system profiles for the process codes for the standard
processes in delivery processing. You cannot change them. If you do
not define a process code profile for a item type, the
settings from the system profile of the corresponding item category are
used automatically.-

## Connection To The PPF

Message/output control
for delivery processing uses Post Processing Framework (PPF). The
PPF is
a Basis component that generates actions from the data
of an
application according to an action definition (for example, the
printing of
a delivery note). PPF provides the tools for scheduling,
starting, and
monitoring actions. Actions are saved in an action profile,
which is
linked to the document type.

[sap/ewm/processes/ppf](../processes/ppf.md)
[sap/ewm/processes/ppf](../processes/ppf)

In addition
to printing-related actions, actions can include:

- Activating delivery documents
such as inbound delivery notification or outbound delivery requests
- Posting
goods issue or receipt


