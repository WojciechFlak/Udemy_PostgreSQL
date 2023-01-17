SELECT
	*
FROM customers
WHERE city IN ('Berlin', 'Madrid', 'London');

SELECT
	*
FROM customers
WHERE country NOT IN ('USA', 'Venezuela', 'Brazil');

SELECT
	*
FROM products
WHERE category_id NOT IN (1, 2, 3)
	AND quantity_per_unit IN ('25 - 825 g cans', '4 - 450 g glasses','12 - 12 oz cans','10 - 500 g pkgs.')


