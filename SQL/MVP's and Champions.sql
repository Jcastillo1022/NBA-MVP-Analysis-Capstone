SELECT 
    m.season, 
    m.player AS mvp, 
    m.team AS mvp_team, 
    c.team AS champion_team,
    CASE 
        WHEN m.team = c.team THEN 'Yes'
        ELSE 'No'
    END AS mvp_won_championship
FROM mvp_data m
LEFT JOIN nba_champions c ON m.season = c.season;