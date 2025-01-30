# Write your MySQL query statement
SELECT e.employee_id,
e.name,
 COUNT(e2.reports_to) AS reports_count,
 ROUND(AVG(e2.age), 0) AS average_age
 FROM employees AS e
 INNER JOIN employees AS e2
 ON e2.reports_to = e.employee_id
GROUP BY e.employee_id, e.name
 ORDER BY employee_id