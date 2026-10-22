SELECT
d.date_date,
f.operational_margin - d.total_ads_cost as ads_margin,
f.average_basket,
f.operataional_margin,
d.total_ads_cost,
d.total_ads_impression,
d.total_ads_clicks,
f.total_quantity,
f.total_revenue,
f.total_purchase_cost,
f.total_margin,
f.shipping_fee,
f.log_cost,
f.ship_cost
FROM {{ref('int_campaigns_daily')}} as d
JOIN {{ref('finance_days')}} as f
USING(date_date)