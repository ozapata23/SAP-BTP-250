@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption: Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTES_5607
  as select from ztclientes_5607  as Clientes
    inner join   ztclnts_lib_5277 as ClientesLib on ClientesLib.id_cliente = Clientes.id_cliente
{
  key Clientes.id_cliente                                       as IdCliente,
  key ClientesLib.id_libro                                      as IdLibro,
  key Clientes.tipo_acceso                                      as Acceso,
      Clientes.nombre                                           as Nombre,
      Clientes.apellidos                                        as Apellidos,
      Clientes.email                                            as Email,
      Clientes.url                                              as Imagen,
      concat_with_space(Clientes.nombre, Clientes.apellidos, 1) as NombreCompleto
}
