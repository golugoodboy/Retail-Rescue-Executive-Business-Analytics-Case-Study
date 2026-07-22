/*
===============================================================
Project       : Retail Rescue - Executive Business Analytics
Company       : NovaMart (Fictional)
Sprint        : Sprint 4 - Revenue & Sales Analysis
Author        : GoluGoodBoy

Objective:
Analyze revenue performance to identify sales trends,
regional performance, and key executive KPIs.

Business Questions:
1. What is the total revenue?
2. What is the Average Order Value (AOV)?
3. How has revenue changed over time?
4. Which states generate the highest revenue?

Tables Used:
- olist_orders_dataset
- olist_order_items_dataset
- olist_customers_dataset

===============================================================
*/

--1. Total Revenue
--Ans : 
 -- total_revenue | total_shipping_revenue | gross_revenue
 -- ---------------- | --------------- | ------------
 -- 13591643.70      |    2251909.54   |  15843553.24
 /*
 select
round(sum(cast(price as decimal(10,2))),2) as total_product_revenue,
round(sum(cast(freight_value as decimal(10,2))),2) as total_shipping_revenue,
round(sum(cast(price as decimal(10,2)) + cast(freight_value as decimal(10,2))),2) as gross_revenue
from 
olist_order_items_dataset
*/


--2. What is the Average Order Value (AOV)?
--Ans : 
--Average Order Value : 160.577638
/*
select 
round(sum(cast(price as decimal(10,2))) + sum(cast(freight_value as decimal(10,2))),2)/count(distinct order_id) as avg_value
from 
olist_order_items_dataset
*/


--3. How has revenue changed over time?
--Ans : 
--Total Monthly Revenue
-- year | month | total_revenue
-- 2016 |    09 |        143.46
-- 2016 |    10 |      46490.66
-- 2016 |    12 |         19.62
-- 2017 |    01 |     127482.37
-- 2017 |    02 |     271239.32
-- 2017 |    03 |     414330.95
-- ...........
/*
select
convert(varchar(7),o.["order_purchase_timestamp"],120) as order_month,
round(sum(cast(oi.price as decimal(10,2))) + sum(cast(oi.freight_value as decimal(10,2))),2) as revenue
from 
olist_orders_dataset as o
join olist_order_items_dataset as oi
on
o.["order_id"] = oi.[order_id]
where o.["order_status"] = 'delivered'
group by convert(varchar(7),o.["order_purchase_timestamp"],120)
order by order_month;
*/

--4. Which states generate the highest revenue?
--Ans : 
--customer_state | total_revenue
--      SP       |   5769703.15
--      RJ       |   2055401.57
--      MG       |   1818891.67
--      RS       |    861472.79
--      PR       |    781708.80
/*
SELECT
    c.customer_state,
    round(sum(cast(oi.price as decimal(10,2))) + sum(cast(oi.freight_value as decimal(10,2))),2) as revenue
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.["customer_id"] = c.customer_id
JOIN olist_order_items_dataset oi
ON o.["order_id"] = oi.order_id
WHERE o.["order_status"] = 'delivered'
GROUP BY c.customer_state
ORDER BY revenue DESC;
*/