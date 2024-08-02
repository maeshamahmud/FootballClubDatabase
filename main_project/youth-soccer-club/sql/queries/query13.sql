SELECT
    cm.ClubMemberID AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name,
    YEAR(CURDATE()) - YEAR(cm.DateOfBirth) AS age,
    cm.TelephoneNumber AS phone_number,
    cm.EmailAddress AS email,
    l.Name AS location_name
FROM ClubMembers cm
JOIN MemberLocations ml ON cm.ClubMemberID = ml.ClubMemberID
JOIN Location l ON ml.LocationID = l.LocationID
JOIN PlayerTeams pt ON cm.ClubMemberID = pt.ClubMemberID
WHERE cm.Status = 'active' AND pt.Role = 'goalkeeper' AND NOT EXISTS (
        SELECT 1
        FROM PlayerTeams pt2
        WHERE pt2.ClubMemberID = cm.ClubMemberID
        AND pt2.Role <> 'goalkeeper' )
GROUP BY cm.ClubMemberID, cm.FirstName, cm.LastName, cm.DateOfBirth, cm.TelephoneNumber, cm.EmailAddress, l.Name
ORDER BY l.Name ASC, cm.ClubMemberID ASC;
