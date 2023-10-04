
{{
    config(
        materialized = 'table'
    )
}}

select
    event_guid,
    created_at_utc,
    user_guid,
    {{event_types('stg_postgres__events', 'event_type') }}
from {{ref('stg_postgres__events')}}
group by 1,2,3