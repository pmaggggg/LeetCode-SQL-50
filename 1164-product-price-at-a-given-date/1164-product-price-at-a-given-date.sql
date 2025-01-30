#
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN
(
    SELECT product_id, MAX(change_date) AS dates
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
UNION ALL

SELECT product_id,
CASE WHEN change_date > '2019-08-16' THEN 10
ELSE new_price END AS price
FROM Products
WHERE change_date > '2019-08-16'
AND (change_date, product_id)
IN
(
    SELECT MIN(change_date), product_id
    FROM Products
    GROUP BY product_id
)

