@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_23FLIGHT
  provider contract transactional_query
  as projection on ZR_23FLIGHT
  association [1..1] to ZR_23FLIGHT as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Carrid,
  Connid,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  CukyField,
  AirportID,
  Name,
  City,
  Country,
  z1time_zone,
  @Semantics: {
    amount.currencyCode: 'CukyField'
  }
  Price,
  @Semantics: {
    user.createdBy: true
  }
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  LocalCreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LasChangedAt,
  _BaseEntity
}
