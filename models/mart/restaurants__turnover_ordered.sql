select
    b.name as name,
    b.address as address,
    a.turnover as turnover,
    a.turnover_rank as turnover_rank
from {{ ref("stg_restaurants__turnover") }} as a, {{ ref("base_restaurants") }} as b
where a.restaurant_identifier = b.identifier
having turnover_rank <= {{ var("nb_restaurants_to_show") }}
order by turnover_rank
