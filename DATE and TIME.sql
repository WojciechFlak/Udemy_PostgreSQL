/* NOW(), NOW()::DATE, NOW()::TIME, CURRENT_TIMESTAMP, CURRENT_DATE, CURRENT_TIME, DATE_TRUNC(‘day’, rental_date),
DATE_PART(‘day’, rental_date), DATE_PART(‘dow’, rental_date) - weekday/sunday=0, EXTRACT(‘dow’ FROM rental_date),
rental_date + INTERVAL ‘3 days’, AGE(return_date, rental_date), DATE ‘2030-05-01’ */

SELECT
	order_date
	, shipped_date
	, AGE(shipped_date, order_date) AS process_time
FROM orders;

SELECT
	AVG(AGE(shipped_date, order_date))
FROM orders;

SELECT
	order_date
	, NOW()::DATE
	, AGE(NOW()::DATE, order_date) AS process_time
FROM orders
WHERE shipped_date IS NULL;

SELECT
	AVG(AGE(shipped_date, order_date))
FROM orders;

SELECT
	order_date
	, DATE '2000-01-01' AS shipp_date
	, AGE(DATE '2000-01-01', order_date) AS process_time
FROM orders
WHERE shipped_date IS NULL;

SELECT
	order_date
--	, COALESCE(shipped_date, order_date + INTERVAL '1 month')::DATE
	, CASE 
		WHEN shipped_date IS NOT NULL THEN shipped_date
	  END AS normally_shipped_date
	, CASE 
		WHEN shipped_date IS NULL THEN (order_date + INTERVAL '1month')::date 
	  END AS default_shipped_date
FROM orders
--WHERE shipped_date IS NULL
;

SELECT
	order_date
	, EXTRACT('day' FROM order_date) AS day
	, DATE_PART('month', order_date) AS month
	, DATE_PART('year', order_date) AS year
FROM orders	