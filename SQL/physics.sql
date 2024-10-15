-- ### Problem Statement:

-- You are given a table of student exam scores across two subjects: Physics and Chemistry. The task is to identify students who have obtained the same marks in both subjects.

-- #### Task:
-- - Write an SQL query to:
--   1. Find students who have taken both Physics and Chemistry exams.
--   2. For those students, check if they have the same score in both subjects.
--   3. Return the student ID of students who have the same mark in both Physics and Chemistry.

-- #### Requirements:
-- 1. Use aggregation functions to count the distinct marks and total marks for each student who has taken both Physics and Chemistry exams.
-- 2. Filter out students who do not have the same mark in both subjects.
-- 3. Ensure that only students with exactly two exam records (Physics and Chemistry) and the same marks are returned.

-- ### Input Table:

-- **Exams Table**
-- ```
-- +------------+------------+-------+
-- | student_id |  subject   | marks |
-- +------------+------------+-------+
-- |            |            |       |
-- |            |            |       |
-- |            |            |       |
-- +------------+------------+-------+
-- ```

-- ### Expected Output:
-- ```
-- +------------+
-- | student_id |
-- +------------+
-- |            |
-- |            |
-- |            |
-- +------------+
-- ```

-- insert query


create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);


-- solution




select  student_id,count(distinct marks) as mrk,count(*) as cnt
from exams
where subject in ('Physics','Chemistry')
group by student_id
having cnt=2 
and mrk=1;