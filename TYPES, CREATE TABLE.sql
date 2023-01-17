-- timestamp, date, time, interval

--CREATE TABLE books
--(book_id INT PRIMARY KEY, title VARCHAR(100), author VARCHAR(50), pages INT, year_printed INT, percent_finished DECIMAL(5,2),
--adults_only BOOL)

--INSERT INTO books
--VALUES (1, 'Frankenstein', 'Mary Shelley', 289, 2007, 100, False)

--INSERT INTO books
--VALUES (2, 'Tales of Terror and Madness', 'Edgar Allan Poe', 188 , 2001, 45.33, True)

SELECT 
	*
FROM books;

DROP TABLE books;