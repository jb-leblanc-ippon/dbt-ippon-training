{{
    config(
        materialized='table'
    )
}}
select distinct * from {{ mockable_source("restaurant", "ORDERS", "sample_orders") }}
