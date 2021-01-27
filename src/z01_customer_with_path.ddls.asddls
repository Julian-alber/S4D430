@AbapCatalog.sqlViewName: 'Z01CUSTASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 13'
define view Z01_customer_with_path with parameters 
    @Environment.systemField: #SYSTEM_DATE
    P_FlightsBefore : abap.dats @<EndUserText.label: 'Consider flights up to this date'
as select from Z01_ASSOCIATION as a {
    
    key customid as ID,
    a._customer.name,    
    a._customer.street,
    a._customer.postcode,
    a._customer.city,
    a._customer.country,
    sum(amount) as amount @<Semantics.amount.currencyCode: 'currency',
    Currency, 
    avg(days_ahead) as days_ahead
}

where fldate < $parameters.P_FlightsBefore

group by
    customid,
    a._customer.name,    
    a._customer.street,
    a._customer.postcode,
    a._customer.city,
    a._customer.country,
    Currency
