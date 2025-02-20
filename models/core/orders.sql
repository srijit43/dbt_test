-- Select max(order_date) from {{ref('stg_orders')}}

{{
    config(
        materialized = "incremental"
    )
}}

with orders as (
    select * from {{ref('stg_orders')}}
    {% if is_incremental() %}
    where order_date >= (Select max(order_date) from {{this}})
    {% endif %}
)

Select * from orders