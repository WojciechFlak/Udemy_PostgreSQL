/*
SELECT
	MAX(p.unit_price)
FROM products p 
*/

SELECT 
	*
FROM products p
WHERE p.unit_price = (SELECT MAX(p.unit_price) FROM products p );

SELECT
	p.product_name
	, p.unit_price
	, p.unit_price - (SELECT AVG(unit_price) FROM products) AS deviation
FROM products p
ORDER BY deviation;

--SELECT MIN(EXTRACT('year' FROM hire_date)) FROM employees;

SELECT
	*
FROM employees e
WHERE EXTRACT('year' FROM hire_date) = (SELECT MIN(EXTRACT('year' FROM hire_date)) FROM employees);


