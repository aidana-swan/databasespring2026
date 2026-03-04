CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

INSERT INTO Students (first_name, last_name, birth_date)
VALUES ('Аман', 'Исаков', '2008-05-12');

INSERT INTO Students (first_name, last_name, birth_date) VALUES
('Саадат', 'Токтогулова', '2008-09-23'),
('Нурбек', 'Маматов', '2009-01-15'),
('Мээрим', 'Бекова', '2008-07-30');

UPDATE Students
SET birth_date = '2008-05-15'
WHERE first_name = 'Аман' AND last_name = 'Исаков';

DELETE FROM Students
WHERE first_name = 'Мээрим' AND last_name = 'Бекова';

UPDATE Students
SET last_name = 'Беков'
WHERE last_name IN ('Исаков', 'Маматов');

DELETE FROM Students
WHERE student_id IN (2, 3);
