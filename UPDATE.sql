/*
UPDATE categories
SET category_name = 'Bakery products'
WHERE category_id = 9
*/

--SELECT * FROM categories
/*
UPDATE products
SET quantity_per_unit = 'pcs', unit_price = 2.49, units_in_stock = 98
WHERE product_id = 78
*/

--SELECT * FROM products WHERE product_id = 78
/*
SELECT
	product_id
FROM order_details
GROUP BY product_id
HAVING SUM(quantity) < 100
*/

UPDATE products
SET discontinued = 1
WHERE product_id IN (SELECT
			product_id
		FROM order_details
		GROUP BY product_id
		HAVING SUM(quantity) < 100);
		
UPDATE orders
SET ship_via = ship_via - 1
WHERE order_id = 10248
		
		