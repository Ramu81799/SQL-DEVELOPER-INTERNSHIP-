CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30),
    department VARCHAR(50),
    fees_paid DECIMAL(10,2)
);

CREATE TABLE ExamResults (
    exam_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);

INSERT INTO Students VALUES 
('S101', 'Ravi Kumar', 20, 'Hyderabad', 'Computer Science', 25000.00),
('S102', 'Priya Reddy', 19, 'Secunderabad', 'Electronics', 22000.50),
('S103', 'Amit Sharma', 21, 'Hyderabad', 'Computer Science', 28000.00),
('S104', 'Sneha Singh', 18, 'Gachibowli', 'Mechanical', 19000.75),
('S105', 'Kiran Mehta', 22, 'Madhapur', 'Electronics', 23000.00),
('S106', 'Anita Das', 20, 'Hyderabad', 'Computer Science', 26000.00),
('S107', 'Rajesh Nair', 19, 'Hyderabad', 'Mechanical', 20000.00),
('S108', 'Pooja Verma', 21, 'Secunderabad', 'Electronics', 24000.25);

INSERT INTO ExamResults VALUES 
(1, 'S101', 'Mathematics', 85, '2024-10-01'),
(2, 'S101', 'Physics', 78, '2024-10-02'),
(3, 'S102', 'Mathematics', 92, '2024-10-01'),
(4, 'S103', 'Physics', 65, '2024-10-02'),
(5, 'S104', 'Mathematics', 88, '2024-10-01'),
(6, 'S105', 'Physics', 45, '2024-10-02'),
(7, 'S106', 'Mathematics', 95, '2024-10-01'),
(8, 'S106', 'Physics', 82, '2024-10-02'),
(9, 'S107', 'Mathematics', 72, '2024-10-01'),
(10, 'S108', 'Physics', 68, '2024-10-02'),
(11, 'S102', 'Physics', 80, '2024-10-02'),
(12, 'S103', 'Mathematics', 75, '2024-10-01');

SELECT COUNT(*) AS total_students FROM Students;

SELECT COUNT(DISTINCT city) AS unique_cities FROM Students;

SELECT AVG(age) AS average_age FROM Students;

SELECT MAX(marks) AS highest_marks FROM ExamResults;

SELECT MIN(marks) AS lowest_marks FROM ExamResults;

SELECT SUM(fees_paid) AS total_fees_collected FROM Students;

SELECT department, COUNT(*) AS number_of_students 
FROM Students 
GROUP BY department;

SELECT city, COUNT(*) AS student_count 
FROM Students 
GROUP BY city 
ORDER BY student_count DESC;

SELECT department, AVG(fees_paid) AS average_fees 
FROM Students 
GROUP BY department;

SELECT subject, AVG(marks) AS average_marks 
FROM ExamResults 
GROUP BY subject;

SELECT department, MAX(fees_paid) AS highest_fee 
FROM Students 
GROUP BY department;

SELECT city, department, COUNT(*) AS student_count 
FROM Students 
GROUP BY city, department 
ORDER BY city, department;

SELECT subject, COUNT(*) AS exam_count, 
       AVG(marks) AS avg_marks, 
       MAX(marks) AS max_marks, 
       MIN(marks) AS min_marks 
FROM ExamResults 
GROUP BY subject;

SELECT department, ROUND(AVG(fees_paid), 2) AS avg_fees_rounded 
FROM Students 
GROUP BY department;

SELECT city, COUNT(*) AS student_count 
FROM Students 
GROUP BY city 
HAVING COUNT(*) > 1;

SELECT department, AVG(marks) AS avg_marks 
FROM Students s 
JOIN ExamResults e ON s.student_id = e.student_id 
GROUP BY department 
HAVING AVG(marks) > 75;

SELECT subject, COUNT(*) AS total_exams 
FROM ExamResults 
GROUP BY subject 
HAVING COUNT(*) >= 3;

SELECT city, department, COUNT(*) AS student_count 
FROM Students 
GROUP BY city, department 
HAVING COUNT(*) >= 2 
ORDER BY city, department;
