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
('S106', 'Anita Das', 'Hyderabad', 'Computer Science', 20);

INSERT INTO ExamResults VALUES 
(1, 'S101', 'Mathematics', 85, '2024-10-01'),
(2, 'S101', 'Physics', 78, '2024-10-02'),
(3, 'S102', 'Mathematics', 92, '2024-10-01'),
(4, 'S103', 'Physics', 65, '2024-10-02'),
(5, 'S104', 'Mathematics', 88, '2024-10-01'),
(6, 'S105', 'Physics', 45, '2024-10-02'),
(7, 'S106', 'Mathematics', 95, '2024-10-01');

INSERT INTO CourseFees VALUES 
(1, 'Computer Science', 50000.00),
(2, 'Electronics', 45000.00),
(3, 'Mechanical', 40000.00);

CREATE VIEW StudentExamView AS
SELECT s.student_id, s.name, s.course, e.subject, e.marks, e.exam_date
FROM Students s
JOIN ExamResults e ON s.student_id = e.student_id;

CREATE VIEW HighScorers AS
SELECT s.name, s.course, e.subject, e.marks
FROM Students s
JOIN ExamResults e ON s.student_id = e.student_id
WHERE e.marks > 80;

CREATE VIEW CourseSummary AS
SELECT s.course, 
       COUNT(*) AS total_students,
       AVG(e.marks) AS average_marks,
       MAX(e.marks) AS highest_marks
FROM Students s
JOIN ExamResults e ON s.student_id = e.student_id
GROUP BY s.course;

CREATE VIEW HyderabadStudents AS
SELECT student_id, name, course, age
FROM Students
WHERE city = 'Hyderabad';

CREATE VIEW StudentFeeView AS
SELECT s.student_id, s.name, s.course, cf.fee_amount
FROM Students s
JOIN CourseFees cf ON s.course = cf.course_name;

CREATE VIEW FailedStudents AS
SELECT s.name, s.course, e.subject, e.marks
FROM Students s
JOIN ExamResults e ON s.student_id = e.student_id
WHERE e.marks < 50;

SELECT * FROM StudentExamView;

SELECT * FROM HighScorers WHERE course = 'Computer Science';

SELECT * FROM CourseSummary;

SELECT * FROM HyderabadStudents;

SELECT * FROM StudentFeeView;

SELECT * FROM FailedStudents;

UPDATE HyderabadStudents SET age = 21 WHERE student_id = 'S101';

DROP VIEW IF EXISTS FailedStudents;

CREATE VIEW StudentDetails AS
SELECT student_id, name, course, city
FROM Students
WHERE age >= 18;