# Write your MySQL query statement
SELECT user_id, 
CONCAT(UCASE(LEFT(name,1)), LCASE(SUBSTR(name, 2))) AS name
FROM Users
ORDER BY user_id