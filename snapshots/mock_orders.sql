{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
        target_database='ANALYTICS',
        target_schema=new_schema,  
        unique_key='order_id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=False
    )
}}

select * from ANALYTICS.{{target.schema}}.mock_orders -- Update source details

{% endsnapshot %}
