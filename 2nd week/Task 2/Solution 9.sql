#Question 9: What is the percentage of 'in full' for each product and which product has the highest percentage,
#based on the data from the 'fact_order_lines' and 'dim_products' tables?

WITH product_if_target AS (
    SELECT 
        p.product_name,
        SUM(CASE 
                WHEN f.in_full = 1 THEN 1 
                ELSE 0 
            END) AS if_count,
        COUNT(f.order_id) AS total_count
    FROM 
        fact_order_lines f
    JOIN dim_products p 
        ON p.product_id = f.product_id
    GROUP BY p.product_name
)
SELECT * FROM product_if_target
LIMIT 20000;



SELECT 
    COUNT(*) AS product_count_above_67
FROM (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(CASE WHEN f.in_full = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(f.order_id) AS if_percentage
    FROM fact_order_lines f
    JOIN dim_products p ON p.product_id = f.product_id
    GROUP BY p.product_id, p.product_name
) AS product_if
WHERE if_percentage > 67;


