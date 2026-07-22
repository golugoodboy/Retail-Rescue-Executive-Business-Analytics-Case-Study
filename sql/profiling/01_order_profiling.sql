-- 1. How many rows
--select count(*) from olist_orders_dataset;
--Ans : 99,441

-- 2. How many columns
--select * from olist_orders_dataset;
--Ans : 8 Columns

--3. Are Order ID unique?
/*select 
count('order_id') as count_orders,
count(distinct 'order_id') as unique_order_id
from 
olist_orders_dataset*/
--Ans : Count_orders  | Unique_order_id
--        99,441       |    99,441


--4. Missing values
/*select
sum(case when 'order_status' is null then 1 else 0 end) as missing_status,
sum(case when 'customer_id' is null then 1 else 0 end) as missing_customer_id,
sum(case when 'order_purchase_timestamp' is null then 1 else 0 end) as missing_purchase_timestamp,
sum(case when 'order_delivered_customer_date' is null then 1 else 0 end) as missing_delivery_date
from 
olist_orders_dataset*/
-- Ans : missing_status | missing_customer_id | missing_purchase_timestamp | missing_delivery_date
--          0               |          0          |              0              |       0

--5. Observation of Order Status
/*select 
"""order_status""",
count(*) as orders
from 
olist_orders_dataset
group by """order_status"""
order by orders desc;*/

/*Ans : 
--    Order_Status                             |    Orders
--   ------------------------------------------  |  -------
--   delivered	                                | 96478
-- shipped	                                | 1107
-- canceled	                                | 625
-- unavailable	                            | 609
-- invoiced	                                | 314
-- processing	                            | 301
    -- created	                            | 5
    -- approved	                            | 2*/

--6. Time Coverage
/*select 
max("""order_purchase_timestamp""") as maximum,
min("""order_purchase_timestamp""") as minimum
from 
olist_orders_dataset*/
--Ans : Maximum : 2018-10-17 17:30:18	2016-09-04 21:15:19


--7. Duplicate Orders
/*select
"""order_id""" as order_id,
count(*) as counting_of_order_id
from
olist_orders_dataset
group by """order_id"""
having count(*) > 1*/
--Ans : No Duplicate Orders

