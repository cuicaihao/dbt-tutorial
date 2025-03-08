
-- test_customer_order_consistency.sql
-- Description: Tests that if a customer has a first_order_date, they must also have 
-- a most_recent_order_date and number_of_orders >= 1
SELECT
    customer_id,
    first_name,
    last_name,
    first_order_date,
    most_recent_order_date,
    number_of_orders,
    CASE
        WHEN most_recent_order_date IS NULL THEN 'Missing most_recent_order_date'
        WHEN number_of_orders < 1 THEN 'Number of orders less than 1'
        ELSE 'Multiple issues'
    END AS failure_reason
FROM
    {{ ref('customers') }}
WHERE
    -- Identify records that break the business rule
    first_order_date IS NOT NULL
    AND (
        most_recent_order_date IS NULL
        OR number_of_orders < 1
    )
ORDER BY
    customer_id