select
    a.restaurant_identifier,
    sum(a.amount) as turnover,
    rank() over (order by turnover desc) as turnover_rank
from {{ ref("base_orders") }} as a
group by a.restaurant_identifier
