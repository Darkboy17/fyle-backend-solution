-- Write query to find the number of grade A's given by the teacher who has graded the most assignments

SELECT t.id AS teacher_id, COUNT(a.grade) AS count_grade_A_assignments
FROM assignments a
JOIN teachers t ON a.teacher_id = t.id
WHERE a.grade = 'A'
GROUP BY t.id
HAVING COUNT(a.grade) = (
    SELECT MAX(count_grade_A_assignments)
    FROM (
        SELECT COUNT(grade) AS count_grade_A_assignments
        FROM assignments
        WHERE grade = 'A'
        GROUP BY teacher_id
    ) AS subquery
);
