/*
	You may run exploratory queries to inspect the data. All tables are preloaded. 
	Prompt 
	The firm wants a report showing each examining doctor's average WPI rating across all PPD exams they have conducted. Write a query that returns: 
	1.	the doctor's full name, first name followed by a space and last name. (as doctor_name): 
	2.	the number of exams they have conducted (as exam_count )(only include doctors who have conducted at least one exam)
	3.	their average WPI rating rounded to two decimal places (as avg_wpi). Order the results by avg_wpi descending. 

*/

SELECT COUNT(*)
FROM doctor t1
LEFT JOIN exam t2 ON t1.doctor_id = t2.doctor_id
ORDER BY 1
;

-- COUNT(*)
-- 25

SELECT COUNT(*)
FROM doctor AS t1
INNER JOIN exam t2 ON t1.doctor_id = t2.doctor_id
ORDER BY 1
;

/*

COUNT(*)
25

*/

SELECT DISTINCT
t1.doctor_id
, t2.exam_id
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
ORDER BY 1
;

/*

doctor_id,exam_id
56,1508
230,1501
230,1667
284,799
350,235
350,480
377,457
377,909
377,1115
542,562
1050,1914
1110,847
1110,1478
1165,802
1165,1520
1169,1463
1188,83
1429,1411
1558,656
1698,946
1819,201
1819,627
1907,1291
1953,427
1953,1734

*/

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, t1.last_name) AS doctor_name -- t1.doctor_id
, COUNT(t2.exam_id) AS exam_count
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY t1.doctor_id, t2.exam_id
ORDER BY 1
) AS s1
;

COUNT(*)
17

SELECT DISTINCT
CONCAT(t1.first_name, t1.last_name) AS doctor_name -- t1.doctor_id
, COUNT(t2.exam_id) AS exam_count
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY t1.doctor_id, t2.exam_id
ORDER BY 1
;

/*

doctor_name,exam_count
AlvinWolf,1
CameranHowe,1
ChesterRasmussen,1
ClarkeMontgomery,1
GraceHenry,1
GraidenReeves,1
IrisBeasley,1
IrisBurch,1
KylynnElliott,1
LoganTerry,1
MannixOwen,1
MartinaBender,1
NinaKerr,1
RamonaTodd,1
TanaHerrera,1
TaraStafford,1
WalterAvila,1

*/

SELECT COUNT(*)
FROM
(
SELECT DISTINCT
CONCAT(t1.first_name, ' ', t1.last_name) AS doctor_name -- t1.doctor_id
, t2.exam_id
, t2.wpi_rating
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY t1.doctor_id, t2.exam_id
ORDER BY 1
) AS s1
;

/*
COUNT(*)
25
*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', t1.last_name) AS doctor_name -- t1.doctor_id
, t2.exam_id
, t2.wpi_rating
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY t1.doctor_id, t2.exam_id
ORDER BY 1
;

/*

doctor_name,exam_id,wpi_rating
"Alvin Wolf",1463,100
"Cameran Howe",235,51
"Cameran Howe",480,37
"Chester Rasmussen",1508,72
"Clarke Montgomery",562,37
"Grace Henry",1411,98
"Graiden Reeves",83,62
"Iris Beasley",799,84
"Iris Burch",1914,56
"Kylynn Elliott",847,32
"Kylynn Elliott",1478,33
"Logan Terry",946,40
"Mannix Owen",1291,25
"Martina Bender",1501,15
"Martina Bender",1667,100
"Nina Kerr",201,10
"Nina Kerr",627,10
"Ramona Todd",802,47
"Ramona Todd",1520,42
"Tana Herrera",656,77
"Tara Stafford",457,94
"Tara Stafford",909,2
"Tara Stafford",1115,35
"Walter Avila",427,72
"Walter Avila",1734,79

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', t1.last_name) AS doctor_name -- t1.doctor_id
, COUNT(t2.exam_id) AS exam_count
, AVG(t2.wpi_rating) AS avg_wpi
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY doctor_name
ORDER BY 1
;

/*

doctor_name,exam_count,avg_wpi
"Alvin Wolf",1,100.0000
"Cameran Howe",2,44.0000
"Chester Rasmussen",1,72.0000
"Clarke Montgomery",1,37.0000
"Grace Henry",1,98.0000
"Graiden Reeves",1,62.0000
"Iris Beasley",1,84.0000
"Iris Burch",1,56.0000
"Kylynn Elliott",2,32.5000
"Logan Terry",1,40.0000
"Mannix Owen",1,25.0000
"Martina Bender",2,57.5000
"Nina Kerr",2,10.0000
"Ramona Todd",2,44.5000
"Tana Herrera",1,77.0000
"Tara Stafford",3,43.6667
"Walter Avila",2,75.5000

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', t1.last_name) AS doctor_name -- t1.doctor_id
, COUNT(t2.exam_id) AS exam_count
, CAST(AVG(t2.wpi_rating) AS DECIMAL(20, 2)) AS avg_wpi
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY doctor_name
ORDER BY 1
;

/*

doctor_name,exam_count,avg_wpi
"Alvin Wolf",1,100.00
"Cameran Howe",2,44.00
"Chester Rasmussen",1,72.00
"Clarke Montgomery",1,37.00
"Grace Henry",1,98.00
"Graiden Reeves",1,62.00
"Iris Beasley",1,84.00
"Iris Burch",1,56.00
"Kylynn Elliott",2,32.50
"Logan Terry",1,40.00
"Mannix Owen",1,25.00
"Martina Bender",2,57.50
"Nina Kerr",2,10.00
"Ramona Todd",2,44.50
"Tana Herrera",1,77.00
"Tara Stafford",3,43.67
"Walter Avila",2,75.50

*/

SELECT DISTINCT
CONCAT(t1.first_name, ' ', t1.last_name) AS doctor_name -- t1.doctor_id
, COUNT(t2.exam_id) AS exam_count
, CAST(AVG(t2.wpi_rating) AS DECIMAL(20, 2)) AS avg_wpi
FROM doctor AS t1
INNER JOIN exam AS t2 ON t1.doctor_id = t2.doctor_id
GROUP BY doctor_name
ORDER BY avg_wpi DESC
;

/*

doctor_name,exam_count,avg_wpi
"Alvin Wolf",1,100.00
"Grace Henry",1,98.00
"Iris Beasley",1,84.00
"Tana Herrera",1,77.00
"Walter Avila",2,75.50
"Chester Rasmussen",1,72.00
"Graiden Reeves",1,62.00
"Martina Bender",2,57.50
"Iris Burch",1,56.00
"Ramona Todd",2,44.50
"Cameran Howe",2,44.00
"Tara Stafford",3,43.67
"Logan Terry",1,40.00
"Clarke Montgomery",1,37.00
"Kylynn Elliott",2,32.50
"Mannix Owen",1,25.00
"Nina Kerr",2,10.00

*/

/*

FIN

/*