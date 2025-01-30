/* Write your T-SQL query statement */
SELECT id, movie, description, rating
FROM Cinema
WHERE description != 'boring'
AND id % 2 = 1
ORDER BY rating desc