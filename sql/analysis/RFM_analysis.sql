/*
===============================================================
Project       : Retail Rescue - Executive Business Analytics
Company       : NovaMart (Fictional)
Workstream    : RFM Customer Segmentation
Author        : GoluGoodBoy

Objective:
Segment customers based on Recency, Frequency, and Monetary
metrics to identify customer loyalty, purchasing behavior,
and churn risk.

Business Questions:
1. How recently has each customer purchased?
2. How frequently do customers purchase?
3. How much has each customer spent?
4. Which customers are Champions?
5. Which customers are At Risk?
6. Which customers require retention efforts?

Tables Used:
- olist_customers_dataset
- olist_orders_dataset
- olist_order_items_dataset

===============================================================
*/

-- This is the query that gives the initial table for further RFM analysis
/*
WITH rfm_base AS
(
    SELECT
        c.customer_unique_id,

        MAX(CAST(o.["order_purchase_timestamp"] AS DATE)) AS last_purchase_date,

        COUNT(DISTINCT o.["order_id"]) AS frequency,

        ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS monetary

    FROM olist_customers_dataset c

    JOIN olist_orders_dataset o
        ON c.customer_id = o.["customer_id"]

    JOIN olist_order_items_dataset oi
        ON o.["order_id"] = oi.order_id

    WHERE o.["order_status"] = 'delivered'

    GROUP BY c.customer_unique_id
)

select top 5 * from rfm_base;
*/

--Table 
/*
customer_unique_id                                        |last_purchase_date    |frequency|monetary
"0000366f3b9a7992bf8c76cfdf3221e2"                          |"2018-05-10"          |1         |129.90
"0000b849f77a49e4a4ce2b2a4ca5be3f"                          |"2018-05-07"          |1         |18.90
"0000f46a3911fa3c0805444483337064"                          |"2017-03-10"          |1         |69.00
"0000f6ccb0745a6a4b88665a16c9f078"                          |"2017-10-12"          |1         |25.99
"0004aac84e0df4da2b147fca70cf8255"                          |"2017-11-14"          |1         |180.00
*/

--------RFM Scoring
/*
WITH rfm_base AS
(
    SELECT
        c.customer_unique_id,

        MAX(CAST(o.["order_purchase_timestamp"] AS DATE)) AS last_purchase_date,

        COUNT(DISTINCT o.["order_id"]) AS frequency,

        ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS monetary

    FROM olist_customers_dataset c

    JOIN olist_orders_dataset o
        ON c.customer_id = o.["customer_id"]

    JOIN olist_order_items_dataset oi
        ON o.["order_id"] = oi.order_id

    WHERE o.["order_status"] = 'delivered'

    GROUP BY c.customer_unique_id
)
,
rfm_score as 
(
	select
	customer_unique_id,
	last_purchase_date,
	frequency,
	monetary,

	Nile(5) over(order by last_purchase_date) as R_score,
	Nile(5) over(order by frequency) as F_score,
	Nile(5) over(order by monetary) as M_score

	from rfm_base

)

SELECT

customer_segment,

COUNT(*) AS total_customers,

round(100 * count(*)/sum(count(*)) over(),2) as customer_segment_percentage

FROM rfm_customer_segment

GROUP BY customer_segment

ORDER BY total_customers DESC;

--Table
/*
customer_unique_id                                        |last_purchase_date    |frequency|monetary|r_score|f_score|m_score
"0000366f3b9a7992bf8c76cfdf3221e2"                          |"2018-05-10"          |1         |129.90    |5      |1      |2
"0000b849f77a49e4a4ce2b2a4ca5be3f"                          |"2018-05-07"          |1         |18.90     |5      |1      |1
"0000f46a3911fa3c0805444483337064"                          |"2017-03-10"          |1         |69.00     |5      |1      |1
"0000f6ccb0745a6a4b88665a16c9f078"                          |"2017-10-12"          |1         |25.99     |5      |1      |1
"0004aac84e0df4da2b147fca70cf8255"                          |"2017-11-14"          |1         |180.00    |5      |1      |2
*/


---Customer Segments in RFM Analysis
/*
WITH rfm_base AS
(
    SELECT
        c.customer_unique_id,

        MAX(CAST(o.["order_purchase_timestamp"] AS DATE)) AS last_purchase_date,

        COUNT(DISTINCT o.["order_id"]) AS frequency,

        ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS monetary

    FROM olist_customers_dataset c

    JOIN olist_orders_dataset o
        ON c.customer_id = o.["customer_id"]

    JOIN olist_order_items_dataset oi
        ON o.["order_id"] = oi.order_id

    WHERE o.["order_status"] = 'delivered'

    GROUP BY c.customer_unique_id
)
,
rfm_score as 
(
	SELECT
    customer_unique_id,
    last_purchase_date,
    frequency,
    monetary,
	DATEDIFF(DAY,last_purchase_date,(SELECT MAX(last_purchase_date) FROM rfm_base)) AS recency_days,

    -- Recency Score: Based on days/date
    CASE 
        WHEN DATEDIFF(DAY,last_purchase_date,(SELECT MAX(last_purchase_date) FROM rfm_base)) <= 30 THEN 5
	    WHEN DATEDIFF(DAY,last_purchase_date,(SELECT MAX(last_purchase_date) FROM rfm_base)) <= 90 THEN 4
        WHEN DATEDIFF(DAY,last_purchase_date,(SELECT MAX(last_purchase_date) FROM rfm_base)) <= 180 THEN 3
        WHEN DATEDIFF(DAY,last_purchase_date,(SELECT MAX(last_purchase_date) FROM rfm_base)) <= 365 THEN 2
    ELSE 1
    END AS R_Score,

    -- Frequency Score: Based on order count
    CASE 
        WHEN frequency >= 5 THEN 5
        WHEN frequency >= 4  THEN 4
        WHEN frequency >= 3  THEN 3
        WHEN frequency >= 2  THEN 2
        ELSE 1
    END AS F_Score,

    -- Monetary Score: Based on total spent
    CASE 
        WHEN monetary >= 1000 THEN 5
        WHEN monetary >= 500  THEN 4
        WHEN monetary >= 250  THEN 3
        WHEN monetary >= 100  THEN 2
        ELSE 1
    END AS M_Score

FROM rfm_base
)
,
rfm_customer_segment as 
(
  select 
  customer_unique_id,
  last_purchase_date,
  frequency,
  monetary,
  recency_days,
  R_Score,
  F_Score,
  M_Score,
  Case
   when R_Score >= 4 and F_Score >=4 and M_Score >=4 then 'Champion'
   when R_Score >= 3 and F_Score >=3 then 'Loyal Customer'
   when R_Score >= 4 and F_Score >=2 then 'Potential Loyalist'
   when R_Score <= 2 and F_Score >=2 then 'At Risk'
   when R_Score <= 2 then 'Lost Customer'
   else 'Need Attention'
   end as customer_segment

  from rfm_score
)

SELECT

customer_segment,

COUNT(*) AS total_customers,

round(100 * count(*)/sum(count(*)) over(),2) as customer_segment_percentage

FROM rfm_customer_segment

GROUP BY customer_segment

ORDER BY total_customers DESC;


select 
customer_segment,
count(customer_unique_id) as total_customers,
sum(monetary) as total_revenue,
avg(monetary) as average_revenuew
from rfm_customer_segment
group by customer_segment
order by total_revenue desc
*/



