SELECT 
	category_id
	, SUM(units_in_stock) 
FROM products
GROUP BY category_id
HAVING SUM(units_in_stock) > 500;

SELECT
	country
	, COUNT(country)
FROM customers
GROUP BY country
HAVING COUNT(*) >=10
ORDER BY COUNT(*) ASC;

SELECT
	contact_title
	, count (*) as number
FROM customers
GROUP BY contact_title
HAVING count(*) >= 5
ORDER BY number