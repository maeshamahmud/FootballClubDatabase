INSERT INTO Location (Name, Address, City, Province, PostalCode, TelephoneNumber, WebAddress, Type, Capacity, Personnels)
VALUES
('Head Office', '123 Main St', 'Metropolis', 'State', '12345', '123-456-7890', 'www.headoffice.com', 'Head', 500, 'John Doe'),
('Branch A', '456 Elm St', 'Gotham', 'State', '67890', '123-456-7891', 'www.branchA.com', 'Branch', 300, 'Jane Smith'),
('Branch B', '789 Oak St', 'Star City', 'State', '11223', '123-456-7892', 'www.branchB.com', 'Branch', 200, 'Jim Brown'),
('Branch C', '101 Pine St', 'Central City', 'State', '44556', '123-456-7893', 'www.branchC.com', 'Branch', 400, 'Jake White'),
('Branch D', '202 Cedar St', 'Coast City', 'State', '77889', '123-456-7894', 'www.branchD.com', 'Branch', 350, 'Jill Black');

INSERT INTO Personnel (FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicalCardNumber, TelephoneNumber, Address, City, Province, PostalCode, EmailAddress, Role, Mandate, StartDate, EndDate)
VALUES
('Alice', 'Johnson', '1980-01-01', '123-45-6789', 'MC12345', '555-555-5555', '123 Birch St', 'Metropolis', 'State', '12345', 'alice@domain.com', 'GeneralManager', 'Salaried', '2020-01-01', NULL),
('Bob', 'Williams', '1985-02-02', '234-56-7890', 'MC23456', '555-555-5556', '456 Spruce St', 'Gotham', 'State', '67890', 'bob@domain.com', 'Administrator', 'Volunteer', '2019-02-01', '2023-01-01'),
('Charlie', 'Brown', '1990-03-03', '345-67-8901', 'MC34567', '555-555-5557', '789 Willow St', 'Star City', 'State', '11223', 'charlie@domain.com', 'Administrator', 'Salaried', '2021-03-01', NULL),
('David', 'Smith', '1975-04-04', '456-78-9012', 'MC45678', '555-555-5558', '101 Fir St', 'Central City', 'State', '44556', 'david@domain.com', 'Other', 'Volunteer', '2020-04-01', '2022-04-01'),
('Eva', 'Davis', '1982-05-05', '567-89-0123', 'MC56789', '555-555-5559', '202 Maple St', 'Coast City', 'State', '77889', 'eva@domain.com', 'Trainer', 'Salaried', '2022-05-01', NULL);

INSERT INTO PersonnelLocations (PersonnelID, LocationID, StartDate, EndDate)
VALUES
(1, 1, '2020-01-01', NULL),
(2, 2, '2019-02-01', '2023-01-01'),
(3, 3, '2021-03-01', NULL),
(4, 4, '2020-04-01', '2022-04-01'),
(5, 5, '2022-05-01', NULL);

INSERT INTO FamilyMember (FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicalCardNumber, TelephoneNumber, Address, City, Province, PostalCode, EmailAddress, LocationID)
VALUES
('George', 'Martin', '2005-01-01', '678-90-1234', 'MC67890', '555-555-5560', '303 Birch St', 'Metropolis', 'State', '12345', 'george@domain.com', 1),
('Hannah', 'Lee', '2010-02-02', '789-01-2345', 'MC78901', '555-555-5561', '404 Spruce St', 'Gotham', 'State', '67890', 'hannah@domain.com', 2),
('Ian', 'Clark', '2008-03-03', '890-12-3456', 'MC89012', '555-555-5562', '505 Willow St', 'Star City', 'State', '11223', 'ian@domain.com', 3),
('Jane', 'Moore', '2012-04-04', '901-23-4567', 'MC90123', '555-555-5563', '606 Fir St', 'Central City', 'State', '44556', 'jane@domain.com', 4),
('Kyle', 'White', '2007-05-05', '012-34-5678', 'MC01234', '555-555-5564', '707 Maple St', 'Coast City', 'State', '77889', 'kyle@domain.com', 5);

INSERT INTO SecondaryFamilyMember (FirstName, LastName, TelephoneNumber, FamilyMemberID)
VALUES
('Laura', 'Martin', '555-555-5565', 1),
('Michael', 'Lee', '555-555-5566', 2),
('Natalie', 'Clark', '555-555-5567', 3),
('Oliver', 'Moore', '555-555-5568', 4),
('Paul', 'White', '555-555-5569', 5);

INSERT INTO ClubMembers (FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicalCardNumber, TelephoneNumber, Address, City, Province, PostalCode, TeamType, Status, Role, ClubMembershipNumber)
VALUES
('Adam', 'Johnson', '2000-01-01', '234-56-7891', 'MC23456', '555-555-5570', '808 Birch St', 'Metropolis', 'State', '12345', 'Junior', 'Active', 'GoalKeeper', 'CMN12345'),
('Brian', 'Williams', '1995-02-02', '345-67-8902', 'MC34567', '555-555-5571', '909 Spruce St', 'Gotham', 'State', '67890', 'Senior', 'Inactive', 'Defender', 'CMN23456'),
('Chris', 'Brown', '2002-03-03', '456-78-9013', 'MC45678', '555-555-5572', '1010 Willow St', 'Star City', 'State', '11223', 'Junior', 'Active', 'Midfielder', 'CMN34567'),
('Daniel', 'Smith', '1998-04-04', '567-89-0124', 'MC56789', '555-555-5573', '1111 Fir St', 'Central City', 'State', '44556', 'Senior', 'Inactive', 'Forward', 'CMN45678'),
('Evan', 'Davis', '2001-05-05', '678-90-1235', 'MC67890', '555-555-5574', '1212 Maple St', 'Coast City', 'State', '77889', 'Junior', 'Active', 'GoalKeeper', 'CMN56789');

INSERT INTO SecondaryFamilyRelated (Relationship, SecondaryFamilyMemberID, ClubMemberID)
VALUES
('Mother', 1, 1),
('Father', 2, 2),
('Tutor', 3, 3),
('Friend', 4, 4),
('Other', 5, 5);

INSERT INTO FamilyRelated (ClubMemberID, FamilyMemberID, Relationship, StartDate, EndDate)
VALUES
(1, 1, 'Parent', '2020-01-01', NULL),
(2, 2, 'Sibling', '2019-02-01', '2023-01-01'),
(3, 3, 'Cousin', '2021-03-01', NULL),
(4, 4, 'Guardian', '2020-04-01', '2022-04-01'),
(5, 5, 'Friend', '2022-05-01', NULL);

INSERT INTO FamilyMemberLocations (FamilyMemberID, LocationID, StartDate, EndDate)
VALUES
(1, 1, '2020-01-01', NULL),
(2, 2, '2019-02-01', '2023-01-01'),
(3, 3, '2021-03-01', NULL),
(4, 4, '2020-04-01', '2022-04-01'),
(5, 5, '2022-05-01', NULL);

INSERT INTO Teams (TeamName, LocationID, TeamType, HeadCoach)
VALUES
('Team A', 1, 'Junior', 'Coach A'),
('Team B', 2, 'Senior', 'Coach B'),
('Team C', 3, 'Junior', 'Coach C'),
('Team D', 4, 'Senior', 'Coach D'),
('Team E', 5, 'Junior', 'Coach E');

INSERT INTO ClubMemberTeams (ClubMemberID, StartDate, EndDate, TeamID)
VALUES
(1,'2020-01-01', NULL, 1),
(2,'2019-02-01', '2023-01-01', 2),
(3,'2021-03-01', NULL, 3),
(4,'2020-04-01', '2022-04-01', 4),
(5,'2022-05-01', NULL, 5);

INSERT INTO ClubMemberLocations (LocationID, ClubMemberID, StartDate, EndDate)
VALUES
(1, 1, '2020-01-01', NULL),
(2, 2, '2019-02-01', '2023-01-01'),
(3, 3, '2021-03-01', NULL),
(4, 4, '2020-04-01', '2022-04-01'),
(5, 5, '2022-05-01', NULL);

INSERT INTO Sessions (TypeOfSession, LocationID)
VALUES
('Training', 1),
('Match', 2),
('Friendly', 3),
('Workshop', 4),
('Seminar', 5);

INSERT INTO TeamFormation (Time, Date, Score, TeamType)
VALUES
('10:00:00', '2024-01-01', 3, 'Junior'),
('11:00:00', '2024-02-02', 2, 'Senior'),
('12:00:00', '2024-03-03', 4, 'Junior'),
('13:00:00', '2024-04-04', 1, 'Senior'),
('14:00:00', '2024-05-05', 5, 'Junior');
