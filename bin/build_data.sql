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
(222, 1834, 1342, 'Workers Compensation', 'Open', '2022-01-26', '2025-01-17', 841298.25),
(1674, 697, 1238, 'Personal Injury', 'Open', '2022-03-31', '2025-01-22', 240785.36),
(638, 466, 1238, 'Workers Compensation', 'Open', '2022-04-04', '2025-01-31', 1118572.85),
(804, 195, 753, 'Workers Compensation', 'Settled', '2022-04-21', '2025-02-25', 1101815.23),
(1896, 91, 14, 'Personal Injury', 'Settled', '2022-04-28', null, 258902.89),
(548, 1754, 1134, 'Personal Injury', 'Settled', '2022-05-20', null, 1216552.5),
(1401, 1407, 531, 'Workers Compensation', 'Settled', '2022-10-18', '2025-03-21', 1188711.95),
(1341, 1967, 503, 'Workers Compensation', 'Settled', '2022-12-05', '2025-03-28', 424776.96),
(1992, 1576, 1049, 'Personal Injury', 'Settled', '2023-01-03', '2025-04-24', 1161940.86),
(346, 1048, 531, 'Workers Compensation', 'Open', '2023-02-09', '2025-05-02', 618423.48),
(1884, 53, 531, 'Personal Injury', 'Settled', '2023-02-23', '2025-05-21', 1128266.8),
(92, 466, 664, 'Workers Compensation', 'Settled', '2023-07-07', null, 171852.49),
(717, 212, 517, 'Workers Compensation', 'Denied', '2023-08-14', null, 1095853.76),
(1520, 756, 503, 'Workers Compensation', 'Settled', '2023-10-20', null, 1262767.19),
(83, 1967, 531, 'Workers Compensation', 'Denied', '2024-02-12', null, 1097620.1),
(1900, 1258, 531, 'Workers Compensation', 'Settled', '2024-04-24', '2025-08-06', 492574.75),
(1343, 481, 1049, 'Workers Compensation', 'Denied', '2024-05-17', '2025-08-08', 651054.77),
(50, 740, 1054, 'Workers Compensation', 'Settled', '2024-06-11', '2025-11-07', 1011605.82),
(723, 221, 1113, 'Workers Compensation', 'Settled', '2024-06-18', '2025-12-05', 771049.59),
(1773, 861, 1859, 'Workers Compensation', 'Denied', '2024-07-03', '2025-12-31', 788680.14),
(1079, 1126, 1422, 'Workers Compensation', 'Settled', '2024-08-15', null, 378269.52),
(123, 740, 1113, 'Workers Compensation', 'Settled', '2024-09-17', null, 395642.57),
(1091, 221, 1054, 'Workers Compensation', 'Settled', '2024-11-01', '2026-02-11', 963773.63),
(1538, 1754, 1422, 'Personal Injury', 'Denied', '2024-11-25', null, 946378.56),
(1362, 1126, 1740, 'Personal Injury', 'Settled', '2024-11-26', null, 462835.94)
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
(457, 638, 1538, '2025-02-28', 83),
(847, 638, 1773, '2025-03-05', 25),
(235, 1520, 1091, '2025-03-06', 1),
(946, 346, 1992, '2025-03-19', 25),
(1667, 1896, 1896, '2025-03-31', 8),
(562, 1520, 1674, '2025-04-14', 13),
(83, 83, 1773, '2025-04-17', 88),
(427, 1992, 1343, '2025-05-26', 98),
(1115, 92, 83, '2025-07-21', 59),
(1411, 1773, 83, '2025-07-30', 97),
(909, 1884, 1896, '2025-08-22', 26),
(1463, 1992, 1362, '2025-08-29', 100),
(201, 548, 50, '2025-10-14', 44),
(480, 1896, 1900, '2025-11-11', 35),
(1291, 1900, 638, '2025-11-14', 69),
(1520, 717, 723, '2025-12-08', 71),
(656, 1538, 548, '2026-03-06', 47),
(1914, 1341, 346, '2026-03-25', 63),
(627, 1520, 1538, '2026-03-31', 3),
(1501, 1900, 1896, '2026-04-27', 6),
(1478, 222, 1343, '2026-05-27', 43),
(799, 222, 804, '2026-07-27', 63),
(1508, 1773, 83, '2026-10-21', 80),
(1734, 1091, 804, '2026-12-02', 22),
(802, 83, 1343, '2026-12-29', 95)
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
	retainer_pct	DECIMAL(2, 2), --	retainer fee percentage
	signed_date	DATE	
)
;

INSERT INTO retainer
(retainer_id, case_id, retainer_pct, signed_date)
VALUES
(78, 638, 0.6, '2024-10-25'),
(17, 1896, 0.64, '2024-11-06'),
(76, 638, 0.09, '2024-12-02'),
(74, 548, 0.25, '2025-01-27'),
(9, 92, 0.74, '2025-02-05'),
(79, 222, 0.33, '2025-04-02'),
(4, 1674, 0.92, '2025-04-03'),
(62, 222, 0.14, '2025-04-10'),
(63, 346, 0.21, '2025-04-16'),
(24, 1992, 0.31, '2025-05-01'),
(1, 1520, 0.42, '2025-05-06'),
(26, 92, 0.77, '2025-05-07'),
(71, 1674, 0.02, '2025-05-08'),
(14, 1091, 0.14, '2025-06-16'),
(2, 1362, 0.96, '2025-06-20'),
(60, 717, 0.11, '2025-06-26'),
(99, 346, 0.96, '2025-07-29'),
(40, 222, 0.57, '2025-09-05'),
(80, 1538, 0.35, '2025-09-11'),
(82, 1341, 0.06, '2025-09-16'),
(41, 123, 0.63, '2025-09-30'),
(53, 92, 0.56, '2025-10-06'),
(98, 1992, 0.5, '2025-11-04'),
(44, 1520, 0.37, '2025-11-24'),
(95, 50, 0.98, '2025-12-03')
;