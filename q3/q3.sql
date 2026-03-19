/*
	You may run exploratory queries to inspect the data. All tables are preloaded. 
    
	Prompt 
    
	The firm is evaluating whether Workers Compensation cases or Personal Injury cases are more efficient to resolve. 
	Write a query that uses a CTE named settled_stats to calculate, for each settled case: 
	the case_type
	settlement_amount
	the number of days from open_date to close_date (as days_to_settle). 

	Then, in the outer query, combine with the full cases table to return each case_type with:
	total_cases - total number of cases regardless of status 
	settled_count - number of settled cases 
	avg_settlement - average settlement amount rounded to two decimal places 
	avg_days_to_settle - average days to settle, rounded to the nearest whole number 

*/

-- some of my sample data is a little fishy here especially. reason 
-- ! fixed it, noted in q2

-- Common Table Expression, i've never called it a CTE for NFL reasons
SELECT COUNT(*)
FROM
(
SELECT t1.case_type
, t1.settlement_amount
, (t1.close_date - t1.open_date) AS days_to_settle
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY 1
) AS s1
;

/*

COUNT(*)
5

*/

SELECT DISTINCT
t1.case_type
, t1.settlement_amount
, (t1.close_date - t1.open_date) AS days_to_settle
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY 1
;

/* NEEDS WORK

case_type,settlement_amount,days_to_settle
"Personal Injury",618423.48,20293
"Personal Injury",1188711.95,29303
"Personal Injury",1128266.80,20298
"Workers Compensation",424776.96,29123
"Workers Compensation",1161940.86,20321

*/

SELECT DISTINCT
t1.case_type
, t1.settlement_amount
, t1.close_date
, t1.open_date -- days_to_settle
-- SELECT DATEDIFF(DAY, start_date, end_date) AS duration_in_days
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY 1
;

/*

case_type,settlement_amount,close_date,open_date
"Personal Injury",618423.48,2025-05-02,2023-02-09
"Personal Injury",1188711.95,2025-03-21,2022-10-18
"Personal Injury",1128266.80,2025-05-21,2023-02-23
"Workers Compensation",424776.96,2025-03-28,2022-12-05
"Workers Compensation",1161940.86,2025-04-24,2023-01-03

*/

SELECT DISTINCT
, t1.case_id
, t1.case_type
, t1.settlement_amount
, t1.close_date
, t1.open_date -- days_to_settle
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY 1
;

/*

case_id,case_type,settlement_amount,close_date,open_date
346,"Personal Injury",618423.48,2025-05-02,2023-02-09
1341,"Workers Compensation",424776.96,2025-03-28,2022-12-05
1401,"Personal Injury",1188711.95,2025-03-21,2022-10-18
1884,"Personal Injury",1128266.80,2025-05-21,2023-02-23
1992,"Workers Compensation",1161940.86,2025-04-24,2023-01-03

*/

SELECT DISTINCT
, t1.case_id
, t1.case_type
, t1.settlement_amount
, t1.close_date
, t1.open_date
, DATEDIFF(t1.close_date, t1.open_date) AS days_to_settle
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY 1
;

/*

case_id,case_type,settlement_amount,close_date,open_date,days_to_settle
346,"Personal Injury",618423.48,2025-05-02,2023-02-09,813
1341,"Workers Compensation",424776.96,2025-03-28,2022-12-05,844
1401,"Personal Injury",1188711.95,2025-03-21,2022-10-18,885
1884,"Personal Injury",1128266.80,2025-05-21,2023-02-23,818
1992,"Workers Compensation",1161940.86,2025-04-24,2023-01-03,842

*/

SELECT DISTINCT
t1.case_type
, t1.settlement_amount
, DATEDIFF(t1.close_date, t1.open_date) AS days_to_settle
FROM case_ AS t1
WHERE t1.status_ = 'Settled'
ORDER BY t1.case_type
;

/*

case_type,settlement_amount,days_to_settle
"Personal Injury",618423.48,813
"Personal Injury",1128266.80,818
"Personal Injury",1188711.95,885
"Workers Compensation",424776.96,844
"Workers Compensation",1161940.86,842

*/

SELECT DISTINCT
COUNT(t1.case_id)
FROM case_ AS t1
ORDER BY 1
;

/*

COUNT(t1.case_id)
25

*/

SELECT DISTINCT
t1.case_type
, COUNT(t1.case_id) AS total_cases
, COUNT(t2.case_id) AS settled_count
, CAST(AVG(t2.settlement_amount) AS DECIMAL(20, 2)) AS avg_settlement
, CAST(AVG(t2.days_to_settle) AS DECIMAL(20, 0)) AS avg_days_to_settle
FROM case_ AS t1
INNER JOIN
(SELECT DISTINCT
t2.case_id
, t2.case_type
, t2.settlement_amount
, DATEDIFF(t2.close_date, t2.open_date) AS days_to_settle
FROM case_ AS t2
WHERE t2.status_ = 'Settled'
ORDER BY t2.case_type) AS t2 ON t1.case_id = t2.case_id
GROUP BY t1.case_type
;

/*

case_type,total_cases,settled_count,avg_settlement,avg_days_to_settle
"Personal Injury",3,3,978467.41,839
"Workers Compensation",2,2,793358.91,843

*/

SELECT DISTINCT
t1.case_type
, COUNT(t1.case_id) AS total_cases
, COUNT(t2.case_id) AS settled_count
, CONCAT('$', CAST(AVG(t2.settlement_amount) AS DECIMAL(20, 2))) AS avg_settlement
, CAST(AVG(t2.days_to_settle) AS DECIMAL(20, 0)) AS avg_days_to_settle
FROM case_ AS t1
INNER JOIN
(SELECT DISTINCT
t2.case_id
, t2.case_type
, t2.settlement_amount
, DATEDIFF(t2.close_date, t2.open_date) AS days_to_settle
FROM case_ AS t2
WHERE t2.status_ = 'Settled'
ORDER BY t2.case_type) AS t2 ON t1.case_id = t2.case_id
GROUP BY t1.case_type
;

/*

case_type,total_cases,settled_count,avg_settlement,avg_days_to_settle
"Personal Injury",3,3,$978467.41,839
"Workers Compensation",2,2,$793358.91,843

*/

/*

SELECT DISTINCT
COUNT(t1.case_id)
, COUNT(t2.case_id)
, CAST(AVG(t2.settlement_amount) AS DECIMAL(20, 2)) AS avg_settlement
, CAST(AVG(t2.days_to_settle) AS DECIMAL(20, 0)) AS avg_days_to_settle
FROM
(SELECT DISTINCT
t2.case_id
, t2.case_type
, t2.settlement_amount
, DATEDIFF(t2.close_date, t2.open_date) AS days_to_settle
FROM case_ AS t2
WHERE t2.status_ = 'Settled'
ORDER BY t2.case_type) AS s1
GROUP BY t1.case_type
;

*/