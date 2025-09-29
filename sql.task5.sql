CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    course VARCHAR(50)
);

CREATE TABLE ExamResults (
    exam_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    amount_paid DECIMAL(10,2),
    payment_date DATE
);

INSERT INTO Students VALUES 
('S101', 'Ravi Kumar', 'Hyderabad', 'Computer Science'),
('S102', 'Priya Reddy', 'Secunderabad', 'Electronics'),
('S103', 'Amit Sharma', 'Hyderabad', 'Computer Science'),
('S104', 'Sneha Singh', 'Gachibowli', 'Mechanical'),
('S105', 'Kiran Mehta', 'Madhapur', 'Electronics'),
('S106', 'Anita Das', 'Hyderabad', 'Computer Science');

INSERT INTO ExamResults VALUES 
(1, 'S101', 'Mathematics', 85, '2024-10-01'),
(2, 'S101', 'Physics', 78, '2024-10-02'),
(3, 'S102', 'Mathematics', 92, '2024-10-01'),
(4, 'S103', 'Physics', 65, '2024-10-02'),
(5, 'S104', 'Mathematics', 88, '2024-10-01'),
(6, 'S106', 'Physics', 82, '2024-10-02');

INSERT INTO FeePayments VALUES 
(1, 'S101', 25000.00, '2024-09-15'),
(2, 'S102', 22000.50, '2024-09-20'),
(3, 'S103', 28000.00, '2024-09-18'),
(4, 'S104', 19000.75, '2024-09-22'),
(5, 'S106', 26000.00, '2024-09-25');

SELECT s.student_id, s.name, e.subject, e.marks
FROM Students s
INNER JOIN ExamResults e ON s.student_id = e.student_id;

SELECT s.student_id, s.name, e.subject, e.marks
FROM Students s
LEFT JOIN ExamResults e ON s.student_id = e.student_id;

SELECT s.student_id, s.name, e.subject, e.marks
FROM Students s
RIGHT JOIN ExamResults e ON s.student_id = e.student_id;

SELECT s.student_id, s.name, e.subject, e.marks
FROM Students s
LEFT JOIN ExamResults e ON s.student_id = e.student_id
UNION
SELECT s.student_id, s.name, e.subject, e.marks
FROM Students s
RIGHT JOIN ExamResults e ON s.student_id = e.student_id;

SELECT s.student_id, s.name, f.amount_paid, f.payment_date
FROM Students s
INNER JOIN FeePayments f ON s.student_id = f.student_id;

SELECT s.student_id, s.name, f.amount_paid
FROM Students s
LEFT JOIN FeePayments f ON s.student_id = f.student_id;

SELECT s.name, e.subject, e.marks, f.amount_paid
FROM Students s
INNER JOIN ExamResults e ON s.student_id = e.student_id
INNER JOIN FeePayments f ON s.student_id = f.student_id;

SELECT s.student_id, s.name, e.subject, e.marks, f.amount_paid
FROM Students s
LEFT JOIN ExamResults e ON s.student_id = e.student_id
LEFT JOIN FeePayments f ON s.student_id = f.student_id;

SELECT s.student_id, s.name, 
       COALESCE(e.subject, 'No Exam') AS subject,
       COALESCE(e.marks, 0) AS marks
FROM Students s
LEFT JOIN ExamResults e ON s.student_id = e.student_id;