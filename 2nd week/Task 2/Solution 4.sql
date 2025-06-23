#Question 4: What is the percentage breakdown of order_qty by category?  
#The final output includes the following fields:
 # - category
 # - order_qty_pct.
 
 SELECT 
	d.category,
	ROUND(SUM(f.order_qty) * 100.0 / SUM(SUM(f.order_qty)) OVER (),2)AS order_qty_pct
From dim_products d
Join fact_order_lines f
on d.product_id = f.product_id
GROUP BY d.category
order by order_qty_pct Desc;


