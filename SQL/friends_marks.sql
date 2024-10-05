-- ### Problem Statement

-- Given two datasets representing individuals and their friendships, the task is to analyze the friendships and compute a summary of individuals who have a total friend score greater than 100. The summary should include the individual's name, the number of friends, and the sum of their friends' scores.

-- ### Input Tables

-- #### Person Table

-- This table contains information about individuals, including their ID, name, email, and score.

-- ```
-- +----------+--------+--------------------------+-------+
-- | PersonID | Name   | Email                    | Score |
-- +----------+--------+--------------------------+-------+
-- | 1        | Alice  | alice2018@hotmail.com    | 88    |
-- | 2        | Bob    | bob2018@hotmail.com      | 11    |
-- | 3        | Davis  | davis2018@hotmail.com    | 27    |
-- | 4        | Tara   | tara2018@hotmail.com     | 45    |
-- | 5        | John   | john2018@hotmail.com     | 63    |
-- +----------+--------+--------------------------+-------+
-- ```

-- #### Friend Table

-- This table establishes relationships between individuals, indicating who is friends with whom.

-- ```
-- +----------+----------+
-- | PersonID | FriendID |
-- +----------+----------+
-- | 1        | 2        |
-- | 1        | 3        |
-- | 2        | 1        |
-- | 2        | 3        |
-- | 3        | 5        |
-- | 4        | 2        |
-- | 4        | 3        |
-- | 4        | 5        |
-- +----------+----------+
-- ```

-- ### Expected Output Table

-- The expected output should summarize the individuals who have a total friend score greater than 100, detailing their name, the number of friends, and the sum of their friends' scores.

-- ```
-- +--------+---------------------+--------------+-----------------------------+
-- | Name   | PersonID           | No_of_Friends| Score_Sum                   |
-- +--------+---------------------+--------------+-----------------------------+
-- |        | .                   | .            | .                           |
-- |        | .                   | .            | .                           |
-- |        | .                   | .            | .                           |
-- +--------+---------------------+--------------+-----------------------------+
-- ```

-- ### Task

-- Develop a SQL query to analyze the `person` and `friend` tables, compute the desired statistics, and format the output as specified in the "Expected Output Table." This will involve aggregating data to count the number of friends and summing their scores for each individual, filtering those with a total friend score greater than 100.



-- solution

with cons as (select f.PersonID,count(p.score) no_of_frnd,sum(p.Score) as score_sum
from frnd f inner join person p on f.FriendID=p.PersonID
group by f.PersonID
having sum(p.Score)>100)

select b.name,a.PersonID,a.no_of_frnd,a.score_sum from cons a inner join person b on a.PersonID=b.PersonID