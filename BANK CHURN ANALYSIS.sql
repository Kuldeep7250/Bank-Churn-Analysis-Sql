select * from bank_churn_data where customer_age>18;
---1.Total Customers:---
select COUNT(clientnum) as Total_Customers from bank_churn_data

---2.Count Churned vs. Active Customers 
---Counts how many customers have churned vs. how many are still active.:---
SELECT churn, COUNT(clientnum) AS customer_count 
FROM bank_churn_data 
GROUP BY churn;

---3. Customer Distribution by Card Category---
---Counts how many customers have each type of credit card.---
SELECT card_category, COUNT(clientnum) AS customer_count 
FROM bank_churn_data 
GROUP BY card_category 
ORDER BY customer_count DESC;

---4. Average Credit Limit per Income Level---
---Finds the average credit limit based on customer income levels.---
SELECT income, AVG(credit_limit) AS avg_credit_limit 
FROM bank_churn_data 
GROUP BY income 
ORDER BY avg_credit_limit DESC;

---5. Customers Segmentation by Age Group---
---Groups customers into different age brackets.---
SELECT 
    CASE 
        WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
        WHEN customer_age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END AS age_group,
    COUNT(clientnum) AS total_customers
FROM bank_churn_data
GROUP BY CASE 
        WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
        WHEN customer_age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END
ORDER BY total_customers DESC;

---6. Customers with Highest Credit Limit (Top 10)---
---Finds the top 10 customers with the highest credit limits.---
SELECT TOP 10 clientnum, customer_age, income, credit_limit 
FROM bank_churn_data 
ORDER BY credit_limit DESC;

---7. Average Account Balance per Marital Status---
---Finds the average balance for customers based on their marital status.---
SELECT marital_status, AVG(balance) AS avg_balance 
FROM bank_churn_data 
GROUP BY marital_status 
ORDER BY avg_balance DESC;

---8. Total Number of Customers by Gender---
---Counts male vs. female customers.---
SELECT gender, COUNT(clientnum) AS total_customers 
FROM bank_churn_data 
GROUP BY gender;

---9. Customers Who Have More than 3 Dependents---
---Finds customers with large financial responsibilities.---
SELECT clientnum, customer_age, income, dependent_count 
FROM bank_churn_data 
WHERE dependent_count > 3 
ORDER BY dependent_count DESC;

---10. Average Credit Utilization by Income Group---
---Finds the average credit utilization per income category.---
SELECT income, AVG(utilization_ratio) AS avg_utilization 
FROM bank_churn_data 
GROUP BY income 
ORDER BY avg_utilization DESC;

---11.Longest Relationship Customers (VIP Segmentation)---
SELECT 
    clientnum, 
    customer_age, 
    months_on_book, 
    income, 
    balance, 
    credit_limit
FROM bank_churn_data
WHERE months_on_book > 53
ORDER BY balance DESC;











