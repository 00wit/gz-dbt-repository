select
m.orders_id,
m.date_date,
ROUND(m.total_margin + sh.shipping_fee - sh.log_cost - sh.ship_cost,2) as operational_margin
FROM {{ref('int_orders_margin')}} as m
JOIN {{ref('stg_raw__shipment')}} as sh
USING(orders_id)