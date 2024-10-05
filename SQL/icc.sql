-- # ICC World Cup Data Transformation

-- ## Problem Statement

-- You have the following table containing match results from the ICC World Cup:


-- +-----------+-----------+---------+
-- | Team_1   | Team_2   | Winner  |
-- +-----------+-----------+---------+
-- |           |           |         |
-- |           |           |         |
-- |           |           |         |
-- |           |           |         |
-- |           |           |         |
-- +-----------+-----------+---------+


-- Transform the data to create a summary table
--  showing each team's total wins and losses in the following format:

-- +--------+------+-------+
-- | Team   | Win  | Lose  |
-- +--------+------+-------+
-- |        |      |       |
-- |        |      |       |
-- |        |      |       |
-- |        |      |       |
-- |        |      |       |
-- |        |      |       |
-- +--------+------+-------+


-- solution

select tm as team ,count(1) as matches ,sum(wins) as wins,count(1)-sum(wins) as lose
 from (select Team_1 as tm , case when  Team_1=winner then 1 else 0 end as wins from icc
union all 
select Team_2 as tm , case when  Team_2=winner then 1 else 0 end as wins  from icc) win
group by tm;


