



-- ### Customer Orders Problem

-- **Problem Statement:**

-- You have a table called `customer_orders` that tracks customer orders. Each order has an `order_id`, `customer_id`, `order_date`, and `order_amount`. Your task is to transform this data to calculate the number of repeat customers and new customers for each day.

-- #### Input Table

-- ```
-- +-----------+-------------+------------+--------------+
-- | order_id  | customer_id | order_date | order_amount |
-- +-----------+-------------+------------+--------------+
-- |           |             |            |              |
-- |           |             |            |              |
-- |           |             |            |              |
-- |           |             |            |              |
-- |           |             |            |              |
-- +-----------+-------------+------------+--------------+
-- ```

-- #### Expected Output

-- ```
-- +------------+------------------+--------------+
-- |    day     | repeat cx count  | new cx count |
-- +------------+------------------+--------------+
-- |            |                  |              |
-- |            |                  |              |
-- |            |                  |              |
-- +------------+------------------+--------------+
-- ```




-- Here is the script :
create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;




-- solution
select order_date, sum(ft.new_flag), sum(ft.rp_flag)
from 
(with first_visit as(
select min(order_date) as fv,customer_id from orders
group by customer_id) 
 select a.order_date,
 sum(case when a.order_date=fv then 1 else 0 end) as new_flag,
 sum(case when a.order_date!=fv then 1 else 0 end) as rp_flag
 from orders a
 inner join first_visit b
 on a.customer_id=b.customer_id
 group by a.order_date) ft
 group by ft.order_date
  