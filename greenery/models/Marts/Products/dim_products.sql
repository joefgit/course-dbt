{{
    config(
        materialized = 'table'
    )
}}

with products as (
    select * from {{ ref('stg_postgres__products')}}
)

select
    product_guid,
    name,
    price,
    inventory
from products