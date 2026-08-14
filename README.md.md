# 🛒 Retail Rescue — NovaMart Executive Business Analytics

## 📌 Project Overview

**Retail Rescue** is an end-to-end business analytics project built using the **Brazilian E-Commerce Public Dataset by Olist**.

The project simulates an analytics environment for a fictional e-commerce company, **NovaMart**, with the goal of transforming raw transactional data into actionable business insights.

The project combines:

- SQL
- Python
- Exploratory Data Analysis
- Statistics
- Power BI
- RFM Analysis
- Time-Series Forecasting
- K-Means Clustering
- PCA
- Business Intelligence

### End-to-End Workflow

```text
Raw Data
   ↓
Data Quality & Validation
   ↓
Data Integration
   ↓
Feature Engineering
   ↓
Exploratory Data Analysis
   ↓
SQL Business Analysis
   ↓
Power BI Dashboard
   ↓
Customer / RFM Analysis
   ↓
Time-Series Forecasting
   ↓
Customer Clustering
   ↓
Business Recommendations
```

---

# 🎯 Business Objectives

The project answers key questions across revenue, customers, operations, forecasting, and segmentation.

### Revenue & Sales
- What are the major revenue-generating product categories?
- Which states generate the most revenue?
- How does revenue change over time?
- What are the monthly revenue patterns?

### Customers
- How many unique customers does NovaMart have?
- What percentage of customers are repeat customers?
- Who are the highest-value customers?
- How can customers be segmented based on purchasing behavior?

### Operations
- What is the average delivery time?
- Which seller states have longer delivery times?
- How does freight cost relate to product price and weight?
- What percentage of orders are delivered, shipped, canceled, or unavailable?

### Forecasting
- Can NovaMart forecast future monthly revenue?
- Is revenue stationary?
- Does the revenue series contain seasonality?
- Which forecasting model performs best?
- Are the final model residuals statistically acceptable?

### Customer Segmentation
- Can customers be grouped according to purchasing behavior?
- How many natural customer segments exist?
- Which segments contain the most customers?
- Which segments have higher purchase frequency and monetary value?

---

# 📊 Dataset

The project uses the **Olist Brazilian E-Commerce Public Dataset**.

The dataset contains information about customers, orders, order items, products, sellers, payments, reviews, product categories, and geographic information.

### Dataset Overview

| Dataset | Rows | Columns |
|---|---:|---:|
| Customers | 99,441 | 5 |
| Geolocation | 1,000,163 | 5 |
| Order Items | 112,650 | 7 |
| Payments | 103,886 | 5 |
| Reviews | 99,224 | 7 |
| Orders | 99,441 | 8 |
| Products | 32,951 | 9 |
| Sellers | 3,095 | 4 |
| Category Translation | 71 | 2 |

---

# 🏗️ Data Integration

The relevant Olist tables were integrated into a transaction-level analytical dataset.

```text
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
```

### Merge Validation

The joins were validated using:

- `many_to_one` validation
- Row-count comparisons
- `indicator=True`
- Missing-value checks
- Referential-integrity checks
- Duplicate analysis

The final transaction-level analytical dataset contained approximately **112,650 rows**.

---

# 🧹 Data Quality & Feature Engineering

Data-quality checks covered missing values, duplicates, foreign-key relationships, timestamps, product attributes, delivery information, and product categories.

### Engineered Features

- `delivery_days`
- `approval_efficiency`
- `purchase_month`
- `purchase_year`
- `purchase_weekdays`
- `Is_Delivered`
- `freight_ratio`
- `item_order_value`

---

# 📈 Exploratory Data Analysis

EDA covered:

- Revenue distribution
- Product price distribution
- Freight distribution
- Delivery-time distribution
- Product-weight distribution
- Price vs freight relationship
- Weight vs freight relationship
- Revenue by product category
- Revenue by seller state
- Revenue by customer state
- Monthly revenue
- Order-status distribution

### Key EDA Findings

- Product prices are **right-skewed**, with high-value outliers influencing the mean.
- Freight charges are also **right-skewed**, with significant high-value observations.
- Delivery time is right-skewed, with a small number of extremely long deliveries.
- Product weight has a stronger positive relationship with freight cost than product price.
- Monthly revenue shows an overall upward movement but considerable volatility.
- Revenue is concentrated among a relatively small number of product categories and states.

### Correlation Findings

```text
Price ↔ Freight Value       ≈ 0.414
Product Weight ↔ Freight    ≈ 0.610
```

Product weight therefore has a stronger positive relationship with freight cost than product price.

---

# 💰 Revenue Analysis

### Overall Revenue

```text
Product Revenue      = 13,591,643.70
Shipping Revenue     =  2,251,909.54
Gross Revenue        = 15,843,553.24
```

### Top Product Categories by Revenue

| Product Category | Revenue |
|---|---:|
| Health & Beauty | 1,258,681.34 |
| Watches & Gifts | 1,205,005.68 |
| Bed Bath & Table | 1,036,988.68 |
| Sports & Leisure | 988,048.97 |
| Computers & Accessories | 911,954.32 |

### Top Seller States by Revenue

| Seller State | Revenue |
|---|---:|
| SP | 8,753,396.21 |
| PR | 1,261,887.21 |
| MG | 1,011,564.74 |
| RJ | 843,984.22 |
| SC | 632,426.07 |

São Paulo is the dominant seller state by revenue.

---

# 👥 Customer Analysis

Customer-level metrics were created using `customer_unique_id`.

### Customer Metrics

```text
Total Customers          = 95,420
One-Time Customers       = 92,507
Repeat Customers         = 2,913
Repeat Purchase Rate     ≈ 3.05%
Average Customer Spend   ≈ 142.44
Average Orders/Customer  ≈ 1.03
```

Approximately **97% of customers made only one purchase**, highlighting customer retention and repeat-purchase conversion as a major business opportunity.

---

# 🎯 RFM Analysis

RFM analysis was performed using:

- **Recency** — how recently a customer purchased
- **Frequency** — how frequently a customer purchased
- **Monetary** — how much a customer spent

Customer segments included:

- Lost Customer
- Need Attention
- At Risk
- Potential Loyalist
- Loyal Customer
- Champion

RFM provided a rule-based framework for identifying customer engagement and value.

---

# 📦 Customer Value Segmentation

Customers were additionally grouped into:

- Low Value
- Medium Value
- High Value
- Premium
- VIP

This provided another perspective on customer value and supported targeted retention strategies.

---

# 🔮 Time-Series Forecasting

Monthly revenue was used as the forecasting target.

### Forecasting Workflow

```text
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
```

---

# 📉 Stationarity Analysis

### Original Revenue

```text
ADF Statistic ≈ -1.480
p-value ≈ 0.543
```

The original revenue series was **not stationary**.

### First-Differenced Revenue

```text
ADF Statistic ≈ -8.176
p-value ≈ 8.39 × 10⁻¹³
```

The first-differenced series was stationary.

Therefore:

```text
d = 1
```

---

# 📊 ACF & PACF

ACF and PACF were used to identify candidate ARIMA parameters.

The analysis supported testing:

```text
p = 1
d = 1
q = 1
```

leading to:

```text
ARIMA(1,1,1)
```

---

# 🌦️ Seasonal Analysis

Because the data is monthly, annual seasonality was investigated using:

```text
Seasonal Period = 12
```

Seasonal differencing and seasonal ACF/PACF patterns were examined, and SARIMA models were tested.

Because the available historical period is relatively short, strong annual seasonality could not be established with high confidence. Model selection was therefore based on out-of-sample validation rather than assuming seasonality.

---

# 🤖 Forecasting Models Evaluated

### Holt's Exponential Smoothing
Used to model level and trend.

### ARIMA
Used to model autoregressive behavior, differencing, and moving-average error structure.

### SARIMA
Used to investigate potential seasonal behavior.

### Auto ARIMA
Used to automatically search candidate ARIMA configurations.

---

# 🚶 Walk-Forward Validation

Random train/test splitting was avoided because time-series observations are ordered chronologically.

An expanding-window walk-forward validation strategy was implemented:

```text
Training
   ↓
Forecast next month
   ↓
Evaluate

Training + new observation
   ↓
Forecast next month
   ↓
Evaluate

Training + new observations
   ↓
Forecast next month
   ↓
Evaluate
```

This provides a more realistic estimate of future forecasting performance.

---

# 🏆 Forecasting Model Comparison

The main walk-forward results were:

| Model | MAE | RMSE | MAPE |
|---|---:|---:|---:|
| **ARIMA(1,1,1)** | **95,959.97** | **149,366.32** | **10.98%** |
| Auto ARIMA | 113,560.65 | 156,300.67 | 13.04% |
| Holt | 127,600.41 | 158,695.07 | 14.42% |

### Selected Model

```text
ARIMA(1,1,1)
```

The ARIMA(1,1,1) model produced the lowest MAE, RMSE, and MAPE among the main evaluated models.

---

# 🔍 Residual Diagnostics

Residual diagnostics included:

- Residual time-series plot
- Residual histogram
- Residual ACF
- Ljung-Box test

### Ljung-Box Results

| Lag | Statistic | p-value |
|---:|---:|---:|
| 6 | 4.2146 | 0.6477 |
| 12 | 7.6922 | 0.8087 |

Both p-values are greater than 0.05, so there was **no statistically significant evidence of remaining autocorrelation** at the tested lags.

---

# 🧠 Customer Clustering

K-Means clustering was used to identify natural customer groups based on:

```text
Recency
Frequency
Monetary
```

Because K-Means is distance-based, the features were standardized using `StandardScaler`.

---

# 📐 Selecting the Number of Clusters

### Elbow Method

The elbow curve suggested a candidate around:

```text
K ≈ 4
```

### Silhouette Score

Silhouette analysis strongly favored:

```text
K = 2
Silhouette Score ≈ 0.74
```

The two-cluster solution provided the clearest separation, so:

```text
Final K = 2
```

was selected.

---

# 👥 K-Means Customer Segments

| Metric | Cluster 0 | Cluster 1 |
|---|---:|---:|
| Customers | 92,501 | 2,919 |
| Customer Share | ≈ 97% | ≈ 3% |
| Avg. Recency | 243.15 | 225.34 |
| Median Recency | 224 | 204 |
| Avg. Frequency | 1.00 | 2.11 |
| Median Frequency | 1.00 | 2.00 |
| Avg. Monetary | 138.18 | 277.42 |
| Median Monetary | 87.00 | 182.88 |
| Revenue | 12,781,854.24 | 809,789.46 |
| Revenue Share | 94.04% | 5.96% |

### Cluster 0 — One-Time / Low-Engagement Customers

Approximately 97% of customers belong to this cluster.

Characteristics:

- Frequency ≈ 1
- Median frequency = 1
- Lower average monetary value
- Dominates the customer population

### Cluster 1 — Repeat / Higher-Value Customers

Approximately 3% of customers belong to this cluster.

Characteristics:

- Frequency ≈ 2.11
- Median frequency = 2
- Average monetary value ≈ 277.42
- More than twice the average spend of Cluster 0
- More than twice the average purchase frequency of Cluster 0

This segment is better described as **Repeat / Higher-Value Customers** rather than automatically labeling it "VIP."

---

# 🧬 PCA Visualization

PCA was used to visualize the three-dimensional customer feature space in two dimensions.

### Explained Variance

```text
PC1 = 36.94%
PC2 = 33.34%

Total = 70.28%
```

The two-dimensional PCA representation therefore preserves approximately **70.3% of the variance** from the original three standardized features.

### PCA Loadings

| Component | Recency | Frequency | Monetary |
|---|---:|---:|---:|
| PC1 | 0.7077 | 0.6924 | -0.1408 |
| PC2 | -0.0072 | 0.2063 | 0.9785 |

### Interpretation

**PC1** is primarily influenced by recency and frequency, representing a customer engagement/purchasing-behavior dimension.

**PC2** is overwhelmingly influenced by monetary value, representing customer value/spending behavior.

PCA was used for **visualization and dimensionality reduction**, not to create the K-Means clusters.

---

# 📊 Power BI Dashboard

Power BI was used to build an executive dashboard containing KPIs and business views such as:

- Total Revenue
- Monthly Revenue
- Total Customers
- New Customers
- Repeat Customers
- Repeat Purchase Rate
- Average Order Value
- Customer Value
- Delivery Performance
- Revenue by State
- Revenue by Product Category
- Top Products
- Top Sellers

The dashboard translates the analytical findings into an executive-friendly format.

---

# 🗄️ SQL Analysis

SQL was used for structured business analysis and KPI generation.

Major analysis areas included:

- Revenue analysis
- Product analysis
- Customer analysis
- RFM analysis
- Repeat customer analysis
- State-level analysis
- Referential-integrity validation

SQL and Python were used together to demonstrate both database-level analysis and advanced analytical workflows.

---

# 💡 Key Business Insights

### 1. Customer retention is the biggest opportunity

Approximately **97% of customers made only one purchase**.

NovaMart should focus on converting one-time customers into repeat buyers.

Potential strategies include:

- Personalized offers
- Post-purchase campaigns
- Cross-selling
- Product recommendations
- Loyalty programs
- Re-engagement campaigns

### 2. Repeat customers are more valuable per customer

The repeat/higher-value cluster has:

- More than twice the average purchase frequency
- Approximately twice the average monetary value

Retaining this segment should therefore be a priority.

### 3. São Paulo is the dominant market

São Paulo is the strongest seller state by revenue and also the largest customer market.

This can influence inventory, seller acquisition, logistics, and marketing decisions.

### 4. Health & Beauty is the leading category

Health & Beauty generated the highest revenue among the analyzed product categories.

### 5. Product weight is a stronger freight-cost driver than price

```text
Price ↔ Freight Value       ≈ 0.414
Product Weight ↔ Freight    ≈ 0.610
```

This suggests logistics and freight planning should pay particular attention to product weight.

### 6. Revenue is volatile

Revenue shows an overall upward trend but significant month-to-month volatility, making forecasting useful for planning while highlighting the need for continuous model validation.

---

# 🛠️ Technology Stack

### Programming & Data Analysis
- Python
- Pandas
- NumPy

### Statistics & Machine Learning
- SciPy
- Scikit-learn
- Statsmodels
- pmdarima

### Visualization
- Matplotlib
- Seaborn
- Power BI

### Database / Querying
- SQL

### Development
- Jupyter Notebook
- Git
- GitHub

---

# 📁 Suggested Project Structure

```text
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
│   ├── forecasting.ipynb
│   └── clustering.ipynb
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
```

---

# 🏁 Final Project Summary

Retail Rescue demonstrates an end-to-end analytics lifecycle:

```text
Raw Data
   ↓
Data Cleaning & Validation
   ↓
Data Integration
   ↓
Feature Engineering
   ↓
EDA
   ↓
SQL Business Analysis
   ↓
Customer Analytics
   ↓
RFM Segmentation
   ↓
Power BI
   ↓
Time-Series Forecasting
   ↓
Model Validation
   ↓
K-Means Clustering
   ↓
PCA
   ↓
Business Insights
```

The project demonstrates how raw transactional data can be transformed into **measurable business insights, predictive forecasts, customer segments, and executive decision support**.

---

# 🚀 Future Improvements

The core project is complete. Possible future extensions include:

- Product-level forecasting
- Category-level forecasting
- Automated forecasting pipelines
- Forecasting at scale
- Advanced customer segmentation
- Customer lifetime value modeling
- Churn prediction
- Recommendation systems
- Automated Power BI refresh
- Production-grade analytics pipelines

---

# 👨‍💻 Project Objective

The ultimate objective of **Retail Rescue** is to demonstrate the complete journey:

**Data → Analysis → Models → Insights → Business Decisions**

This project showcases practical skills across SQL, Python, statistics, business intelligence, forecasting, unsupervised machine learning, and data visualization.
