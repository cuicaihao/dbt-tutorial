-- Check if the number of orders is negative
SELECT
    customer_id,
    number_of_orders,
FROM
    {{ ref('customers') }}
WHERE
    number_of_orders < 0
ORDER BY
    customer_id
 