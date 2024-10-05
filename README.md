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

