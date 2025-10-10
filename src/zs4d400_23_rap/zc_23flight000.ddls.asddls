@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_23FLIGHT000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_23FLIGHT000
  association [1..1] to ZR_23FLIGHT000 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Carrid,
  Connid,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CukyField,
  AirportID,
  Name,
  City,
  Country,
  Z1timeZone,
  @Semantics: {
    Amount.Currencycode: 'CukyField'
  }
  Price,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LasChangedAt,
  _BaseEntity
}
