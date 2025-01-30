#
WITH mindates AS
(
SELECT player_id, MIN(event_date) as min_event_date
FROM Activity
GROUP BY player_id
)
,
bosh AS
(
SELECT mindates.player_id, mindates.min_event_date, a.player_id AS player, a.event_date AS event
FROM mindates
JOIN Activity AS a
ON DATEDIFF(a.event_date, mindates.min_event_date) = 1
AND mindates.player_id = a.player_id
)
SELECT ROUND((COUNT(bosh.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity)), 2) AS fraction
FROM bosh
