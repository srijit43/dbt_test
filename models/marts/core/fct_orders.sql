{{
    config (
        materialized = "view"
    )
}}


with orders as (
    Select * from {{ref('stg_orders')}}
),

payments as (
    Select * from {{ref("stg_payment")}}
),

fct_orders as (
    Select order_id,
    customer_id,
    payment_id,
    paymentmethod,
    amount
    from orders o 
    left join
    payments p 
    on 
    o.order_id = p.orderid
)

Select * from fct_orders