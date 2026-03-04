SELECT b.title, a.first_name, a.last_name 
FROM books b 
JOIN book_authors ba ON b.book_id = ba.book_id 
JOIN authors a ON ba.author_id = a.author_id;

SELECT m.first_name, m.last_name, b.title, l.loan_date, l.due_date
FROM members m 
JOIN loans l ON m.member_id = l.member_id 
JOIN books b ON l.book_id = b.book_id;
