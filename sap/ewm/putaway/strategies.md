---
id: u2pijwn38ihql4e9bwt27b
title: sap/ewm/putaway/strategies
desc: ''
updated: 1724253163
created: 1724253163
---
# sap/ewm/putaway/strategies

## About

putaway strategies are used to determine how we find a bin for
any given good coming into the warehouse


## Putaway Strategies

Putaway strategies determine the type of bin that you use for the storage of your product

as far as I can tell storage bin type is about the SIZE of your bin where as this bin determination
is for the actual quality metric of the bin (pallet, bulk, flexible ect.)

there are several different putaway strategies that each change how the system actually stores
material away, and you can see them listed bellow after the SAP quotes

FROM SAP


The putaway strategy is used to determine the bin or bins
for the storage of your products. In SAP EWM, you implement
the putaway strategies, in most cases, by configuring one or more
of the following fields in the storage type definition:

- Storage Behavior Possible parameters include the following:
    - blank - Standard Warehouse
    - 1 - Pallet Storage
    - 2 - Bulk Storage
    - 3 - Flexible Storage

    > Storage behaviors other then “Standard Warehouse” require additional settings for the storage type.

- Putaway Rule: Possible parameters include the following:
    - 2 - Addition to Existing Stock / Empty Bin
    - 4 - General Storage Area
    - 5 - Empty Bin

> The putaway rule “3 - Consolidation Group” is only used for
> packaging work centers and in a transit warehouse. Also the putaway
> rule “6 - Transit Warehouse: Staging Area for Door” can only be used in a transit warehouse.

- WT Generic : Possible parameters include the following:
    - blank - Not generic
    - 1 - Only St. Type - Section
    - 2 - Only Storage Type

### Manual Entry Putaway Strategy

Using the manual entry strategy, the system does not determine a storage
section or a storage bin. You enter the destination storage bin
manually when the warehouse task is created or confirmed. You generally
use this procedure if the search for a suitable storage bin
is performed on-site by a warehouse worker.

### Fixed Storage Bin Strategy

this is used to place products into their standard bins that they allways go in,
basically you put uranium in the lead bin ALLWAYS so you could use fixed storage bin
for that

Maintain the following master data configuration settings to implement the fixed bin strategy:

Assign fixed bins to the warehouse product masters.
Make the following storage type configuration settings to implement the fixed bin strategy:

- Storage Behavior: standard warehouse
- Putaway Rules: addition to existing stock/empty bin
- Addn.Stock Forbidden: addition to existing stock permitted
- Set the Use Fixed Storage Bins indicator
- Set the Max. Fixed Bins field if this control is required
- Activate a form of capacity checking

### General Storage Strategy

The system uses the general storage strategy to find a storage
bin in a general storage area. With the general storage putaway
strategy, you define a single storage bin per storage section. The
quants in the storage bin can also be in the form
of mixed storage.

Maintain the following storage type configuration settings to implement the general storage putaway strategy:

- Storage Behavior: standard warehouse
- Putaway Rules: general storage area
- Mixed Storage: mixed storage without limitations

### Existing Stock Storage Strategy

in this strategy you place incoming stock into existing bins that already contain stock,
basically you ARE putting all of your eggs into one baskit so to speak.

in order for this to work obviously the bins that you are placing the objects into need to
have necessary capacity

- Storage Behavior: standard warehouse
- Putaway Rules: addition to existing stock/empty bin
- Addn.Stock Forbidden
    If you want to allow additions to existing stock, choose “”
    (Addition to existing stock permitted) or M (Addition to existing stock
    via addtn ID in Product Putaway Profile in Customizing). If you
    choose M, you must choose the required value for the Addit.to
    Exist.Stock indicator in the product putaway profile.
- Mixed Storage: only one HU allowed per bin
- Configure a method of capacity checking


### Empty Storage Bin Storage Strategy

the system finds an empty storage bin.

used to support warehouses that are organizaed randomly,
"pick a stack" warehouses.

useful for high rack storage and shelf storage.

Maintain the following storage type configuration settings to implement the empty storage bin putaway strategy:

- Storage Behavior: standard warehouse
- Putaway Rules: empty Bin

You also have the option to change the sort sequence of
the storage bins. This effects the determination of the empty storage
bin under SrchRule EmptyBin.

### Bulk Storage

from how SAP seems to be refering to it
