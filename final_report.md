# Customer Churn Analysis and Prediction Report

## Project Overview

This project analyses customer churn data to identify factors associated with customer churn and build a simple machine learning model to predict whether a customer is likely to churn.

The project uses Python, pandas, SQL, data visualisation, and machine learning.

## Dataset

The dataset contains 900 customer records and 10 original columns. Each row represents one customer.

The dataset includes information such as:

- Customer age
- Total purchase amount
- Account manager assignment
- Years with the company
- Number of sites
- Onboarding date
- Location
- Company
- Churn status

The target variable is `Churn`, where:

- `0` means the customer did not churn
- `1` means the customer churned

## Initial Data Inspection

The dataset contains 900 rows and 10 columns. There were no missing values in the dataset.

The overall churn rate is approximately 16.7%. This means that around 1 in 6 customers in the dataset churned.

Because most customers did not churn, the dataset is imbalanced. This is important when evaluating machine learning models, because accuracy alone may not fully reflect how well the model identifies churned customers.

## Exploratory Data Analysis

The analysis compared churned and non-churned customers across several variables.

| Variable | Did Not Churn | Churned |
|---|---:|---:|
| Age | 41.58 | 42.99 |
| Total Purchase | 10036.95 | 10192.18 |
| Account Manager | 0.47 | 0.56 |
| Years | 5.15 | 5.88 |
| Num Sites | 8.17 | 10.66 |

The clearest difference between churned and non-churned customers is the number of sites.

Customers who churned had an average of 10.66 sites, compared to 8.17 sites for customers who did not churn. This suggests that customers with more sites are more likely to churn.

`Years` also showed some relationship with churn, but the difference was smaller. Customers who churned had been with the company for an average of 5.88 years, compared to 5.15 years for customers who did not churn.

`Total_Purchase` did not appear to clearly separate churned and non-churned customers, as both groups had similar average purchase amounts.

## Site Risk Group Analysis

To make the `Num_Sites` finding easier to interpret, customers were grouped into three site risk groups:

- Low site count: 8 or fewer sites
- Medium site count: 9 to 10 sites
- High site count: more than 10 sites

| Site Risk Group | Customer Count | Churned Customers | Churn Rate |
|---|---:|---:|---:|
| Low Site Count | 454 | 11 | 2.42% |
| Medium Site Count | 317 | 53 | 16.72% |
| High Site Count | 129 | 86 | 66.67% |

This shows a clear increase in churn risk as the number of sites increases.

Customers with low site counts had a churn rate of only 2.42%, while customers with high site counts had a churn rate of 66.67%. This makes `Num_Sites` the strongest churn-related variable in the dataset.

## SQL Analysis

SQL was used to reproduce and validate the main business findings.

The SQL analysis covered:

1. Customer count by churn status
2. Churn distribution as a percentage of total customers
3. Average customer characteristics by churn status
4. Churn rate by site risk group
5. Churn rate by account manager assignment

The SQL analysis confirmed the same main finding from the pandas analysis: customers with higher site counts had significantly higher churn rates.

## Machine Learning

Two machine learning models were tested:

1. Logistic Regression
2. Random Forest

The features used for prediction were:

- Age
- Total Purchase
- Account Manager
- Years
- Num Sites

The target variable was `Churn`.

The dataset was split into training and testing sets, with 80% used for training and 20% used for testing. Stratified splitting was used to preserve the churn distribution in both sets.

## Model Performance

| Model | Accuracy | Precision Churn | Recall Churn | F1 Churn |
|---|---:|---:|---:|---:|
| Logistic Regression 0.50 | 0.91 | 0.81 | 0.57 | 0.67 |
| Logistic Regression 0.40 | 0.90 | 0.73 | 0.63 | 0.68 |
| Logistic Regression 0.30 | 0.88 | 0.62 | 0.67 | 0.65 |
| Random Forest | 0.87 | 0.67 | 0.40 | 0.50 |

The default Logistic Regression model achieved 91% accuracy. However, its recall for churned customers was 0.57, meaning it only identified 57% of customers who actually churned.

Since churn prediction is mainly about identifying customers who may leave, recall for the churned class is especially important.

Lowering the Logistic Regression threshold from 0.50 to 0.40 improved churn recall from 0.57 to 0.63, while accuracy only decreased slightly from 0.91 to 0.90.

The Random Forest model performed worse than Logistic Regression, especially in recall for churned customers.

The preferred model is Logistic Regression with a 0.40 threshold because it provides the best balance between overall accuracy and identifying more churned customers.

## Feature Importance

The Logistic Regression coefficients showed that `Num_Sites` was the most influential feature in predicting churn.

This supports the earlier exploratory analysis, correlation heatmap, and site risk group analysis. Across the project, `Num_Sites` consistently appeared as the strongest churn-related variable.

`Years` was the second most influential feature, but its effect was smaller than `Num_Sites`.

## Key Findings

1. The overall churn rate is approximately 16.7%.
2. `Num_Sites` is the strongest churn-related variable in the dataset.
3. Customers with more than 10 sites have a much higher churn rate than customers with fewer sites.
4. `Years` has some relationship with churn, but the effect is weaker than `Num_Sites`.
5. `Total_Purchase` does not clearly separate churned and non-churned customers.
6. Logistic Regression performed better than Random Forest.
7. Adjusting the Logistic Regression threshold from 0.50 to 0.40 improved recall for churned customers.

## Business Recommendations

The company should prioritise retention efforts for customers with more than 10 sites, as this group has the highest churn risk.

These customers may have more complex operational needs, so the company could consider:

- Proactive account reviews
- Targeted retention campaigns
- Additional support for customers managing many sites
- Early intervention when customers move into the high site count group

The model should be used as a decision-support tool rather than a final decision-maker. Customers flagged as high risk should still be reviewed together with business context before action is taken.

## Limitations

The dataset is relatively small, with only 900 customer records.

The dataset is imbalanced, with only 16.7% of customers having churned. Because of this, accuracy alone is not enough to evaluate model performance.

The analysis identifies relationships between variables and churn, but it does not prove causation.

More customer behaviour data could improve the analysis and model, such as:

- Product usage frequency
- Support ticket history
- Customer complaints
- Contract type
- Customer satisfaction scores
- Renewal history

## Conclusion

This project found that the number of sites managed by a customer is the strongest indicator of churn risk. Customers with more than 10 sites had a much higher churn rate than other customers.

A Logistic Regression model with a 0.40 prediction threshold was selected as the preferred model because it improved recall for churned customers while maintaining strong overall performance.

The analysis suggests that the company should focus retention efforts on customers with high site counts, especially those managing more than 10 sites.