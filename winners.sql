-- ### Problem Statement:

-- You are tasked with ranking players within groups based on their total score from matches played. The `players` table contains information about which group each player belongs to, and the `matches` table contains the results of head-to-head matches between players. Your objective is to determine the top-ranked player from each group based on their cumulative match scores.

-- #### Task:
-- - Write an SQL query to:
--   1. Calculate the total score for each player by summing up the scores from the `matches` table.
--   2. Rank players within their respective groups based on their total score.
--   3. Retrieve only the top-ranked player from each group.

-- - The `matches` table records both the first player's and second player's scores for each match, and you will need to aggregate the scores from both perspectives.

-- #### Requirements:
-- 1. Combine the `players` table and the `matches` table to calculate the cumulative score for each player.
-- 2. Use window functions to rank the players within each group based on their total score, with the highest score receiving the top rank.
-- 3. Output the top-ranked player from each group.

-- ### Input Tables:

-- **Players Table**
-- ```
-- +-----------+----------+
-- | player_id | group_id |
-- +-----------+----------+
-- |           |          |
-- |           |          |
-- |           |          |
-- +-----------+----------+
-- ```

-- **Matches Table**
-- ```
-- +----------+-------------+--------------+-------------+--------------+
-- | match_id | first_player | second_player| first_score | second_score |
-- +----------+-------------+--------------+-------------+--------------+
-- |          |             |              |             |              |
-- |          |             |              |             |              |
-- |          |             |              |             |              |
-- +----------+-------------+--------------+-------------+--------------+
-- ```

-- ### Expected Output:
-- ```
-- +-----------+----------+-------+
-- | player_id | group_id | rank  |
-- +-----------+----------+-------+
-- |           |          |       |
-- |           |          |       |
-- |           |          |       |
-- +-----------+----------+-------+
-- ```




create table players
(player_id int,
group_id int)

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);



-- solution

with com_pt as (
select player, sum(score) as score from (
select first_player as player,first_score as score from matches 
 union 
select second_player as player,second_score as score from matches ) a
group by player) ,
final_ranking as (

select *,
rank () over(partition by b.group_id order by a.score desc,player_id) as rnk

 from com_pt a inner join players b
on a.player=b.player_id)
select * from final_ranking
where rnk=1
