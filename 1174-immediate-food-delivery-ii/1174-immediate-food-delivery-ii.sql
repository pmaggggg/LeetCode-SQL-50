# Write your MySQL query statement
WITH CTE AS
(
SELECT *,
CASE WHEN order_date = customer_pref_delivery_date THEN 'immidiate' ELSE 'scheduled' END AS scale
FROM Delivery
WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id)
ORDER BY customer_id, delivery_id
)
SELECT ROUND((SUM(CASE WHEN CTE.scale = 'immidiate' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) as immediate_percentage
FROM CTE