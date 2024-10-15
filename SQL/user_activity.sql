-- ### Problem Statement:

-- You are given a table containing the activity records of various users, including the start and end dates of each activity. The task is to retrieve the second most recent activity for each user. If a user has only one recorded activity, return that single activity.

-- #### Task:
-- - Write an SQL query to:
--   1. For each user, rank their activities based on the end date in descending order, so the most recent activity is ranked first.
--   2. If a user has more than one activity, return the second most recent activity.
--   3. If a user has only one activity, return that activity.
  
-- #### Requirements:
-- 1. Use window functions to rank the activities for each user by their end date, in descending order.
-- 2. For users with more than one activity, return the activity ranked as second. For users with only one activity, return that single activity.
-- 3. Ensure that the output includes both users who have one or more activities.

-- ### Input Table:

-- **UserActivity Table**
-- ```
-- +----------+----------+------------+------------+
-- | username | activity | startDate  | endDate    |
-- +----------+----------+------------+------------+
-- |          |          |            |            |
-- |          |          |            |            |
-- |          |          |            |            |
-- +----------+----------+------------+------------+
-- ```

-- ### Expected Output:
-- ```
-- +----------+----------+------------+------------+
-- | username | activity | startDate  | endDate    |
-- +----------+----------+------------+------------+
-- |          |          |            |            |
-- |          |          |            |            |
-- |          |          |            |            |
-- +----------+----------+------------+------------+
-- ```


-- insert query


create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');


-- solution


with cte as (
select *,
rank() over (partition by username order by endDate desc ) as rnk,
count(*) over (partition by username ) as tl
 from useractivity)
 select * from cte
  where rnk = 2 or tl=1
