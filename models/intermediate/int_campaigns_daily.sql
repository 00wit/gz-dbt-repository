SELECT
date_date,
SUM(ads_cost) as total_ads_cost,
SUM(impression) as total_ads_impression,
SUM(click) as total_ads_clicks
FROM {{ref('int_campaigns')}}
GROUP BY date_date
ORDER BY date_date DESC