@AbapCatalog.sqlViewName: 'Z01ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 4'
define view Z01_ANNOTATIONS as select from  
    sbook as b inner join scustom as c on b.customid = c.id {
        
        key b.carrid,
        key b.connid,
        key b.fldate,
        key b.bookid,
        b.class,        
        b.forcuram as amount @<Semantics.amount.currencyCode: 'currency',
        b.forcurkey as Currency @<Semantics.currencyCode: true ,
        @Semantics.quantity.unitOfMeasure: 'wunit'
        b.luggweight,
        @Semantics.unitOfMeasure: true
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
