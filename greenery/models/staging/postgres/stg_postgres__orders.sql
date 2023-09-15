{{ config(materialized = 'view') }}

with source as (
    select * from {{source ('postgres', 'orders') }}   
)
, renamed_recast as (
select 
order_id as order_guid
, user_id as user_guid
, promo_id
, address_id as address_guid
, created_at as create_at_utc
, order_cost
, shipping_cost
, order_total
, tracking_id as tracking_guid
, shipping_service
, estimated_delivery_at as estimated_delivery_at_utc
, delivered_at as delivered_at_utc
, status
from source
)

select * from renamed_recast