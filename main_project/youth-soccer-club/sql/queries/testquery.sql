SELECT
    cm.ClubMemberID,
    cm.ClubMembershipNumber AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name,
    COUNT(DISTINCT cml.LocationID) AS location_count
FROM ClubMembers cm
JOIN ClubMemberLocations cml ON cm.ClubMemberID = cml.ClubMemberID
WHERE cm.Status = 'Active'
GROUP BY cm.ClubMembershipNumber, cm.FirstName, cm.LastName
ORDER BY location_count DESC;
