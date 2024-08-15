---
id: co1s5lzibe0fqbvydg05k0
title: sap/ewm/warehouseOrg/main
desc: ''
updated: 1723750769
created: 1723750769
---
# sap/ewm/warehouseOrg/main

## About

this is a spot to put general information about warehouse organization in SAP

 __________________________________ 
/ is this the real life or is this \
\ fantasy                          /
 ---------------------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
## Slotting

The goal of slotting is to help in the determination of
the best storage bin for a material during putaway. The best
bin for a material depends on factors such as whether that
material is fast-moving, slow-moving, and so on. A well laid-out warehouse
makes the picking process easier.



Examples of data that the slotting process uses to determine putaway, includes:

- Product data
- Storage requirement data
- Packaging data
- Demand forecasts or historical data from SAP Advanced Planning and Optimization (SAP APO)

During slotting, the system determines the following storage parameters:

1. Putaway control indicator (and, optionally, stock removal control indicator)
2. Maximum quantity in storage type
3. Storage section indicator
4. Storage bin types

The system always performs step 1. Steps 2 to 4 are
optional. Steps 1, 3, and 4 are performed using the condition
technique. Step 4 can also be performed using storage bin type
determination rules.

### Calculated Parameters

obviously correct information must come from somewhere, so the system needs data to make informed decisions
this data can come from APO, manual entry, or mass mainteneance.

EWM stores this data locally in the warehouse.

APO performs planning at the plant level
EWM stores requirements data at the warehouse level

> slotting assumes there is a one to one relationship between APO and EWM storage locations
> BAdIs are used for conversion if this is not the case

 ___________________________________ 
/ SAP provides this delightfully    \
| unhelpful graphic of the slotting |
\ process                           /
 ----------------------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

![slottingProcessOverview](./assets/slottingProcessOverview.svg)


## Replenishment Techniques

SAP EWM provides predefined techniques for the replenishment of storage bins.
You can use any or all of these techniques in the
warehouse to replenish storage bins. Before the replenishment control is used,
certain data fields in the warehouse product must be updated. The
data fields are as follows:

- Minimum Stocking Quantity
- Maximum Stocking Quantity
- Minimum Replenishment Quantity (optional)


these are specified at storage type level in the EWM masster record or at the
storage bin level. They can be entered manually or determined during the slotting process.
Some of the replenishment control types require additional settings in customizing.


 ____________________________________ 
< and they don't specifiy which ones >
 ------------------------------------ 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

## physical inventory procedures

To perform a physical inventory, you can choose between various inventory procedures such as:

- Continuous Physical Inventory Procedure
- Periodic Physical Inventory Procedure
    - Ad-hoc Physical Inventory (Storage Bin Specific and Product Specific)
    - Putaway Physical Inventory
    - Low Stock/Zero Stock Physical Inventory
    - Low Stock/Zero Stock Check
    - Storage Bin Check
- Cycle Counting


### Periodic Physical Inventory

SAP EWM supports an annual physical inventory (storage bin-specific and product-specific).
In an annual physical inventory, you record all stocks on a certain
day (or within a short time-period). This is usually done at
the end of the fiscal year. During this time, you can
prohibit stock movements. You can also use this procedure to take
a physical inventory for storage bins and quants that are subject
to continuous inventory, but have not had any stock movements in
the current fiscal year. A product-specific periodic or annual inventory is
also possible.


### Continuous phyiscal storage procedures

these seem listified in the SAP documentation so I placed them here as such

1. Ad-Hoc Physical Inventory (Storage-Bin Specific and Product Specific)
    For storage bin-specific ad-hoc physical inventory, you take inventory for
    certain storage bins. You can do this at any time of
    the fiscal year. This physical inventory procedure is manually controlled. The
    product-specific ad-hoc physical inventory is similar to storage bin-specific procedure, except
    that you perform it on products.
3. Putaway Physical Inventory
    When stock if first placed on an empty bin in the fiscal
    year, the inventory process is triggered. The warehouse employee confirms the
    warehouse task of putaway and as a result, performs the physical
    inventory.
5. Low Stock/Zero Stock Physical Inventory
    As a prerequisite in
    this case, you must define (in Customizing) a quantity threshold of
    physical inventory area-specific settings. If picking causes levels to fall below
    the threshold, the low stock physical inventory is triggered. The warehouse
    employee confirms the picking warehouse task and the system creates the
    physical inventory document in the background. For a zero stock physical
    inventory, the threshold value is zero.
7. Low Stock/Zero Stock Check
    The low stock / zero stock check is a variant of
    the low stock physical inventory, where no physical inventory document is
    created. This check can be done in addition to a low
    stock / zero stock physical inventory and in can be done
    multiple times (while a physical inventory document is only created once
    in a fiscal period).
8. Storage Bin Check
    In this procedure,
    the system checks if a product is on the correct storage
    bin. This procedure can be triggered manually (at any chosen time).
    This check is recommended if a product is damaged. This check
    does not create a physical inventory document.

### Product Specific Cycle Counting

SAP EWM supports cycle counting, which means that you carry
out a physical inventory of your stocks at regular intervals during
a fiscal year. By allocating products to different classes (for example,
A, B, and C), you specify the intervals or cycles when
you take a physical inventory of those products. This allows you
to take inventory of fast-moving products in your warehouse more frequently
than inventory of slow-moving products, for example.

## Physical Inventory areas

For each physical inventory area, you can define the related procedure
of physical inventory. Also, you maintain Tolerance Groups to clear differences
and to use the Difference Analyzer.

The process of physical inventory begins with the creation of a physical
inventory document. This can be created manually or automatically. This document
is used to do the following

1. Plan and perform the physical inventory
2. Record the count data
3. Post any differences revealed by the count


