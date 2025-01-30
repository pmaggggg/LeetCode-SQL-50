# Write your MySQL query statement
WITH tables AS
(
SELECT DISTINCT c.customer_id, p.product_key
FROM Customer AS c
CROSS JOIN Product AS p
)
, solution AS
(
SELECT tables.customer_id, c.product_key 
FROM tables
LEFT JOIN Customer AS c
ON tables.customer_id = c.customer_id
AND tables.product_key = c.product_key
)
SELECT DISTINCT solution.customer_id AS customer_id
FROM solution
GROUP BY solution.customer_id
HAVING COUNT(solution.product_key) = COUNT(*)
