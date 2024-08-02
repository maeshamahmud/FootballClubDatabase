SELECT
    l.Name AS LocationName,
    l.Address,
    l.City,
    l.Province,
    l.PostalCode,
    l.TelephoneNumber,
    l.WebAddress,
    l.Type,
    l.Capacity,
    p.FirstName || ' ' || p.LastName AS GeneralManager,
    (SELECT COUNT(*)
     FROM ClubMemberLocations cml
     WHERE cml.LocationID = l.LocationID) AS NumberOfClubMembers
FROM
    Location l
LEFT JOIN
    Personnel p ON l.Personnel = p.PersonnelID
ORDER BY
    l.Province ASC,
    l.City ASC;
