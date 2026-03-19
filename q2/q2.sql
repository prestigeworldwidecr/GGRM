/*
	You may run exploratory queries to inspect the data. All tables are preloaded. 
    
	Prompt 
    
	Management wants to know each attorneys performance on settled cases. Write a query that returns:
		the attorneys full name (as attorney_name)
		their practice area (as practice_area)
		the number of cases they have settled (as settled_count)
		the total settlement amount (as total_settlements)
		the average retainer percentage on those settled cases rounded to two decimal places (as avg_retainer_pct). 
        
	Only include cases with a status of 'Settled'. Order by total_settlements descending, then by attorney_name ascending. 

*/

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
GROUP BY t1.attorney_id
) AS s1
;

/*

COUNT(*)
13

*/

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
GROUP BY t1.attorney_id
) AS s1
;

/*

attorney_name,practice_area,settled_count,total_settlements
"Chandler Guzman","Workers Compensation",1,395642.57
"Ezekiel Wiggins","Personal Injury",3,2271026.64
"Imelda Battle","Personal Injury",1,1216552.50
"Kibo Rowe","Workers Compensation",1,1161940.86
"Latifah Nolan","Personal Injury",2,517805.78
"Lee Justice","Personal Injury",1,240785.36
"Lucy Fulton","Workers Compensation",1,462835.94
"Matthew Murphy","Personal Injury",1,788680.14
"Maxwell Conley","Personal Injury",7,5697040.46
"May Valentine","Workers Compensation",3,3287561.28
"Ray Gilliam","Workers Compensation",1,1011605.82
"Rhoda Bean","Personal Injury",2,343704.98
"Tanner Freeman","Workers Compensation",1,841298.25

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
GROUP BY t1.attorney_id
ORDER BY 1
;

/*

attorney_name,practice_area,settled_count,total_settlements
"Chandler Guzman","Workers Compensation",1,395642.57
"Ezekiel Wiggins","Personal Injury",3,2271026.64
"Imelda Battle","Personal Injury",1,1216552.50
"Kibo Rowe","Workers Compensation",1,1161940.86
"Latifah Nolan","Personal Injury",2,517805.78
"Lee Justice","Personal Injury",1,240785.36
"Lucy Fulton","Workers Compensation",1,462835.94
"Matthew Murphy","Personal Injury",1,788680.14
"Maxwell Conley","Personal Injury",7,5697040.46
"May Valentine","Workers Compensation",3,3287561.28
"Ray Gilliam","Workers Compensation",1,1011605.82
"Rhoda Bean","Personal Injury",2,343704.98
"Tanner Freeman","Workers Compensation",1,841298.25

*/

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
LEFT JOIN retainer AS t3 ON t2.case_id = t3.case_id
GROUP BY t1.attorney_id
ORDER BY 1
) AS s1
;

/*

COUNT(*)
15

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
LEFT JOIN retainer AS t3 ON t2.case_id = t3.case_id
GROUP BY t1.attorney_id
ORDER BY 1
;

/*

attorney_name,practice_area,settled_count,total_settlements
"Chandler Guzman","Workers Compensation",2,1166692.16
"Ezekiel Wiggins","Personal Injury",3,2271026.64
"Helen Gordon","Workers Compensation",1,1101815.23
"Imelda Battle","Personal Injury",1,1216552.50
"Kibo Rowe","Workers Compensation",2,1812995.63
"Latifah Nolan","Personal Injury",2,517805.78
"Lee Justice","Personal Injury",2,1359358.21
"Lucy Fulton","Workers Compensation",1,462835.94
"Macaulay Pratt","Personal Injury",2,1687544.15
"Matthew Murphy","Personal Injury",1,788680.14
"Maxwell Conley","Personal Injury",8,6825307.26
"May Valentine","Workers Compensation",3,3287561.28
"Ray Gilliam","Workers Compensation",2,1975379.45
"Rhoda Bean","Personal Injury",2,343704.98
"Tanner Freeman","Workers Compensation",1,841298.25

*/

-- cases use more than one retainer, *** not sure if that's legally possible?
-- one of those things i ask during development, if this has to be one to one, i wind up bickering about data integrity, hehe
-- for purposes of this exercise, i'll restrain it a one to one data relationship

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
WHERE t2.status_ = 'Settled'
GROUP BY t1.attorney_id
ORDER BY total_settlements DESC, attorney_name DESC
) AS s1
;

/*

COUNT(*)
9

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
, t2.status_ AS status
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
WHERE t2.status_ = 'Settled'
GROUP BY t1.attorney_id
ORDER BY total_settlements DESC, attorney_name DESC
;

/*

attorney_name,practice_area,settled_count,total_settlements,avg_retainer_pct,status
"Maxwell Conley","Personal Injury",4,3362573.40,45.85,Settled
"Imelda Battle","Personal Injury",1,1216552.50,41.30,Settled
"Kibo Rowe","Workers Compensation",1,1161940.86,77.17,Settled
"Ray Gilliam","Workers Compensation",1,1011605.82,4.18,Settled
"Latifah Nolan","Personal Injury",2,517805.78,61.92,Settled
"Lucy Fulton","Workers Compensation",1,462835.94,0.73,Settled
"Chandler Guzman","Workers Compensation",1,395642.57,77.75,Settled
"Ezekiel Wiggins","Personal Injury",1,378269.52,95.09,Settled
"Rhoda Bean","Personal Injury",2,343704.98,88.60,Settled


*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
WHERE t2.status_ = 'Settled'
GROUP BY t1.attorney_id
ORDER BY total_settlements DESC, attorney_name DESC
;

/*

attorney_name,practice_area,settled_count,total_settlements,avg_retainer_pct
"Maxwell Conley","Personal Injury",4,3362573.40,45.85
"Imelda Battle","Personal Injury",1,1216552.50,41.30
"Kibo Rowe","Workers Compensation",1,1161940.86,77.17
"Ray Gilliam","Workers Compensation",1,1011605.82,4.18
"Latifah Nolan","Personal Injury",2,517805.78,61.92
"Lucy Fulton","Workers Compensation",1,462835.94,0.73
"Chandler Guzman","Workers Compensation",1,395642.57,77.75
"Ezekiel Wiggins","Personal Injury",1,378269.52,95.09
"Rhoda Bean","Personal Injury",2,343704.98,88.60

*/

-- i revamped the case_ table because i didnt have corresponding status w/open and close date
-- just gonna run the same query again after updating the case table
-- this'll clear up q3.sql

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, SUM(t2.settlement_amount) AS total_settlements -- SELECT FORMAT(200.3639, 'C') AS 'Currency Format';
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
WHERE t2.status_ = 'Settled'
GROUP BY t1.attorney_id
ORDER BY total_settlements DESC, attorney_name DESC
;

/*

attorney_name,practice_area,settled_count,total_settlements,avg_retainer_pct
"Karleigh Flowers","Personal Injury",2,2377423.90,46.87
"Lee Justice","Personal Injury",2,1236846.96,71.58
"Chandler Guzman","Workers Compensation",1,1161940.86,77.17


*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', last_name) AS attorney_name
, t1.practice_area AS practice_area
, COUNT(t2.case_id) AS settled_count
, CONCAT('$', SUM(t2.settlement_amount)) AS total_settlements -- SELECT FORMAT(200.3639, 'C') AS 'Currency Format';
, CAST(AVG(t3.retainer_pct) AS DECIMAL(4, 2)) AS avg_retainer_pct
FROM attorney AS t1
INNER JOIN case_ AS t2 ON t1.attorney_id = t2.attorney_id
INNER JOIN retainer AS t3 ON t2.case_id = t3.case_id
WHERE t2.status_ = 'Settled'
GROUP BY t1.attorney_id
ORDER BY total_settlements DESC, attorney_name DESC
;

/*

attorney_name,practice_area,settled_count,total_settlements,avg_retainer_pct
"Karleigh Flowers","Personal Injury",2,$2377423.90,46.87
"Lee Justice","Personal Injury",2,$1236846.96,71.58
"Chandler Guzman","Workers Compensation",1,$1161940.86,77.17

*/

/*

FIN

*/