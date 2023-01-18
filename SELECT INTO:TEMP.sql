/*
SELECT
	SUM(quantity * unit_price)
--INTO temp_order_details
FROM temp_order_details
*/

DELETE FROM temp_order_details
WHERE product_id IN
(SELECT 
	product_id
FROM products
WHERE category_id = 1);

SELECT
	SUM(quantity * unit_price)
--INTO temp_order_details
FROM temp_order_details;

UPDATE temp_order_details
SET unit_price = unit_price * 1.5
WHERE product_id IN
(SELECT 
	product_id
FROM products
WHERE category_id = 2);

SELECT
	SUM(quantity * unit_price)
--INTO temp_order_details
FROM temp_order_details;

DROP TABLE temp_order_details