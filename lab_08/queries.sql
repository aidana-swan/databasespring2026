SELECT d.dept_name, e.first_name, e.last_name, e.salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
ORDER BY d.dept_name;

SELECT s.first_name || ' ' || s.last_name AS student_name,
       c.course_code,
       c.course_name,
       se.grade
FROM students s
JOIN student_enrollments se ON s.student_id = se.student_id
JOIN courses c ON se.course_id = c.course_id
ORDER BY s.last_name, c.course_code;
