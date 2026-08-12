🛒 Retail Rescue — Executive Business Analytics

📌 Project Overview

Retail Rescue is an end-to-end business analytics project built using the Brazilian E-Commerce Public Dataset by Olist.

The project simulates an executive analytics environment for a fictional e-commerce company, NovaMart, with the objective of transforming raw transactional data into actionable business insights.

The project covers:

Data profiling and quality assessment

Relational data integration

Exploratory Data Analysis (EDA)

Revenue and product analysis

Customer analysis

RFM segmentation

Customer value analysis

Time-series forecasting

Model evaluation and validation

Forecasting diagnostics

The project demonstrates practical skills in Python, Pandas, SQL, Statistics, Machine Learning, Data Visualization, and Business Analytics.

🎯 Business Objectives

The analysis focuses on answering key business questions.

Revenue & Sales

What are the major revenue-generating product categories?

Which states generate the most revenue?

How does revenue change over time?

What are the monthly revenue patterns?

Customers

How many unique customers does NovaMart have?

What percentage of customers are repeat customers?

Who are the highest-value customers?

How can customers be segmented based on purchasing behavior?

Operations

What is the average delivery time?

Which seller states have longer delivery times?

How does freight cost relate to product price and weight?

What percentage of orders are delivered, canceled, shipped, or unavailable?

Forecasting

Can NovaMart forecast future monthly revenue?

Which forecasting model performs best?

Does the revenue series contain significant seasonality?

Does the selected model leave systematic patterns in its residuals?

📊 Dataset

The project uses the Olist Brazilian E-Commerce dataset.

Dataset Overview

Dataset

Rows

Columns

Customers

99,441

5

Geolocation

1,000,163

5

Order Items

112,650

7

Payments

103,886

5

Reviews

99,224

7

Orders

99,441

8

Products

32,951

9

Sellers

3,095

4

Category Translation

71

2

🏗️ Data Integration

The transactional dataset was converted into a master analytical dataset by joining the relevant tables.

Main relationships

Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ├──────────────► Payments
    ├──────────────► Reviews
    │
    ▼
Order Items
    │
    ├──────────────► Products
    │                    │
    │                    ▼
    │             Category Translation
    │
    └──────────────► Sellers

Merge validation

The joins were validated using:

many_to_one validation

Row-count comparison

indicator=True

Missing-value checks

Foreign-key consistency checks

The final transaction-level dataset contained 112,650 rows without unexpected row multiplication during the merge process.

🧹 Data Quality & Feature Engineering

Data-quality checks were performed across:

Order approval timestamps

Delivery timestamps

Product metadata

Product dimensions

Review comments

Product category translations

Engineered Features

The analytical dataset includes:

delivery_days

approval_efficiency

purchase_month

purchase_year

purchase_weekdays

Is_Delivered

freight_ratio

item_order_value

📈 Exploratory Data Analysis

EDA was performed to understand:

Revenue distribution

Product price distribution

Freight cost distribution

Delivery-time distribution

Relationships between price, freight, and product weight

Revenue by product category

Revenue by seller state

Revenue by customer state

Monthly revenue patterns

Order-status distribution

Key EDA Findings

Product prices are right-skewed with several high-value outliers.

Freight charges are also right-skewed.

Delivery time is right-skewed, with a small number of very long deliveries.

Product weight has a stronger positive relationship with freight cost than product price does.

Revenue is concentrated among a small number of major product categories and states.

Monthly revenue shows an overall upward movement but also considerable volatility.

💰 Revenue Analysis

Total revenue was calculated using product price and freight revenue.

Product Revenue      = 13,591,643.70
Shipping Revenue     =  2,251,909.54
Gross Revenue        = 15,843,553.24

Top Product Categories by Revenue

Product Category

Revenue

Health & Beauty

1,258,681.34

Watches & Gifts

1,205,005.68

Bed Bath & Table

1,036,988.68

Sports & Leisure

988,048.97

Computers & Accessories

911,954.32

👥 Customer Analysis

Customer behavior was analyzed using:

Unique customers

Order frequency

Total customer spend

Average customer spend

Repeat purchase behavior

RFM analysis

Customer Metrics

Total Customers          ≈ 95,420
One-Time Customers       ≈ 92,507
Repeat Customers         ≈ 2,913
Repeat Purchase Rate     ≈ 3.05%
Average Customer Spend   ≈ 142.44
Average Orders/Customer ≈ 1.03

The analysis highlights a major business opportunity around customer retention and repeat purchasing.

🎯 RFM Analysis

RFM analysis was used to segment customers based on:

Recency

How recently the customer purchased.

Frequency

How frequently the customer purchased.

Monetary

How much the customer spent.

Customer segments included:

Lost Customer

Need Attention

At Risk

Potential Loyalist

Loyal Customer

Champion

This analysis provides a foundation for targeted customer-retention strategies.

📦 Customer Value Segmentation

Customers were additionally segmented based on purchasing behavior.

Segments included:

Low Value

Medium Value

High Value

Premium

VIP

This allows NovaMart to identify high-value customers and prioritize retention efforts.

🔮 Time-Series Forecasting

Monthly revenue was aggregated from the transaction-level dataset to create a time series.

The forecasting workflow included:

Monthly Revenue
      ↓
Trend Analysis
      ↓
Moving Averages
      ↓
Stationarity Analysis
      ↓
ADF Test
      ↓
Differencing
      ↓
ACF / PACF
      ↓
ARIMA
      ↓
SARIMA
      ↓
Auto ARIMA
      ↓
Walk-Forward Validation
      ↓
Residual Diagnostics

📉 Stationarity Analysis

The Augmented Dickey-Fuller (ADF) test was used to assess stationarity.

Original Revenue

ADF Statistic ≈ -1.48
p-value ≈ 0.543

The original series was not stationary.

First-Differenced Revenue

ADF Statistic ≈ -8.18
p-value ≈ 8.39 × 10⁻¹³

The first-differenced series was stationary.

Therefore:

d = 1

📊 ACF & PACF

ACF and PACF were used to identify potential ARIMA parameters.

The analysis supported:

p = 1
d = 1
q = 1

leading to the candidate:

ARIMA(1,1,1)

🌦️ Seasonal Analysis

Because the data is monthly, annual seasonality was investigated using a seasonal period of:

s = 12

Seasonal differencing alone did not produce stationarity.

Furthermore, the ACF/PACF did not show strong evidence of significant seasonal autocorrelation at the 12-month lag.

Given the relatively short historical period, a strong annual seasonal component could not be reliably established.

Therefore, a simpler ARIMA model was preferred over the tested seasonal SARIMA specification.

🤖 Forecasting Models Evaluated

The following models were evaluated:

Holt's Exponential Smoothing

Captures:

Level

Trend

ARIMA

Captures:

Autoregressive behavior

Differencing

Moving-average error structure

SARIMA

Extends ARIMA with seasonal components.

Auto ARIMA

Automatically searches candidate ARIMA configurations based on statistical model-selection criteria.

🚶 Walk-Forward Validation

Because time-series data must respect chronological order, random train/test splitting was avoided.

An expanding-window walk-forward validation strategy was implemented.

Conceptually:

Training → Forecast next month → Evaluate

Training + new observation
        ↓
Forecast next month → Evaluate

Training + new observations
        ↓
Forecast next month → Evaluate

This provides a more realistic estimate of future forecasting performance.

🏆 Forecasting Model Comparison

Walk-forward validation produced the following results:

Model

MAE

RMSE

MAPE

ARIMA(1,1,1)

95,959.97

149,366.32

10.98%

Auto ARIMA

113,560.65

156,300.67

13.04%

Holt

127,600.41

158,695.07

14.42%

Selected Model

ARIMA(1,1,1)

The ARIMA model achieved the lowest MAE, RMSE, and MAPE among the evaluated models.

🔍 Residual Diagnostics

Residual analysis was performed to determine whether the selected ARIMA model left systematic temporal patterns unexplained.

Diagnostics included:

Residual time-series plot

Residual distribution

Residual ACF

Ljung-Box test

Ljung-Box Results

Lag

Statistic

p-value

6

4.2146

0.6477

12

7.6922

0.8087

Both p-values are greater than 0.05, so there was no statistically significant evidence of residual autocorrelation at the tested lags.

The residuals were approximately centered around zero, although some large residuals and mild skewness were observed.

🏁 Forecasting Conclusion

Based on the available historical data:

ARIMA(1,1,1)

was selected as the preferred forecasting model.

The model achieved approximately:

MAE  ≈ 95,960
RMSE ≈ 149,366
MAPE ≈ 10.98%

in expanding-window walk-forward validation.

The residual diagnostics also indicated that there was no significant remaining autocorrelation.

However, the dataset contains only approximately two years of monthly observations, so the results should be interpreted with caution. The model should be re-evaluated as more historical data becomes available.

🛠️ Technologies Used

Programming & Analysis

Python

Pandas

NumPy

SciPy

Statsmodels

Scikit-learn

pmdarima

Visualization

Matplotlib

Seaborn

Analytics

Exploratory Data Analysis

Statistical Analysis

RFM Analysis

Time-Series Forecasting

Model Evaluation

Walk-Forward Validation

Residual Diagnostics

Database / Querying

SQL

Relational Data Analysis

Business Intelligence

Power BI

📁 Project Structure

Retail-Rescue/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── data_profiling.ipynb
│   ├── data_cleaning_merging.ipynb
│   ├── exploratory_data_analysis.ipynb
│   ├── customer_analysis.ipynb
│   └── forecasting.ipynb
│
├── sql/
│   ├── business_requirements.md
│   ├── revenue_analysis.sql
│   ├── product_analysis.sql
│   ├── customer_analysis.sql
│   └── referential_integrity.sql
│
├── powerbi/
│   └── NovaMart_Executive_Dashboard.pbix
│
├── README.md
└── requirements.txt

📌 Key Business Insights

The analysis identified several important business opportunities:

Customer retention is a major opportunity because the repeat purchase rate is approximately 3%.

São Paulo is the dominant revenue market among both customer and seller states.

Health & Beauty is the highest-revenue product category.

Freight cost has a positive relationship with product weight.

Revenue contains substantial volatility and occasional large deviations.

ARIMA(1,1,1) provided the strongest forecasting performance among the tested models.

Forecasting accuracy can be improved further as more historical observations become available.

🚀 Future Work

Planned extensions include:

Customer clustering using K-Means

Elbow method

Silhouette analysis

Advanced customer segmentation

Product-level forecasting

Category-level forecasting

Forecasting at scale

Feature-based forecasting

Advanced time-series models

Power BI forecasting dashboard

👨‍💻 Project Focus

This project demonstrates an end-to-end analytical workflow:

Raw Data
   ↓
Data Quality
   ↓
Data Integration
   ↓
Feature Engineering
   ↓
EDA
   ↓
SQL Analysis
   ↓
Customer Analytics
   ↓
RFM Segmentation
   ↓
Forecasting
   ↓
Model Validation
   ↓
Business Insights

The ultimate goal is to demonstrate how raw transactional data can be transformed into data-driven business decisions.