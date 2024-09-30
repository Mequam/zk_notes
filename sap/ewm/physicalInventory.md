---
id: tvrjjv50r3gzu1ugj7j8jo
title: sap/ewm/physicalInventory
desc: ''
updated: 1724335695
created: 1724335695
---
# sap/ewm/physicalInventory

## About

these processes are all about counting the physical goods stored in the
warehouse. Think of a manager checking inventory stock.

these processes are often required by financial and legal laws to check on the
health of the organization

You use the physical inventory functions in EWM to carry out
a physical inventory of products for stock control and balance sheet
purposes. You have the following options:

- Storage-bin-specific physical inventory: This inventory is counted at the storage
    bin level, and, therefore, all the products and HUs in this
    storage bin are counted.
- Product-specific physical inventory: This inventory is based solely on the
    products in one or more storage bins and/or HUs.

sap proides a graphic of this process which we have snipped bellow
![process graphic](./assets/images/physicalInventoryProcesses.png)

## Status

physical inventory procedures can be assigned a status indicating 
where they are in the process of bieng completed

a graphic containing these statuses and how they flow is shown bellow

![status](./assets/images/physicalInventoryProcesses.png)


## Inventory Procedures

EWM supports different types of inventory procedures as follows:

1. Periodic Physical Inventory (Storage-Bin Specific and Product Specific)
2. Continuous Physical Inventory Procedures
    - Ad-hoc Physical Inventory (Storage-Bin Specific and Product Specific)
    - Putaway Physical Inventory
    - Low Stock/Zero Stock Physical Inventory
    - Low Stock/Zero Stock Check
    - Storage Bin Check
3. Cycle Counting

Any or all of these procedures can be implemented in an EWM warehouse.

### Periodic Physical Inventory Procedure

You can configure EWM to carry out an annual physical inventory
(storage-bin-specific and product-specific) on a certain day or within a fairly
short period (in most cases at the end of the fiscal
year). During this time, you can prohibit stock movements. Furthermore, if
you have set up a continuous inventory process, but no stock
movements have occurred during the current fiscal year for some storage
bins, you can use this procedure to carry out the physical
inventory. The product-specific annual physical inventory corresponds to the storage bin-specific
annual physical inventory (except that you carry it out for products).


### Continuous Physical Inventory Procedure

The following are continuous
physical inventory procedures:

1. Ad Hoc Physical Inventory:
    Executed anytime during the fiscal year, an ad hoc physical inventory
    may become necessary, if, for example, a product has been damaged.
    This procedure can be performed at the storage bin level or it can be product-specific.
2. Low Stock Physical Inventory:
    This procedure is performed during warehouse task confirmation if the
    source bin contains only a small quantity (lower than a configurable
    threshold) after the stock removal. You can confirm in RF or
    on the printed warehouse order for the task that you have
    performed the physical inventory. During warehouse task confirmation, the system automatically
    creates the physical inventory document in the background based on information
    in the warehouse task. The low stock physical inventory is storage
    bin-specific.
3. Zero Stock Physical Inventory:
    This works in the
    same way as a low stock physical inventory with a threshold
    value of 0.
4. Low Stock / Zero Stock Check:
    A low stock / zero stock check is done during picking,
    similar to the low stock / zero stock physical inventor (and
    the same threshold value is used). The difference is that no
    physical inventory document is created.
5. Putaway Physical Inventory:
    This procedure is similar to the low stock physical inventory, but
    it occurs only during putaway. The putaway physical inventory for a storage
    bin is carried out at the time of the first putaway
    in this bin in the fiscal year. The warehouse employee confirms
    during the first putaway that the stock in the storage bin
    matches the confirmed quantity in the warehouse task after the putaway.

6. Storage Bin Check:
    The storage bin check is a procedure in which you check
    whether a product is actually stored in the storage bin in
    which it is supposed to be located. The quantity of the
    product in the storage bin is not counted, so it is
    not a physical inventory procedure in the true sense.
7. Cycle Counting:
    With cycle counting, you carry out a physical inventory of
    your stock at regular intervals during a fiscal year. Only a small
    subset is counted each day. Cycle counting is an ongoing inventory
    procedure and it is less disruptive (for daily business) compared to
    an annual inventory, where the whole warehouse is counted within a short
    time frame.

---

## Phyisical Inventory Area

For physical inventory, you create one or more physical inventory areas
and assign the physical inventory area to an activity area in
EWM. The activity area needs sort sequence for an activity which
is connected to the Warehouse Process CategoryPhysical Inventory.

In the definition of the physical inventory area, you have the following options:

- Activate Putaway Physical Inventory and / or Low Stock Check
    with Phys. Inventory. If any of these two continuous inventory procedures
    is selected, you also need to enter the according type as
    Permitted Document Types.
- Activate Low Stock Check Without Physical Inventory. For this as
    well as for the Low Stock Check with Phys. Inventory the
    field Qty (Physical-Inventory-Related Quantity Threshold Value) controls the threshold.
- Select Simultaneous Posting After Count Entry to trigger an automatic posting if a difference
    is below the user related tolerance.

- The following indicators should only be set after checking with your auditor:
    - Display Book Quantity at Time of Count Entry: with this option
        it is possible to display the book inventory quantity when entering
        the count results in certain transactions.
    - Proposed Inventory Quantity at Time of Count Entry: Determines whether the
        inventory quantity is proposed at the time of count entry.
    - Display Item Objects at Time of Count Entry: Indicates that object
        information is to be displayed as suggested (default) lines when a count
        result is entered for a storage-bin-specific physical inventory. If you set
        this indicator, all objects at the storage bin will be suggested
        by the system for counting. Hierarchies of handling units (HUs) can
        thus be entered on a simplified basis.
    - Printout of Item Objects in Phys. Inventory Count Document: Indicates whether
        the object information is to be represented as suggested (default) lines
        when a physical inventory count document for a storage-bin-specific physical inventory
        is printed out.
    - Serial Number in Phys. Inventory for Count (Suggest):
        Determines whether serial numbers are to be suggested by the system
        when count results are entered.
    - "HU Complete" Allowed: Indicates whether the possibility of counting a handling
            unit (HU) as "exists and complete" is allowed.
- HU Counting Methods: Specifies whether you want to count collectively the
    number of handling units (HUs) or the number of items
    inside a handling unit. This is specifically for bulk storage.
- Completeness Check Online/Offline (Report): You use this indicator to determine whether
    the completeness check is to be carried out upon posting or
    in offline mode only (report).
- No Default Stock Type: You can specify a default stock type
    for your warehouse in the Customizing. If you select this checkbox,
    the system ignores the default stock type set on the warehouse level for your PI area.
- Permitted Document Types:
    In this sub-dialog you have to enter all the different physical
    inventory procedures you plan to use in this physical inventory area.

---

## Transaction Codes

/SCWM/PI\_DOWNLOAD : download storage bins and count data
/SCWM/WM\_ADJUST : post differences to ERP system
/SCWM/VALUATION\_SET : determine and set prices from ERP
/SCWM/ERP\_STOCKCHECK : stock comparison with ERP

---

## Recounting

before a recount can occure in physical inventory you have to make sure that the inventory
count is at status 

> counted

after which the system can indcate that a recount needs to happen
