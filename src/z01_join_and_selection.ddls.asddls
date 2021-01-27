@AbapCatalog.sqlViewName: 'Z01JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 4'
define view Z01_JOIN_AND_SELECTION as select from  
    sbook as b inner join scustom as c on b.customid = c.id {
        
        key b.carrid,
        key b.connid,
        key b.fldate,
        key b.bookid,
        b.class,
        b.forcuram as Amount,
        b.forcurkey as Currency,
        b.luggweight,
        b.wunit,
        b.order_date,
        b.agencynum,
        b.counter,
        b.customid,       
        c.name,  
        c.street,
        c.postcode,
        c.city,
        c.country                
}

where b.cancelled <> 'x'
