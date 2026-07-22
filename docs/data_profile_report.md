# Orders Table

## Table Information

Rows : 99,441

Columns : 8

Primary Key : order_id

Foreign Key : customer_id

Date Range : 2016-09-04 21:15:19 to 2018-10-17 17:30:18

---

## Data Quality Assessment

Duplicate Records : 0

Missing Values : NA

Invalid Values : None


---

## Business Findings

Finding 1 : Finding

97.02% of customer orders were delivered successfully.

This indicates that the overall fulfillment process is stable.

However, 1,240 orders were either canceled or unavailable, representing lost revenue opportunities and requiring further investigation.



## Recommendation

Maintain current fulfillment processes while investigating and addressing the root causes of canceled and unavailable orders to prevent future revenue loss.




# Customer Table

## Table Information

Rows : 99,441

Columns : 5

Primary Key : customer_id


---

## Data Quality Assessment

Duplicate Records : 0

Missing Values : NA

Invalid Values : None


---

## Business Findings


Total Number of Customer Records : 99,441

Total Unique Customer ID Records : 96,096

2,997 customers made multiple purchases.

This state has the largest customer market base:
 customer_state | total_numbers_of_customer
-------------------- | -------------------------
     SP  |                     41,746

Top 10 customer cities :
    sao paulo	            14,984
    rio de janeiro	        6,620
    belo horizonte	        2,672
    brasilia	            2,069
    curitiba	            1,465
    campinas	            1,398
    porto alegre	        1,326
    salvador	            1,209
    guarulhos	            1,153
    sao bernardo do campo	  908


Customer is more concentrated in these region.

    customer_state | customers | percentage_of_customers
    -------------------- | ----------- | ------------------------
    SP	                 40,302	     41.940000000000
    RJ	                 12,384	     12.890000000000
    MG	                 11,259	     11.720000000000
    RS	                 5,277	      5.490000000000
    PR	                 4,882	      5.080000000000


Repeat Purchase Rate

total customers | repeat customers | repeat purchase rate
96,096	          2,997	            3.12%






