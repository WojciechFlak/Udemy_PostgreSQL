-- Question data: https://www.youtube.com/watch?v=ZwFfiadQB3k 

select
	sl.roll_number, sl.student_name, sl.class, sl.section, sl.school_name
	, COUNT(CASE WHEN temp.subject='Math' AND temp.correct_answer=1 THEN 1 ELSE NULL END) AS math_correct
	, COUNT(CASE WHEN temp.subject='Math' AND temp.correct_answer=0 AND temp.option_marked <> 'e' THEN 1 ELSE NULL END) AS math_wrong
	, COUNT(CASE WHEN temp.subject='Math' AND temp.option_marked='e' THEN 1 ELSE NULL END) AS math_yet_to_learn
	, COUNT(CASE WHEN temp.subject='Math' AND temp.correct_answer=1 THEN 1 ELSE NULL END) AS math_score
	, ROUND((COUNT(CASE WHEN temp.subject='Math' AND temp.correct_answer=1 THEN 1 ELSE NULL END))::decimal/ 40*100, 2) AS math_percentage
	, COUNT(CASE WHEN temp.subject='Science' AND temp.correct_answer=1 THEN 1 ELSE NULL END) AS science_correct
	, COUNT(CASE WHEN temp.subject='Science' AND temp.correct_answer=0 AND temp.option_marked <> 'e' THEN 1 ELSE NULL END) AS science_wrong
	, COUNT(CASE WHEN temp.subject='Science' AND temp.option_marked='e' THEN 1 ELSE NULL END) AS science_yet_to_learn
	, COUNT(CASE WHEN temp.subject='Science' AND temp.correct_answer=1 THEN 1 ELSE NULL END) AS science_score
	, ROUND((COUNT(CASE WHEN temp.subject='Science' AND temp.correct_answer=1 THEN 1 ELSE NULL END))::decimal/ 60*100, 2) AS science_percentage
FROM (SELECT 
		sr.*
		, qpc.subject
		, CASE WHEN sr.option_marked=ca.correct_option THEN 1 ELSE 0 END as correct_answer
	FROM student_response sr
	LEFT JOIN correct_answer ca ON sr.question_paper_code=ca.question_paper_code AND sr.question_number=ca.question_number
	LEFT JOIN question_paper_code qpc ON sr.question_paper_code=qpc.paper_code)temp
JOIN student_list sl ON sl.roll_number=temp.roll_number
GROUP BY temp.roll_number, sl.roll_number, sl.student_name, sl.class, sl.section, sl.school_name
ORDER BY temp.roll_number;