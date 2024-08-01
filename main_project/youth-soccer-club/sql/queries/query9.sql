SELECT
c.first_name AS head_coach_first_name,
c.last_name AS head_coach_last_name,
s.start_time,
s.address,
s.session_type, -- 'training' or 'game'
t.team_name,
COALESCE(s.score, 'N/A') AS score,
p.first_name AS player_first_name,
p.last_name AS player_last_name,
pt.role AS player_role
FROM Teams t
JOIN Sessions s ON t.session_id = s.session_id
JOIN Coaches c ON t.coach_id = c.coach_id
JOIN Locations l ON t.location_id = l.location_id
JOIN Player_Teams pt ON t.team_id = pt.team_id
JOIN Players p ON pt.player_id = p.player_id
WHERE l.location_id = ? -- Replace with the location ID
AND s.session_date = ? -- Replace with the date of interest
ORDER BY s.start_time ASC;
