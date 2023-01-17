SELECT 
	country
	, COUNT(customer_id) AS number
FROM customers
GROUP BY country
ORDER BY number DESC;

SELECT 
	ship_country
	, COUNT(ship_country) as number
FROM orders
GROUP BY ship_country
ORDER BY number ASC;

SELECT
	supplier_id, category_id
	, round(cast(avg(unit_price) as decimal),2)
FROM products
GROUP BY supplier_id, category_id
ORDER BY supplier_id


