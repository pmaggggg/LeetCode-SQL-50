# Write your MySQL query statement
SELECT Name
FROM Employee WHERE id IN
(
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)