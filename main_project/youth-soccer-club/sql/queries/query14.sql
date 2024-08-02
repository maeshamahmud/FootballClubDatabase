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
WHERE cm.Status = 'active'
    AND EXISTS (
        SELECT 1
        FROM PlayerTeams pt
        WHERE pt.ClubMemberID = cm.ClubMemberID
        AND pt.Role = 'goalkeeper')
    AND EXISTS (
        SELECT 1
        FROM PlayerTeams pt
        WHERE pt.ClubMemberID = cm.ClubMemberID
        AND pt.Role = 'defender')
    AND EXISTS (
        SELECT 1
        FROM PlayerTeams pt
        WHERE pt.ClubMemberID = cm.ClubMemberID
        AND pt.Role = 'midfielder')
    AND EXISTS (
        SELECT 1
        FROM PlayerTeams pt
        WHERE pt.ClubMemberID = cm.ClubMemberID
        AND pt.Role = 'forward')
ORDER BY l.Name ASC, cm.ClubMemberID ASC;