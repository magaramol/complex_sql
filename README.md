# Complex SQL Problems Repository

## Overview

This repository contains a collection of complex SQL problems along with their solutions. Each problem is designed to challenge your SQL skills and improve your understanding of data manipulation and analysis. Solutions are provided using both SQL and pandas for comparison and demonstration of different approaches.

## Problem Statements

### ICC World Cup Match Results

Transform match results from the ICC World Cup into a summary table showing each team's total wins and losses. The input data is structured as follows:

#### input table

``` 
+-----------+-----------+---------+
| Team_1   | Team_2   | Winner  |
+-----------+-----------+---------+
|           |           |         |
|           |           |         |
|           |           |         |
|           |           |         |
|           |           |         |
+-----------+-----------+---------+
```

#### And for the summary table:

```
+--------+------+-------+
| Team   | Win  | Lose  |
+--------+------+-------+
|        |      |       |
|        |      |       |
|        |      |       |
|        |      |       |
|        |      |       |
|        |      |       |
+--------+------+-------+
```



### Customer Orders Problem

**Problem Statement:**

You have a table called `customer_orders` that tracks customer orders. Each order has an `order_id`, `customer_id`, `order_date`, and `order_amount`. Your task is to transform this data to calculate the number of repeat customers and new customers for each day.

#### Input Table

```
+-----------+-------------+------------+--------------+
| order_id  | customer_id | order_date | order_amount |
+-----------+-------------+------------+--------------+
|           |             |            |              |
|           |             |            |              |
|           |             |            |              |
|           |             |            |              |
|           |             |            |              |
+-----------+-------------+------------+--------------+
```

#### Expected Output

```
+------------+------------------+--------------+
|    day     | repeat cx count  | new cx count |
+------------+------------------+--------------+
|            |                  |              |
|            |                  |              |
|            |                  |              |
+------------+------------------+--------------+
```


### entries Problem


### Problem Statement

You are tasked with analyzing visitor data from a facility to summarize key statistics for each visitor. Specifically, you need to extract the following information for each visitor (identified by their `name`):

1. The most frequently visited floor (in case of a tie, select any).
2. The total number of visits across all floors.
3. A list of resources accessed by each visitor during their visits.

You will use a table called `entries`, which logs each visit with the following columns:
- `name`: The name of the visitor.
- `floor`: The floor visited.
- `resources`: The resources accessed during the visit.

Your goal is to generate a report that summarizes this information for each visitor.

### Input Table: `entries`

```
+--------+-------+-----------+
| name   | floor | resources |
+--------+-------+-----------+
| Alice  | 1     | Resource_A|
| Alice  | 2     | Resource_B|
| Alice  | 1     | Resource_A|
| Bob    | 1     | Resource_C|
| Bob    | 2     | Resource_D|
| Bob    | 1     | Resource_C|
| Charlie| 3     | Resource_E|
| Charlie| 3     | Resource_F|
| Charlie| 2     | Resource_G|
| Alice  | 2     | Resource_H|
+--------+-------+-----------+
```

### Expected Output Table

```
+--------+---------------------+--------------+-----------------------------+
| name   | most_visited_floor  | total_visits | resources                   |
+--------+---------------------+--------------+-----------------------------+
| Alice  | .                   | .            | .                           |
| Bob    | .                   | .            | .                           |
| Charlie| .                   | .            | .                           |
+--------+---------------------+--------------+-----------------------------+
```

### Notes:
- The output should provide the most visited floor, total number of visits, and a concatenated list of resources for each visitor.



### freind_marks

### Problem Statement

Given two datasets representing individuals and their friendships, the task is to analyze the friendships and compute a summary of individuals who have a total friend score greater than 100. The summary should include the individual's name, the number of friends, and the sum of their friends' scores.

### Input Tables

#### Person Table

This table contains information about individuals, including their ID, name, email, and score.

```
+----------+--------+--------------------------+-------+
| PersonID | Name   | Email                    | Score |
+----------+--------+--------------------------+-------+
| 1        | Alice  | alice2018@hotmail.com    | 88    |
| 2        | Bob    | bob2018@hotmail.com      | 11    |
| 3        | Davis  | davis2018@hotmail.com    | 27    |
| 4        | Tara   | tara2018@hotmail.com     | 45    |
| 5        | John   | john2018@hotmail.com     | 63    |
+----------+--------+--------------------------+-------+
```

#### Friend Table

This table establishes relationships between individuals, indicating who is friends with whom.

```
+----------+----------+
| PersonID | FriendID |
+----------+----------+
| 1        | 2        |
| 1        | 3        |
| 2        | 1        |
| 2        | 3        |
| 3        | 5        |
| 4        | 2        |
| 4        | 3        |
| 4        | 5        |
+----------+----------+
```

### Expected Output Table

The expected output should summarize the individuals who have a total friend score greater than 100, detailing their name, the number of friends, and the sum of their friends' scores.

```
+--------+---------------------+--------------+-----------------------------+
| Name   | PersonID           | No_of_Friends| Score_Sum                   |
+--------+---------------------+--------------+-----------------------------+
|        | .                   | .            | .                           |
|        | .                   | .            | .                           |
|        | .                   | .            | .                           |
+--------+---------------------+--------------+-----------------------------+
```

### Task

Develop a SQL query to analyze the `person` and `friend` tables, compute the desired statistics, and format the output as specified in the "Expected Output Table." This will involve aggregating data to count the number of friends and summing their scores for each individual, filtering those with a total friend score greater than 100.













### Daily Trip Performance Report for Non-Banned Users


### Problem Statement:

You are required to generate a report summarizing the daily performance of a ride-hailing service. The service has two key entities: `Trips` and `Users`. Your task is to analyze the trips based on whether the client and driver are not banned and calculate metrics related to incomplete trips (trips that are not marked as 'completed').

#### Task:
- Write an SQL query to retrieve the following information for each day (`request_at`):
  1. **Total Trips**: The number of trips recorded on each day.
  2. **Incomplete Trips**: The number of trips where the status is not 'completed'.
  3. **Percentage of Incomplete Trips**: The ratio of incomplete trips to total trips.
  
- You will use the `Trips` table for trip details and the `Users` table to determine if the clients or drivers involved in the trips are banned.
  
#### Requirements:
1. Only include trips where both the client and the driver are not banned.
2. Join the `Users` table twice—once to check the client status and once for the driver status.
3. Calculate the percentage of incomplete trips as a proportion of total trips for each day.

### Input Tables:

**Trips Table**
```
+----+-----------+-----------+---------+--------------------+------------+
| id | client_id | driver_id | city_id |       status        | request_at |
+----+-----------+-----------+---------+--------------------+------------+
|    |           |           |         |                    |            |
|    |           |           |         |                    |            |
|    |           |           |         |                    |            |
+----+-----------+-----------+---------+--------------------+------------+
```

**Users Table**
```
+----------+--------+-------+
| users_id | banned | role  |
+----------+--------+-------+
|          |        |       |
|          |        |       |
|          |        |       |
+----------+--------+-------+
```

### Expected Output:
```
+------------+-------------+-----------------+------------------+
|  request   | total_trips | incomplete_trips | incomplete_percent|
+------------+-------------+-----------------+------------------+
|            |             |                 |                  |
|            |             |                 |                  |
|            |             |                 |                  |
+------------+-------------+-----------------+------------------+
```



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

