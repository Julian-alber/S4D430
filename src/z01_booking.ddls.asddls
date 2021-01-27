@AbapCatalog.sqlViewName: 'Z01BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 8'
define view Z01_booking as select from sbook as b  {
        
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
        b.customid            
}

where b.cancelled <> 'x'
