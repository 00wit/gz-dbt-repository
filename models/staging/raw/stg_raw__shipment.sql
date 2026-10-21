with 

source as (

    select * from {{ source('raw', 'shipment') }}

),

renamed as (

    select
        orders_id,
        CAST(shipping_fee as FLOAT64) as shipping_fee,
        log_cost,
        ship_cost

    from source

)

select * from renamed