# Write your MySQL query statement 
SELECT *
FROM Users WHERE mail LIKE '%@leetcode.com'
AND LEFT(mail, 1) REGEXP '[a-zA-Z]'
AND mail REGEXP '^[a-zA-Z0-9-._]+@leetcode.com$'