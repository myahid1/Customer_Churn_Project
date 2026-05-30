# Customer Churn Analysis and Prediction

## Project Overview

This project analyses customer churn data to identify factors associated with customer churn and build a simple machine learning model to predict whether a customer is likely to churn.

The project combines:

- Python
- pandas
- SQL
- data visualisation
- machine learning

## Objectives

The main objectives of this project are to:

- Analyse the overall customer churn rate
- Identify customer characteristics associated with churn
- Use SQL and pandas for exploratory data analysis
- Build and compare basic classification models
- Provide business recommendations based on the analysis

## Dataset

The dataset contains 900 customer records and 10 original columns.

Key columns include:

- `Age`
- `Total_Purchase`
- `Account_Manager`
- `Years`
- `Num_Sites`
- `Onboard_date`
- `Location`
- `Company`
- `Churn`

The target variable is `Churn`, where:

- `0` = customer did not churn
- `1` = customer churned

## Project Structure

```text
churn_project/
├── README.md
├── final_report.md
├── requirements.txt
├── .gitignore
├── data/
│   ├── customer_churn.csv
│   └── new_customers_1.csv
├── notebooks/
│   └── customer_churn_analysis.ipynb
├── sql/
│   └── customer_churn_analysis.sql
├── charts/
│   ├── churn_distribution.png
│   ├── churn_rate_by_site_risk_group.png
│   └── logistic_regression_feature_coefficients.png
└── results/
    ├── model_comparison.csv
    ├── site_risk_summary.csv
    └── feature_importance.csv
```

## Full Report

A more detailed explanation of the project findings, SQL analysis, machine learning results, recommendations, and limitations can be found in:

```text
final_report.md
```

## Getting Started
```
pip install -r requirements.txt
```
