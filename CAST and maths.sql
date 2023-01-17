SELECT
	*
	, round(cast(unit_price * quantity AS decimal), 2) AS total
	, round(cast(unit_price * quantity * (1-discount) AS decimal), 2) AS total_after_dc
	, round(cast(unit_price * quantity AS decimal), 2) - 
	  round(cast(unit_price * quantity * (1-discount) AS decimal), 2) AS dc_value
FROM order_details
WHERE round(cast(unit_price * quantity AS decimal), 2) - 
	  	round(cast(unit_price * quantity * (1-discount) AS decimal), 2) >= 100
ORDER BY dc_value DESC;