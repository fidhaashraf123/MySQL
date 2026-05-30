use LibraryDB;
UPDATE Books set is_available=true where book_id=1;

#3.List available books
SELECT * FROM Books WHERE is_available = TRUE;

#4.Member Loan History
select m.name,b.title,br.borrow_date,br.return_date
from borrowing br
join members m on br.member_id=m.member_id
join books b on br.book_id=b.book_id
where m.member_id=1;

#5. Overdue books (>14 days)
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL
AND br.borrow_date < CURRENT_DATE - INTERVAL 14 DAY;

#6. Books by 'George Orwell'
SELECT title, genre, published_year
FROM Books
WHERE author = 'George Orwell';

#7. Books published after 2000
SELECT title, author, published_year
FROM Books
WHERE published_year > 2000;

# 8. Total books in library
SELECT COUNT(*) AS total_books FROM Books;

#9. Members who borrowed '1984'
select m.name ,br.borrow_date,br.return_date
from Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE b.title = '1984';

#10. Bor;rowing history for member 1
select b.title ,br.borrow_date,br.return_date
from Borrowing br
join Books b on br.book_id=b.book_id
where br.member_id=1;
 
 #11. Available Fiction books
SELECT title, author, published_year
FROM Books
WHERE genre = 'Fiction' AND is_available = TRUE;

#12. Total books borrowed per member
SELECT m.name, COUNT(br.loan_id) AS total_books_borrowed
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
GROUP BY m.name;

#13. Overdue books not returned (>30 days)
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL
AND br.borrow_date < CURRENT_DATE - INTERVAL 30 DAY;

# 14. Top librarians by borrowings
SELECT l.name, COUNT(br.loan_id) AS total_borrowings
FROM Borrowing br
JOIN Librarians l ON br.librarian_id = l.librarian_id
GROUP BY l.name
ORDER BY total_borrowings DESC;

#15. Currently borrowed books
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;


