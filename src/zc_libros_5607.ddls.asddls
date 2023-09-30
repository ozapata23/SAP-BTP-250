@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption: Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_LIBROS_5607
  as select from    ztb_libros_5607   as Libros
    inner join      ztb_catego_5607   as Categoria on Categoria.bi_categ = Libros.bi_categ
    left outer join ZC_CLNTS_LIB_5607 as Ventas    on Ventas.IdLibro = Libros.id_libro
  association [0..*] to ZC_CLIENTES_5607 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro       as IdLibro,
      Libros.titulo         as Titulo,
      Libros.bi_categ       as Categoria,
      Libros.autor          as Autor,
      Libros.editorial      as Editorial,
      Libros.idioma         as Idioma,
      Libros.paginas        as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio         as Precio,


      case when Ventas.noVentas < 1 then 0
           when Ventas.noVentas = 1 then 1
           when Ventas.noVentas = 2 then 2

           else 3 end       as Ventas,

      case Ventas.noVentas
        when 0 then ''
        else ''
      end                   as Text,

      Libros.moneda         as Moneda,
      Libros.formato        as Formato,
      Categoria.descripcion as Descripcion,
      Libros.url            as Imagen,

      _Clientes
}
