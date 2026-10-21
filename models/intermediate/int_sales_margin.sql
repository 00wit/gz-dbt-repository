select
s.*,
ROUND(s.quantity * p.purchase_price, 2) as purchase_cost,
ROUND(s.revenue - (s.quantity * p.purchase_price) , 2) as margin
FROM {{ref("stg_raw__sales")}} as s
JOIN {{ref("stg_raw__product")}} as p
USING (products_id)