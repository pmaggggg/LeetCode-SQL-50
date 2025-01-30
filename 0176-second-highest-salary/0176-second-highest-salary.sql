# Write your MySQL query statement
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary <
(
    SELECT MAX(salary) FROM Employee 
)