# Write your MySQL query statement
WITH CTE AS
(
SELECT e.*, d.id AS did, d.name AS dname
FROM Employee AS e
CROSS JOIN Department AS d
ON d.id = e.departmentid
)
,
RANKING AS 
(
SELECT CTE.dname AS Department,
CTE.name AS Employee,
CTE.salary AS Salary,
DENSE_RANK() OVER (PARTITION BY CTE.dname ORDER BY CTE.salary DESC) AS RANKED
FROM CTE
GROUP BY CTE.dname, CTE.name
ORDER BY CTE.Salary DESC
)
SELECT RANKING.Department, RANKING.Employee, RANKING.Salary 
FROM RANKING
WHERE RANKING.RANKED <=3