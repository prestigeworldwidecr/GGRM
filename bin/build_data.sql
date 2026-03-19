DROP TABLE attorney
;

CREATE TABLE attorney
(
	attorney_id	INTEGER	PRIMARY KEY,
	first_name	VARCHAR(255) NOT NULL,	
	last_name	VARCHAR(255) NOT NULL,	
	practice_area	VARCHAR(255) NOT NULL -- either "Workers Compensation" or "Personal Injury"
)
;

INSERT INTO attorney
(attorney_id, first_name, last_name, practice_area)
VALUES
(1054, 'Ray', 'Gilliam', 'Workers Compensation'),
(1134, 'Imelda', 'Battle', 'Personal Injury'),
(625, 'Bruno', 'Shepherd', 'Personal Injury'),
(1568, 'Brock', 'Allison', 'Workers Compensation'),
(1422, 'Ezekiel', 'Wiggins', 'Personal Injury'),
(517, 'May', 'Valentine', 'Workers Compensation'),
(268, 'Ishmael', 'Burns', 'Personal Injury'),
(663, 'Omar', 'Gross', 'Workers Compensation'),
(664, 'Rhoda', 'Bean', 'Personal Injury'),
(1113, 'Chandler', 'Guzman', 'Workers Compensation'),
(931, 'Jeremy', 'Rivera', 'Workers Compensation'),
(1727, 'Whoopi', 'Campos', 'Personal Injury'),
(901, 'Lila', 'Bond', 'Personal Injury'),
(1049, 'Kibo', 'Rowe', 'Workers Compensation'),
(1342, 'Tanner', 'Freeman', 'Workers Compensation'),
(1740, 'Lucy', 'Fulton', 'Workers Compensation'),
(1859, 'Matthew', 'Murphy', 'Personal Injury'),
(531, 'Maxwell', 'Conley', 'Personal Injury'),
(753, 'Helen', 'Gordon', 'Workers Compensation'),
(1238, 'Lee', 'Justice', 'Personal Injury'),
(249, 'Karleigh', 'Flowers', 'Personal Injury'),
(1575, 'Haviva', 'Downs', 'Workers Compensation'),
(1766, 'Evangeline', 'Sellers', 'Personal Injury'),
(503, 'Macaulay', 'Pratt', 'Personal Injury'),
(14, 'Latifah', 'Nolan', 'Personal Injury')
;


DROP TABLE client
;

CREATE TABLE client
(
    client_id	INTEGER	PRIMARY KEY,
	first_name	VARCHAR(255) NOT NULL,
	last_name	VARCHAR(255) NOT NULL,	
	intake_date	DATE NOT NULL,
	portal_version	VARCHAR(255) NOT NULL-- either 'A' or 'B'
)
;

INSERT INTO client
(client_id, first_name, last_name, intake_date, portal_version)
VALUES
(1219, 'Kyle', 'Rowland', '2021-03-30', 'B'),
(1048, 'Lester', 'Spears', '2021-04-02', 'A'),
(1967, 'Agnes', 'Benton', '2021-04-23', 'B'),
(195, 'Porter', 'Anthony', '2022-03-14', 'A'),
(1407, 'Teddy', 'Hess', '2022-05-31', 'A'),
(1258, 'Elizabeth', 'Aguilar', '2023-01-11', 'B'),
(1754, 'Connie', 'Kaiser', '2023-01-20', 'A'),
(1834, 'Sheryl', 'Le', '2023-01-23', 'B'),
(466, 'Melanie', 'Sutton', '2023-05-05', 'A'),
(221, 'Jeramy', 'Montoya', '2023-06-05', 'A'),
(861, 'Sanford', 'Hicks', '2023-06-16', 'B'),
(212, 'Sean', 'Jimenez', '2023-08-17', 'B'),
(913, 'Celia', 'Cowan', '2023-09-08', 'A'),
(332, 'Rosetta', 'Schmitt', '2024-03-21', 'A'),
(284, 'Jordon', 'Mcclain', '2024-03-28', 'B'),
(740, 'Carl', 'Hull', '2024-04-25', 'A'),
(53, 'Deandre', 'Morrison', '2024-06-03', 'B'),
(1467, 'Valarie', 'Kaufman', '2024-06-28', 'A'),
(697, 'Ezequiel', 'Deleon', '2024-09-04', 'B'),
(1126, 'Jamison', 'Dalton', '2025-01-08', 'B'),
(481, 'Julius', 'Reyes', '2025-01-16', 'B'),
(1576, 'Jefferey', 'Byrd', '2025-08-11', 'B'),
(756, 'Milton', 'Zimmerman', '2025-12-31', 'A'),
(941, 'Dorthy', 'Watkins', '2026-06-25', 'B'),
(91, 'Raymon', 'Escobar', '2026-10-19', 'A')
;

DROP TABLE case_
;

CREATE TABLE case_
(
	case_id	INTEGER	PRIMARY KEY,
	client_id	INTEGER,	-- foreign key
	attorney_id	INTEGER,	-- foreign key
	case_type	VARCHAR(255) NOT NULL, 	-- either "Workers Compensation" or "Personal Injury"
	status_	VARCHAR(255) NOT NULL,	-- "Open", "Settled", "Closed", "Denied"
	open_date	DATE NOT NULL,	
	close_date	DATE,	
	settlement_amount	DECIMAL(20, 2)
)
;

INSERT INTO case_
(case_id, client_id, attorney_id, case_type, status_, open_date, close_date, settlement_amount)
VALUES
(222, 1754, 753, 'Workers Compensation', 'Open', '2022-01-26', null, 841298.25),
(1674, 332, 1727, 'Personal Injury', 'Open', '2022-03-31', null, 240785.36),
(638, 1126, 1422, 'Personal Injury', 'Denied', '2022-04-04', '2025-01-31', 1118572.85),
(804, 1834, 1575, 'Workers Compensation', 'Denied', '2022-04-21', '2025-02-25', 1101815.23),
(1896, 284, 1049, 'Workers Compensation', 'Open', '2022-04-28', null, 258902.89),
(548, 756, 664, 'Workers Compensation', 'Open', '2022-05-20', null, 1216552.5),
(1401, 1467, 249, 'Personal Injury', 'Settled', '2022-10-18', '2025-03-21', 1188711.95),
(1341, 1967, 531, 'Workers Compensation', 'Settled', '2022-12-05', '2025-03-28', 424776.96),
(1992, 861, 1113, 'Workers Compensation', 'Settled', '2023-01-03', '2025-04-24', 1161940.86),
(346, 1967, 1238, 'Personal Injury', 'Settled', '2023-02-09', '2025-05-02', 618423.48),
(1884, 1258, 531, 'Personal Injury', 'Settled', '2023-02-23', '2025-05-21', 1128266.8),
(92, 913, 753, 'Personal Injury', 'Open', '2023-07-07', null, 171852.49),
(717, 1048, 1859, 'Workers Compensation', 'Open', '2023-08-14', null, 1095853.76),
(1520, 466, 625, 'Workers Compensation', 'Open', '2023-10-20', null, 1262767.19),
(83, 913, 1049, 'Personal Injury', 'Open', '2024-02-12', null, 1097620.1),
(1900, 913, 1342, 'Personal Injury', 'Closed', '2024-04-24', '2025-08-06', 492574.75),
(1343, 284, 1575, 'Workers Compensation', 'Closed', '2024-05-17', '2025-08-08', 651054.77),
(50, 1576, 14, 'Workers Compensation', 'Closed', '2024-06-11', '2025-11-07', 1011605.82),
(723, 1219, 1054, 'Workers Compensation', 'Closed', '2024-06-18', '2025-12-05', 771049.59),
(1773, 1754, 931, 'Personal Injury', 'Closed', '2024-07-03', '2025-12-31', 788680.14),
(1079, 195, 1568, 'Workers Compensation', 'Open', '2024-08-15', null, 378269.52),
(123, 195, 1238, 'Personal Injury', 'Open', '2024-09-17', null, 395642.57),
(1091, 861, 1575, 'Personal Injury', 'Closed', '2024-11-01', '2026-02-11', 963773.63),
(1538, 53, 1054, 'Personal Injury', 'Open', '2024-11-25', null, 946378.56),
(1362, 1407, 1054, 'Personal Injury', 'Open', '2024-11-26', null, 462835.94)
;

SELECT DISTINCT *
FROM case_
ORDER BY 1
;

DROP TABLE exam
;

CREATE TABLE exam
(
	exam_id	INTEGER	PRIMARY KEY,
	case_id	INTEGER,	-- foreign key
	doctor_id	INTEGER,	-- foreign key
	exam_date	DATE,	
	wpi_rating	DECIMAL(3)	-- Whole Person Impairment rating (0.00-100.00)
)
;

INSERT INTO exam
(exam_id, case_id, doctor_id, exam_date, wpi_rating)
VALUES
(457, 1401, 377, '2025-02-28', 94),
(847, 1992, 1110, '2025-03-05', 32),
(235, 717, 350, '2025-03-06', 51),
(946, 1992, 1698, '2025-03-19', 40),
(1667, 1341, 230, '2025-03-31', 100),
(562, 1674, 542, '2025-04-14', 37),
(83, 1520, 1188, '2025-04-17', 62),
(427, 346, 1953, '2025-05-26', 72),
(1115, 1401, 377, '2025-07-21', 35),
(1411, 222, 1429, '2025-07-30', 98),
(909, 1520, 377, '2025-08-22', 2),
(1463, 92, 1169, '2025-08-29', 100),
(201, 346, 1819, '2025-10-14', 10),
(480, 50, 350, '2025-11-11', 37),
(1291, 1992, 1907, '2025-11-14', 25),
(1520, 123, 1165, '2025-12-08', 42),
(656, 717, 1558, '2026-03-06', 77),
(1914, 1341, 1050, '2026-03-25', 56),
(627, 1992, 1819, '2026-03-31', 10),
(1501, 1896, 230, '2026-04-27', 15),
(1478, 1362, 1110, '2026-05-27', 33),
(799, 1520, 284, '2026-07-27', 84),
(1508, 1091, 56, '2026-10-21', 72),
(1734, 1520, 1953, '2026-12-02', 79),
(802, 723, 1165, '2026-12-29', 47)
;


DROP TABLE doctor
;

CREATE TABLE doctor
(
	doctor_id	INTEGER	PRIMARY KEY,
	first_name	VARCHAR(255),
	last_name	VARCHAR(255),	
	specialty	VARCHAR(255)	
)
;

INSERT INTO doctor
(doctor_id, first_name, last_name, specialty)
VALUES
(1907, 'Mannix', 'Owen', 'Family Medicine'),
(1521, 'Kiara', 'Ramos', 'Pediatrics'),
(350, 'Cameran', 'Howe', 'Psychiatry'),
(1050, 'Iris', 'Burch', 'Obstetrics and Gynecology'),
(854, 'Jeremy', 'Le', 'Family Medicine'),
(1698, 'Logan', 'Terry', 'Psychiatry'),
(230, 'Martina', 'Bender', 'Obstetrics and Gynecology'),
(1429, 'Grace', 'Henry', 'Pediatrics'),
(284, 'Iris', 'Beasley', 'Family Medicine'),
(617, 'Tasha', 'Dickson', 'Pediatrics'),
(542, 'Clarke', 'Montgomery', 'Obstetrics and Gynecology'),
(863, 'Meghan', 'Sanders', 'Obstetrics and Gynecology'),
(1165, 'Ramona', 'Todd', 'Family Medicine'),
(1625, 'Knox', 'Jefferson', 'Internal Medicine'),
(470, 'Jada', 'Leblanc', 'Psychiatry'),
(1819, 'Nina', 'Kerr', 'Internal Medicine'),
(1110, 'Kylynn', 'Elliott', 'Obstetrics and Gynecology'),
(1169, 'Alvin', 'Wolf', 'Family Medicine'),
(1558, 'Tana', 'Herrera', 'Obstetrics and Gynecology'),
(191, 'Margaret', 'Day', 'Psychiatry'),
(1, 'Holmes', 'Vincent', 'Pediatrics'),
(56, 'Chester', 'Rasmussen', 'Obstetrics and Gynecology'),
(1188, 'Graiden', 'Reeves', 'Obstetrics and Gynecology'),
(1953, 'Walter', 'Avila', 'Psychiatry'),
(377, 'Tara', 'Stafford', 'Psychiatry')
;

DROP TABLE retainer
;

CREATE TABLE retainer
(
	retainer_id	INTEGER	PRIMARY KEY,
	case_id	INTEGER, --	foreign key
	retainer_pct	DECIMAL(4, 2), --	retainer fee percentage
	signed_date	DATE	
)
;

INSERT INTO retainer
(retainer_id, case_id, retainer_pct, signed_date)
VALUES
(78, 717, 12.58, '2024-10-25'),
(17, 548, 41.3, '2024-11-06'),
(76, 92, 83.95, '2024-12-02'),
(74, 123, 77.75, '2025-01-27'),
(9, 1538, 91.31, '2025-02-05'),
(79, 222, 77.94, '2025-04-02'),
(4, 1992, 77.17, '2025-04-03'),
(62, 1401, 2.45, '2025-04-10'),
(63, 50, 4.18, '2025-04-16'),
(24, 1896, 57.35, '2025-05-01'),
(1, 92, 93.24, '2025-05-06'),
(26, 346, 91.73, '2025-05-07'),
(71, 1079, 95.09, '2025-05-08'),
(14, 1773, 72.03, '2025-06-16'),
(2, 1538, 70.01, '2025-06-20'),
(60, 346, 51.42, '2025-06-26'),
(99, 717, 13.97, '2025-07-29'),
(40, 1896, 66.48, '2025-09-05'),
(80, 1674, 11.27, '2025-09-11'),
(82, 717, 54.1, '2025-09-16'),
(41, 1900, 5.52, '2025-09-30'),
(53, 1900, 84.13, '2025-10-06'),
(98, 83, 11.32, '2025-11-04'),
(44, 1401, 91.29, '2025-11-24'),
(95, 1362, 0.73, '2025-12-03')
;

SELECT *
FROM retainer
ORDER BY 1
;