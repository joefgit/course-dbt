{{
    config(
        materialized = 'table'
    )
}}

with products_agg as (
    select * from {{ ref('int_product_agg')}}
)

, products as (
    select * from {{ ref('stg_postgres__products')}}
)

select  
    pa.product_guid,
    p.name,
    pa.country,
    pa.state,
    pa.zipcode,
    pa.order_date,
    pa.order_quantity
from products_agg pa
    join products p
        on pa.product_guid = p.product_guid