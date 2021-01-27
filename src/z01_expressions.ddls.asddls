@AbapCatalog.sqlViewName: 'Z01EXPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 6'
define view Z01_EXPRESSIONS as select from
    sbook as b inner join scustom as c on b.customid = c.id {
        
        key b.carrid,
        key b.connid,
        key b.fldate,
        key b.bookid,
        
        case b.class 
            when 'Y' then 'Economy'
            when 'C' then 'Business'
            when 'F' then 'First'
            else '???'
        end as class,    
             
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
        c.country,         
        
        @EndUserText.label: 'Discount Factor'  
        @EndUserText.quickInfo: 'Customer Specific Discount Factor'     
        cast(c.discount as abap.fltp) / 100.0 as discount
}

where b.cancelled <> 'x'
    
