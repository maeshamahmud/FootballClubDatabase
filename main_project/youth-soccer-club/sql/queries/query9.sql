SELECT
    p.FirstName AS head_coach_first_name,
    p.LastName AS head_coach_last_name,
    s.Time AS start_time,
    l.Address AS address,
    s.TypeOfSession AS session_type,
    t.TeamName AS team_name,
    COALESCE(s.Score, 'N/A') AS score,
    cm.FirstName AS player_first_name,
    cm.LastName AS player_last_name,
    pt.Role AS player_role
FROM Teams t
JOIN Sessions s ON t.SessionID = s.SessionID
JOIN Personnel p ON t.CoachID = p.PersonnelID
JOIN Location l ON t.LocationID = l.LocationID
JOIN ClubMemberTeams pt ON t.TeamID = pt.TeamID
JOIN ClubMembers cm ON pt.ClubMemberID = cm.ClubMemberID
WHERE l.LocationID = [GivenLocationID] AND s.Date <  [GivenDate]
ORDER BY s.Time ASC;
