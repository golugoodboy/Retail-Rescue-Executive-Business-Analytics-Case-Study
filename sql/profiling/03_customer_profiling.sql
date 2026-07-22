--1. Row Count
/*select
count(*) as number_of_rows
from 
olist_customers_dataset
*/
--Ans : 99441

--2. Count unique customer id
/*select
count(*) as customer_id,
count(distinct customer_id) as unique_customer_id
from 
olist_customers_dataset
*/
--Ans : customer_id | unique_customer_id
--         99441     |    99441

--3. Count unique customers
/*select 
count(distinct customer_unique_id) as unique_customers
from
olist_customers_dataset
*/
--Ans : 96096

--4. Missing values
/*select
sum(case when customer_id is null then 1 else 0 end) as missing_customer_id,
sum(case when customer_unique_id is null then 1 else 0 end) as missing_unique_customer_id,
sum(case when customer_zip_code_prefix is null then 1 else 0 end) as missing_zip_code,
sum(case when customer_city is null then 1 else 0 end) as missing_city,
sum(case when customer_state is null then 1 else 0 end) as missing_state
from
olist_customers_dataset
*/
--Ans : missing_customer_id | missing_unique_customer_id | missing_zip_code | missing_city | missing_state
--          0                    |              0             |         0          |       0        |       0


--5. Duplicate customer id 
/*
select
customer_id,
count(*)
from olist_customers_dataset
group by customer_id
having count(*) > 1
*/
--Ans : No Duplicate Customer IDs 


--6. Repeat Customers
/*select 
customer_unique_id,
count(*) as total_numbers
from
olist_customers_dataset
group by customer_unique_id
having count(*) > 1
order by total_numbers desc;
*/
--Ans : 2997 Rows


--7. Customer distribution by state
/*
select
customer_state,
count(distinct customer_unique_id) as total_numbers_of_customer
from
olist_customers_dataset
group by customer_state
order by count(distinct customer_unique_id) desc;
*/
/*Ans : 

    customer_state | total_numbers_of_customer
-------------------- | -------------------------
                 SP  |                     41746
                 RJ  |                     21114
                 MG  |                     11635
                 RS  |                      3892
                 PR  |                      3622
..................
*/



