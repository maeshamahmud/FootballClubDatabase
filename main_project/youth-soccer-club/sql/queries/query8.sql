SELECT
fm.FirstName, fm.LastName,
(SELECT COUNT(*) FROM ClubMembers WHERE FamilyMemberID = fm.FamilyMemberID AND LocationID = fm.LocationID) AS NumberOfActiveClubMembers
FROM FamilyMember fm
WHERE fm.LocationID = 3 AND ;