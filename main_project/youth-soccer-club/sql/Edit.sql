UPDATE Location
SET Name = 'Main Office',
    Address = '123 Updated St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    TelephoneNumber = '321-654-0987',
    WebAddress = 'www.mainoffice.com',
    Type = 'Head',
    Capacity = 600,
    Personnel = 'John Doe Updated'
WHERE LocationID = 1;

UPDATE Personnel
SET FirstName = 'Alice Updated',
    LastName = 'Johnson Updated',
    DateOfBirth = '1981-01-01',
    SocialSecurityNumber = '123-45-6780',
    MedicalCardNumber = 'MC12346',
    TelephoneNumber = '555-555-5560',
    Address = '123 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    EmailAddress = 'alice.updated@domain.com',
    Role = 'Senior Manager',
    Mandate = 'Salaried',
    StartDate = '2021-01-01',
    EndDate = NULL
WHERE PersonnelID = 1;

UPDATE PersonnelLocations
SET EndDate = '2023-12-31'
WHERE PersonnelID = 1 AND LocationID = 1 AND StartDate = '2020-01-01';

-- Update a record in FamilyMember table
UPDATE FamilyMember
SET FirstName = 'George Updated',
    LastName = 'Martin Updated',
    DateOfBirth = '2006-01-01',
    SocialSecurityNumber = '678-90-1235',
    MedicalCardNumber = 'MC67891',
    TelephoneNumber = '555-555-5570',
    Address = '303 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    EmailAddress = 'george.updated@domain.com',
    LocationID = 2
WHERE FamilyMemberID = 1;

UPDATE SecondaryFamilyMember
SET FirstName = 'Laura Updated',
    LastName = 'Martin Updated',
    TelephoneNumber = '555-555-5571',
    FamilyMemberID = 2
WHERE SecondaryFamilyMemberID = 1;

UPDATE SecondaryFamilyRelated
SET Relationship = 'Updated Parent',
    ClubMemberID = 2
WHERE SecondaryFamilyMemberID = 1 AND ClubMemberID = 1;

UPDATE FamilyRelated
SET Relationship = 'Updated Parent'
WHERE ClubMemberID = 1 AND FamilyMemberID = 1;

UPDATE FamilyMemberLocations
SET EndDate = '2023-12-31'
WHERE FamilyMemberID = 1 AND LocationID = 1;

UPDATE ClubMembers
SET FirstName = 'Adam Updated',
    LastName = 'Johnson Updated',
    DateOfBirth = '2001-01-01',
    SocialSecurityNumber = '234-56-7892',
    MedicalCardNumber = 'MC23457',
    TelephoneNumber = '555-555-5575',
    Address = '808 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    TeamType = 'Senior',
    Status = 'Active',
    Role = 'Defender',
    ClubMembershipNumber = 'CMN12346'
WHERE ClubMemberID = 1;

UPDATE Teams
SET TeamName = 'Updated Team A',
    LocationID = 2,
    TeamType = 'Senior',
    HeadCoach = 'Updated Coach A'
WHERE TeamID = 1;

UPDATE ClubMemberTeams
SET EndDate = '2023-12-31'
WHERE ClubMemberID = 1;

UPDATE ClubMemberLocations
SET EndDate = '2023-12-31'
WHERE LocationID = 1 AND ClubMemberID = 1;

UPDATE Sessions
SET TypeOfSession = 'Updated Training',
    LocationID = 2
WHERE SessionID = 1;

UPDATE TeamFormation
SET Time = '15:00:00',
    Date = '2024-06-01',
    Score = 6,
    TeamType = 'Senior'
WHERE TeamFormationID = 1;
