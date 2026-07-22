/*
===============================================================
Project       : Retail Rescue - Executive Business Analytics
Company       : NovaMart (Fictional)
Workstream    : Customer Analytics
Author        : GoluGoodBoy

Objective:
Analyze customer behavior, loyalty, retention, and purchasing
patterns to support customer acquisition and retention strategies.

Business Questions:
1. How many unique customers have made purchases?
2. What is the repeat purchase rate?
3. Who are the top customers by spending?
4. What is the average customer lifetime value?
5. Which states have the highest customer value?
6. Which customers are at risk of churn? (RFM Analysis)

Tables Used:
- olist_orders_dataset
- olist_customers_dataset
- olist_order_items_dataset

===============================================================
*/

--1. How many unique customers have made purchases?
--Ans : 96096
/*
select
count(distinct customer_unique_id) as unique_customers
from 
olist_customers_dataset
*/

--2. What is the repeat purchase rate?
--Ans : 3.12%
/*
with customer_order as 
(
select
customer_unique_id as unique_customer,
count(distinct o.["order_id"]) as purchases_count
from
olist_customers_dataset as c
JOIN olist_orders_dataset as o
on 
c.customer_id = o.["customer_id"]
group by customer_unique_id
)

select
count(*) as total_customer,
sum(case when purchases_count > 1 then 1 else 0 end) as repeat_customers,
round(100 * sum(case when purchases_count > 1 then 1 else 0 end),2)/count(*) as repeat_purchase_rate
from 
customer_order
*/

--3. Who are the top 10 customers by spending?
--Ans : 
/*
 customer_unique_id               |total_orders   | lifetime_value
"0a0a92112bd4c708ca5fde585afaa872"   | 1             | 13440.00
da122df9eeddfedc1dc1f5349a1a690c     | 2             | 7388.00
"763c8b1c9c68a0229c42c9fc6f662b93"   | 1             | 7160.00
dc4802a71eae9be1dd28f5d788ceb526     | 1             | 6735.00
"459bef486812aa25204be022145caa62"   | 1             | 6729.00
ff4159b92c40ebe40454e3e6a7c35ed6     | 1             | 6499.00
"4007669dec559734d6f53e029e360987"   | 1             | 5934.60
eebb5dda148d3893cdaf5b5ca3040ccb     | 1             | 4690.00
"48e1ac109decbb87765a3eade6854098"   | 1             | 4590.00
a229eba70ec1c2abef51f04987deb7a5     | 1             | 4400.00
*/
/*
SELECT TOP 10
    c.customer_unique_id,
    COUNT(DISTINCT o.["order_id"]) as total_orders,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) as lifetime_value
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.["customer_id"]
JOIN olist_order_items_dataset oi
    ON o.["order_id"] = oi.order_id
WHERE o.["order_status"] = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY lifetime_value DESC;
*/


--4. What is the average customer lifetime value?
--Ans : Average customer lifetime value is 141.620000.
/*
with customer_table as 
(
SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.["order_id"]) as total_orders,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) as lifetime_value
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.["customer_id"]
JOIN olist_order_items_dataset oi
    ON o.["order_id"] = oi.order_id
WHERE o.["order_status"] = 'delivered'
GROUP BY c.customer_unique_id
)
select 
round(avg(lifetime_value),2) as average_customer_lifetime
from
customer_table;
*/


--5. Which states have the highest customer value?
--Ans : 
--customer_state  total_revenue   total_customer  average_order_value
--1. PB	            112586.82	        504	            223.390000
--2. AC	            15930.97	        76	            209.620000
--3. AL	            78855.72	        387	            203.760000
--4. AP	            13374.81	        66	            202.650000
--5. RO	            45682.76	        231	            197.760000
/*
SELECT
    c.customer_state,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS revenue,
    COUNT(DISTINCT c.customer_unique_id) AS customers,
    ROUND(
        SUM(cast(oi.price as decimal(10,2))) /
        COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS average_clv
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.["customer_id"]
JOIN olist_order_items_dataset oi
    ON o.["order_id"] = oi.order_id
WHERE o.["order_status"] = 'delivered'
GROUP BY c.customer_state
ORDER BY average_clv DESC;
*/