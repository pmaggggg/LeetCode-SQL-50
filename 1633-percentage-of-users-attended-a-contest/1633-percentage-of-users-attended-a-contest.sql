# Write your MySQL query statement
WITH CTE AS
(
SELECT DISTINCT r.contest_id, u.user_id
FROM Register AS r
CROSS JOIN Users AS u
)
,
CTE2 AS(
SELECT CTE.*, r.user_id as right_user_id
FROM CTE
LEFT JOIN Register AS r
ON CTE.user_id = r.user_id AND CTE.contest_id = r.contest_id
)
SELECT CTE2.contest_id,
 ROUND(COUNT(CTE2.right_user_id) / COUNT(CTE2.user_id) * 100, 2)   AS percentage
 FROM CTE2
 GROUP BY CTE2.contest_id
 ORDER BY ROUND(COUNT(CTE2.right_user_id) / COUNT(CTE2.user_id) * 100, 2) DESC,
 CTE2.contest_id ASC


