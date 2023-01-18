/*
SELECT
	*
FROM orders o 
JOIN employees e ON e.employee_id = o.employee_id
WHERE last_name = 'Buchanan'
*/
/*
SELECT
	*
FROM orders o 
WHERE employee_id IN 
(
	SELECT 
		employee_id 
	FROM employees e
	WHERE last_name = 'Buchanan'
);
*/
/*
SELECT 
	*
FROM orders o 
JOIN customers c ON c.customer_id = o.customer_id
WHERE c.country = 'USA';
*/

SELECT
	*
FROM orders o
WHERE customer_id IN
(
SELECT
	customer_id
FROM customers c
WHERE country = 'USA'
)