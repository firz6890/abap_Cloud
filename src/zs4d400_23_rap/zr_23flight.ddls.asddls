@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_23FLIGHT
  as select from Z23FLIGHT as Flight
{
  key uuid as UUID,
  carrid as Carrid,
  connid as Connid,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  cuky_field as CukyField,
  airport_id as AirportID,
  name as Name,
  city as City,
  country as Country,
  z1time_zone as z1time_zone,
  @Semantics.amount.currencyCode: 'CukyField'
  price as Price,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  las_changed_at as LasChangedAt
}
