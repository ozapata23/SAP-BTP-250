@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption: Ventas'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CLNTS_LIB_5607
  as select from ztclnts_lib_5607 as Ventas
{
  key id_libro                     as IdLibro,
      count( distinct id_cliente ) as noVentas
}
group by
  id_libro
