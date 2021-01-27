@AbapCatalog.sqlViewName: 'Z01CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 9'
define view Z01_customer_with_revenue as select from Z01_booking_and_customer {
    
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
group by
    customid,
    name,
    street,
    postcode,
    city,
    country,
    Currency
