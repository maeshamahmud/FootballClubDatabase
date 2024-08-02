SELECT
    cm.ClubMemberID AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name,
    YEAR(CURDATE()) - YEAR(cm.DateOfBirth) AS age,
    cm.TelephoneNumber AS phone_number,
    cm.EmailAddress AS email,
    l.Name AS location_name
FROM ClubMembers cm
LEFT JOIN MemberLocations ml ON cm.ClubMemberID = ml.ClubMemberID
LEFT JOIN Location l ON ml.LocationID = l.LocationID
LEFT JOIN PlayerTeams pt ON cm.ClubMemberID = pt.ClubMemberID
WHERE cm.Status = 'active' AND pt.TeamID IS NULL
ORDER BY l.Name ASC, cm.ClubMemberID ASC;