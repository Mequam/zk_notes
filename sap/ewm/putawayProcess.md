---
id: 1cjz31grqzs3lyuzheln82
title: sap/ewm/putawayProcess
desc: ''
updated: 1724249059
created: 1724249059
---
# sap/ewm/putawayProcess

## About


During the warehouse task creation for putaway, the system can do several steps to determine the final bin:

1. The system uses existing HU information or packaging specifications for palletization for quantity information.
2. A storage type search sequence is determined.
3. Optional: a storage section search is done.
4. Optional: a bin type determination is done.
5. The putaway rule for the storage type is used to determine a bin.
6. Optional: a capacity check for the bin is triggered.


> the order here appears to be relevent to when the check is run

we use the storage type to determine which bin to store the package in.

storage type is determined from inbound delivery order

## Storage Type Search Sequence


as far as I can tell, this is the process where the system determines 
what storage type is needed to store any given object, we get a list of storage
types out of this process that I THINK an employee chooses


the storage type search sequence uses fields in the inbound delivery order,
master product data among others in making it's determination


### Access Type

this is a configureation used by customers to indicate exactly which fields are used by the
system when searching for a storage type sequence

### SAP Quote

FROM SAP

The system can use several parameters to determine the storage type search sequence.

- Warehouse Number: This is the only mandatory parameter.
- Putaway Control Indicator: This indicator is assigned to the warehouse product.
- Warehouse Process Type: For the warehouse process types you can also define Groups.
    To define groups, in Customizing for SCM Extended Warehouse Management, choose Extended Warehouse
    Management → Goods Receipt Process → Strategies → Definition of Groups
    → Define Group for Process Type. A similar path exists in
    the customizing for the Goods Issue Process. You define the groups
    in either place and assign them directly in the warehouse process
    type.
- Quantity Classification: This comes from a packaging specification or from an alternative unit of measure.
- Stock Type: Also stock types can be consolidated into groups
- Type: Here you can distinguish regular stock from Sales Order Stock or Project Stock.
- Stock Usage: Special stock usages are for example Consignment Stock or Stock with Subcontractor.
    Party Entitled to Dispose
    Hazard Rating - 1 and 2

When searching for the storage type search sequence, the systems attempts
to read a completely qualified entry at first. In other words
with all available information from the inbound delivery, the warehouse product,
and the dangerous goods master. If no entry is found, the
system uses the Access Strategy. This access strategy is defined by
the customer to control which fields should be used at all
for the search and in which sequence the search should be done.

For example: you have an entry using a putaway control indicator
and another entry using the warehouse process type. In the first sequence the system would try to find an entry with

    the putaway control indicator (assuming there is one in the warehouse
    product you want to create the warehouse task for)
    the warehouse process type (which must be in the inbound delivery)
    at least with the stock type and the party entitled to
    dispose, because definitely this information is available. Any other search information
    listed above might not be relevant (for example it is no hazardous substance).

In the access strategy optimization you have maintained an entry to
search with the putaway control indicator first (which makes sense, as
you want to find it product specific) and then with the
warehouse process type (which would then be found for products without
the putaway control indicator).


## Storage Section Determination

storage section is determined by 

- storage type
- warehouse product master record
- haz material subset master record

storage section determination is optional, and must be configured before use

you would typically use it when you know the storage type of a material, but want to
make sure that goods of different speeds or hazard are not stored next to eachother



## Evaluation Points - Evaluation Golf

evaluation points indicate a "slowness" value that can be placed
on any of the following categories

- storage type
- storage section
- storage bin type

then when evaluating a product the sum of evaluation points in each
category is used to determine in what order the potential options
are evaluated, with lower evaluation points going first

## Priorities

these determine the order in which the system searches for storage type storage section and bin type

> from SAP
> Instead of using Evaluation Points, it is also possible to change
> the Priorities in the determination of storage type, storage section, and
> bin type. The standard priorities are High for the storage type,
> Medium for the storage section, and Low for bin types, and
> this creates the standard sequence of the determination as explained in
> the beginning of this lesson. You could change for example the
> priority for bin types to High and for storage types to
> Low. Then the system would first search for a preferred bin
> type (in the storage types which are in the storage type
> search sequence). But evaluation points give you a higher flexibility.

---

putaway strategies are used to determine how we find a bin for
any given good coming into the warehouse

see
[sap/ewm/putaway/strategies](putaway/strategies.md)
[sap/ewm/putaway/strategies](putaway/strategies)

for more details
