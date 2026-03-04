CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(100)
);

INSERT INTO staff (name, subject, salary, email) VALUES
('Аман Исмаилов', 'Математика', 80000, 'aman@gmail.com'),
('Бермет Касымова', 'Информатика', 110000, 'bermet@school.kg'),
('Руслан Алиев', 'Математика', 55000, 'ruslan@gmail.com'),
('Салтанат Оморова', 'Физика', 95000, 'saltanat@gmail.com'),
('Бахтияр Бекбоев', 'Информатика', 65000, 'bakha@mail.ru');

SELECT * FROM staff;
SELECT name, salary, salary * 0.10 AS bonus FROM staff;

SELECT name, salary FROM staff WHERE subject = 'Математика';
SELECT name FROM staff WHERE salary > 70000 AND subject = 'Информатика';
SELECT name FROM staff WHERE salary BETWEEN 60000 AND 100000;

SELECT name FROM staff WHERE name LIKE 'А%';
SELECT email FROM staff WHERE email ILIKE '%@gmail.com';

SELECT name, salary,
    CASE
        WHEN salary > 100000 THEN 'Senior'
        WHEN salary BETWEEN 60000 AND 100000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS staff_level
FROM staff;

WITH subject_averages AS (
    SELECT subject, AVG(salary) AS avg_salary
    FROM staff
    GROUP BY subject
)
SELECT s.name, s.salary, s.subject, sa.avg_salary
FROM staff s
JOIN subject_averages sa ON s.subject = sa.subject;
