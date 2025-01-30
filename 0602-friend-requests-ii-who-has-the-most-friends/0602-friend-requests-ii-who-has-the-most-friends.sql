# Write your MySQL query statement
WITH requestcount AS
(
SELECT requester_id ,COUNT(requester_id) AS count
FROM RequestAccepted
GROUP BY requester_id
)
, acceptcount AS
(
SELECT accepter_id ,COUNT(accepter_id) AS count
FROM RequestAccepted
GROUP BY accepter_id
)
, unioned AS
(SELECT count, accepter_id as id FROM acceptcount
UNION ALL
SELECT count, requester_id as id FROM requestcount
)

SELECT id, SUM(count) AS num 
FROM unioned
GROUP BY  id
ORDER BY num DESC
LIMIT 1