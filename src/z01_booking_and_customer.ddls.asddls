@AbapCatalog.sqlViewName: 'Z01BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 8'
define view Z01_booking_and_customer as select from 
    Z01_booking as b inner join Z01_customer as c on b.customid = c.id {
    
        key b.carrid,
        key b.connid,
        key b.fldate,
        key b.bookid,       
        b.class,    
        b.amount,             
        b.Currency,                     
        b.luggweight,      
        b.wunit,        
        b.order_date,
        b.days_ahead,        
        b.agencynum,
        b.counter,
        b.customid,       
        c.name,  
        c.street,
        c.postcode,
        c.city,
        c.country,                
         c.discount
}
