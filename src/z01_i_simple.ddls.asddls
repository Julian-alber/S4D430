@AbapCatalog.sqlViewName: 'Z01SIMPLE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Aufgabe 3'
define view Z01_I_SIMPLE as select from sbook {
    
    carrid,
    connid,
    fldate,
    bookid,
    class,
    forcuram,
    forcurkey,
    luggweight,
    wunit,
    order_date,
    agencynum,
    counter,
    customid
}
