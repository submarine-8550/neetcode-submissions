SELECT e1.student_id,
       MIN(e1.exam_id) AS exam_id,
       e1.score
FROM exam_results e1
JOIN (
    SELECT student_id,
           MAX(score) AS max_score
    FROM exam_results
    GROUP BY student_id
) e2
ON e1.student_id = e2.student_id
AND e1.score = e2.max_score
GROUP BY e1.student_id, e1.score
ORDER BY e1.student_id;