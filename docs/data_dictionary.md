## Table: orders

Description:
Stores one record for every customer order.

Primary Key:
order_id

Possible Foreign Keys:
customer_id

Columns:

| Column | Data Type | Description | Business Meaning |
|---------|-----------|-------------|------------------|
| order_id | string | Unique order identifier | Used to track every purchase |
| customer_id | string | Customer identifier | Links orders to customers |
| order_status | string | Current status | Measures operational performance |
...


## Table: Customer Data Set

Description:
Store customer data for every customer.

Primary Key: 
customer_id

Columns:

|Column|DataType|Description|Business Meaning|
|-----|--------|-----------|----------------|
customer_id|string|Unique customer identifier|Used to track every customer|
customer_unique_id|string|Unique customer identifier|Links orders to customers|
customer_zip_code_prefix|string|Customer zip code prefix|Measures operational performance|
customer_city|string|Customer city|Measures operational performance|
customer_state|string|Customer state|Measures operational performance|
06b8999e2fba1a1fbc88172c00ba8bc7|861eff4711a542e4b93843c6dd7febb0|14409|franca|SP
18955e83d337fd6b2def6b18a428ac77|290c77bc529b7ac935b93aa66c333dc3|9790|sao bernardo do campo|SP
4e7b3e00288586ebd08712fdd0374a03|060e732b5b29e8181a18229c7b0b2b5e|1151|sao paulo|SP


## Table: Geolocation Dataset

Description: 
Stores the latitude and longitude of the customer zip code prefix.

Primary Key:
No primary key

Columns:
|geolocation_zip_code_prefix|geolocation_lat|geolocation_lng|geolocation_city|geolocation_state|
|1037|-23.54562128|-46.63929205|sao paulo|SP|
|1046|-23.54608113|-46.6448203|sao paulo|SP|
|1046|-23.54612897|-46.64295148|sao paulo|SP|
|1041|-23.54439216|-46.63949931|sao paulo|SP|


## Table: Order Items

Description:
Stores Order Id and order details.

Primary Key:
Order ID

Columns:

| order_id | order_item_id | product_id | seller_id | shipping_limit_date | price | freight_value |
| 00010242fe8c5a6d1ba2dd792cb16214 | 1 | 4244733e06e7ecb4970a6e2683c13e61 | 48436dade18ac8b2bce089ec2a041202 | 9/19/2017 9:45 | 58.9 | 13.29 |
| 00018f77f2f0320c557190d7a144bdd3 | 1 | e5f2d52b802189ee658865ca93d83a8f | dd7ddc04e1b6c2c614352b383efe2d36 | 5/3/2017 11:05 | 239.9 | 19.93 |


## Table: Order Payments

Description:
Stores order payments.

Primary Key:
Order ID

Columns:

| order_id | payment_sequential | payment_type | payment_installments | payment_value |
| b81ef226f3fe1789b1e8b2acac839d17 | 1 | credit_card | 8 | 99.33 |
| a9810da82917af2d9aefd1278f1dcfa0 | 1 | credit_card | 1 | 24.39 |


## Table : Order Reviews

Description:
Keeps the order reviews.

Primary Key and Foreign Key:
Review ID and Order ID

Columns:

| review_id | order_id | review_score | review_comment_title | review_comment_message |
| 7bc2406110b926393aa56f80a40eba40 | 73fc7af87114b39712e6da79b0a377eb | 4 | | |
| 80e641a11e56f04c1ad469d5645fdfde | a548910a1c6147796b98fdf73dbeba33 | 5 | | |


## Table: Product Dataset

Description:
It contains product id and product details.

Primary Key:
Product ID

Columns:

| product_id | product_category_name | product_name_lenght | product_description_lenght | product_photos_qty | product_weight_g | product_length_cm | product_height_cm | product_width_cm |
| 1e9e8ef04dbcff4541ed26657ea517e5 | perfumaria | 40 | 287 | 1 | 225 | 16 | 10 | 14 |
| 3aa071139cb16b67ca9e5dea641aaa2f | artes | 44 | 276 | 1 | 1000 | 30 | 18 | 20 |


## Table : Seller Dataset

Description:
It contains seller details.

Primary Key:
Seller ID

Columns:

| seller_id | seller_zip_code_prefix | seller_city | seller_state |
| 3442f8959a84dea7ee197c632cb2df15 | 13023 | campinas | SP |
| d1b65fc7debc3361ea86b5f14c68d2e2 | 13844 | mogi guacu | SP |


## Table : Product Category Name Translation

Description:
It contains product name and category.

Primary Key:
Product name and Product category

Columns:

| product_category_name | product_category_name_english |
| beleza_saude | health_beauty |
| informatica_acessorios | computers_accessories |


