# Write your MySQL query statement
WITH CTE AS
(
    SELECT c.action, s.user_id
    FROM Signups AS s
    LEFT JOIN Confirmations AS c
    ON s.user_id = c.user_id
)
SELECT 
    CTE.user_id, 
    ROUND(SUM(COALESCE(CASE WHEN CTE.action = 'confirmed' THEN 1 ELSE 0 END, 0)) / COUNT(COALESCE(CTE.action, 0)), 2) AS confirmation_rate
FROM CTE
GROUP BY CTE.user_id;
