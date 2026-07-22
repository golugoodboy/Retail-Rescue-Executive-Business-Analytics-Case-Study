/*
===============================================================
Project       : Retail Rescue - Executive Business Analytics
Company       : NovaMart (Fictional)
Sprint        : Product Analysis
Author        : GoluGoodBoy

Objective:
Analyze product and category performance to identify
high-performing products, revenue-driving categories,
and opportunities for portfolio optimization.

Business Questions:
1. Which product categories generate the highest revenue?
2. Which categories sell the highest volume?
3. What is the average selling price by category?
4. Which categories generate high revenue but low sales volume?
5. Which categories should NovaMart prioritize?

Tables Used:
- olist_order_items_dataset
- olist_products_dataset
- product_category_name_translation

===============================================================
*/

--1. Which product categories generate the highest revenue?
--Ans : 
--product_category     |    revenue    | item_sold
--health_beauty        |   1258681.34  |  9670
--watches_gifts        |   1205005.68  |  5991
--bed_bath_table       |   1036988.68  |  11115
--sports_leisure       |   988048.97   |  8641
--computers_accessories|   911954.32   |  7827
--furniture_decor      |   729762.49   |  8334
--cool_stuff           |   635290.85   |  3796
--housewares           |   632248.66   |  6964
--auto                 |   592720.11   |  4235
--garden_tools         |   485256.46   |  4347
/*
SELECT
top 10
    t.product_category_name_english,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS revenue,
    COUNT(*) AS items_sold
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY revenue DESC;
*/

--2. Which categories sell the highest volume?
--Ans : 
--product_category            |  item_sold
--bed_bath_table              |  11115
--health_beauty               |  9670
--sports_leisure              |  8641
--furniture_decor             |  8334
--computers_accessories       |  7827
--housewares                  |  6964
--watches_gifts               |  5991
--telephony                   |  4545
--garden_tools                |  4347
--auto                        |  4235
/*
SELECT
top 10
    t.product_category_name_english,
    COUNT(*) AS items_sold
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY items_sold DESC;
*/


--3. What is the average selling price by category?
--Ans : 
--product_category                                |  avg_price
--computers                                       | 1098.340000
--small_appliances_home_oven_and_coffee           |   624.290000
--home_appliances_2                               |   476.120000
--agro_industry_and_commerce                      |   342.120000
--musical_instruments                             |   281.620000
--small_appliances	                              |   280.780000
--fixed_telephony	                              |   225.690000
--construction_tools_safety	                      |   208.990000
--watches_gifts	                                  |   201.140000
--air_conditioning	                              |   185.270000
/*
SELECT
top 10
    t.product_category_name_english,
	ROUND(avg(cast(oi.price as decimal(10,2))),2) AS average_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY average_revenue DESC;
*/

--4. Which categories generate high revenue but low sales volume?
--Ans : 
--product_category               | revenue      | items_sold
--health_beauty                  |1258681.34    |   9670
--watches_gifts                  |1205005.68    |   5991
--bed_bath_table                 |1036988.68    |   11115
--sports_leisure                 | 988048.97    |   8641
--computers_accessories          | 911954.32    |   7827
--furniture_decor                | 729762.49    |   8334
--cool_stuff                     | 635290.85    |   3796
--housewares                     | 632248.66    |   6964
--auto                           | 592720.11    |   4235
--garden_tools                   | 485256.46    |   4347
/*
SELECT
top 10
    t.product_category_name_english,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS revenue,
    COUNT(*) AS items_sold
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY revenue DESC, items_sold asc;
*/


--5. Which categories should NovaMart prioritize?
--Ans : Novamart should priortize Health_beauty because it is generating the maximum revenue for them.

--6. Category Revenue Contribution
--Ans : 
--product_category	                       revenue	      item_sold	revenue_percentage
--health_beauty	                            1258681.34	    9670	        9.260699
--watches_gifts	                            1205005.68	    5991	        8.865783
--bed_bath_table	                        1036988.68	   11115	        7.629604
--sports_leisure	                        988048.97	    8641	        7.269532
--computers_accessories	                    911954.32	    7827	        6.709669
--furniture_decor	                        729762.49	    8334	        5.369199
--cool_stuff	                            635290.85	    3796	        4.674128
--housewares	                            632248.66	    6964	        4.651745
--auto	                                    592720.11	    4235	        4.360915
--garden_tools	                            485256.46	    4347	        3.570255
/*
SELECT
top 10
    t.product_category_name_english,
    ROUND(SUM(cast(oi.price as decimal(10,2))),2) AS revenue,
    COUNT(*) AS items_sold,
	100 * ROUND(SUM(cast(oi.price as decimal(10,2))),2)/(select
round(sum(cast(oi.price as decimal(10,2))),2)
from 
olist_order_items_dataset as oi)
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY revenue DESC;
*/