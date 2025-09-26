CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    age INT DEFAULT 18,
    city VARCHAR(30),
    phone VARCHAR(15)
);

CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);

INSERT INTO Students VALUES 
('S101', 'Ravi', 20, 'Hyderabad', '9876543210'),
('S102', 'Priya', 19, 'Secunderabad', NULL),
('S103', 'Amit', 21, 'Hyderabad', '9123456789'),
('S104', 'Sneha', 18, 'Gachibowli', '9988776655'),
('S105', 'Kiran', 22, 'Hyderabad', NULL);

INSERT INTO Exams VALUES 
(1, 'S101', 'Maths', 85, '2024-10-01'),
(2, 'S101', 'Physics', NULL, '2024-10-02'),
(3, 'S102', 'Maths', 78, '2024-10-01'),
(4, 'S103', 'Physics', 92, '2024-10-02'),
(5, 'S104', 'Maths', NULL, '2024-10-01'),
(6, 'S105', 'Physics', 88, '2024-10-02');

UPDATE Students SET name = 'Sneha Reddy' WHERE student_id = 'S104';
UPDATE Exams SET marks = 0 WHERE marks IS NULL;
DELETE FROM Students WHERE name = 'Kiran';
