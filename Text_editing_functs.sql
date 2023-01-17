/* LEFT/RIGHT(column, number), UPPER, LOWER, REPEAT(sth, times), CONCAT, TRIM, SUBSTRING(column FROM 1 FOR 2),
REVERSE, LENGTH, POSITION(‘amazing’ IN LOWER(description))*/


SELECT
	UPPER(company_name)
	, LOWER(contact_title)
	, CONCAT(LEFT(company_name, 3),RIGHT(city, 3)) AS code
	, address
	, CASE
		WHEN POSITION(',' IN address) > 0 THEN LEFT(address, POSITION(',' IN address) - 1)
		ELSE address
	  END AS address_1
	 , CASE
	 	WHEN POSITION(',' IN address) > 0 
			THEN SUBSTRING(address FROM (POSITION(',' IN address) + 1) FOR LENGTH(address) - POSITION(',' IN address))
		ELSE ''
	  END AS address_2
FROM customers