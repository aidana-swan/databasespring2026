CREATE TABLE school_staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO school_staff (name, subject, salary, bonus) VALUES
('Аман Исмаилов', 'Математика', 80000, 5000),
('Бермет Касымова', 'Информатика', 110000, NULL),
('Руслан Алиев', 'Математика', 55000, 2000),
('Салтанат Оморова', 'Физика', 95000, 4000),
('Бахтияр Бекбоев', 'Информатика', 65000, NULL);

-- Базовые агрегатные функции
SELECT COUNT(*) AS total_staff, 
       AVG(salary) AS avg_salary, 
       SUM(salary) AS total_budget,
       MIN(salary) AS lowest_salary,
       MAX(salary) AS highest_salary
FROM school_staff;

-- Группировка по предметам
SELECT subject, 
       COUNT(*) AS teacher_count, 
       AVG(salary) AS avg_subject_salary
FROM school_staff
GROUP BY subject;

-- Фильтрация групп (HAVING)
SELECT subject, AVG(salary) AS avg_salary
FROM school_staff
GROUP BY subject
HAVING AVG(salary) > 70000;

-- Продвинутая агрегация (список имен через запятую)
SELECT subject, STRING_AGG(name, ', ') AS teachers
FROM school_staff
GROUP BY subject;

-- Работа с NULL (подсчет бонусов)
SELECT COUNT(*) AS total_rows,
       COUNT(bonus) AS staff_with_bonus,
       SUM(bonus) AS total_bonuses
FROM school_staff;

-- Оконная функция (зарплата сотрудника vs средняя по предмету)
SELECT name, subject, salary,
       AVG(salary) OVER(PARTITION BY subject) AS subject_avg
FROM school_staff;
