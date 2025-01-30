# Write your MySQL query statement
SELECT teacher_id, 
   COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id