# Write your MySQL query statement below
## gg
SELECT name
FROM Customer
WHERE referee_id IS NULL
OR referee_id != 2