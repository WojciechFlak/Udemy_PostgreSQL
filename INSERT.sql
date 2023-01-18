--SELECT * FROM categories

/*
INSERT INTO categories
VALUES (9, 'Bread') RETURNING category_id
*/
/*
INSERT INTO products
VALUES (78, 'Baguette',  3, 9, 'piece', 2, 99, 0, 0, 0)
*/

--SELECT * FROM products

--INSERT INTO orders
--VALUES (11078, 'FRANK', 7,  NOW()::DATE ,  NOW()::DATE + INTERVAL '3 day', NULL, 2, 1,  'Ben Benson',  'Padre Rico 8',  'Pueblo Piernico',  NULL,  12-345,  'San Escobar')

UPDATE orders
SET ship_postal_code = '12-345'
WHERE order_id = 11078;

--INSERT INTO order_details
--VALUES ( 11078, 78, 2, 1, 0) RETURNING order_id;

SELECT * FROM order_details