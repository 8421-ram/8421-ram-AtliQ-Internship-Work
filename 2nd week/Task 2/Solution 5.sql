#Question 5: Generate a report that includes the customer ID, customer name, ontime_target_pct, 
#and percentage_category.

#The percentage category is divided into four types: 'Above 90' if the  ontime_target_pct is 
#greater than 90,'Above 80' if it is greater than 80, 'Above 70' 
#if it is greater than 70, and 'Less than 70' for all other cases.

SELECT 
	D.customer_id,
	D.customer_name,
    DT.ontime_target_pct,
CASE 
	WHEN DT.ontime_target_pct > 90 THEN "Above 90"
    WHEN DT.ontime_target_pct > 80 THEN "Above 80"
    WHEN DT.ontime_target_pct > 70 THEN "Above 70"
ELSE 
	"Below 70"
END AS Percentage_Category
FROM dim_Customers D
JOIN dim_targets_orders as DT
on D.Customer_id = DT.customer_id;





SELECT 
    COUNT(DISTINCT product_id) AS dairy_product_count
FROM 
    dim_products
WHERE 
    category = 'Dairy';
