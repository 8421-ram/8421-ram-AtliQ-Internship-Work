# Question 2: What are the minimum and maximum order quantities for each product?
 SELECT 	
	p.product_id, 
	p.product_name,
	MIN(f.order_qty) as minimum_qty,
	MAX(f.order_qty) as maximum_qty
FROM fact_order_lines f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_id;



 SELECT 	
	p.product_id, 
	p.product_name,
	MIN(f.order_qty) as minimum_qty,
	MAX(f.order_qty) as maximum_qty
FROM fact_order_lines f
JOIN dim_products p ON f.product_id = p.product_id
WHERE product_name ="AM Tea 100"
GROUP BY p.product_id;
