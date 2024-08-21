---
id: xysb73hofar2lk2dq1xahb
title: sap/ewm/optimizationOR/main
desc: ''
updated: 1723815889
created: 1723815889
---
# sap/ewm/optimizationOR/main

## About


## Wave Management

### Wave Templates

A wave template is made up of:

- Release method. Possible values are: Automatic, Immediate, and Manual.
- Wave type. Different wave types enable specific monitoring in the Warehouse Management Monitor.
- Wave category. You can use this as a filter for warehouse order creation rules.
- Date- and time-related fields. These are used to determine wave start and completion dates, and times, for example.
- Capacity profile. This is used for defining capacity limits.
- Calendar. This is used for defining workdays.


After waves have been created, they can be processed in a number of ways:

- Waves can be locked or unlocked. This function allows you to block and unblock a wave from further processing.
- Waves can be merged.
- Waves can be released. This action creates warehouse tasks and subsequent warehouse orders for the warehouse request items in a wave.
- Waves can be deleted. This action removes all warehouse request items from a wave.


## Labor Management

After LM is activated, certain processing transactions require that a processor, start time, and end time be entered. The transactions affected by this can be:

- Warehouse order confirmation
- Physical inventory processing and counting
- VAS processing transactions
- Quality management-related transactions

The master data processor has important information recorded about the processor, including:

- Their warehouse assignment
- The process steps he or she executes
- Their labor factor (representing his or her rating)

### Shifts

Shifts are used to define the work schedule for processors working
in a warehouse. You can assign breaks and a shift factor
to a shift, which reduces the productive working time of the
shift. Shift sequences are used to define a shift order for
as many consecutive days as required. The shift sequence repeats itself
in cycles, for example, every five days for a five-day shift sequence.

You can use shifts to determine the productive labor capacity at
a certain point of time in your warehouse. You can also
determine the labor performance of a shift if you have Labor
Management activated. For example, when a processor confirms a warehouse task,
the system records the processor's shift into the executed workload record
for future labor performance evaluation.


## Warehouse Management Monitor

LM activation provides additional nodes in Warehouse Management Monitor

- planned workload
- excecuted workload
- labor utilization


## Labor Activities

There are two approaches to determining labor activities:

Using active labor activities directly:


The system uses this approach if there is a 1:1 relationship
between an active labor activity at the warehouse level and an
external process step. This approach is always used for indirect labor,
for example, changing a battery.

Using a decision service in BRFplus:



The system uses this approach if there is not a 1:1
relationship between a labor activity and an external process step, for
example, in the case of picking or staging. A decision service
in BRFplus determines the labor activity at runtime by considering context-dependent
information such as external process step, activity area, material group, location,
or reference document data (such as warehouse order).

## Engineered Labor Standards (ELS)

Engineered labor standards (ELS) are used to define the times that are required to execute an activity in the warehouse. The system calculates ELS when:

- Creating a document, when the system generates planned workload.
- Confirming a document, when the system generates executed workload.

## Manufacturing Order

- What will be produced
- When production will happen
- What resource will process the order
- How much the production will cost

## Staging Method

different products can be staged differently

- Pick Parts
    The materials are picked according to the required quantity that is specified in the production order.
- Release Order Parts
    The pick quantities for release order parts are based on the requirements of several production orders (not individually as for pick parts) and on the stock levels in the scheduled production supply areas.
- Crate Parts
    A crate part is a material that is staged independently of
    manufacturing orders. The material is used continually and it is usually
    stored in a crate or another standard container. Kanban is a special method for managing crate parts.
- EWM staging
    These materials are staged directly in SAP EWM using a production
    material request. If a material is staged with single-order staging (similar
    to a pick part) or with cross-order staging (similar to a release order part) is assigned in SAP EWM.

## Cross Docking

there are 5 types of cross docking that SAP supports
becasue they looooove lists

1. transportation cross docking
2. merchandise distribution
    - Cross-docking
    - Flow-through
    - Putaway
3. push deployment
4. ewm triggered opportunistic cd
5. pick from goods receipt

the last 3 are "opportunistic cd" and the first two are planned cross docking
