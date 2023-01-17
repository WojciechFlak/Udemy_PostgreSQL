SELECT
	company_name
	, COALESCE(region, country) AS region_country
	, COALESCE(fax, phone) AS fax_phone
	, COALESCE(homepage, 'unknown') AS homepage
FROM suppliers;

SELECT
	order_id
	, CASE 
		WHEN CAST(shipped_date AS VARCHAR(10)) IS NULL THEN 'not shipped yet'
		ELSE CAST(shipped_date AS VARCHAR(10))
	  END AS shipped_info
FROM orders
ORDER BY shipped_info DESC;

SELECT
	product_name
	, category_id
	, CASE
		WHEN category_id = 1 THEN 'Beverages'
		WHEN category_id = 2 THEN 'Condiments'
		ELSE 'OTHER'
	  END AS cat_name
FROM products;