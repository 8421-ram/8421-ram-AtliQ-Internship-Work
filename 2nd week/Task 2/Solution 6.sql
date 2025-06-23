#Question 6: Generate a report that lists all the product categories, along with the product names 
#and total count of products in each category.
#The output should have three columns: 
#category, products, and product_count.

SELECT category, 
GROUP_CONCAT(product_name) AS products,
COUNT(*) AS product_count
FROM dim_products
GROUP BY category;

    
	
