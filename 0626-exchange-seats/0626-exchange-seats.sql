# Write your MySQL query statement
SELECT 
CASE WHEN id IN (SELECT MAX(id) FROM seat) AND MOD(id, 2) = 1 THEN id
WHEN MOD(id, 2) = 0 THEN id - 1
WHEN MOD(id, 2) = 1 THEN id + 1
ELSE id END AS id,
student
FROM Seat
ORDER BY id ASC