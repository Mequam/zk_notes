---
id: 0tezn29t8oxcjfs7txumdf
title: abap/cds/associationExample.cds
desc: ''
updated: 1728329226
created: 1728329226
---
# abap/cds/associationExample.cds

## About

example of using associations in abap these are specifically
ways to link together view ENTITIES and are converted to join statements when code
interacting with entities touches the database

## Example

```abap
g.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MM App - Plant Material'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_APET_MATERIAL
  as select from ZI_APET_MATERIAL_LOW as Material

  association [1]    to ZI_APET_PLANT             as _Plant            on  $projection.Plant = _Plant.Plant
  association [1..*] to ZI_APET_MATERIAL_INSTANCE as _MaterialInstance on  $projection.Material = _MaterialInstance.Material
                                                                       and $projection.Plant    = _MaterialInstance.Plant
  association [0..*] to ZI_WH_SNAP                as _Snapshot         on  $projection.Plant    = _Snapshot.PlantId
                                                                       and $projection.Material = _Snapshot.MaterialNumber

{

  key Material,
  key Plant,

      _MaterialText.MaterialName,
      InstanceCount,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      QuantityInBaseUnitSum,
      MaterialBaseUnit,

      /* Associations */
      _Plant,
      _MaterialInstance,
      _Snapshot

}

```
