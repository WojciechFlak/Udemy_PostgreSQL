/*
SELECT
	product_id
	, unit_price
	, quantity
	INTO temp_order_details
FROM order_details
*/

--SELECT SUM(quantity*unit_price) FROM temp_order_details --1354458.590441227

--DELETE FROM temp_order_details
--WHERE product_id = 1

/*
INSERT INTO temp_order_details
SELECT 
	product_id
	, unit_price * 0.9
	, quantity * 1.2
FROM order_details
WHERE product_id = 1
*/

--SELECT SUM(quantity*unit_price) FROM temp_order_details --1355622.8311152458

DROP TABLE temp_order_details

