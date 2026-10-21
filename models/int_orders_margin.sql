select
orders_id,
min(date_date)as date_date,
ROUND(sum(revenue),2) as total_revenue,
sum(quantity) as total_quantity,
ROUND(sum(purchase_cost),2) as total_purchase_cost,
ROUND(sum(margin),2) as total_margin
FROM {{ref('int_sales_margin')}}
GROUP BY orders_id