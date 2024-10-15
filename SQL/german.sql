-- ### Problem Statement:

-- You are given a table containing information about users in various companies and the languages they speak. The task is to identify companies that have at least two users who can speak both English and German.

-- #### Task:
-- - Write an SQL query to:
--   1. Find users who speak both English and German within each company.
--   2. Identify companies that have at least two such users.
  
-- #### Requirements:
-- 1. Use a subquery or CTE to find users within each company who speak both English and German.
-- 2. Group the results by company and ensure that only companies with at least two such users are returned.
-- 3. Output the company IDs that meet the criteria.

-- ### Input Table:

-- **Company_Users Table**
-- ```
-- +------------+----------+------------+
-- | company_id | user_id  |  language  |
-- +------------+----------+------------+
-- |            |          |            |
-- |            |          |            |
-- |            |          |            |
-- +------------+----------+------------+
-- ```

-- ### Expected Output:
-- ```
-- +------------+
-- | company_id |
-- +------------+
-- |            |
-- |            |
-- |            |
-- +------------+
-- ```


-- insert query

create table company_users 
(
company_id int,
user_id int,
language varchar(20)
);

insert into company_users values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');


-- solution


select company_id from 
(
select company_id,user_id-- ,count(*)
 from company_users
where language in ('English','German')
group by company_id,user_id
having count(*)=2) a
group by company_id
having count(user_id)=2