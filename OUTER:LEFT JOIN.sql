SELECT
	p.product_name
FROM products p
LEFT JOIN order_details o ON o.product_id = p.product_id
WHERE o.order_id IS NULL;

SELECT
	c.company_name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

SELECT
	COUNT(*)
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id; --832

SELECT
	COUNT(*)
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id; --830