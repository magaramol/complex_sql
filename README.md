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