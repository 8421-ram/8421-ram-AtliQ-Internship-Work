# Question 7: What are the top 3 most demanded products in the 'Dairy' category, and their respective 
# order quantity in millions? The final output includes the following fields:
# - product name
# - order_qty_mln. 

SELECT 
    P.product_name,
    CONCAT(ROUND(SUM(F.order_qty) / 1000000, 2), ' MILLION') AS order_qty_mln
FROM dim_products P
JOIN fact_order_lines F
    ON P.product_id = F.product_id
WHERE P.category = 'Dairy'
GROUP BY P.product_name
ORDER BY SUM(F.order_qty) DESC
LIMIT 3;




SELECT 
    ROUND(SUM(order_qty_mln), 2) AS total_order_qty_mln
FROM (
    SELECT 
        SUM(F.order_qty) / 1000000 AS order_qty_mln
    FROM dim_products P
    JOIN fact_order_lines F
        ON P.product_id = F.product_id
    WHERE P.category = 'Dairy'
    GROUP BY P.product_name
    ORDER BY SUM(F.order_qty) DESC
    LIMIT 3
) AS top3_dairy_products;
