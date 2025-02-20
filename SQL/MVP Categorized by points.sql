SELECT 
    CASE 
        WHEN points_per_game < 20 THEN 'Below 20 PPG'
        WHEN points_per_game BETWEEN 20 AND 24.99 THEN '20-24.9 PPG'
        WHEN points_per_game BETWEEN 25 AND 29.99 THEN '25-29.9 PPG'
        WHEN points_per_game >= 30 THEN '30+ PPG'
    END AS PPG_Category, 
    COUNT(*) AS MVP_Count
FROM mvp_data
GROUP BY PPG_Category
ORDER BY MVP_Count DESC;