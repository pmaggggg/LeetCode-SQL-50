# Write your MySQL query statement
WITH tiv AS
(
SELECT * 
FROM Insurance
WHERE tiv_2015 NOT IN (SELECT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(*) = 1)
)
, location AS
(
    SELECT * 
    FROM Insurance
    WHERE (lat, lon) NOT IN (SELECT lat, lon FROM Insurance GROUP BY lat, lon HAVING COUNT(*) > 1)
)
, unioned AS
(
SELECT *
FROM tiv
UNION ALL
SELECT * 
FROM location
)
, uniqued AS
(
SELECT pid, tiv_2016
FROM unioned
GROUP BY pid
HAVING COUNT(*) > 1
)
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM uniqued