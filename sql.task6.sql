CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    course VARCHAR(50),
    age INT
);

CREATE TABLE ExamResults (
    exam_id INT PRIMARY KEY,
    student_id VARCHAR(10),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);

CREATE TABLE CourseFees (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fee_amount DECIMAL(10,2)
);

INSERT INTO Students VALUES 
('S101', 'Ravi Kumar', 'Hyderabad', 'Computer Science', 20),
('S102', 'Priya Reddy', 'Secunderabad', 'Electronics', 19),
('S103', 'Amit Sharma', 'Hyderabad', 'Computer Science', 21),
('S104', 'Sneha Singh', 'Gachibowli', 'Mechanical', 18),
('S105', 'Kiran Mehta', 'Madhapur', 'Electronics', 22),
('S106', 'Anita Das', 'Hyderabad', 'Computer Science', 20),
('S107', 'Rajesh Nair', 'Hyderabad', 'Mechanical', 19),
('S108', 'Pooja Verma', 'Secunderabad', 'Electronics', 21);

INSERT INTO ExamResults VALUES 
(1, 'S101', 'Mathematics', 85, '2024-10-01'),
(2, 'S101', 'Physics', 78, '2024-10-02'),
(3, 'S102', 'Mathematics', 92, '2024-10-01'),
(4, 'S103', 'Physics', 65, '2024-10-02'),
(5, 'S104', 'Mathematics', 88, '2024-10-01'),
(6, 'S105', 'Physics', 45, '2024-10-02'),
(7, 'S106', 'Mathematics', 95, '2024-10-01'),
(8, 'S107', 'Physics', 72, '2024-10-02'),
(9, 'S108', 'Mathematics', 82, '2024-10-01');

INSERT INTO CourseFees VALUES 
(1, 'Computer Science', 50000.00),
(2, 'Electronics', 45000.00),
(3, 'Mechanical', 40000.00);

SELECT name, city, course
FROM Students
WHERE student_id IN (SELECT student_id FROM ExamResults WHERE marks > 80);

SELECT name, age
FROM Students
WHERE age > (SELECT AVG(age) FROM Students);

SELECT s.name, e.marks
FROM Students s
JOIN ExamResults e ON s.student_id = e.student_id
WHERE e.marks = (SELECT MAX(marks) FROM ExamResults);

SELECT name, course
FROM Students
WHERE EXISTS (SELECT 1 FROM ExamResults WHERE ExamResults.student_id = Students.student_id AND marks < 50);

SELECT student_id, marks
FROM ExamResults
WHERE marks > (SELECT AVG(marks) FROM ExamResults) AND subject = 'Mathematics';

SELECT s.name, s.course, cf.fee_amount
FROM Students s
JOIN CourseFees cf ON s.course = cf.course_name
WHERE cf.fee_amount = (SELECT MAX(fee_amount) FROM CourseFees);

SELECT name, city
FROM Students
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM ExamResults WHERE subject = 'Physics');

SELECT course, COUNT(*) as student_count
FROM Students
GROUP BY course
HAVING COUNT(*) > (SELECT AVG(course_count) FROM (SELECT COUNT(*) as course_count FROM Students GROUP BY course) as counts);

SELECT s.name, 
       (SELECT AVG(marks) FROM ExamResults e WHERE e.student_id = s.student_id) as avg_marks
FROM Students s;

SELECT name, age
FROM Students s1
WHERE age = (SELECT MAX(age) FROM Students s2 WHERE s2.city = s1.city);

SELECT subject, 
       (SELECT COUNT(*) FROM ExamResults e2 WHERE e2.subject = e1.subject AND marks >= 75) as good_students_count
FROM ExamResults e1
GROUP BY subject;

SELECT name, course
FROM Students
WHERE student_id IN (SELECT student_id FROM ExamResults WHERE marks BETWEEN 70 AND 90);