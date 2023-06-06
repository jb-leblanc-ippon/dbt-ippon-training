select
    b.NAME, a.* exclude restaurant_identifier
from {{ ref("stg_restaurants__turnover_by_payment_method") }} as a, {{ ref("base_restaurants") }} as b
where a.restaurant_identifier = b.identifier