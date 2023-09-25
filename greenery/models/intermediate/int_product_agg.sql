{{
    config(
        materialized = 'table'   
    )
}}

select  
        oi.product_guid,
        a.country,
        a.state,
        a.zipcode,
        o.create_at_utc::date as order_date,
        sum(oi.quantity) as order_quantity
from 
        stg_postgres__orders o
    join 
        stg_postgres__order_items oi
    on
        o.order_guid = oi.order_guid
    join
        stg_postgres__products p
    on
        oi.product_guid = p.product_guid
    join
        stg_postgres__users u
    on
        o.user_guid = u.user_guid
    join 
        stg_postgres__addresses a
    on
        u.address_guid = a.address_guid
group by all

 