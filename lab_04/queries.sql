-- 1. Выбрать всех студентов
SELECT * FROM students;

-- 2. Выбрать только имена и почту
SELECT name, email FROM students;

-- 3. Фильтрация (WHERE) - поиск Тимура
SELECT name, email FROM students WHERE name = 'Timur';

-- 4. Сортировка (ORDER BY) по имени
SELECT name, email FROM students ORDER BY name;

-- 5. Ограничение (LIMIT) - только первые 2 записи
SELECT name, email FROM students LIMIT 2;
