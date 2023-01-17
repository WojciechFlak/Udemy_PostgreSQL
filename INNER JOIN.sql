SELECT
	p.product_name 
	, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;


SELECT
	s.company_name
	, p.product_name
FROM products p 
JOIN suppliers s ON p.supplier_id = s.supplier_id;

SELECT
	p.product_name 
	, c.category_name
	, s.company_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON s.supplier_id = p.supplier_id;

SELECT
	o.unit_price
	, o.quantity
	, ord.order_date
	, p.product_name
	, c.company_name
FROM order_details o
JOIN orders ord ON o.order_id = ord.order_id
JOIN products p ON p.product_id = o.product_id
JOIN customers c ON c.customer_id = ord.customer_id;


SELECT
	c.company_name
	, sum(round(cast(ord.unit_price * ord.quantity AS DECIMAL(10,2)),2)) AS value
--	, ord.unit_price
--	, ord.quantity
--	, round(cast(ord.unit_price * ord.quantity AS DECIMAL),2)
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_details ord ON ord.order_id = o.order_id
WHERE o.order_date BETWEEN DATE '1997-01-01' AND DATE '1997-12-31'
GROUP BY c.company_name
ORDER BY value DESC;