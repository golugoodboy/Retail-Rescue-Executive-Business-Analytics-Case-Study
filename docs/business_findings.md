## Business Findings

97.02% of customer orders were delivered successfully.

This indicates that the overall fulfillment process is stable.

However, 1,240 orders were either canceled or unavailable, representing lost revenue opportunities and requiring further investigation.


## Referential Integrity Assessment

### Finding

All core business entities maintain referential integrity.

No orphan records were detected between Orders, Customers, Products, Sellers, Payments, Reviews, and Category Translation tables.

Business Impact

This indicates the transactional database is highly consistent and reliable for downstream business analysis.

The absence of orphan records significantly reduces the risk of incorrect joins, inaccurate KPIs, and misleading executive reports.

### Risk Level
Low


## Customer Table Business Findings

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


## Revenue Analysis

Revenue Concentration
São Paulo alone generates approximately 36% of NovaMart's gross revenue.

Business Impact
The company has a strong market presence in São Paulo but faces geographic concentration risk. Expanding customer acquisition in underrepresented states could diversify revenue and reduce dependence on a single region.

Revenue Mix
Approximately 86% of revenue comes from product sales, while 14% comes from freight charges.

Business Impact
Shipping is a significant revenue component. NovaMart should continue monitoring freight pricing to balance profitability with customer satisfaction and competitiveness.


Average Order Value
Customers spend an average of $160.58 per completed order.

Business Impact
AOV provides a baseline for evaluating future promotions, cross-selling initiatives, and pricing strategies.


## Product Analysis

Health & Beauty dominates revenue
Health & Beauty generated R$1.26M, making it NovaMart's highest revenue-generating category.

Business Impact
NovaMart should continue investing in this category through inventory expansion, supplier partnerships, and targeted marketing campaigns.

Bed Bath Table has the highest sales volume
The Bed Bath Table category sold 11,115 items, the highest across all product categories.
Despite this, it ranks below Health & Beauty in revenue.

Business Impact
The category appears to rely on lower-priced products. NovaMart should evaluate opportunities for premium product bundles and upselling to improve margins.

Computers represent a premium segment
Computers have the highest average selling price (R$1,098) but are absent from the top-selling categories.

Business Impact
This category is positioned as a premium offering. Marketing efforts should prioritize high-intent customers rather than broad promotional campaigns.


## Customer Analysis

Only 3.12% of customers placed more than one order.
This suggests customer retention is low and NovaMart should consider loyalty programs and personalized marketing.

Out of the top 10 customers, 9 have only one order but very high spending.
This means NovaMart's biggest customers are high-value one-time buyers, not necessarily loyal customers.
That's a valuable business insight.

Average CLV(customer lifetime value) is R$141.62.



## RFM Analysis
NovaMart has 93,358 customers with at least one delivered order, forming the basis for customer segmentation.

Customer purchase frequency ranges from 1 to 15 orders, indicating a mix of one-time buyers and highly loyal customers.

Customer spending ranges from R$0.85 to R$13,440.00, highlighting significant variation in customer value.

The RFM analysis covers transactions from September 2016 through August 2018, providing nearly two years of customer purchase history.

Approximately 57% of NovaMart customers are classified as Lost Customers, indicating a substantial opportunity to improve retention through loyalty programs, personalized promotions, and post-purchase engagement.

Around 40% of customers fall into the Need Attention segment. These customers have purchased recently enough that targeted marketing campaigns could encourage repeat purchases before they become inactive.

Less than 1% of customers qualify as Loyal Customers or Champions, suggesting that while high-value customers exist, they represent only a small portion of the customer base.

The Champion and Loyal Customer segments should receive premium retention strategies because losing even a few high-value customers could disproportionately impact revenue.

Approximately 57% of NovaMart's customers are classified as Lost Customers, representing over R$7.3 million in historical revenue. Improving customer retention could significantly increase repeat purchases and long-term profitability.

Nearly 40% of customers fall into the Need Attention segment. These customers have generated more than R$5.3 million in revenue and should be targeted with personalized marketing campaigns before they become inactive.

Although there are only 11 Champion customers, they spend an average of R$1,239 each—almost 9 times the value of a Lost Customer. Retaining these customers should be a top business priority.

Customers in the At Risk segment have an average customer value of R$253, substantially higher than Lost Customers. Timely win-back campaigns could recover high-value customers before they churn completely.

| Customer Segment          | Customer Profile                                           | Recommended Business Action                                                                      | Business Objective                                     |
| ------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------ |
| 🏆 **Champion**           | High spend, frequent purchases, recent activity            | Offer VIP rewards, exclusive discounts, early access to new products, premium customer support   | Maximize retention and increase lifetime value         |
| ❤️ **Loyal Customer**     | Frequent repeat buyers with strong purchase history        | Launch loyalty programs, personalized recommendations, cross-selling and upselling campaigns     | Increase customer lifetime value                       |
| 🌱 **Potential Loyalist** | Recent customers beginning to purchase repeatedly          | Send targeted promotions, welcome offers, and product recommendations                            | Convert into Loyal Customers                           |
| ⚠️ **At Risk**            | Previously active customers who haven't purchased recently | Run win-back campaigns, limited-time discounts, reminder emails, and abandoned customer outreach | Prevent churn and recover valuable customers           |
| 👀 **Need Attention**     | Moderate-value customers with declining engagement         | Re-engage with personalized emails, product suggestions, and seasonal promotions                 | Encourage another purchase before they become inactive |
| ❌ **Lost Customer**       | Customers inactive for a long period with low engagement   | Launch reactivation campaigns, survey customer feedback, and offer attractive return incentives  | Recover inactive customers where economically viable   |

