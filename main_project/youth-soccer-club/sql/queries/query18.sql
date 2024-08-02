SELECT
    p.FirstName AS first_name,
    p.LastName AS last_name,
    p.TelephoneNumber AS telephone_number,
    p.EmailAddress AS email_address,
    l.Name AS location_name,
    pl.Role AS role
FROM Personnel p
JOIN PersonnelLocations pl ON p.PersonnelID = pl.PersonnelID
JOIN Location l ON pl.LocationID = l.LocationID
LEFT JOIN FamilyMembers fm ON p.PersonnelID = fm.FamilyMemberID
WHERE pl.Mandate = 'volunteer' AND fm.FamilyMemberID IS NULL
ORDER BY l.Name ASC, pl.Role ASC, p.FirstName ASC, p.LastName ASC;