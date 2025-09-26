CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30),
    phone VARCHAR(15),
    joining_date DATE
);

CREATE TABLE ExamResults (
    exam_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);

INSERT INTO Students VALUES 
('S101', 'Ravi Kumar', 20, 'Hyderabad', '9876543210', '2024-01-15'),
('S102', 'Priya Reddy', 19, 'Secunderabad', NULL, '2024-02-10'),
('S103', 'Amit Sharma', 21, 'Hyderabad', '9123456789', '2024-01-20'),
('S104', 'Sneha Singh', 18, 'Gachibowli', '9988776655', '2024-03-05'),
('S105', 'Kiran Mehta', 22, 'Madhapur', NULL, '2024-02-28'),
('S106', 'Anita Das', 20, 'Hyderabad', '9000011111', '2024-01-25');

INSERT INTO ExamResults VALUES 
(1, 'S101', 'Mathematics', 85, '2024-10-01'),
(2, 'S101', 'Physics', 78, '2024-10-02'),
(3, 'S102', 'Mathematics', 92, '2024-10-01'),
(4, 'S103', 'Physics', 65, '2024-10-02'),
(5, 'S104', 'Mathematics', 88, '2024-10-01'),
(6, 'S105', 'Physics', 45, '2024-10-02'),
(7, 'S106', 'Mathematics', 95, '2024-10-01'),
(8, 'S106', 'Physics', 82, '2024-10-02');

SELECT * FROM Students;

SELECT name, age, city FROM Students;

SELECT student_id, name FROM Students WHERE city = 'Hyderabad';

SELECT * FROM Students WHERE age BETWEEN 19 AND 21;

SELECT * FROM Students WHERE name LIKE 'A%';

SELECT * FROM ExamResults WHERE marks > 80;

SELECT * FROM ExamResults WHERE subject = 'Physics' AND marks >= 70;

SELECT * FROM Students WHERE city = 'Hyderabad' OR city = 'Madhapur';

SELECT * FROM ExamResults ORDER BY marks DESC;

SELECT * FROM Students ORDER BY joining_date ASC;

SELECT * FROM ExamResults ORDER BY marks DESC LIMIT 3;

SELECT DISTINCT city FROM Students;

SELECT name AS Student_Name, city AS City_Name FROM Students;

SELECT student_id, subject, marks, 
       CASE WHEN marks >= 75 THEN 'Good' 
            WHEN marks >= 50 THEN 'Average' 
            ELSE 'Poor' 
       END AS Grade 
FROM ExamResults;

SELECT * FROM ExamResults WHERE marks IN (85, 88, 95);

SELECT * FROM Students WHERE phone IS NULL;

SELECT * FROM Students WHERE name LIKE '%Reddy%';

SELECT student_id, subject, marks 
FROM ExamResults 
WHERE exam_date BETWEEN '2024-10-01' AND '2024-10-02' 
ORDER BY marks DESC 
LIMIT 5;
