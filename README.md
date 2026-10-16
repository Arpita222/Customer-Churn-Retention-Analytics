# 📊 Customer Churn & Retention Analytics

**Turning customer data into actionable retention insights using Python, SQL, and Power BI.**

<p align="center">
  <img src="https://img.shields.io/badge/Python-Pandas-blue?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI"/>
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" alt="Project status"/>
</p>

---

## 🎯 Project Overview

Customer churn is a major challenge for subscription-based businesses. Understanding why customers leave helps organizations improve customer satisfaction, strengthen retention strategies, and make data-driven decisions.

This project analyzes the **IBM Telco Customer Churn dataset** to identify customer segments with higher churn rates, explore behavioral patterns, and develop actionable business recommendations.

The analysis uses **Python for data cleaning and exploratory data analysis (EDA), MySQL for querying and segmentation, and Power BI for interactive visualization.**

## 🎯 Business Objectives

- Measure overall customer churn and retention rates.
- Identify customer segments with the highest churn.
- Analyze the relationship between churn, tenure, contract type, payment method, and internet service.
- Compare the behavior of churned and retained customers.
- Develop data-driven recommendations to support customer retention.

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas & NumPy | Data manipulation and numerical operations |
| Matplotlib | Data visualization |
| MySQL | SQL queries, aggregations, and customer segmentation |
| Microsoft Power BI | Interactive dashboard and KPI reporting |
| Git & GitHub | Version control and project documentation |

## 📂 Project Structure

```text
Customer-Churn-Retention-Analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   └── 01_customer_churn_eda.ipynb
│
├── sql/
│   └── customer_churn_analysis.sql
│
├── powerbi/
│   └── Customer_Churn_Dashboard.pbix
│
├── visuals/
│   └── churn_by_contract.png
│
├── .gitignore
└── README.md
```

*Dataset CSV files are excluded from the public repository. Download the dataset from the source below and place the files in the appropriate local folders.*

## 📈 Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Retained Customers | 5,174 |
| Overall Churn Rate | 26.54% |
| Overall Retention Rate | 73.46% |

## 🔍 Key Findings

### 1. Contract Type

| Contract | Churn Rate |
|---|---:|
| Month-to-month | 42.71% |
| One year | 11.27% |
| Two year | 2.83% |

**Insight:** Month-to-month customers have substantially higher churn rates than customers on longer contracts.

### 2. Customer Tenure

| Tenure Group | Churn Rate |
|---|---:|
| 0–12 months | 47.44% |
| 13–24 months | 28.71% |
| 25–48 months | 20.39% |
| 49–72 months | 9.51% |

**Insight:** Customers in their first year show the highest churn rate, highlighting the importance of early customer engagement and onboarding.

### 3. Payment Method

| Payment Method | Churn Rate |
|---|---:|
| Electronic check | 45.29% |
| Mailed check | 19.11% |
| Bank transfer (automatic) | 16.71% |
| Credit card (automatic) | 15.24% |

**Insight:** Electronic-check customers have the highest observed churn rate. Billing experience and payment preferences warrant further investigation.

### 4. Internet Service

| Internet Service | Churn Rate |
|---|---:|
| Fiber optic | 41.89% |
| DSL | 18.96% |
| No internet service | 7.40% |

**Insight:** Fiber-optic customers show higher churn in this dataset. Pricing, service quality, and support should be investigated before recommending changes.

### 5. Churned vs. Retained Customers

| Metric | Churned | Retained |
|---|---:|---:|
| Average Monthly Charges | 74.44 | 61.27 |
| Average Tenure (months) | 17.98 | 37.57 |

**Insight:** Churned customers have higher average monthly charges and shorter average tenure. These are observed associations, not proof of causation.

## 📊 Power BI Dashboard

The interactive dashboard includes:

- **KPI cards:** Total customers, churn rate, retained customers, and churned customers.
- **Contract analysis:** Churn rate by contract type.
- **Tenure analysis:** Churn rate across tenure groups.
- **Payment analysis:** Churn rate by payment method.
- **Service analysis:** Churn rate by internet service.
- **Interactive slicers:** Contract, payment method, and internet service.

The dashboard enables users to explore customer segments and compare churn patterns interactively.

## 💡 Business Recommendations

1. **Improve first-year retention:** Strengthen onboarding, proactively engage new customers, and monitor early support issues.
2. **Review month-to-month contracts:** Test appropriate loyalty incentives or longer-term plans and measure their impact on retention.
3. **Investigate electronic-check churn:** Examine billing-related complaints and compare payment experiences across customer segments.
4. **Review fiber-optic customer experience:** Investigate pricing, service reliability, and customer support satisfaction.
5. **Measure retention outcomes:** Evaluate proposed interventions through controlled tests or before-and-after comparisons rather than assuming they will reduce churn.

## 🧹 Data Cleaning & Analysis

The Python workflow includes:

- Loading and inspecting the dataset.
- Checking duplicate records and customer IDs.
- Converting `TotalCharges` to a numeric data type.
- Identifying 11 blank `TotalCharges` values.
- Retaining all 7,043 customers and preserving the missing values as nulls.
- Creating tenure groups and calculating customer churn KPIs.
- Performing segment-level analysis and saving visualizations.

The 11 missing `TotalCharges` values occur for customers with zero tenure. They were retained rather than automatically imputed or removed.

## 🗄️ SQL Analysis

The MySQL analysis covers:

- Overall churn and retention KPIs.
- Churn by contract type and tenure group.
- Churn by payment method and internet service.
- Churn comparisons by gender, senior-citizen status, and paperless billing.
- Average monthly charges, tenure, and total charges by churn status.
- Churn segmentation by tech support availability.

SQL concepts used include `GROUP BY`, aggregate functions, `CASE WHEN`, conditional aggregation, `ROUND()`, and `DISTINCTCOUNT`-equivalent customer counting through distinct IDs.

## 🚀 How to Run the Project

### 1. Obtain the dataset

Download the IBM Telco Customer Churn dataset from Kaggle:

[**IBM Telco Customer Churn Dataset — Kaggle**](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

Place the original CSV in `data/raw/`.

### 2. Run the Python analysis

Install the required packages:

```bash
pip install pandas numpy matplotlib jupyter
```

Open the notebook:

```bash
jupyter notebook
```

Run `notebooks/01_customer_churn_eda.ipynb` from top to bottom. Update file paths if your folder structure differs.

### 3. Run the SQL analysis

- Open MySQL Workbench.
- Create the `customer_churn_db` database.
- Import the cleaned CSV into a table named `customer_churn`.
- Execute `sql/customer_churn_analysis.sql`.

### 4. Open the Power BI dashboard

Open `powerbi/Customer_Churn_Dashboard.pbix`. If you are asked to locate the dataset, reconnect it to your local cleaned CSV.

## 📌 Limitations

- This is an exploratory analysis of a customer-level snapshot, not a time-series churn forecast.
- The findings describe associations and do not establish causation.
- The analysis does not predict which individual customer will churn.
- Retention recommendations require additional validation using customer feedback, service data, or controlled experiments.

## 👩‍💻 Author

**Arpita Yelpale**

Computer Engineering Graduate | Aspiring Data Analyst

**Skills demonstrated:** Python • Pandas • SQL • MySQL • Power BI • EDA • Data Visualization • Business Insights

---

⭐ *If you find this project useful, feel free to explore the repository and share feedback.*

