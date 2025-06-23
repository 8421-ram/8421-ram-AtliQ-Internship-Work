# Question 1: How many unique customers are in the city of 'Surat'?
SELECT DISTINCT
    (COUNT(customer_id)) AS Distinct_Customer
FROM
    dim_customers
WHERE
    city = 'SURAT';