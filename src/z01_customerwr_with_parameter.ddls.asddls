@AbapCatalog.sqlViewName: 'Z01CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 11'
define view Z01_customerWR_with_parameter 
with parameters 
    @Environment.systemField: #SYSTEM_DATE
    P_FlightsBefore : abap.dats @<EndUserText.label: 'Consider flights up to this date'
as select from Z01_booking_and_customer {
    
    key customid as ID,
    name,
    street,
    postcode,
    city,
    country,
    sum(amount) as amount @<Semantics.amount.currencyCode: 'currency',
    Currency, 
    avg(days_ahead) as days_ahead
}

where fldate < $parameters.P_FlightsBefore

group by
    customid,
    name,
    street,
    postcode,
    city,
    country,
    Currency
