-- ### Problem Statement:

-- You are required to generate a report summarizing the daily performance of a ride-hailing service. The service has two key entities: `Trips` and `Users`. Your task is to analyze the trips based on whether the client and driver are not banned and calculate metrics related to incomplete trips (trips that are not marked as 'completed').

-- #### Task:
-- - Write an SQL query to retrieve the following information for each day (`request_at`):
--   1. **Total Trips**: The number of trips recorded on each day.
--   2. **Incomplete Trips**: The number of trips where the status is not 'completed'.
--   3. **Percentage of Incomplete Trips**: The ratio of incomplete trips to total trips.
  
-- - You will use the `Trips` table for trip details and the `Users` table to determine if the clients or drivers involved in the trips are banned.
  
-- #### Requirements:
-- 1. Only include trips where both the client and the driver are not banned.
-- 2. Join the `Users` table twice—once to check the client status and once for the driver status.
-- 3. Calculate the percentage of incomplete trips as a proportion of total trips for each day.

-- ### Input Tables:

-- **Trips Table**
-- ```
-- +----+-----------+-----------+---------+--------------------+------------+
-- | id | client_id | driver_id | city_id |       status        | request_at |
-- +----+-----------+-----------+---------+--------------------+------------+
-- |    |           |           |         |                    |            |
-- |    |           |           |         |                    |            |
-- |    |           |           |         |                    |            |
-- +----+-----------+-----------+---------+--------------------+------------+
-- ```

-- **Users Table**
-- ```
-- +----------+--------+-------+
-- | users_id | banned | role  |
-- +----------+--------+-------+
-- |          |        |       |
-- |          |        |       |
-- |          |        |       |
-- +----------+--------+-------+
-- ```

-- ### Expected Output:
-- ```
-- +------------+-------------+-----------------+------------------+
-- |  request   | total_trips | incomplete_trips | incomplete_percent|
-- +------------+-------------+-----------------+------------------+
-- |            |             |                 |                  |
-- |            |             |                 |                  |
-- |            |             |                 |                  |
-- +------------+-------------+-----------------+------------------+
-- ```



-- table structure


Create table  Trips (id int, client_id int, driver_id int, city_id int, status varchar(50), request_at varchar(50));
Create table Users (users_id int, banned varchar(50), role varchar(50));
Truncate table Trips;
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');
Truncate table Users;
insert into Users (users_id, banned, role) values ('1', 'No', 'client');
insert into Users (users_id, banned, role) values ('2', 'Yes', 'client');
insert into Users (users_id, banned, role) values ('3', 'No', 'client');
insert into Users (users_id, banned, role) values ('4', 'No', 'client');
insert into Users (users_id, banned, role) values ('10', 'No', 'driver');
insert into Users (users_id, banned, role) values ('11', 'No', 'driver');
insert into Users (users_id, banned, role) values ('12', 'No', 'driver');
insert into Users (users_id, banned, role) values ('13', 'No', 'driver');







-- solution 



select 
date(a.request_at),count(*) as total_trips, sum(case when a.status!='completed' then 1 else 0 end) as comp
, sum(case when a.status!='completed' then 1 else 0 end)/count(*) as percent
-- a.*,b.banned as cl_banned,c.banned as dr_bann, case when a.status!='completed' then 1 else 0 end as comp
 from trips a left join users b on a.client_id=b.users_id
left join  users c  on a.driver_id=c.users_id
where b.banned='No' and c.banned='No'
group by date(request_at)
