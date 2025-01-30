# Write your MySQL query statement
SELECT activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
AND activity_type IS NOT NULL
GROUP BY activity_date