#
WITH singles AS
(
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) < 2
)
SELECT MAX(singles.num) as num
FROM singles