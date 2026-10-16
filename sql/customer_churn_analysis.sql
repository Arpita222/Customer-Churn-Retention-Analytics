
-- =====================================================
-- CUSTOMER CHURN & RETENTION ANALYTICS
-- Database: customer_churn_db
-- Table: customer_churn
-- =====================================================

USE customer_churn_db;

-- 1. Verify total records and missing values
SELECT
    COUNT(*) AS total_customers,
    COUNT(TotalCharges) AS customers_with_total_charges,
    SUM(TotalCharges IS NULL) AS missing_total_charges
FROM customer_churn;

-- 2. Overall churn and retention KPIs
SELECT
    COUNT(DISTINCT customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        AS retained_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT customerID), 2
    ) AS churn_rate_pct,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT customerID), 2
    ) AS retention_rate_pct
FROM customer_churn;

-- 3. Churn by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- 4. Churn by tenure group
SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY TenureGroup
ORDER BY
    CASE TenureGroup
        WHEN '0–12 months' THEN 1
        WHEN '13–24 months' THEN 2
        WHEN '25–48 months' THEN 3
        WHEN '49–72 months' THEN 4
        ELSE 5
    END;

-- 5. Churn by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

-- 6. Churn by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;

-- 7. Compare churned and retained customers
SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 2) AS avg_tenure_months,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customer_churn
GROUP BY Churn;

-- 8. Churn by senior citizen status
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate_pct DESC;

-- 9. Churn by paperless billing
SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate_pct DESC;

-- 10. Churn by gender
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate_pct DESC;

-- 11. Monthly charges by churn status
SELECT
    Churn,
    MIN(MonthlyCharges) AS min_monthly_charges,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    MAX(MonthlyCharges) AS max_monthly_charges
FROM customer_churn
GROUP BY Churn;

-- 12. Churn by tech support availability
SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_pct
FROM customer_churn
GROUP BY TechSupport
ORDER BY churn_rate_pct DESC;
