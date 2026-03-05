-- Создаем таблицы для примера
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE library_cards (
    card_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    issue_date DATE
);

-- Наполняем данными
INSERT INTO students (name) VALUES ('Аман'), ('Бермет'), ('Руслан');
INSERT INTO library_cards (student_id, issue_date) VALUES (1, '2024-01-10'), (2, '2024-02-15');
-- Руслан (id 3) без карточки, а добавим карточку без студента (если бы не было FK)

-- 1. INNER JOIN (только те, у кого есть карточка)
SELECT s.name, l.issue_date
FROM students s
INNER JOIN library_cards l ON s.student_id = l.student_id;

-- 2. LEFT JOIN (все студенты, даже без карточек)
SELECT s.name, l.issue_date
FROM students s
LEFT JOIN library_cards l ON s.student_id = l.student_id;

-- 3. RIGHT JOIN (все карточки, даже если студент удален)
SELECT s.name, l.issue_date
FROM students s
RIGHT JOIN library_cards l ON s.student_id = l.student_id;

-- 4. FULL OUTER JOIN (вообще все данные из обеих таблиц)
SELECT s.name, l.issue_date
FROM students s
FULL OUTER JOIN library_cards l ON s.student_id = l.student_id;

-- 5. CROSS JOIN (каждый с каждым - декартово произведение)
SELECT s.name, l.card_id
FROM students s
CROSS JOIN library_cards l;

-- 6. SELF JOIN (пример: поиск однофамильцев или пар, тут просто для синтаксиса)
SELECT a.name AS student_a, b.name AS student_b
FROM students a
JOIN students b ON a.student_id <> b.student_id;

-- Индексы для производительности (как в скрине)
CREATE INDEX idx_cards_student_id ON library_cards(student_id);
