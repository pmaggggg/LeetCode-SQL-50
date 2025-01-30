# Write your MySQL query statement
WITH allorders AS
(
SELECT p.product_name, p.product_category,
o.order_date, o.unit
FROM Products AS p
INNER JOIN Orders AS o
ON p.product_id = o.product_id
)
SELECT product_name, SUM(unit) AS unit
FROM allorders
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_name
HAVING SUM(unit) >= 100 
