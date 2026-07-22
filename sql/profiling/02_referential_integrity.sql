--1. Does every order belong to a valid customer?
/*select 
count(*) as orphan_orders
from 
olist_orders_dataset as o
left join olist_customers_dataset as c
on
o."""customer_id""" = c.customer_id
where c.customer_id is null
*/
--Ans : 0

--2. Does every order item belong to a valid order?
/*select 
count(*) as orphan_orders
from 
olist_order_items_dataset as oi
left join olist_orders_dataset as o
on 
oi.order_id = o."""order_id"""
where o."""order_id""" is null;
*/
--Ans : 0

--3. Payment --> Orders
/*select 
count(*) as orphan_payments
from 
olist_order_payments_dataset as p
left join olist_orders_dataset as o
on 
p.order_id = o."""order_id"""
where o."""order_id""" is null
*/
--Ans : 0

--4. Reviews --> Orders
/*SELECT
    COUNT(*) AS orphan_reviews
FROM olist_order_reviews_dataset r
LEFT JOIN olist_orders_dataset o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;
*/
--Ans : 0

--5. Order Items --> Products
/*SELECT
    COUNT(*) AS orphan_order_items
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
*/
--Ans : 0

--6. Order Items --> Seller
/*
SELECT
    COUNT(*) AS orphan_sellers
FROM olist_order_items_dataset oi
LEFT JOIN olist_sellers_dataset s
ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;
*/
--Ans : 0

--7. Product --> Category Translation
/*
SELECT
    COUNT(*) AS untranslated_categories
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL
AND t.product_category_name IS NULL;
*/
--Ans : 0

