@AbapCatalog.sqlViewName: 'Z01PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 10'
define view Z01_partner_with_revenue as select from Z01_customer_with_revenue {
    
    //Z01_customer_with_revenue
    key ID,
    'C' as type,
    name,
    street,
    postcode,
    city,
    country,
    amount,
    Currency,
    days_ahead
}

union select from S4d430_Agency_With_Revenue {

    key id,
    'A' as Type,
    name,
    street,
    postcode,
    city,
    country,
    amount,
    currency,
    days_ahead
}
