CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    faculty VARCHAR(50)
);

CREATE TABLE course_enrollments (
    student_id INTEGER,
    course_id INTEGER,
    semester VARCHAR(20),
    enrollment_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (student_id, course_id)
);
