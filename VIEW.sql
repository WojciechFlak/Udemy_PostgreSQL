
CREATE OR REPLACE VIEW customer_names
AS
SELECT
	SUBSTRING(contact_name FROM POSITION(' ' IN contact_name) FOR (LENGTH(contact_name) - POSITION(' ' IN contact_name))) AS last_name
	, SUBSTRING(contact_name FROM 1 FOR POSITION(' ' IN contact_name)) AS first_name
	, contact_title AS title
FROM customers

