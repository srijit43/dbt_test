with payments as (
    Select
        id as payment_id,
        orderid,
        paymentmethod,
        status,
        amount,
        created

    from raw.stripe.payments
)

Select * from payments