SELECT
    p.FirstName AS first_name,
    p.LastName AS last_name,
    pl.StartDate AS start_date_as_president,
    pl.EndDate AS last_date_as_president
FROM Personnel p
JOIN PersonnelLocations pl ON p.PersonnelID = pl.PersonnelID
WHERE pl.Role = 'president'
ORDER BY p.FirstName ASC, p.LastName ASC, pl.StartDate ASC;