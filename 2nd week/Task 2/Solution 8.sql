#Question 8: Calculate the OTIF % for a customer named Vijay Stores
#The final output should contain these fields,
#customer_name
#OTIF_percentage

SELECT 
	c.customer_name,
	ROUND((SUM(f.otif) / COUNT(f.order_id) * 100),2) AS OTIF_percentage
FROM fact_orders_aggregate f
JOIN dim_customers c 
ON c.customer_id = f.customer_id
WHERE c.customer_name = "Vijay Stores"
GROUP BY c.customer_name;

