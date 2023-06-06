{{
    config(
        materialized='table'
    )
}}
select distinct * from {{ source("restaurant", "ORDERS") }}
