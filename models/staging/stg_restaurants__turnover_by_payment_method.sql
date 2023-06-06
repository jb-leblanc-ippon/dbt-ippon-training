{% set payment_method_list = get_list_of_unique_value_from_column_name() %}

select
    a.restaurant_identifier,
    {% for payment_method in payment_method_list %}
    sum(
        CASE
        WHEN a.payment_method = '{{payment_method}}' THEN a.amount else 0
        END
    ) as {{payment_method}}{%if not loop.last%},{%endif%}
    {% endfor %}

from {{ ref("base_orders") }} as a
group by a.restaurant_identifier
