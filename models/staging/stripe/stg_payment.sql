with payments as (
    Select
        id as payment_id,
        orderid,
        paymentmethod,
        status,
        amount,
        created

    from {{source('stripe','payments')}}
)

Select * from payments