create database LibraryDB;
use LibraryDB;

#Books table
CREATE table Books(book_id int auto_increment primary key,title varchar(255) not null,
author varchar(255) not null,genre varchar(100),published_year year,
is_available boolean  default True);

#Members table
CREATE TABLE Members (
member_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255),
phone_number VARCHAR(15),
join_date DATE DEFAULT (current_date));

#Librarian table
CREATE TABLE Librarians (
librarian_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255),
phone_number VARCHAR(15),
hire_date DATE DEFAULT (CURRENT_DATE));

#Borrowing table
CREATE TABLE Borrowing (
loan_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT,
member_id INT,
borrow_date DATE DEFAULT  (CURRENT_DATE),
return_date DATE,
librarian_id INT,
FOREIGN KEY (book_id) REFERENCES Books(book_id),
FOREIGN KEY (member_id) REFERENCES Members(member_id),
FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);

#_insert_sample_data.sql
use LibraryDB;

#Books
INSERT INTO Books (title, author, genre, published_year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('1984', 'George Orwell', 'Dystopian', 1949),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);

#Members
INSERT INTO Members (name, email, phone_number) VALUES
('Alen King', 'alenking@example.com', '1234567890'),
('Alece Hofman', 'alecehofman@example.com', '9876543210');

#Librarians
INSERT INTO Librarians (name, email, phone_number) VALUES
('Nail Horn', 'nail@example.com', '4567891230'),
('Garden McGraw', 'garden@example.com', '7894561230');

#queries.sql
#1.Borrow a book
INSERT INTO Borrowing (book_id, member_id, librarian_id)
VALUES (1, 1, 1);
UPDATE Books SET is_available = FALSE WHERE book_id = 1;UPDATE Borrowing SET return_date = CURRENT_DATE WHERE loan_id = 1;

#2. Return a Book
UPDATE Borrowing SET return_date = CURRENT_DATE WHERE loan_id = 1;
UPDATE Books SET is_available = TRUE WHERE book_id = 1;







