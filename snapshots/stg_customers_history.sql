{% snapshot stg_customers_history %}

{{
    config(
        target_schema='jaffle_shop',
        unique_key='customer_id',
        strategy='check', 
        check_cols=['first_name', 'last_name']
    )
}}

SELECT
    * 
FROM
    {{ ref('stg_customers') }}

{% endsnapshot %}