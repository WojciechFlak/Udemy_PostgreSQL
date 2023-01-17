SELECT 
	*
FROM orders
WHERE shipped_date IS NULL;

SELECT 
	*
FROM orders
WHERE order_date IS NULL;

SELECT 
	*
FROM customers
WHERE fax IS NULL;

SELECT 
	COUNT(DISTINCT(country))
FROM customers
WHERE region IS NULL;
