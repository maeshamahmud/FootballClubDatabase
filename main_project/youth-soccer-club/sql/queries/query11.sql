SELECT
    l.Name AS location_name,
    COUNT(CASE WHEN s.TypeOfSession = 'training' THEN 1 END) AS total_training_sessions,
    SUM(CASE WHEN s.TypeOfSession = 'training' THEN t.total_players ELSE 0 END) AS total_training_players,
    COUNT(CASE WHEN s.TypeOfSession = 'game' THEN 1 END) AS total_game_sessions,
    SUM(CASE WHEN s.TypeOfSession = 'game' THEN t.total_players ELSE 0 END) AS total_game_players
FROM Location l
JOIN Sessions s ON l.LocationID = s.LocationID
JOIN (SELECT tf.TeamFormationID AS session_id, COUNT(cmt.ClubMemberID) AS total_players
     FROM TeamFormation tf
     JOIN ClubMemberTeams cmt ON tf.TeamFormationID = cmt.TeamID
     WHERE tf.Date BETWEEN '2024-01-01' AND '2024-03-31'
     GROUP BY tf.TeamFormationID) t ON s.SessionID = t.session_id
GROUP BY l.Name
HAVING COUNT(CASE WHEN s.TypeOfSession = 'game' THEN 1 END) >= 3
ORDER BY total_game_sessions DESC;