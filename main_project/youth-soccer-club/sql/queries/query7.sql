SELECT Address, City, Province, PostalCode, TelephoneNumber, WebAddress, Type, Capacity, Personnels,
(SELECT COUNT(*) FROM ClubMembers WHERE LocationID = Location.LocationID) AS NumberOfClubMembers
FROM Location
ORDER BY Province ASC, City ASC;
