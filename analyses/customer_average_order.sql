{{ config(
    materialized = 'view'
) }}

WITH customer_order_counts AS (
    SELECT
        customer_id,
        number_of_orders
    FROM
        {{ ref('customers') }}
)

SELECT
    AVG(number_of_orders) AS average_orders_per_customer,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(number_of_orders) AS total_orders
FROM
    customer_order_counts