SELECT
    m.orders_id,
    m.date_date,
    m.total_revenue,
    m.total_quantity,
    m.total_purchase_cost,
    m.total_margin,
    sh.shipping_fee,
    sh.log_cost,
    sh.ship_cost,
    ROUND(
        m.total_margin
        + sh.shipping_fee
        - sh.log_cost
        - sh.ship_cost,
        2
    ) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS m
JOIN {{ ref('stg_raw__shipment') }} AS sh
USING (orders_id)