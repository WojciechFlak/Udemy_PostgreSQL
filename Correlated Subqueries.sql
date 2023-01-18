/*
SELECT
	p.product_name
	, p.category_id
	, p. unit_price
	, (SELECT
		  AVG(p1.unit_price)
	   FROM products p1
	   WHERE p1.category_id = p.category_id)
FROM products p
WHERE p.unit_price >
(
	SELECT
		AVG(p1.unit_price)
	FROM products p1
	WHERE p1.category_id = p.category_id
);
*/
/*
SELECT
	category_id
	, AVG(unit_price)
FROM products
GROUP BY category_id
*/

SELECT
	p.product_name
	, o.product_id
	, round(cast(o.unit_price * o.quantity AS decimal),2) AS value
--	, (SELECT
--	   		SUM(o1.unit_price * o1.quantity)
--	   FROM order_details o1
--	   WHERE o1.order_id = o.order_id
--	) AS order_value
	, round((o.unit_price * o.quantity) /
	  (SELECT
	   		SUM(o1.unit_price * o1.quantity)
	   FROM order_details o1
	   WHERE o1.order_id = o.order_id
	) *100) AS percent_of_order
FROM order_details o
JOIN products p ON p.product_id = o.product_id;
