INSERT INTO authors (first_name, last_name, birth_date) VALUES 
('George', 'Orwell', '1903-06-25'),
('Gabriel', 'Garcia Marquez', '1927-03-06');

INSERT INTO books (title, isbn, publication_year, available_copies) VALUES 
('1984', '9780451524935', 1949, 5),
('One Hundred Years of Solitude', '9780060883287', 1967, 3);

INSERT INTO book_authors (book_id, author_id) VALUES (1, 1), (2, 2);

INSERT INTO members (first_name, last_name, email, phone) VALUES 
('Aidana', 'Swan', 'aa12840@auca.kg', '555-0101'),
('John', 'Doe', 'john.doe@example.com', '555-0202');

INSERT INTO loans (member_id, book_id, due_date) VALUES 
(1, 1, CURRENT_DATE + INTERVAL '14 days'),
(2, 2, CURRENT_DATE + INTERVAL '14 days');
