#Question 3: Generate a report with month_name and number of unfullfilled_orders(i.e order_qty - delivery_qty) 
#in that respective month.
SELECT 
	MONTHNAME(fg.order_placement_date) as month_name, 
	SUM(f.order_qty) as sum_of_qty
FROM fact_orders_aggregate fg 
JOIN fact_order_lines f
on fg.order_id = f.order_id
GROUP By MONTHNAME(order_placement_date)
ORDER BY sum_of_qty DESC; 
