SELECT
    p.FirstName AS head_coach_first_name,
    p.LastName AS head_coach_last_name,
    tf.Time AS start_time,
    l.Address AS address,
    s.TypeOfSession AS session_type, -- 'training' or 'game'
    t.TeamName AS team_name,
    COALESCE(tf.Score, 'N/A') AS score,
    cm.FirstName AS player_first_name,
    cm.LastName AS player_last_name,
    cm.Role AS player_role
FROM Teams t
JOIN TeamFormation tf ON t.TeamID = tf.TeamFormationID
JOIN Sessions s ON tf.TeamFormationID = s.SessionID
JOIN Personnel p ON t.HeadCoach = p.PersonnelID
JOIN Location l ON t.LocationID = l.LocationID
JOIN ClubMemberTeams cmt ON t.TeamID = cmt.TeamID
JOIN
    ClubMembers cm ON cmt.ClubMemberID = cm.ClubMemberID
WHERE l.LocationID = ? AND tf.Date < ?
ORDER BY tf.Time;