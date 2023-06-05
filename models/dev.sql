{{config(materialized="ephemeral")}}
select * from {{ source('restaurant', 'RESTAURANTS') }}