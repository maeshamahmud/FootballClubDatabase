SELECT
    l.location_name,
    COUNT(CASE WHEN s.session_type = 'training' THEN 1 END) AS total_training_sessions,
    SUM(CASE WHEN s.session_type = 'training' THEN t.total_players ELSE 0 END) AS total_training_players,
    COUNT(CASE WHEN s.session_type = 'game' THEN 1 END) AS total_game_sessions,
    SUM(CASE WHEN s.session_type = 'game' THEN t.total_players ELSE 0 END) AS total_game_players
FROM Location l
JOIN Sessions s ON l.location_id = s.location_id
JOIN (SELECT tf.session_id, COUNT(pt.player_id) AS total_players
     FROM TeamFormation tf
     JOIN PlayerTeam pt ON tf.team_id = pt.team_id
     GROUP BY tf.session_id) t ON s.session_id = t.session_id
WHERE s.session_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY l.location_name
HAVING COUNT(CASE WHEN s.session_type = 'game' THEN 1 END) >= 3
ORDER BY total_game_sessions DESC;