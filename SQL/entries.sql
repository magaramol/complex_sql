-- ### Problem Statement

-- You are tasked with analyzing visitor data from a facility to summarize key statistics for each visitor. Specifically, you need to extract the following information for each visitor (identified by their `name`):

-- 1. The most frequently visited floor (in case of a tie, select any).
-- 2. The total number of visits across all floors.
-- 3. A list of resources accessed by each visitor during their visits.

-- You will use a table called `entries`, which logs each visit with the following columns:
-- - `name`: The name of the visitor.
-- - `floor`: The floor visited.
-- - `resources`: The resources accessed during the visit.

-- Your goal is to generate a report that summarizes this information for each visitor.

-- ### Input Table: `entries`

-- ```
-- +--------+-------+-----------+
-- | name   | floor | resources |
-- +--------+-------+-----------+
-- | Alice  | 1     | Resource_A|
-- | Alice  | 2     | Resource_B|
-- | Alice  | 1     | Resource_A|
-- | Bob    | 1     | Resource_C|
-- | Bob    | 2     | Resource_D|
-- | Bob    | 1     | Resource_C|
-- | Charlie| 3     | Resource_E|
-- | Charlie| 3     | Resource_F|
-- | Charlie| 2     | Resource_G|
-- | Alice  | 2     | Resource_H|
-- +--------+-------+-----------+
-- ```

-- ### Expected Output Table

-- ```
-- +--------+---------------------+--------------+-----------------------------+
-- | name   | most_visited_floor  | total_visits | resources                   |
-- +--------+---------------------+--------------+-----------------------------+
-- | Alice  | .                   | .            | .                           |
-- | Bob    | .                   | .            | .                           |
-- | Charlie| .                   | .            | .                           |
-- +--------+---------------------+--------------+-----------------------------+
-- ```

-- ### Notes:
-- - The output should provide the most visited floor, total number of visits, and a concatenated list of resources for each visitor.



create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')


-- solution

with most_visited_floor as (
select * from (
select name, floor as most_visited_floor,
rank() over(partition by name order by count(*) desc) as rnk
 from entries
 group by name,floor) a
 having a.rnk=1),
 
  total_visits as (
 select name , count(floor) as total_visits
 from entries
 group by name),
 resources as (

select name,group_concat(resources SEPARATOR',' ) as resources
 from entries
 group by name)

 select x.*,c.resources,b.total_visits from most_visited_floor x
 inner join total_visits b on x.name=b.name
 inner join resources c on x.name=c.name 

 
