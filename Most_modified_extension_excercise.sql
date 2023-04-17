-- Excercise data: https://www.youtube.com/watch?v=Det4ZjBSe3M
	
WITH temp AS (
SELECT
	date_modified
	, SUBSTRING(file_name, POSITION('.' IN file_name)+1, LENGTH(file_name)) AS extension
	, COUNT(1) AS cnt
FROM files
GROUP BY extension, date_modified)
SELECT date_modified, string_agg(extension, ',' order by extension DESC) as extension, max(cnt) as count
FROM temp c1
WHERE cnt = (SELECT MAX(cnt) FROM temp c2 where c1.date_modified=c2.date_modified)
GROUP BY date_modified;





