{{config(materialized = 'table')}}

SELECT
    date_date,
    ROUND(SUM(operational_margin),2) as operational_margin,
    ROUND(SUM(shipping_fee),2) as shipping_fee,
    ROUND(SUM(log_cost),2) as log_cost,
    ROUND(SUM(ship_cost),2) as ship_cost,
    COUNT(DISTINCT orders_id) AS nb_transactions,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    SUM(total_quantity) AS total_quantity,
    ROUND(SUM(total_purchase_cost), 2) AS total_purchase_cost,
    ROUND(SUM(total_margin), 2) AS total_margin,
    ROUND(
        SUM(total_revenue) / NULLIF(COUNT(DISTINCT orders_id), 0),
        2
    ) AS average_basket
FROM {{ ref("int_orders_operational") }}
GROUP BY date_date