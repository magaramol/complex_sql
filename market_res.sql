-- ### Problem Statement:

-- You are required to analyze the sales data of an e-commerce platform to determine if sellers are selling items from their favorite brands. The platform stores data about users, their favorite brands, and the orders they make as buyers or sellers. Your goal is to identify, for each seller, whether their second recorded sale involves selling an item from their favorite brand.

-- #### Task:
-- - Write an SQL query to:
--   1. For each order, check if the item sold by the seller belongs to the seller's favorite brand.
--   2. Rank the orders for each seller based on the order date.
--   3. Return whether the item sold in the seller's second-ranked sale matches their favorite brand.

-- - You will use the `orders` table to get the details of sales, the `users` table to get information about the seller's favorite brand, and the `items` table to get the brand of the item sold.

-- #### Requirements:
-- 1. Join the `orders`, `users`, and `items` tables to associate each sale with the seller's favorite brand and the brand of the item sold.
-- 2. Rank the sales for each seller based on the order date.
-- 3. Return a table showing the seller's ID and a 'yes' or 'no' to indicate if the item sold in the second sale matches the seller's favorite brand.

-- ### Input Tables:

-- **Users Table**
-- ```
-- +---------+------------+----------------+
-- | user_id | join_date  | favorite_brand |
-- +---------+------------+----------------+
-- |         |            |                |
-- |         |            |                |
-- |         |            |                |
-- +---------+------------+----------------+
-- ```

-- **Orders Table**
-- ```
-- +----------+------------+----------+----------+-----------+
-- | order_id | order_date | item_id  | buyer_id | seller_id |
-- +----------+------------+----------+----------+-----------+
-- |          |            |          |          |           |
-- |          |            |          |          |           |
-- |          |            |          |          |           |
-- +----------+------------+----------+----------+-----------+
-- ```

-- **Items Table**
-- ```
-- +---------+-------------+
-- | item_id | item_brand  |
-- +---------+-------------+
-- |         |             |
-- |         |             |
-- |         |             |
-- +---------+-------------+
-- ```

-- ### Expected Output:
-- ```
-- +-----------+-----+
-- | seller_id | cd  |
-- +-----------+-----+
-- |           |     |
-- |           |     |
-- |           |     |
-- +-----------+-----+
-- ```














create table users (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );

 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );


 insert into users values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);



select * from users ;
 select * from orders ;
 select * from items;
 with rnk_se as (
 select a.*,c.item_brand,b.favorite_brand,rank() over(partition by a.seller_id order by order_date ) as rnk
 
 from orders a left join users b
 on a.seller_id=b.user_id
 inner join items c on a.item_id=c.item_id) 
 select seller_id,
 case when item_brand=favorite_brand then 'yes' else 'no' end as cd
 from rnk_se
 where rnk=2