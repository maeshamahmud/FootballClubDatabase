SELECT
    cm.ClubMemberID AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name
FROM ClubMembers cm
JOIN MemberLocations ml ON cm.ClubMemberID = ml.ClubMemberID
WHERE cm.Status = 'active' AND DATEDIFF(CURDATE(), cm.JoinDate) <= 730 -- 730 days = 2 years
GROUP BY cm.ClubMemberID, cm.FirstName, cm.LastName
HAVING COUNT(DISTINCT ml.LocationID) >= 4
ORDER BY cm.ClubMemberID ASC;