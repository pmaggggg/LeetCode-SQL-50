# Write your MySQL query statement
WITH full AS
(
SELECT m.title, u.name, r.* FROM MovieRating AS r
INNER JOIN Users AS u
ON r.user_id = u.user_id
INNER JOIN Movies AS m
ON r.movie_id = m.movie_id
)
, daniel AS
(
SELECT name
FROM full
GROUP BY name, user_id
ORDER BY COUNT(*) DESC , name ASC
LIMIT 1
)
, frozen AS
(
SELECT title
FROM full
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY title
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1
)
SELECT name AS results 
FROM daniel 
UNION ALL
SELECT title AS results
FROM frozen 