# Write your MySQL query statement
WITH CTE AS
(
SELECT s.student_name, su.subject_name, s.student_id
FROM Students AS s
CROSS JOIN Subjects AS su
)
SELECT CTE.student_id, CTE.student_name, CTE.subject_name, COUNT(e.subject_name) AS attended_exams
FROM CTE
LEFT JOIN Examinations AS e
ON CTE.student_id = e.student_id AND CTE.subject_name = e.subject_name
GROUP BY CTE.student_name, CTE.subject_name, e.student_id
ORDER BY CTE.student_id, CTE.subject_name