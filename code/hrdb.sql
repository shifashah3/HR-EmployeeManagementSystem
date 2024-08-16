CREATE TABLE EmployeeLogin (
    EmployeeID INT PRIMARY KEY,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	Password VARCHAR(50)
);
select * from EmployeeLogin
select * from employees
select * from SalaryInfo
select * from jobs
select * from Applicants
select * from Announcement
-- Inserting sample data
INSERT INTO EmployeeLogin (EmployeeID, Password) VALUES 
    (1, 'hr123'),
	(2, 'emp_newpass456'),
	(3, 'empPwd789'),
	(4, 'hr_newpassword1'),
	(5, 'hr_newsecret567'),
	(6, 'hrPwd123'),
	(7, 'emp_newaccess321'),
	(8, 'emp_newpass789'),
	(9, 'hr_newlogin123'),
	(10, 'hr_newpass789'),
	(11, 'hr_newsecret987'),
	(12, 'emp_newpassword1'),
	(13, 'emp_newsecure789'),
	(14, 'emp_newaccess987'),
	(15, 'hr_newpass123'),
	(16, 'hr_newaccess567'),
	(17, 'hr_newsecret345'),
	(18, 'emp_newlogin123'),
	(19, 'emp_newpassword1'),
	(20, 'emp_newsecure567'),
	(21, 'hr_newpass456'),
	(22, 'hr_newaccess123'),
	(23, 'hr_newsecret789'),
	(24, 'emp_newsecret567'),
	(25, 'emp_newaccess123');

CREATE TABLE employees(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    JobID INT,
	FOREIGN KEY (JobID) REFERENCES jobs(JobID),
    Gender CHAR(1),
    SSN VARCHAR(11),  -- Assuming the format is XXX-XX-XXXX
    DOB DATE,
    Salary INT,
    PhoneNumber VARCHAR(15),  -- Assuming a standard phone number format
    Address VARCHAR(255),
    OnboardingDate DATE
);

update employees
set Address =  '456 Oak St, Townsville, USA'
where EmployeeID=2

-- Inserting sample data into the Employees table
INSERT INTO employees (FirstName, LastName, Position, JobID, Gender, SSN, DOB, Salary, PhoneNumber, Address, OnboardingDate) VALUES
    ('John', 'Doe', 'Software Engineer', 101, 'M', '123-45-6789', '1990-05-15', 85000.00, '555-123-4567', '123 Main St, Cityville, USA', '2022-01-10'),
    ('Jane', 'Smith', 'HR Manager', 201, 'F', '234-56-7890', '1985-08-22', 95000.00, '555-234-5678', '456 Oak St, Townsville, USA', '2022-02-05'),
    ('Mike', 'Johnson', 'Marketing Specialist', 301, 'M', '345-67-8901', '1993-12-10', 75000.00, '555-345-6789', '789 Pine St, Villageton, USA', '2022-03-15'),
    ('Emily', 'Brown', 'Finance Analyst', 401, 'F', '456-78-9012', '1988-04-18', 90000.00, '555-456-7890', '101 Cedar St, Hamletown, USA', '2022-04-20'),
    ('David', 'Taylor', 'Sales Representative', 501, 'M', '567-89-0123', '1995-07-25', 80000.00, '555-567-8901', '202 Elm St, Villagetown, USA', '2022-05-25'),
	('Olivia', 'Wilson', 'HR Manager', 601, 'F', '678-90-1234', '1992-09-08', 72000.00, '555-678-9012', '303 Birch St, Citytown, USA', '2022-06-01'),
    ('William', 'Martinez', 'Product Manager', 701, 'M', '789-01-2345', '1987-02-14', 105000.00, '555-789-0123', '404 Maple St, Villageside, USA', '2022-07-10'),
    ('Sophia', 'Miller', 'HR Specialist', 801, 'F', '890-12-3456', '1994-11-20', 65000.00, '555-890-1234', '505 Pine St, Hamletville, USA', '2022-08-15'),
    ('Ethan', 'Anderson', 'Quality Assurance Engineer', 901, 'M', '901-23-4567', '1989-06-30', 80000.00, '555-901-2345', '606 Oak St, Townside, USA', '2022-09-20'),
    ('Ava', 'Garcia', 'Operations Coordinator', 1001, 'F', '012-34-5678', '1996-03-12', 68000.00, '555-012-3456', '707 Cedar St, Villageland, USA', '2022-10-01'),
    ('Noah', 'Brown', 'HR Specialist', 1101, 'M', '123-45-6789', '1991-04-25', 90000.00, '555-123-4567', '808 Elm St, Cityside, USA', '2022-11-10'),
    ('Emma', 'Rodriguez', 'Marketing Coordinator', 1201, 'F', '234-56-7890', '1986-07-05', 75000.00, '555-234-5678', '909 Birch St, Villageville, USA', '2022-12-15'),
    ('Liam', 'Lee', 'Finance Manager', 1301, 'M', '345-67-8901', '1997-10-18', 110000.00, '555-345-6789', '1010 Maple St, Hamletside, USA', '2023-01-20'),
    ('Isabella', 'Lopez', 'Sales Manager', 1401, 'F', '456-78-9012', '1984-05-30', 100000.00, '555-456-7890', '1111 Pine St, Cityland, USA', '2023-02-01'),
    ('Mason', 'Perez', 'HR Specialist', 1501, 'M', '567-89-0123', '1998-08-10', 72000.00, '555-567-8901', '1212 Oak St, Villageside, USA', '2023-03-10'),
    ('Amelia', 'Taylor', 'Software Developer', 1601, 'F', '678-90-1234', '1993-01-15', 95000.00, '555-678-9012', '1313 Cedar St, Hamletland, USA', '2023-04-15'),
    ('Carter', 'Gonzalez', 'IT Manager', 1701, 'M', '789-01-2345', '1988-12-20', 105000.00, '555-789-0123', '1414 Elm St, Villageside, USA', '2023-05-20'),
    ('Chloe', 'Hernandez', 'Customer Success Manager', 1801, 'F', '890-12-3456', '1995-06-01', 90000.00, '555-890-1234', '1515 Pine St, Townland, USA', '2023-06-01'),
    ('Jackson', 'Harris', 'Quality Assurance Analyst', 1901, 'M', '901-23-4567', '1990-09-10', 78000.00, '555-901-2345', '1616 Maple St, Cityside, USA', '2023-07-10'),
    ('Avery', 'Wright', 'HR Coordinator', 2001, 'F', '012-34-5678', '1985-02-15', 110000.00, '555-012-3456', '1717 Birch St, Villageland, USA', '2023-08-15'),
    ('Elijah', 'Clark', 'Marketing Director', 2101, 'M', '123-45-6789', '1996-11-20', 120000.00, '555-123-4567', '1818 Oak St, Cityville, USA', '2023-09-20'),
    ('Grace', 'Green', 'Finance Analyst', 2201, 'F', '234-56-7890', '1989-04-25', 85000.00, '555-234-5678', '1919 Pine St, Villagetown, USA', '2023-10-01'),
    ('Logan', 'Baker', 'Sales Representative', 2301, 'M', '345-67-8901', '1994-07-05', 80000.00, '555-345-6789', '2020 Cedar St, Hamletville, USA', '2023-11-10'),
    ('Aria', 'Cruz', 'HR Coordinator', 2401, 'F', '456-78-9012', '1991-10-18', 72000.00, '555-456-7890', '2121 Elm St, Townside, USA', '2023-12-15'),
    ('Jack', 'Torres', 'Software Engineer', 2501, 'M', '567-89-0123', '1986-05-30', 95000.00, '555-567-8901', '2222 Birch St, Villageton, USA', '2024-01-20');

	CREATE TABLE SalaryInfo (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    DateReceived DATE,
    Amount INT
);

select * from SalaryInfo
-- Assuming EmployeeID values match those in the Employees table

SET IDENTITY_INSERT SalaryInfo OFF;
INSERT INTO SalaryInfo (SalaryID, EmployeeID, DateReceived, Amount) VALUES
	(7, 1, '2023-02-05', 85000.00),
	(8, 1, '2023-03-05', 85000.00),
	(9, 1, '2023-04-05', 85000.00),
	(10, 1, '2023-05-05', 85000.00),
	(11, 1, '2023-06-05', 85000.00),
	(12, 1, '2023-07-05', 85000.00),
	(13, 2, '2023-02-10', 95000.00),
	(14, 2, '2023-03-10', 95000.00),
	(15, 2, '2023-04-10', 95000.00),
	(16, 2, '2023-05-10', 95000.00),
	(17, 2, '2023-06-10', 95000.00),
	(18, 2, '2023-07-10', 95000.00),
	(19, 3, '2023-02-15', 75000.00),
	(20, 3, '2023-03-15', 75000.00),
	(21, 3, '2023-04-15', 75000.00),
	(22, 3, '2023-05-15', 75000.00),
	(23, 3, '2023-06-15', 75000.00),
	(24, 3, '2023-07-15', 75000.00),
	(25, 4, '2023-02-20', 90000.00),
	(26, 4, '2023-03-20', 90000.00),
	(27, 4, '2023-04-20', 90000.00),
	(28, 4, '2023-05-20', 90000.00),
	(29, 4, '2023-06-20', 90000.00),
	(30, 4, '2023-07-20', 90000.00),
	(31, 5, '2023-02-25', 80000.00),
	(32, 5, '2023-03-25', 80000.00),
	(33, 5, '2023-04-25', 80000.00),
	(34, 5, '2023-05-25', 80000.00),
	(35, 5, '2023-06-25', 80000.00),
	(36, 5, '2023-07-25', 80000.00),
	(37, 6, '2023-02-28', 72000.00),
	(38, 6, '2023-03-30', 72000.00),
	(39, 6, '2023-04-30', 72000.00),
	(40, 6, '2023-05-30', 72000.00),
	(41, 6, '2023-06-30', 72000.00),
	(42, 6, '2023-07-30', 72000.00),
	(43, 7, '2023-03-05', 105000.00),
	(44, 7, '2023-04-05', 105000.00),
	(45, 7, '2023-05-05', 105000.00),
	(46, 7, '2023-06-05', 105000.00),
	(47, 7, '2023-07-05', 105000.00),
	(48, 7, '2023-08-05', 105000.00),
	(49, 8, '2023-03-10', 65000.00),
	(50, 8, '2023-04-10', 65000.00),
	(51, 8, '2023-05-10', 65000.00),
	(52, 8, '2023-06-10', 65000.00),
	(53, 8, '2023-07-10', 65000.00),
	(54, 8, '2023-08-10', 65000.00),
	(55, 9, '2023-03-15', 80000.00),
	(56, 9, '2023-04-15', 80000.00),
	(57, 9, '2023-05-15', 80000.00),
	(58, 9, '2023-06-15', 80000.00),
	(59, 9, '2023-07-15', 80000.00),
	(60, 9, '2023-08-15', 80000.00),
	(61, 10, '2023-03-20', 68000.00),
	(62, 10, '2023-04-20', 68000.00),
	(63, 10, '2023-05-20', 68000.00),
	(64, 10, '2023-06-20', 68000.00),
	(65, 10, '2023-07-20', 68000.00),
	(66, 10, '2023-08-20', 68000.00),
	(67, 11, '2023-03-25', 90000.00),
	(68, 11, '2023-04-25', 90000.00),
	(69, 11, '2023-05-25', 90000.00),
	(70, 11, '2023-06-25', 90000.00),
	(71, 11, '2023-07-25', 90000.00),
	(72, 11, '2023-08-25', 90000.00),
	(73, 12, '2023-03-30', 75000.00),
	(74, 12, '2023-04-30', 75000.00),
	(75, 12, '2023-05-30', 75000.00),
	(76, 12, '2023-06-30', 75000.00),
	(77, 12, '2023-07-30', 75000.00),
	(78, 12, '2023-08-30', 75000.00),
	(79, 13, '2023-04-05', 110000.00),
	(80, 13, '2023-05-05', 110000.00),
	(81, 13, '2023-06-05', 110000.00),
	(82, 13, '2023-07-05', 110000.00),
	(83, 13, '2023-08-05', 110000.00),
	(84, 13, '2023-09-05', 110000.00),
	(85, 14, '2023-04-10', 100000.00),
	(86, 14, '2023-05-10', 100000.00),
	(87, 14, '2023-06-10', 100000.00),
	(88, 14, '2023-07-10', 100000.00),
	(89, 14, '2023-08-10', 100000.00),
	(90, 14, '2023-09-10', 100000.00),
	(91, 15, '2023-04-15', 72000.00),
	(92, 15, '2023-05-15', 72000.00),
	(93, 15, '2023-06-15', 72000.00),
	(94, 15, '2023-07-15', 72000.00),
	(95, 15, '2023-08-15', 72000.00),
	(96, 15, '2023-09-15', 72000.00),
	(97, 16, '2023-04-20', 95000.00),
	(98, 16, '2023-05-20', 95000.00),
	(99, 16, '2023-06-20', 95000.00),
	(100, 16, '2023-07-20', 95000.00),
	(101, 16, '2023-08-20', 95000.00),
	(102, 16, '2023-09-20', 95000.00),
	(103, 17, '2023-04-25', 105000.00),
	(104, 17, '2023-05-25', 105000.00),
	(105, 17, '2023-06-25', 105000.00),
	(106, 17, '2023-07-25', 105000.00),
	(107, 17, '2023-08-25', 105000.00),
	(108, 17, '2023-09-25', 105000.00),
	(109, 18, '2023-05-05', 90000.00),
	(110, 18, '2023-06-05', 90000.00),
	(111, 18, '2023-07-05', 90000.00),
	(112, 18, '2023-08-05', 90000.00),
	(113, 18, '2023-09-05', 90000.00),
	(114, 18, '2023-10-05', 90000.00),
	(115, 19, '2023-05-10', 78000.00),
	(116, 19, '2023-06-10', 78000.00),
	(117, 19, '2023-07-10', 78000.00),
	(118, 19, '2023-08-10', 78000.00),
	(119, 19, '2023-09-10', 78000.00),
	(120, 19, '2023-10-10', 78000.00),
	(121, 20, '2023-05-15', 110000.00),
	(122, 20, '2023-06-15', 110000.00),
	(123, 20, '2023-07-15', 110000.00),
	(124, 20, '2023-08-15', 110000.00),
	(125, 20, '2023-09-15', 110000.00),
	(126, 20, '2023-10-15', 110000.00),
	(127, 21, '2023-05-20', 120000.00),
	(128, 21, '2023-06-20', 120000.00),
	(129, 21, '2023-07-20', 120000.00),
	(130, 21, '2023-08-20', 120000.00),
	(131, 21, '2023-09-20', 120000.00),
	(132, 21, '2023-10-20', 120000.00),
	(133, 22, '2023-05-25', 85000.00),
	(134, 22, '2023-06-25', 85000.00),
	(135, 22, '2023-07-25', 85000.00),
	(136, 22, '2023-08-25', 85000.00),
	(137, 22, '2023-09-25', 85000.00),
	(138, 22, '2023-10-25', 85000.00),
	(139, 23, '2023-05-30', 80000.00),
	(140, 23, '2023-06-30', 80000.00),
	(141, 23, '2023-07-30', 80000.00),
	(142, 23, '2023-08-30', 80000.00),
	(143, 23, '2023-09-30', 80000.00),
	(144, 23, '2023-10-30', 80000.00),
	(145, 24, '2023-06-05', 72000.00),
	(146, 24, '2023-07-05', 72000.00),
	(147, 24, '2023-08-05', 72000.00),
	(148, 24, '2023-09-05', 72000.00),
	(149, 24, '2023-10-05', 72000.00),
	(150, 24, '2023-11-05', 72000.00),
	(151, 25, '2023-06-10', 95000.00),
	(152, 25, '2023-07-10', 95000.00),
	(153, 25, '2023-08-10', 95000.00),
	(154, 25, '2023-09-10', 95000.00),
	(155, 25, '2023-10-10', 95000.00),
	(156, 25, '2023-11-10', 95000.00);


CREATE TABLE EmployeeContract (
    ContractID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    OnboardingDate DATE,
    Salary INT,
    HealthInsurance CHAR(5)
);

SET IDENTITY_INSERT EmployeeContract OFF;
INSERT INTO EmployeeContract (ContractID, EmployeeID, OnboardingDate, Salary, HealthInsurance) VALUES
    (26, 1, '2022-01-10', 85000.00, 'true'),
    (27, 2, '2022-02-05', 95000.00, 'true'),
    (28, 3, '2022-03-15', 75000.00, 'false'),
    (29, 4, '2022-04-20', 90000.00, 'true'),
    (30, 5, '2022-05-25', 80000.00, 'true'),
    (31, 6, '2022-06-01', 72000.00, 'false'),
    (32, 7, '2022-07-10', 105000.00, 'true'),
    (33, 8, '2022-08-15', 65000.00, 'false'),
    (34, 9, '2022-09-20', 80000.00, 'true'),
    (35, 10, '2022-10-01', 68000.00, 'false'),
    (36, 11, '2022-11-10', 90000.00, 'true'),
    (37, 12, '2022-12-15', 75000.00, 'false'),
    (38, 13, '2023-01-20', 110000.00, 'true'),
    (39, 14, '2023-02-01', 100000.00, 'true'),
    (40, 15, '2023-03-10', 72000.00, 'false'),
    (41, 16, '2023-04-15', 95000.00, 'true'),
    (42, 17, '2023-05-20', 105000.00, 'true'),
    (43, 18, '2023-06-01', 90000.00, 'true'),
    (44, 19, '2023-07-10', 78000.00, 'false'),
    (45, 20, '2023-08-15', 110000.00, 'true'),
    (46, 21, '2023-09-20', 120000.00, 'true'),
    (47, 22, '2023-10-01', 85000.00, 'false'),
    (48, 23, '2023-11-10', 80000.00, 'true'),
    (49, 24, '2023-12-15', 72000.00, 'false'),
    (50, 25, '2024-01-20', 95000.00, 'true');

--select * from EmployeeContract
select * from Attendance
where EmployeeID=18 and Date='2023-11-25'
CREATE TABLE Announcement (
    MessageID INT PRIMARY KEY,
    ToUser INT,
	FOREIGN KEY (ToUser) REFERENCES employees(EmployeeID),
    Description TEXT
);


-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 1
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (1, 1, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (2, 1, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (3, 1, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (4, 1, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (5, 1, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (6, 1, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (7, 1, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (8, 1, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (9, 1, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (10, 1, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 2
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (11, 2, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (12, 2, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (13, 2, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (14, 2, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (15, 2, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (16, 2, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (17, 2, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (18, 2, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (19, 2, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (20, 2, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 3
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (21, 3, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (22, 3, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (23, 3, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (24, 3, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (25, 3, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (26, 3, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (27, 3, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (28, 3, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (29, 3, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (30, 3, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 4
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (31, 4, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (32, 4, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (33, 4, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (34, 4, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (35, 4, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (36, 4, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (37, 4, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (38, 4, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (39, 4, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (40, 4, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 5
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (41, 5, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (42, 5, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (43, 5, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (44, 5, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (45, 5, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (46, 5, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (47, 5, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (48, 5, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (49, 5, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (50, 5, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 6
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (51, 6, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (52, 6, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (53, 6, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (54, 6, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (55, 6, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (56, 6, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (57, 6, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (58, 6, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (59, 6, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (60, 6, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 7
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (61, 7, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (62, 7, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (63, 7, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (64, 7, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (65, 7, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (66, 7, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (67, 7, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (68, 7, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (69, 7, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (70, 7, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 8
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (71, 8, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (72, 8, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (73, 8, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (74, 8, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (75, 8, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (76, 8, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (77, 8, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (78, 8, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (79, 8, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (80, 8, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 9
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (81, 9, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (82, 9, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (83, 9, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (84, 9, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (85, 9, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (86, 9, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (87, 9, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (88, 9, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (89, 9, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (90, 9, 'Expect IT system maintenance scheduled for Saturday.');
-- Assuming that the employees table already has data with EmployeeID values

-- Inserting 10 announcements for user 10
INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (91, 10, 'Complete quarterly report by the end of the month.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (92, 10, 'Attend the team meeting on Monday at 10 AM.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (93, 10, 'Review and provide feedback on the latest project drafts.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (94, 10, 'Participate in the company-wide training session this Friday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (95, 10, 'Submit expense reports for the current month by Wednesday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (96, 10, 'Join the office party on Friday evening.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (97, 10, 'Prepare presentation slides for the client meeting next week.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (98, 10, 'Review and adhere to the new company policies.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (99, 10, 'Conduct training session for new hires on Thursday.');

INSERT INTO Announcement (MessageID, ToUser, Description)
VALUES (100, 10, 'Expect IT system maintenance scheduled for Saturday.');



select * from Announcement


CREATE TABLE jobs (
    JobID INT PRIMARY KEY,
    Position VARCHAR(50),
    SeniorityLevel VARCHAR(20),
    Department VARCHAR(50),
    Location VARCHAR(50),
    Type VARCHAR(20)
);


INSERT INTO Jobs (JobID, Position, SeniorityLevel, Department, Location, Type) VALUES
    (101, 'Software Engineer', 'Junior', 'Engineering', 'Headquarters', 'Full-time'),
    (201, 'HR Manager', 'Manager', 'Human Resources', 'Headquarters', 'Full-time'),
    (301, 'Marketing Specialist', 'Intermediate', 'Marketing', 'Branch Office A', 'Part-time'),
    (401, 'Finance Analyst', 'Intermediate', 'Finance', 'Branch Office B', 'Full-time'),
    (501, 'Sales Representative', 'Junior', 'Sales', 'Headquarters', 'Full-time'),
    (601, 'Data Analyst', 'Junior', 'Data Analytics', 'Branch Office A', 'Part-time'),
    (701, 'Product Manager', 'Senior', 'Product Management', 'Headquarters', 'Full-time'),
    (801, 'Customer Support Specialist', 'Intermediate', 'Customer Support', 'Branch Office B', 'Full-time'),
    (901, 'Quality Assurance Engineer', 'Junior', 'Quality Assurance', 'Headquarters', 'Part-time'),
    (1001, 'Operations Coordinator', 'Intermediate', 'Operations', 'Branch Office A', 'Full-time'),
    (1101, 'IT Specialist', 'Junior', 'IT', 'Headquarters', 'Full-time'),
    (1201, 'Marketing Coordinator', 'Intermediate', 'Marketing', 'Branch Office B', 'Full-time'),
    (1301, 'Finance Manager', 'Senior', 'Finance', 'Headquarters', 'Full-time'),
    (1401, 'Sales Manager', 'Senior', 'Sales', 'Branch Office A', 'Full-time'),
    (1501, 'HR Specialist', 'Intermediate', 'Human Resources', 'Branch Office B', 'Full-time'),
    (1601, 'Software Developer', 'Intermediate', 'Engineering', 'Headquarters', 'Part-time'),
    (1701, 'IT Manager', 'Senior', 'IT', 'Branch Office A', 'Full-time'),
    (1801, 'Customer Success Manager', 'Senior', 'Customer Support', 'Branch Office B', 'Full-time'),
    (1901, 'Quality Assurance Analyst', 'Intermediate', 'Quality Assurance', 'Headquarters', 'Full-time'),
    (2001, 'Operations Manager', 'Senior', 'Operations', 'Branch Office A', 'Full-time'),
    (2101, 'Marketing Director', 'Senior', 'Marketing', 'Branch Office B', 'Full-time'),
    (2201, 'Finance Analyst', 'Intermediate', 'Finance', 'Headquarters', 'Full-time'),
    (2301, 'Sales Representative', 'Junior', 'Sales', 'Branch Office A', 'Part-time'),
    (2401, 'HR Coordinator', 'Intermediate', 'Human Resources', 'Branch Office B', 'Full-time'),
    (2501, 'Software Engineer', 'Intermediate', 'Engineering', 'Headquarters', 'Full-time');
	


CREATE TABLE Applicants (
    ApplicantID INT IDENTITY(1,1) PRIMARY KEY,
    PositionApplied INT,
	FOREIGN KEY (PositionApplied) REFERENCES jobs(JobID),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Qualifications TEXT,
    DateApplied DATE
);

SET IDENTITY_INSERT Applicants ON;
INSERT INTO Applicants (ApplicantID, PositionApplied, FirstName, LastName, DOB, Email, PhoneNumber, Qualifications, DateApplied) VALUES
    (1, 101, 'Alice', 'Johnson', '1991-06-20', 'alice.johnson@example.com', '555-111-2222', 'Bachelor in Computer Science', '2023-06-01'),
    (2, 201, 'Bob', 'Williams', '1986-09-15', 'bob.williams@example.com', '555-333-4444', 'Master in Human Resources', '2023-07-15'),
    (3, 301, 'Charlie', 'Anderson', '1994-02-28', 'charlie.anderson@example.com', '555-555-6666', 'Bachelor in Marketing', '2023-08-20'),
    (4, 401, 'Diana', 'Smith', '1989-05-05', 'diana.smith@example.com', '555-777-8888', 'Master in Finance', '2023-09-25'),
    (5, 501, 'Edward', 'Wong', '1996-10-12', 'edward.wong@example.com', '555-999-0000', 'Bachelor in Business Administration', '2023-10-30'),
    (6, 601, 'Fiona', 'Chen', '1993-12-02', 'fiona.chen@example.com', '555-123-4567', 'Master in Data Analytics', '2023-11-01'),
    (7, 701, 'George', 'Kim', '1988-04-18', 'george.kim@example.com', '555-234-5678', 'Bachelor in Product Management', '2023-12-06'),
    (8, 801, 'Haley', 'Nguyen', '1995-11-20', 'haley.nguyen@example.com', '555-345-6789', 'Master in Customer Support', '2024-01-10'),
    (9, 901, 'Ian', 'Gomez', '1990-07-30', 'ian.gomez@example.com', '555-456-7890', 'Bachelor in Quality Assurance', '2024-02-15'),
    (10, 1001, 'Julia', 'Kumar', '1997-04-15', 'julia.kumar@example.com', '555-567-8901', 'Master in Operations Management', '2024-03-20'),
    (11, 1101, 'Kevin', 'Patel', '1992-02-25', 'kevin.patel@example.com', '555-678-9012', 'Bachelor in IT', '2024-04-25'),
    (12, 1201, 'Lily', 'Garcia', '1987-07-05', 'lily.garcia@example.com', '555-789-0123', 'Master in Marketing', '2024-05-30'),
    (13, 1301, 'Michael', 'Ng', '1998-10-18', 'michael.ng@example.com', '555-890-1234', 'Bachelor in Finance', '2024-06-01'),
    (14, 1401, 'Natalie', 'Chang', '1984-05-30', 'natalie.chang@example.com', '555-901-2345', 'Master in Sales', '2024-07-10'),
    (15, 1501, 'Oscar', 'Lopez', '1991-08-10', 'oscar.lopez@example.com', '555-012-3456', 'Bachelor in Human Resources', '2024-08-15'),
    (16, 1601, 'Pamela', 'Wu', '1996-01-15', 'pamela.wu@example.com', '555-123-4567', 'Master in Computer Science', '2024-09-20'),
    (17, 1701, 'Quentin', 'Hernandez', '1988-12-20', 'quentin.hernandez@example.com', '555-234-5678', 'Bachelor in IT', '2024-10-01'),
    (18, 1801, 'Rachel', 'Baker', '1995-06-01', 'rachel.baker@example.com', '555-345-6789', 'Master in Customer Support', '2024-11-10'),
    (19, 1901, 'Samuel', 'Harris', '1990-09-10', 'samuel.harris@example.com', '555-456-7890', 'Bachelor in Quality Assurance', '2024-12-15'),
    (20, 2001, 'Tiffany', 'Wright', '1985-02-15', 'tiffany.wright@example.com', '555-567-8901', 'Master in Operations Management', '2025-01-20');
   
   --select * from Applicants
drop table Attendance
CREATE TABLE Attendance (
    EmployeeID INT,
    Date DATE,
	Status varchar(10)
    PRIMARY KEY (EmployeeID, Date),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID)
);
select * from Attendance
INSERT INTO Attendance (EmployeeID, Date, Status)
VALUES
(1, '2023-11-01', 'Present'),
(2, '2023-11-01', 'Present'),
(3, '2023-11-01', 'Present'),
(4, '2023-11-01', 'Present'),
(5, '2023-11-01', 'Present'),
(6, '2023-11-01', 'Present'),
(7, '2023-11-01', 'Present'),
(8, '2023-11-01', 'Present'),
(9, '2023-11-01', 'Present'),
(10, '2023-11-01', 'Present'),
(11, '2023-11-01', 'Present'),
(12, '2023-11-01', 'Present'),
(13, '2023-11-01', 'Present'),
(14, '2023-11-01', 'Absent'),
(15, '2023-11-01', 'Present'),
(16, '2023-11-01', 'Present'),
(17, '2023-11-01', 'Present'),
(18, '2023-11-01', 'Absent'),
(19, '2023-11-01', 'Present'),
(20, '2023-11-01', 'Present'),
(21, '2023-11-01', 'Absent'),
(22, '2023-11-01', 'Present'),
(23, '2023-11-01', 'Present'),
(24, '2023-11-01', 'Present'),
(25, '2023-11-01', 'Absent'),

(1, '2023-11-02', 'Present'),
(2, '2023-11-02', 'Present'),
(3, '2023-11-02', 'Present'),
(4, '2023-11-02', 'Absent'),
(5, '2023-11-02', 'Present'),
(6, '2023-11-02', 'Absent'),
(7, '2023-11-02', 'Present'),
(8, '2023-11-02', 'Present'),
(9, '2023-11-02', 'Present'),
(10, '2023-11-02', 'Present'),
(11, '2023-11-02', 'Present'),
(12, '2023-11-02', 'Present'),
(13, '2023-11-02', 'Present'),
(14, '2023-11-02', 'Present'),
(15, '2023-11-02', 'Present'),
(16, '2023-11-02', 'Present'),
(17, '2023-11-02', 'Present'),
(18, '2023-11-02', 'Present'),
(19, '2023-11-02', 'Absent'),
(20, '2023-11-02', 'Present'),
(21, '2023-11-02', 'Present'),
(22, '2023-11-02', 'Present'),
(23, '2023-11-02', 'Present'),
(24, '2023-11-02', 'Present'),
(25, '2023-11-02', 'Present'),

(1, '2023-11-03', 'Present'),
(2, '2023-11-03', 'Present'),
(3, '2023-11-03', 'Absent'),
(4, '2023-11-03', 'Present'),
(5, '2023-11-03', 'Present'),
(6, '2023-11-03', 'Absent'),
(7, '2023-11-03', 'Present'),
(8, '2023-11-03', 'Absent'),
(9, '2023-11-03', 'Present'),
(10, '2023-11-03', 'Present'),
(11, '2023-11-03', 'Absent'),
(12, '2023-11-03', 'Present'),
(13, '2023-11-03', 'Present'),
(14, '2023-11-03', 'Present'),
(15, '2023-11-03', 'Absent'),
(16, '2023-11-03', 'Present'),
(17, '2023-11-03', 'Present'),
(18, '2023-11-03', 'Present'),
(19, '2023-11-03', 'Present'),
(20, '2023-11-03', 'Present'),
(21, '2023-11-03', 'Present'),
(22, '2023-11-03', 'Absent'),
(23, '2023-11-03', 'Present'),
(24, '2023-11-03', 'Absent'),
(25, '2023-11-03', 'Absent'),

(1, '2023-11-04', 'Present'),
(2, '2023-11-04', 'Absent'),
(3, '2023-11-04', 'Absent'),
(4, '2023-11-04', 'Present'),
(5, '2023-11-04', 'Present'),
(6, '2023-11-04', 'Present'),
(7, '2023-11-04', 'Present'),
(8, '2023-11-04', 'Present'),
(9, '2023-11-04', 'Absent'),
(10, '2023-11-04', 'Present'),
(11, '2023-11-04', 'Present'),
(12, '2023-11-04', 'Present'),
(13, '2023-11-04', 'Present'),
(14, '2023-11-04', 'Absent'),
(15, '2023-11-04', 'Present'),
(16, '2023-11-04', 'Present'),
(17, '2023-11-04', 'Present'),
(18, '2023-11-04', 'Present'),
(19, '2023-11-04', 'Present'),
(20, '2023-11-04', 'Present'),
(21, '2023-11-04', 'Present'),
(22, '2023-11-04', 'Present'),
(23, '2023-11-04', 'Present'),
(24, '2023-11-04', 'Present'),
(25, '2023-11-04', 'Present'),

(1, '2023-11-05', 'Present'),
(2, '2023-11-05', 'Present'),
(3, '2023-11-05', 'Present'),
(4, '2023-11-05', 'Present'),
(5, '2023-11-05', 'Present'),
(6, '2023-11-05', 'Present'),
(7, '2023-11-05', 'Present'),
(8, '2023-11-05', 'Present'),
(9, '2023-11-05', 'Present'),
(10, '2023-11-05', 'Present'),
(11, '2023-11-05', 'Absent'),
(12, '2023-11-05', 'Present'),
(13, '2023-11-05', 'Present'),
(14, '2023-11-05', 'Present'),
(15, '2023-11-05', 'Absent'),
(16, '2023-11-05', 'Present'),
(17, '2023-11-05', 'Present'),
(18, '2023-11-05', 'Present'),
(19, '2023-11-05', 'Absent'),
(20, '2023-11-05', 'Present'),
(21, '2023-11-05', 'Present'),
(22, '2023-11-05', 'Absent'),
(23, '2023-11-05', 'Present'),
(24, '2023-11-05', 'Present'),
(25, '2023-11-05', 'Present'),

(1, '2023-11-06', 'Absent'),
(2, '2023-11-06', 'Present'),
(3, '2023-11-06', 'Present'),
(4, '2023-11-06', 'Present'),
(5, '2023-11-06', 'Absent'),
(6, '2023-11-06', 'Absent'),
(7, '2023-11-06', 'Present'),
(8, '2023-11-06', 'Present'),
(9, '2023-11-06', 'Present'),
(10, '2023-11-06', 'Present'),
(11, '2023-11-06', 'Absent'),
(12, '2023-11-06', 'Absent'),
(13, '2023-11-06', 'Present'),
(14, '2023-11-06', 'Present'),
(15, '2023-11-06', 'Present'),
(16, '2023-11-06', 'Absent'),
(17, '2023-11-06', 'Present'),
(18, '2023-11-06', 'Present'),
(19, '2023-11-06', 'Present'),
(20, '2023-11-06', 'Present'),
(21, '2023-11-06', 'Present'),
(22, '2023-11-06', 'Present'),
(23, '2023-11-06', 'Present'),
(24, '2023-11-06', 'Present'),
(25, '2023-11-06', 'Present'),

(1, '2023-11-07', 'Absent'),
(2, '2023-11-07', 'Absent'),
(3, '2023-11-07', 'Present'),
(4, '2023-11-07', 'Present'),
(5, '2023-11-07', 'Present'),
(6, '2023-11-07', 'Present'),
(7, '2023-11-07', 'Present'),
(8, '2023-11-07', 'Present'),
(9, '2023-11-07', 'Present'),
(10, '2023-11-07', 'Present'),
(11, '2023-11-07', 'Present'),
(12, '2023-11-07', 'Present'),
(13, '2023-11-07', 'Absent'),
(14, '2023-11-07', 'Present'),
(15, '2023-11-07', 'Present'),
(16, '2023-11-07', 'Present'),
(17, '2023-11-07', 'Absent'),
(18, '2023-11-07', 'Present'),
(19, '2023-11-07', 'Present'),
(20, '2023-11-07', 'Present'),
(21, '2023-11-07', 'Absent'),
(22, '2023-11-07', 'Present'),
(23, '2023-11-07', 'Present'),
(24, '2023-11-07', 'Present'),
(25, '2023-11-07', 'Present'),

(1, '2023-11-08', 'Absent'),
(2, '2023-11-08', 'Present'),
(3, '2023-11-08', 'Absent'),
(4, '2023-11-08', 'Present'),
(5, '2023-11-08', 'Present'),
(6, '2023-11-08', 'Present'),
(7, '2023-11-08', 'Absent'),
(8, '2023-11-08', 'Present'),
(9, '2023-11-08', 'Present'),
(10, '2023-11-08', 'Present'),
(11, '2023-11-08', 'Absent'),
(12, '2023-11-08', 'Present'),
(13, '2023-11-08', 'Absent'),
(14, '2023-11-08', 'Present'),
(15, '2023-11-08', 'Present'),
(16, '2023-11-08', 'Present'),
(17, '2023-11-08', 'Present'),
(18, '2023-11-08', 'Present'),
(19, '2023-11-08', 'Present'),
(20, '2023-11-08', 'Present'),
(21, '2023-11-08', 'Present'),
(22, '2023-11-08', 'Absent'),
(23, '2023-11-08', 'Present'),
(24, '2023-11-08', 'Present'),
(25, '2023-11-08', 'Present'),

(1, '2023-11-09', 'Present'),
(2, '2023-11-09', 'Present'),
(3, '2023-11-09', 'Absent'),
(4, '2023-11-09', 'Present'),
(5, '2023-11-09', 'Present'),
(6, '2023-11-09', 'Present'),
(7, '2023-11-09', 'Present'),
(8, '2023-11-09', 'Present'),
(9, '2023-11-09', 'Present'),
(10, '2023-11-09', 'Present'),
(11, '2023-11-09', 'Present'),
(12, '2023-11-09', 'Present'),
(13, '2023-11-09', 'Present'),
(14, '2023-11-09', 'Present'),
(15, '2023-11-09', 'Present'),
(16, '2023-11-09', 'Absent'),
(17, '2023-11-09', 'Present'),
(18, '2023-11-09', 'Present'),
(19, '2023-11-09', 'Absent'),
(20, '2023-11-09', 'Present'),
(21, '2023-11-09', 'Present'),
(22, '2023-11-09', 'Present'),
(23, '2023-11-09', 'Present'),
(24, '2023-11-09', 'Absent'),
(25, '2023-11-09', 'Present'),

(1, '2023-11-10', 'Present'),
(2, '2023-11-10', 'Present'),
(3, '2023-11-10', 'Present'),
(4, '2023-11-10', 'Present'),
(5, '2023-11-10', 'Present'),
(6, '2023-11-10', 'Present'),
(7, '2023-11-10', 'Present'),
(8, '2023-11-10', 'Absent'),
(9, '2023-11-10', 'Absent'),
(10, '2023-11-10', 'Present'),
(11, '2023-11-10', 'Absent'),
(12, '2023-11-10', 'Present'),
(13, '2023-11-10', 'Present'),
(14, '2023-11-10', 'Absent'),
(15, '2023-11-10', 'Present'),
(16, '2023-11-10', 'Present'),
(17, '2023-11-10', 'Absent'),
(18, '2023-11-10', 'Present'),
(19, '2023-11-10', 'Present'),
(20, '2023-11-10', 'Present'),
(21, '2023-11-10', 'Present'),
(22, '2023-11-10', 'Present'),
(23, '2023-11-10', 'Present'),
(24, '2023-11-10', 'Present'),
(25, '2023-11-10', 'Present'),

(1, '2023-11-11', 'Present'),
(2, '2023-11-11', 'Present'),
(3, '2023-11-11', 'Present'),
(4, '2023-11-11', 'Present'),
(5, '2023-11-11', 'Present'),
(6, '2023-11-11', 'Present'),
(7, '2023-11-11', 'Present'),
(8, '2023-11-11', 'Absent'),
(9, '2023-11-11', 'Present'),
(10, '2023-11-11', 'Present'),
(11, '2023-11-11', 'Present'),
(12, '2023-11-11', 'Absent'),
(13, '2023-11-11', 'Absent'),
(14, '2023-11-11', 'Present'),
(15, '2023-11-11', 'Absent'),
(16, '2023-11-11', 'Absent'),
(17, '2023-11-11', 'Present'),
(18, '2023-11-11', 'Present'),
(19, '2023-11-11', 'Present'),
(20, '2023-11-11', 'Absent'),
(21, '2023-11-11', 'Present'),
(22, '2023-11-11', 'Present'),
(23, '2023-11-11', 'Absent'),
(24, '2023-11-11', 'Absent'),
(25, '2023-11-11', 'Present'),

(1, '2023-11-12', 'Absent'),
(2, '2023-11-12', 'Present'),
(3, '2023-11-12', 'Present'),
(4, '2023-11-12', 'Present'),
(5, '2023-11-12', 'Present'),
(6, '2023-11-12', 'Present'),
(7, '2023-11-12', 'Absent'),
(8, '2023-11-12', 'Present'),
(9, '2023-11-12', 'Present'),
(10, '2023-11-12', 'Present'),
(11, '2023-11-12', 'Present'),
(12, '2023-11-12', 'Present'),
(13, '2023-11-12', 'Present'),
(14, '2023-11-12', 'Present'),
(15, '2023-11-12', 'Present'),
(16, '2023-11-12', 'Present'),
(17, '2023-11-12', 'Present'),
(18, '2023-11-12', 'Present'),
(19, '2023-11-12', 'Present'),
(20, '2023-11-12', 'Absent'),
(21, '2023-11-12', 'Present'),
(22, '2023-11-12', 'Present'),
(23, '2023-11-12', 'Present'),
(24, '2023-11-12', 'Present'),
(25, '2023-11-12', 'Present'),

(1, '2023-11-13', 'Present'),
(2, '2023-11-13', 'Present'),
(3, '2023-11-13', 'Present'),
(4, '2023-11-13', 'Absent'),
(5, '2023-11-13', 'Present'),
(6, '2023-11-13', 'Present'),
(7, '2023-11-13', 'Present'),
(8, '2023-11-13', 'Present'),
(9, '2023-11-13', 'Absent'),
(10, '2023-11-13', 'Present'),
(11, '2023-11-13', 'Present'),
(12, '2023-11-13', 'Present'),
(13, '2023-11-13', 'Present'),
(14, '2023-11-13', 'Present'),
(15, '2023-11-13', 'Present'),
(16, '2023-11-13', 'Present'),
(17, '2023-11-13', 'Present'),
(18, '2023-11-13', 'Present'),
(19, '2023-11-13', 'Present'),
(20, '2023-11-13', 'Present'),
(21, '2023-11-13', 'Present'),
(22, '2023-11-13', 'Absent'),
(23, '2023-11-13', 'Present'),
(24, '2023-11-13', 'Present'),
(25, '2023-11-13', 'Present'),

(1, '2023-11-14', 'Present'),
(2, '2023-11-14', 'Present'),
(3, '2023-11-14', 'Present'),
(4, '2023-11-14', 'Present'),
(5, '2023-11-14', 'Present'),
(6, '2023-11-14', 'Present'),
(7, '2023-11-14', 'Present'),
(8, '2023-11-14', 'Absent'),
(9, '2023-11-14', 'Present'),
(10, '2023-11-14', 'Present'),
(11, '2023-11-14', 'Present'),
(12, '2023-11-14', 'Present'),
(13, '2023-11-14', 'Present'),
(14, '2023-11-14', 'Present'),
(15, '2023-11-14', 'Present'),
(16, '2023-11-14', 'Present'),
(17, '2023-11-14', 'Present'),
(18, '2023-11-14', 'Present'),
(19, '2023-11-14', 'Present'),
(20, '2023-11-14', 'Present'),
(21, '2023-11-14', 'Present'),
(22, '2023-11-14', 'Present'),
(23, '2023-11-14', 'Present'),
(24, '2023-11-14', 'Absent'),
(25, '2023-11-14', 'Present'),

(1, '2023-11-15', 'Absent'),
(2, '2023-11-15', 'Present'),
(3, '2023-11-15', 'Absent'),
(4, '2023-11-15', 'Present'),
(5, '2023-11-15', 'Present'),
(6, '2023-11-15', 'Present'),
(7, '2023-11-15', 'Present'),
(8, '2023-11-15', 'Present'),
(9, '2023-11-15', 'Present'),
(10, '2023-11-15', 'Present'),
(11, '2023-11-15', 'Present'),
(12, '2023-11-15', 'Present'),
(13, '2023-11-15', 'Present'),
(14, '2023-11-15', 'Present'),
(15, '2023-11-15', 'Present'),
(16, '2023-11-15', 'Present'),
(17, '2023-11-15', 'Present'),
(18, '2023-11-15', 'Absent'),
(19, '2023-11-15', 'Present'),
(20, '2023-11-15', 'Present'),
(21, '2023-11-15', 'Present'),
(22, '2023-11-15', 'Absent'),
(23, '2023-11-15', 'Present'),
(24, '2023-11-15', 'Present'),
(25, '2023-11-15', 'Present'),

(1, '2023-11-16', 'Present'),
(2, '2023-11-16', 'Absent'),
(3, '2023-11-16', 'Present'),
(4, '2023-11-16', 'Present'),
(5, '2023-11-16', 'Present'),
(6, '2023-11-16', 'Present'),
(7, '2023-11-16', 'Present'),
(8, '2023-11-16', 'Present'),
(9, '2023-11-16', 'Absent'),
(10, '2023-11-16', 'Present'),
(11, '2023-11-16', 'Present'),
(12, '2023-11-16', 'Present'),
(13, '2023-11-16', 'Present'),
(14, '2023-11-16', 'Present'),
(15, '2023-11-16', 'Present'),
(16, '2023-11-16', 'Present'),
(17, '2023-11-16', 'Present'),
(18, '2023-11-16', 'Present'),
(19, '2023-11-16', 'Present'),
(20, '2023-11-16', 'Present'),
(21, '2023-11-16', 'Present'),
(22, '2023-11-16', 'Absent'),
(23, '2023-11-16', 'Present'),
(24, '2023-11-16', 'Present'),
(25, '2023-11-16', 'Present'),

(1, '2023-11-17', 'Absent'),
(2, '2023-11-17', 'Present'),
(3, '2023-11-17', 'Present'),
(4, '2023-11-17', 'Present'),
(5, '2023-11-17', 'Present'),
(6, '2023-11-17', 'Absent'),
(7, '2023-11-17', 'Present'),
(8, '2023-11-17', 'Absent'),
(9, '2023-11-17', 'Present'),
(10, '2023-11-17', 'Present'),
(11, '2023-11-17', 'Absent'),
(12, '2023-11-17', 'Present'),
(13, '2023-11-17', 'Absent'),
(14, '2023-11-17', 'Present'),
(15, '2023-11-17', 'Present'),
(16, '2023-11-17', 'Present'),
(17, '2023-11-17', 'Present'),
(18, '2023-11-17', 'Absent'),
(19, '2023-11-17', 'Absent'),
(20, '2023-11-17', 'Present'),
(21, '2023-11-17', 'Present'),
(22, '2023-11-17', 'Present'),
(23, '2023-11-17', 'Absent'),
(24, '2023-11-17', 'Present'),
(25, '2023-11-17', 'Present'),

(1, '2023-11-18', 'Present'),
(2, '2023-11-18', 'Present'),
(3, '2023-11-18', 'Absent'),
(4, '2023-11-18', 'Present'),
(5, '2023-11-18', 'Present'),
(6, '2023-11-18', 'Present'),
(7, '2023-11-18', 'Absent'),
(8, '2023-11-18', 'Present'),
(9, '2023-11-18', 'Present'),
(10, '2023-11-18', 'Present'),
(11, '2023-11-18', 'Present'),
(12, '2023-11-18', 'Present'),
(13, '2023-11-18', 'Present'),
(14, '2023-11-18', 'Present'),
(15, '2023-11-18', 'Absent'),
(16, '2023-11-18', 'Present'),
(17, '2023-11-18', 'Present'),
(18, '2023-11-18', 'Present'),
(19, '2023-11-18', 'Present'),
(20, '2023-11-18', 'Present'),
(21, '2023-11-18', 'Absent'),
(22, '2023-11-18', 'Present'),
(23, '2023-11-18', 'Present'),
(24, '2023-11-18', 'Absent'),
(25, '2023-11-18', 'Present'),

(1, '2023-11-19', 'Present'),
(2, '2023-11-19', 'Present'),
(3, '2023-11-19', 'Present'),
(4, '2023-11-19', 'Present'),
(5, '2023-11-19', 'Present'),
(6, '2023-11-19', 'Present'),
(7, '2023-11-19', 'Present'),
(8, '2023-11-19', 'Present'),
(9, '2023-11-19', 'Present'),
(10, '2023-11-19', 'Present'),
(11, '2023-11-19', 'Present'),
(12, '2023-11-19', 'Present'),
(13, '2023-11-19', 'Present'),
(14, '2023-11-19', 'Absent'),
(15, '2023-11-19', 'Present'),
(16, '2023-11-19', 'Absent'),
(17, '2023-11-19', 'Present'),
(18, '2023-11-19', 'Present'),
(19, '2023-11-19', 'Present'),
(20, '2023-11-19', 'Present'),
(21, '2023-11-19', 'Present'),
(22, '2023-11-19', 'Present'),
(23, '2023-11-19', 'Present'),
(24, '2023-11-19', 'Present'),
(25, '2023-11-19', 'Present'),

(1, '2023-11-20', 'Present'),
(2, '2023-11-20', 'Present'),
(3, '2023-11-20', 'Present'),
(4, '2023-11-20', 'Present'),
(5, '2023-11-20', 'Present'),
(6, '2023-11-20', 'Present'),
(7, '2023-11-20', 'Absent'),
(8, '2023-11-20', 'Present'),
(9, '2023-11-20', 'Present'),
(10, '2023-11-20', 'Present'),
(11, '2023-11-20', 'Present'),
(12, '2023-11-20', 'Present'),
(13, '2023-11-20', 'Present'),
(14, '2023-11-20', 'Present'),
(15, '2023-11-20', 'Present'),
(16, '2023-11-20', 'Present'),
(17, '2023-11-20', 'Present'),
(18, '2023-11-20', 'Present'),
(19, '2023-11-20', 'Absent'),
(20, '2023-11-20', 'Present'),
(21, '2023-11-20', 'Absent'),
(22, '2023-11-20', 'Present'),
(23, '2023-11-20', 'Present'),
(24, '2023-11-20', 'Present'),
(25, '2023-11-20', 'Present'),

(1, '2023-11-21', 'Present'),
(2, '2023-11-21', 'Present'),
(3, '2023-11-21', 'Present'),
(4, '2023-11-21', 'Present'),
(5, '2023-11-21', 'Present'),
(6, '2023-11-21', 'Present'),
(7, '2023-11-21', 'Present'),
(8, '2023-11-21', 'Present'),
(9, '2023-11-21', 'Present'),
(10, '2023-11-21', 'Absent'),
(11, '2023-11-21', 'Present'),
(12, '2023-11-21', 'Present'),
(13, '2023-11-21', 'Present'),
(14, '2023-11-21', 'Present'),
(15, '2023-11-21', 'Absent'),
(16, '2023-11-21', 'Absent'),
(17, '2023-11-21', 'Present'),
(18, '2023-11-21', 'Absent'),
(19, '2023-11-21', 'Present'),
(20, '2023-11-21', 'Present'),
(21, '2023-11-21', 'Absent'),
(22, '2023-11-21', 'Present'),
(23, '2023-11-21', 'Present'),
(24, '2023-11-21', 'Present'),
(25, '2023-11-21', 'Present'),

(1, '2023-11-22', 'Absent'),
(2, '2023-11-22', 'Present'),
(3, '2023-11-22', 'Present'),
(4, '2023-11-22', 'Present'),
(5, '2023-11-22', 'Present'),
(6, '2023-11-22', 'Present'),
(7, '2023-11-22', 'Present'),
(8, '2023-11-22', 'Present'),
(9, '2023-11-22', 'Present'),
(10, '2023-11-22', 'Present'),
(11, '2023-11-22', 'Present'),
(12, '2023-11-22', 'Present'),
(13, '2023-11-22', 'Absent'),
(14, '2023-11-22', 'Present'),
(15, '2023-11-22', 'Present'),
(16, '2023-11-22', 'Absent'),
(17, '2023-11-22', 'Present'),
(18, '2023-11-22', 'Present'),
(19, '2023-11-22', 'Present'),
(20, '2023-11-22', 'Absent'),
(21, '2023-11-22', 'Present'),
(22, '2023-11-22', 'Present'),
(23, '2023-11-22', 'Present'),
(24, '2023-11-22', 'Present'),
(25, '2023-11-22', 'Present'),

(1, '2023-11-23', 'Absent'),
(2, '2023-11-23', 'Present'),
(3, '2023-11-23', 'Present'),
(4, '2023-11-23', 'Present'),
(5, '2023-11-23', 'Present'),
(6, '2023-11-23', 'Present'),
(7, '2023-11-23', 'Present'),
(8, '2023-11-23', 'Present'),
(9, '2023-11-23', 'Present'),
(10, '2023-11-23', 'Present'),
(11, '2023-11-23', 'Absent'),
(12, '2023-11-23', 'Present'),
(13, '2023-11-23', 'Absent'),
(14, '2023-11-23', 'Present'),
(15, '2023-11-23', 'Present'),
(16, '2023-11-23', 'Present'),
(17, '2023-11-23', 'Present'),
(18, '2023-11-23', 'Present'),
(19, '2023-11-23', 'Absent'),
(20, '2023-11-23', 'Present'),
(21, '2023-11-23', 'Present'),
(22, '2023-11-23', 'Present'),
(23, '2023-11-23', 'Present'),
(24, '2023-11-23', 'Present'),
(25, '2023-11-23', 'Present'),

(1, '2023-11-24', 'Present'),
(2, '2023-11-24', 'Absent'),
(3, '2023-11-24', 'Present'),
(4, '2023-11-24', 'Present'),
(5, '2023-11-24', 'Present'),
(6, '2023-11-24', 'Present'),
(7, '2023-11-24', 'Present'),
(8, '2023-11-24', 'Present'),
(9, '2023-11-24', 'Present'),
(10, '2023-11-24', 'Absent'),
(11, '2023-11-24', 'Present'),
(12, '2023-11-24', 'Present'),
(13, '2023-11-24', 'Present'),
(14, '2023-11-24', 'Present'),
(15, '2023-11-24', 'Absent'),
(16, '2023-11-24', 'Present'),
(17, '2023-11-24', 'Absent'),
(18, '2023-11-24', 'Present'),
(19, '2023-11-24', 'Absent'),
(20, '2023-11-24', 'Absent'),
(21, '2023-11-24', 'Present'),
(22, '2023-11-24', 'Present'),
(23, '2023-11-24', 'Present'),
(24, '2023-11-24', 'Absent'),
(25, '2023-11-24', 'Present'),

(1, '2023-11-25', 'Present'),
(2, '2023-11-25', 'Absent'),
(3, '2023-11-25', 'Present'),
(4, '2023-11-25', 'Present'),
(5, '2023-11-25', 'Present'),
(6, '2023-11-25', 'Present'),
(7, '2023-11-25', 'Present'),
(8, '2023-11-25', 'Absent'),
(9, '2023-11-25', 'Present'),
(10, '2023-11-25', 'Present'),
(11, '2023-11-25', 'Present'),
(12, '2023-11-25', 'Present'),
(13, '2023-11-25', 'Present'),
(14, '2023-11-25', 'Present'),
(15, '2023-11-25', 'Present'),
(16, '2023-11-25', 'Present'),
(17, '2023-11-25', 'Present'),
(18, '2023-11-25', 'Absent'),
(19, '2023-11-25', 'Present'),
(20, '2023-11-25', 'Present'),
(21, '2023-11-25', 'Present'),
(22, '2023-11-25', 'Present'),
(23, '2023-11-25', 'Absent'),
(24, '2023-11-25', 'Absent'),
(25, '2023-11-25', 'Absent'),

(1, '2023-11-26', 'Present'),
(2, '2023-11-26', 'Present'),
(3, '2023-11-26', 'Present'),
(4, '2023-11-26', 'Absent'),
(5, '2023-11-26', 'Present'),
(6, '2023-11-26', 'Present'),
(7, '2023-11-26', 'Present'),
(8, '2023-11-26', 'Absent'),
(9, '2023-11-26', 'Absent'),
(10, '2023-11-26', 'Present'),
(11, '2023-11-26', 'Present'),
(12, '2023-11-26', 'Present'),
(13, '2023-11-26', 'Present'),
(14, '2023-11-26', 'Absent'),
(15, '2023-11-26', 'Present'),
(16, '2023-11-26', 'Present'),
(17, '2023-11-26', 'Present'),
(18, '2023-11-26', 'Present'),
(19, '2023-11-26', 'Absent'),
(20, '2023-11-26', 'Present'),
(21, '2023-11-26', 'Present'),
(22, '2023-11-26', 'Present'),
(23, '2023-11-26', 'Present'),
(24, '2023-11-26', 'Present'),
(25, '2023-11-26', 'Present'),

(1, '2023-11-27', 'Present'),
(2, '2023-11-27', 'Present'),
(3, '2023-11-27', 'Present'),
(4, '2023-11-27', 'Absent'),
(5, '2023-11-27', 'Present'),
(6, '2023-11-27', 'Absent'),
(7, '2023-11-27', 'Absent'),
(8, '2023-11-27', 'Present'),
(9, '2023-11-27', 'Present'),
(10, '2023-11-27', 'Absent'),
(11, '2023-11-27', 'Present'),
(12, '2023-11-27', 'Present'),
(13, '2023-11-27', 'Present'),
(14, '2023-11-27', 'Present'),
(15, '2023-11-27', 'Present'),
(16, '2023-11-27', 'Absent'),
(17, '2023-11-27', 'Present'),
(18, '2023-11-27', 'Absent'),
(19, '2023-11-27', 'Absent'),
(20, '2023-11-27', 'Absent'),
(21, '2023-11-27', 'Present'),
(22, '2023-11-27', 'Present'),
(23, '2023-11-27', 'Absent'),
(24, '2023-11-27', 'Present'),
(25, '2023-11-27', 'Present'),

(1, '2023-11-28', 'Present'),
(2, '2023-11-28', 'Present'),
(3, '2023-11-28', 'Present'),
(4, '2023-11-28', 'Absent'),
(5, '2023-11-28', 'Absent'),
(6, '2023-11-28', 'Present'),
(7, '2023-11-28', 'Absent'),
(8, '2023-11-28', 'Present'),
(9, '2023-11-28', 'Absent'),
(10, '2023-11-28', 'Present'),
(11, '2023-11-28', 'Present'),
(12, '2023-11-28', 'Present'),
(13, '2023-11-28', 'Present'),
(14, '2023-11-28', 'Absent'),
(15, '2023-11-28', 'Present'),
(16, '2023-11-28', 'Present'),
(17, '2023-11-28', 'Present'),
(18, '2023-11-28', 'Absent'),
(19, '2023-11-28', 'Present'),
(20, '2023-11-28', 'Present'),
(21, '2023-11-28', 'Present'),
(22, '2023-11-28', 'Present'),
(23, '2023-11-28', 'Absent'),
(24, '2023-11-28', 'Present'),
(25, '2023-11-28', 'Present'),

(1, '2023-11-29', 'Absent'),
(2, '2023-11-29', 'Present'),
(3, '2023-11-29', 'Present'),
(4, '2023-11-29', 'Present'),
(5, '2023-11-29', 'Present'),
(6, '2023-11-29', 'Present'),
(7, '2023-11-29', 'Present'),
(8, '2023-11-29', 'Present'),
(9, '2023-11-29', 'Present'),
(10, '2023-11-29', 'Present'),
(11, '2023-11-29', 'Present'),
(12, '2023-11-29', 'Present'),
(13, '2023-11-29', 'Present'),
(14, '2023-11-29', 'Present'),
(15, '2023-11-29', 'Present'),
(16, '2023-11-29', 'Present'),
(17, '2023-11-29', 'Present'),
(18, '2023-11-29', 'Present'),
(19, '2023-11-29', 'Present'),
(20, '2023-11-29', 'Present'),
(21, '2023-11-29', 'Present'),
(22, '2023-11-29', 'Present'),
(23, '2023-11-29', 'Present'),
(24, '2023-11-29', 'Present'),
(25, '2023-11-29', 'Present'),

(1, '2023-11-30', 'Present'),
(2, '2023-11-30', 'Present'),
(3, '2023-11-30', 'Present'),
(4, '2023-11-30', 'Present'),
(5, '2023-11-30', 'Present'),
(6, '2023-11-30', 'Absent'),
(7, '2023-11-30', 'Present'),
(8, '2023-11-30', 'Present'),
(9, '2023-11-30', 'Absent'),
(10, '2023-11-30', 'Present'),
(11, '2023-11-30', 'Present'),
(12, '2023-11-30', 'Absent'),
(13, '2023-11-30', 'Present'),
(14, '2023-11-30', 'Present'),
(15, '2023-11-30', 'Absent'),
(16, '2023-11-30', 'Present'),
(17, '2023-11-30', 'Present'),
(18, '2023-11-30', 'Absent'),
(19, '2023-11-30', 'Present'),
(20, '2023-11-30', 'Present'),
(21, '2023-11-30', 'Present'),
(22, '2023-11-30', 'Present'),
(23, '2023-11-30', 'Present'),
(24, '2023-11-30', 'Present'),
(25, '2023-11-30', 'Present');

