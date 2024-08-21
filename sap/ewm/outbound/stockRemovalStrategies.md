---
id: odg05tyl6yzx19otq1mbhy
title: sap/ewm/outbound/stockRemovalStrategies
desc: ''
updated: 1724267459
created: 1724267459
---
# sap/ewm/outbound/stockRemovalStrategies

## About

method used to determine the bins
from which to pick one or more quants
of a product from stock.

this occures after the system has
determined storage type from the storage
type search process

the search for quant occures within a
storage type or within a storage type
group

## Creation of Stock Removal Strategies

The quant sorting can contain a maximum of 30 fields. For
each field, this sorting can be ascending or descending. Most fields
are from the table of the available quantity (/SCWM/AQUA). 

The following special fields are filled dynamically:

- EMPTY\_FIXBIN: Empty fixed bin
- PICK\_ITM: Open stock removal items for each storage bin

- SPICK\_QTY: Open stock removal quantity for each storage bin

- AISLE\_ITM: MFS: Open stock removal items for each aisle and level
    The field AISLE\_ITM is only filled in an MFS environment. Only
    one resource has to be assigned to an aisle and level combination.

- SCORE:
    Points (score) for stock determination:
        Points are used if you
        have set up a stock determination and selected Stock Determination Dominates search for an alternative Owner or Stock Type.
- STOCK\_POS:
    Stock quantity is positive

## Removal Strategies

### FIFO removal strateg

first in first out, you know it you see it you love it

For this removal strategy the quants are sorted according to the
goods receipt date in the quant. There are actually two sort
fields which can be used:

- WDATU:
    This is date and time of goods receipt.
- WDATU_DATE:
    This is only the goods receipt date, without time of day.


#### Stringent FIFO

this is used when you want to apply FIFO accross several storage types
the rule is applied by using storage type groups.

here is the SAP SPLEAL on it in their usual wordy format

Use this rule when you want to apply the FIFO rule
across several storage types. Apply the rule by using storage type
groups. The stock is sorted by the defined sort fields within
one storage type group. Each storage type search sequence can have
a different storage type group.

Then defining a storage type search sequence, you can not only
assign either a list of storage types or a storage type
group. You could also have:

- an individual storage type and then a storage type group
- a storage type group followed by an individual storage type
- more then one storage type groups

Combined with a sorting rule by goods receipt date, this would
not really be considered as stringent FIFO, but this gives a huge
number of possibilities to implement your pick strategy.

### LIFO (last in first out) removal strat

I would assume that this if for warehouses where you have a lot of goods
moving through from the definition, and the most recent goods that enter
the warehouse have to be sent off from the warehouse to the outside world

the SAP spleel is bellow

For some warehouses the FIFO principle is not possible. For
example, in the building materials industry, products that are to be
removed from stock, such as lumber, are stacked on stock that
is already stored in the warehouse. To implement the FIFO strategy,
the warehouse worker would first have to remove the stock lying
on top to get to the stock with the oldest goods
receipt date. You can implement the LIFO strategy for such situations.
When the system searches for a suitable quant to remove from
stock, it always suggests the last quant that was placed into
stock.

The three stock removal strategies FIFO, stringent FIFO, and
LIFO, all use the same information, the goods receipt date. The
trick is that for FIFO and stringent FIFO the sort sequence is the other way then for LIFO.

The same way you implement stringent FIFO, you could define stringent
LIFO, by using a storage type group (if this would be required).

### Shelf Life Expiration Date removal strat

products with the shortest life experation date are removed first when using
this sequence

### Partial Quantities First removal strat

the idea here is to prioratize handling units that are all the
way filled over handling units that only have a little items on them


> With the partial quantities first strategy, the system takes a full
> handling unit or tries to remove stock in partial handling units
> first, depending on the required quantity, therefore 
> optimizing the management of
> stock in the warehouse. With this strategy, the number of partial
> handling units in a storage type is kept to a minimum.
> This strategy is useful if you store material in a standard
> package quantity size (for example 100 pieces on one pallet) and
> you either have to pick
> -SAP

To implement this strategy, maintain the following settings:

- Define a stock removal rule with 
    ascending quantity (piece) and a stock removal rule with descending quantity
    (standard HU). As additional sort field you would use the goods
    receipt date.
- Define quantity classifications for 
    the warehouse in Customizing and use these to determine the stock
    removal rules.
- Define a packaging specification for
    the product or use alternative units of measure.
    The packaging specification or the alternative unit of measure is used to determine the Quantity Classification.


### Small Quantities removal strat

You implement this strategy to remove stock based on quantity size.
For example, if small quantities (cartons) are requested, the system searches
the stock in storage type A. If large quantities (full pallets)
are requested, the system searches the stock in storage type B.


The implementation of this strategy is very similar to
Partial Quantities first. You require a packaging specification or alternative units
of measure to determine quantity classifications. The difference is that with
the help of the quantity classifications you determine different storage type
search sequences rather then different stock removal rules.

### Fixed Bin storage strat

With the fixed bin strategy, the system uses the storage bins
that were assigned to the product master to find stock. But
as there can be more then one fixed bin in a storage
type, it is interesting to combine this strategy with another stock
removal rule.

Consider the following scenario: Several fixed bins are
assigned to the same product. You perform order based picking. If
there is an open warehouse task for fixed bin 1, the
system should create the next warehouse task for fixed bin 2 to
avoid a situation where multiple workers are trying to pick from
the same bin. To implement this, include the sort field PICK_ITM
(Open Stock Removal Items per Storage Bin or PICK_QT (Open Quantity
to Remove per Storage Bin) in your stock removal rule.

If
you use fixed storage bin assignments and allow negative available quantities
for a storage type, the system also considers the storage bins
that do not contain any stock when determining the stock. This
means that the system can create warehouse tasks (WTs) for which
no stock exists. You use replenishment control to ensure that stock
is available in the storage bin at the time of picking.

