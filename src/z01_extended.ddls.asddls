@AbapCatalog.sqlViewName: 'Z01EXTENDED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 12'
define view Z01_Extended as select from Z01_booking as b 
    association [1] to Z01_customer as _customer on b.customid = _customer.id {
    
        key b.carrid,
        key b.connid,
        key b.fldate,
        key b.bookid,         
        b.amount,             
        b.Currency,                     
        b.luggweight,      
        b.wunit,        
        b.order_date,
        b.days_ahead,        
        b.agencynum,        
        b.customid,   
        _customer    
}
