/* Write your T-SQL query statement below */
SELECT e.name, u.unique_id
FROM Employees AS e
LEFT JOIN EmployeeUNI AS u
ON e.id = u.id