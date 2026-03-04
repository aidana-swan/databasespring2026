CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    manager_name VARCHAR(100),
    budget DECIMAL(10,2)
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INTEGER NOT NULL REFERENCES departments(dept_id) ON DELETE RESTRICT
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL,
    instructor VARCHAR(100)
);

CREATE TABLE student_enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INTEGER NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade CHAR(2),
    UNIQUE(student_id, course_id)
);
