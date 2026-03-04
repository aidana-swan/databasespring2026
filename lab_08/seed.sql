INSERT INTO departments (dept_name, manager_name, budget) VALUES
('Engineering', 'Alice Johnson', 500000.00),
('Marketing', 'Bob Wilson', 200000.00);

INSERT INTO employees (first_name, last_name, salary, dept_id) VALUES
('John', 'Smith', 75000.00, 1),
('Jane', 'Doe', 85000.00, 1),
('Mike', 'Brown', 80000.00, 1),
('Sarah', 'Davis', 55000.00, 2);

INSERT INTO students (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice@university.edu'),
('Bob', 'Smith', 'bob@university.edu'),
('Carol', 'Wilson', 'carol@university.edu');

INSERT INTO courses (course_code, course_name, credits, instructor) VALUES
('CS101', 'Introduction to Programming', 3, 'Dr. Brown'),
('CS201', 'Data Structures', 4, 'Dr. Davis'),
('MATH101', 'Calculus I', 4, 'Dr. Wilson');

INSERT INTO student_enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B+'),
(2, 1, 'A-'),
(2, 3, 'B'),
(3, 2, 'A'),
(3, 3, 'A-');
