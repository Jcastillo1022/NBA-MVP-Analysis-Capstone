SELECT
    m.season,
    m.player,
    m.team,
    m.points_per_game AS PPG,
	m.assists_per_game AS APG,
	rebounds_per_game AS RPG,
    m.wins_shares,
    m.win_shares_per_48,
	m.fg_percentage,
    t.win_loss_pct AS Team_Win_Percentage,
    t.points_per_game AS Team_Points_Scored_Per_Game
FROM 
    mvp_data m
JOIN 
    nba_team_performance t 
ON m.team = t.team AND m.season = t.season_year
ORDER BY  
    t.win_loss_pct DESC;