select
    o.*
    , d.value as dish_id
from
    {{ ref('base_orders_bis') }} as o
, table(flatten(input => parse_json(o.dishes_ids), outer => true)) as d