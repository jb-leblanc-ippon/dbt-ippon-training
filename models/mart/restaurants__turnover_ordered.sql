select b.name as name, a.turnover as turnover, b.ADDRESS as address, a.turnover_rank as turnover_rank
from {{ ref("stg_restaurants__turnover") }} as a, {{ ref("base_restaurants") }} as b
where a.restaurant_identifier = b.identifier
order by turnover_rank
