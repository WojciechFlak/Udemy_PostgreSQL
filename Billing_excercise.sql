with cte as (
	SELECT customer_name
	, sum(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2019' then billed_amount else 0 end)::decimal as sum_2019
	, sum(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2020' then billed_amount else 0 end)::decimal as sum_2020
	, sum(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2021' then billed_amount else 0 end)::decimal as sum_2021
	, count(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2019' then billed_amount else null end) as cnt_2019
	, count(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2020' then billed_amount else null end) as cnt_2020
	, count(CASE WHEN to_char(billing_creation_date, 'yyyy') = '2021' then billed_amount else null end) as cnt_2021
	FROM billing
	GROUP BY customer_name)
	
SELECT customer_name
-- ,cnt_2019, cnt_2020, cnt_2021
-- , (sum_2019+sum_2020+sum_2021) as total
, round((sum_2019+sum_2020+sum_2021)/
	(case when cnt_2019=0 then 1 else cnt_2019 end
	+ case when cnt_2020=0 then 1 else cnt_2020 end
	+ case when cnt_2021=0 then 1 else cnt_2021 end),2)
FROM cte
ORDER BY customer_name