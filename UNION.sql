SELECT
	e.last_name
	, e.first_name
	, 'EMPLOYEE' AS type
FROM employees e

UNION

SELECT
	SUBSTRING(contact_name FROM POSITION(' ' IN contact_name) FOR (LENGTH(contact_name) - POSITION(' ' IN contact_name))) AS last_name
	, SUBSTRING(contact_name FROM 1 FOR POSITION(' ' IN contact_name)) AS first_name
	, 'CUSTOMER' AS type
FROM customers

UNION

SELECT
	SUBSTRING(contact_name FROM POSITION(' ' IN contact_name) FOR (LENGTH(contact_name) - POSITION(' ' IN contact_name))) AS last_name
	, SUBSTRING(contact_name FROM 1 FOR POSITION(' ' IN contact_name)) AS first_name
	, 'SUPPLIER' AS type
FROM suppliers

UNION

SELECT
	company_name
	, ''
	, 'SHIPPER' AS type
FROM shippers;
