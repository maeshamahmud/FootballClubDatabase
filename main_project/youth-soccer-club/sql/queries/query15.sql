SELECT
    fm.FirstName AS first_name,
    fm.LastName AS last_name,
    fm.TelephoneNumber AS phone_number
FROM FamilyMembers fm
JOIN ClubMembers cm ON fm.FamilyMemberID = cm.FamilyMemberID
JOIN MemberLocations ml ON cm.ClubMemberID = ml.ClubMemberID
JOIN TeamFormations tf ON ml.LocationID = tf.LocationID
JOIN Personnel p ON tf.CoachID = p.PersonnelID
WHERE
    cm.Status = 'active'
    AND p.Role = 'head coach'
    AND fm.FamilyMemberID = p.FamilyMemberID
    AND ml.LocationID = ?
GROUP BY fm.FirstName, fm.LastName, fm.TelephoneNumber
ORDER BY fm.LastName, fm.FirstName;