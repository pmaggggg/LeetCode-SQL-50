# Write your MySQL query statement
WITH CTE AS
(
SELECT *, SUM(weight) OVER (ORDER BY turn) AS cum
FROM Queue
ORDER BY turn
)
SELECT person_name 
FROM CTE
WHERE cum<= 1000
ORDER BY cum DESC
LIMIT 1