{{
    config(
        materialized='incremental',
        unique_key=['identifier','hour'],
        on_schema_change='append_new_columns'
    )
}}

select
    d.identifier
    , d.name
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.production_cost)                               as global_profit
    , date_trunc('hour', to_timestamp(odf.created_at))     as hour
    , any_value(sysdate())                                 as inserted_at
from
    {{ ref('stg_orders__dishes_flattened') }} as odf
left join
    {{ ref('base_dishes') }} as d
    on odf.dish_id = d.identifier
{% if is_incremental() %}
    where odf.created_at > (select max(hour) from {{ this }})
{% endif %}
group by
    d.identifier
    , d.name
    , hour