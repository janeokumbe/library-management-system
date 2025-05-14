-- Create the Library Management Database
CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    biography TEXT
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    published_year SMALLINT NOT NULL,
    total_copies INT DEFAULT 1 CHECK (total_copies >= 1)
);

-- BookAuthors Table (Many-to-Many)
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- BookCategories Table (Many-to-Many)
CREATE TABLE BookCategories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    membership_date DATE NOT NULL
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert Authors
INSERT INTO Authors (name, biography) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George Orwell', 'English novelist and essayist, known for 1984 and Animal Farm.'),
('Jane Austen', 'English novelist known for Pride and Prejudice.');

-- Insert Categories
INSERT INTO Categories (name) VALUES
('Fiction'),
('Fantasy'),
('Classics'),
('Dystopian');

-- Insert Books
INSERT INTO Books (title, isbn, published_year, total_copies) VALUES
('Harry Potter and the Sorcerer\'s Stone', '9780747532699', 1997, 5),
('1984', '9780451524935', 1949, 3),
('Pride and Prejudice', '9780141439518', 1813, 4);

-- Associate Books with Authors
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1), -- Harry Potter by J.K. Rowling
(2, 2), -- 1984 by George Orwell
(3, 3); -- Pride and Prejudice by Jane Austen

-- Associate Books with Categories
INSERT INTO BookCategories (book_id, category_id) VALUES
(1, 1), (1, 2),      -- Harry Potter: Fiction, Fantasy
(2, 1), (2, 4),      -- 1984: Fiction, Dystopian
(3, 1), (3, 3);      -- Pride and Prejudice: Fiction, Classics

-- Insert Members
INSERT INTO Members (name, email, phone, membership_date) VALUES
('Alice Johnson', 'alice@example.com', '1234567890', '2024-01-15'),
('Bob Smith', 'bob@example.com', '0987654321', '2024-03-10');

-- Insert Loans
INSERT INTO Loans (book_id, member_id, loan_date, due_date, return_date) VALUES
(1, 1, '2025-05-01', '2025-05-15', NULL), -- Not returned yet
(2, 2, '2025-04-10', '2025-04-24', '2025-04-22'); -- Returned
