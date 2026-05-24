-- 1. Customer count by churn status

SELECT 
    Churn,
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY Churn;

-- 2. Churn distribution as a percentage of total customers

SELECT 
    Churn,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn), 2) AS percentage
FROM customer_churn
GROUP BY Churn;

-- 3. Average customer characteristics by churn status

SELECT 
    Churn,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(Total_Purchase), 2) AS avg_total_purchase,
    ROUND(AVG(Account_Manager), 2) AS avg_account_manager,
    ROUND(AVG(Years), 2) AS avg_years,
    ROUND(AVG(Num_Sites), 2) AS avg_num_sites
FROM customer_churn
GROUP BY Churn;

-- 4. Churn rate by site risk group

WITH site_groups AS (
    SELECT
        CASE
            WHEN Num_Sites <= 8 THEN 'Low Site Count'
            WHEN Num_Sites <= 10 THEN 'Medium Site Count'
            ELSE 'High Site Count'
        END AS site_risk_group,
        CASE
            WHEN Num_Sites <= 8 THEN 1
            WHEN Num_Sites <= 10 THEN 2
            ELSE 3
        END AS sort_order,
        Churn
    FROM customer_churn
)

SELECT
    site_risk_group,
    COUNT(*) AS customer_count,
    SUM(Churn) AS churned_customers,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate
FROM site_groups
GROUP BY site_risk_group, sort_order
ORDER BY sort_order;

-- 5. Churn rate by account manager assistant

SELECT
    Account_Manager,
    COUNT(*) AS customer_count,
    SUM(Churn) AS churned_customers,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Account_Manager
ORDER BY Account_Manager;