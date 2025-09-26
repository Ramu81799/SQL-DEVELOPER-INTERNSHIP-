CREATE DATABASE library2;
USE library2;

CREATE TABLE Authors(
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);

INSERT INTO Authors VALUES
(1, 'Dan Brown', 'American'),
(2, 'Chetan Bhagat', 'Indian'),
(3, 'Paulo Coelho', 'Brazilian'),
(4, 'Arthur Conan Doyle', 'British');

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    published_year INT
);

INSERT INTO Books VALUES
(1, 'The Da Vinci Code', 'Thriller', 2003),
(2, 'Five Point Someone', 'Fiction', 2004),
(3, 'The Alchemist', 'Philosophical', 1988),
(4, 'Sherlock Holmes: A Study in Scarlet', 'Mystery', 1887),
(5, 'Digital Fortress', 'Thriller', 1998);

CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO BookAuthors VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    membership_date DATE
);

INSERT INTO Members VALUES
(1, 'Ravi Kumar', 'ravi@example.com', '9876501234', '2023-05-12'),
(2, 'Priya Sharma', 'priya@example.com', '9123409876', '2023-06-20'),
(3, 'Arjun Mehta', 'arjun@example.com', '9988701122', '2023-07-05');

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50)
);

INSERT INTO Staff VALUES
(1, 'Meera Nair', 'Librarian'),
(2, 'Rahul Verma', 'Assistant'),
(3, 'Kavita Rao', 'Manager');

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    staff_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

INSERT INTO Loans VALUES
(1, 1, 1, 1, '2023-08-02', '2023-08-16'),
(2, 2, 2, 2, '2023-08-06', '2023-08-22'),
(3, 3, 3, 1, '2023-08-12', NULL),
(4, 4, 1, 3, '2023-09-03', '2023-09-15'),
(5, 5, 2, 2, '2023-09-06', NULL);
