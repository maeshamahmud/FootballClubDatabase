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
JOIN TeamFormations tf ON pt.TeamID = tf.TeamID
JOIN Sessions s ON tf.SessionID = s.SessionID
WHERE
    cm.Status = 'active'
    AND s.TypeOfSession = 'game'
    AND NOT EXISTS (
        SELECT 1
        FROM TeamFormations tf2
        WHERE tf2.SessionID = s.SessionID
        AND tf2.TeamID <> tf.TeamID
        AND tf2.Score > tf.Score)
GROUP BY cm.ClubMemberID, cm.FirstName, cm.LastName, cm.DateOfBirth, cm.TelephoneNumber, cm.EmailAddress, l.Name
HAVING COUNT(s.SessionID) > 0
ORDER BY l.Name ASC, cm.ClubMemberID ASC;