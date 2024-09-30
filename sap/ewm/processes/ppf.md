---
id: 17s7h2ozusvdop7mkyma10
title: sap/ewm/processes/ppf
desc: ''
updated: 1723658482
created: 1723658482
---
# sap/ewm/processes/ppf

## About

the post processing framework is embeded in the SAP Web Application Server

Post Processing Framework

follow up mo

provides tools to 

- plan
- start
- monitor

which offer functionality for 

- printing
- sending emails 
- sending faxes
- starting workflows 
- starting badis
- starting business addins

converts inbound delivery notification into inbound delivery

you can see an overview of the ppf architecture at this image

![ppfArchitecture](./assets/images/ppFrameworkArchitecture.png)

---

## Structure Overview

- Action Profiles : contain action defintions and settings applying to all definitions in the profile
- Action Definition : describes the content of the action (independently of profile frikin wordy SAP \-\_\-)
- Processing Type : executes a particular work action at runtime (sap provieds printing sending or starting as examp.)
- worklist : contains actions that can be run manually

---

## Connection To Warehouse Tasks

for each warehouse request item, the ppf may create a warehouse tasks
automatically in the background, if not you can create one manually

see [sap/ewm/overview/warehouseTasks](../overview/warehouseTasks)
see [sap/ewm/overview/warehouseTasks](../overview/warehouseTasks.md)

## Connection to service definition

Message/output control for delivery processing uses Post Processing Framework (PPF). The
PPF is a Basis component that generates actions from the data
of an application according to an action definition (for example, the
printing of a delivery note). PPF provides the tools for scheduling,
starting, and monitoring actions. Actions are saved in an action profile,
which is linked to the document type.

---

## PPF Structure

The PPF is made up the following parts:

- Action Profile:
    contains action definitions and the settings for all the action definitions
    in the profile. Common profiles contain reusable actions, such as sending
    e-mail.
- Action Definition:
    describes the content of an action independently of the processing type.
    However, the types with which the actions can be processed, as
    well as the partners with which the actions can be executed, are assigned to the action definition.
- Action Determination:
    checks whether the conditions for scheduling the actions have occurred using
    the attributes of the application documents that are available using the
    business object assigned in customizing. The technology used for the determination
    is specified for each action definition. The standard determination uses workflow rules.
- Action Merging:
    merges new actions with any actions in the action list or
    worklist that have not yet been executed, according to specific criteria.
- Action List:
    lists actions that have been scheduled by the determination process for
    an application document. Users can display the action list and if
    necessary edit it.
- Worklist:
    contains actions that can be scheduled manually.
- Processing (Type):
    executes a particular action (for example printing, sending, or starting a workflow) at runtime.

### Actions

these appear to simply be functions that are run on the backend to edit existing documents, 
with much of the framework dedicated to determineing WHEN these functions run and what they do
and what functions are run on what documents.

> these are defined under a header profile

can be performed in the background by

- person
- group
- organizational unit
- can be configured at both item and document header level

## Post Processing Functions

The Post Processing Framework (PPF) provides basic functions that are delivered
with predefined settings depending on the application. You can adjust the
settings as you require.

The PPF provides the following functions:

- Technique for determining actions
- Technique for grouping found actions
- Framework for processing actions, such as a printer, fax, or e-mail
- User interface for customizing action templates such as determination and aggregation
    techniques as well as processing mediums
- User interface for the customizing conditions if you use determination by
    conditions

## PPF Configuration Steps

In customizing for delivery processing, you execute the following activities:

1. Create an action profile.
2. Under the action profile, you define actions, for example sending messages,
    printing delivery notes, or posting goods receipt. For every action, you
    define a processing type, action determination, and processing time-spots.
3. If necessary, define conditions for the actions in the profile.
4. Assign the action profile to the document type and item type.
