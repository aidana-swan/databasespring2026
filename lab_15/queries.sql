CREATE TABLE school_hierarchy (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INTEGER REFERENCES school_hierarchy(id)
);

INSERT INTO school_hierarchy (name, position, salary, manager_id) VALUES
('Азамат Бакиров', 'Директор', 150000, NULL),
('Айгуль Осмонова', 'Завуч', 120000, 1),
('Улан Садыков', 'Учитель', 80000, 2),
('Бермет Касымова', 'Учитель', 85000, 2),
('Эркин Алиев', 'Охранник', 45000, 1);

-- 1. Подзапрос (Учителя, чья зарплата выше средней)
SELECT name, salary 
FROM school_hierarchy 
WHERE salary > (SELECT AVG(salary) FROM school_hierarchy);

-- 2. CTE (Временная таблица со средними зарплатами)
WITH average_salary AS (
    SELECT AVG(salary) as avg_val FROM school_hierarchy
)
SELECT name, salary 
FROM school_hierarchy, average_salary
WHERE salary < avg_val;

-- 3. Рекурсивный CTE (Иерархия школы: кто под кем работает)
WITH RECURSIVE org_chart AS (
    -- Базовая часть (Директор)
    SELECT id, name, position, manager_id, 1 as level
    FROM school_hierarchy
    WHERE manager_id IS NULL
    UNION ALL
    -- Рекурсивная часть
    SELECT sh.id, sh.name, sh.position, sh.manager_id, oc.level + 1
    FROM school_hierarchy sh
    JOIN org_chart oc ON sh.manager_id = oc.id
)
SELECT * FROM org_chart ORDER BY level;

-- 4. Использование EXPLAIN (как в скрине)
EXPLAIN SELECT * FROM school_hierarchy WHERE salary > 50000;
