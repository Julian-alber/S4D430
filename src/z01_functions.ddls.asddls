@AbapCatalog.sqlViewName: 'Z01FUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 7'
define view Z01_FUNCTIONS as select from
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
             
        currency_conversion( 
            amount => b.forcuram, 
            source_currency => b.forcurkey, 
            target_currency => cast('USD' as abap.cuky), 
            exchange_rate_date => b.order_date ) as amount @<Semantics.amount.currencyCode: 'currency',
        cast('USD' as abap.cuky) as Currency @<Semantics.currencyCode: true ,        
        
        @Semantics.quantity.unitOfMeasure: 'wunit'
        b.luggweight,
        @Semantics.unitOfMeasure: true
        b.wunit,
        
        b.order_date,
        dats_days_between(b.order_date, b.fldate) as days_ahead,
        
        b.agencynum,
        b.counter,
        b.customid,       
        concat_with_space(c.form, c.name, 1) as name,  
        c.street,
        c.postcode,
        c.city,
        c.country,         
        
        @EndUserText.label: 'Discount Factor'  
        @EndUserText.quickInfo: 'Customer Specific Discount Factor'     
        division(cast(c.discount as abap.int4), 100, 2) as discount
}

where b.cancelled <> 'x'
    
