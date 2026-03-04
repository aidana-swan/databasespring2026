ALTER TABLE students ADD COLUMN date_of_birth DATE;

ALTER TABLE students DROP COLUMN faculty;

ALTER TABLE students ALTER COLUMN first_name TYPE TEXT;

ALTER TABLE students ADD CONSTRAINT unique_student_email UNIQUE (email);

ALTER TABLE students RENAME COLUMN email TO email_address;

ALTER TABLE students RENAME TO university_students;
