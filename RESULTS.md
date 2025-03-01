# SQL Query - Analyis and Visuals

# ***1. Explore how points per game are related to MVP wins.*** 

```sql
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
```

# Results 
- PPG Distribution:
  - Most MVPs scored between 25-30 PPG.
  - Few MVPs scored below 20 PPG. (Only Steve Nash)
- Insight:
   - While high scoring is important, it isn’t the sole factor.
  For example, Steve Nash won MVP with around 15-18 PPG, thanks to his playmaking with assisst and overall efficiency. 

[![MVP's PPG Category](https://github.com/user-attachments/assets/dba71335-337d-45d5-a1cf-9bc6ad6de7c6)](https://public.tableau.com/app/profile/joshua.castillo2852/viz/DistributionofMVPsbyPPGCategory/MVPsPPGCategory) 

# ***2. Analysis of MVP and Team Performance Data and Categorizing MVPs into High-Scoring vs. All-Around.*** 

```sql
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
FROM  mvp_data m
JOIN nba_team_performance t ON m.team = t.team
AND m.season = t.season_year
ORDER BY  
t.win_loss_pct DESC;
```
# Results 
- Team Success:
   - Most MVPs come from teams with a winning percentage above 0.700.
   - Example: Curry (2015-16) led the 73-9 Warriors (W% = 0.890), while Westbrook (2016-17) is an outlier with a W% of 0.573.
- Scoring and Efficiency:
   - Typical MVPs score between 25-30 PPG
   - MVPs with very low PPG, like Nash (15.5 PPG), compensated with elite playmaking.
- Field Goal Percentage Variations:
   - High FG% MVPs are usually dominant big men ex: Shaq (0.574), Giannis (0.578), Duncan (0.513).
   - Lower FG% MVPs are typically high-volume scorers ex: Westbrook (0.425), Iverson (0.420).
- Rebounding & Playmaking:
   - Top Rebounders: Garnett (13.9 RPG), Shaq (13.6 RPG), Duncan (12.9 RPG).
   - Top Assist Leaders: Nash (11.5 APG), Westbrook (10.4 APG), Harden (8.8 APG).
- All-Around Performance:
   - Triple-Double MVP: Westbrook (2016-17)
   - Balanced MVPs: LeBron (2012-13) and Jokic (2021-22). Close to a Triple-Double.

[![Team Success vs  MVP Performance](https://github.com/user-attachments/assets/e208ea22-47ed-4e58-bdf2-9c48a1f8fa81)
)](https://public.tableau.com/views/MVPandTeamPerformance/TeamSuccessvs_MVPPerformance?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[![MVP Scoring Trends](https://github.com/user-attachments/assets/392e21c2-7843-498d-87f3-45fddc680bd5)](https://public.tableau.com/views/MVPandTeamPerformance/MVPScoringTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[![Multi-Metric MVP Performance Chart (Team PPG, RPG, APG)](https://github.com/user-attachments/assets/b5db77bb-a860-44cf-9fc0-3946e56202fc)](https://public.tableau.com/views/MVPandTeamPerformance/Multi-MetricMVPPerformanceChartTeamPPGRPGAPG?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

___
# ***3. Championship Success of MVP Teams.***

```sql 
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
```
# Results 
- Championship Wins:
   - Only 5 out of the 24 MVPs (~20.8%) won the championship in the same season.
- Back-to-Back MVPs:
   - Players like Jokić, Giannis, LeBron, and Nash won consecutive MVPs but didn’t win a title in those seasons, showing it's not easy to win both MVP and Championship.
- Frequent MVPs, Few Titles:
   - Despite being a 4x MVP, LeBron won the championship in only two seasons.
   - Tim Duncan and Shaq are the only big men to win both MVP and the championship in the same season.
- Modern Trends:
   - The last MVP to win a championship in the same season was Stephen Curry back in 2015; since then, no MVP has won. 

 [![MVP Champions](https://github.com/user-attachments/assets/b586e602-2f1a-4558-820f-8342fe4d0e89)](https://public.tableau.com/views/MVPChampions/MVPChampions?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
___
 # ***4. Does Age Matter? Do MVPs Tend to Be Younger or Older?***

```sql
SELECT Season, Player, Age  
FROM mvp_data  
ORDER BY age ASC;
```
# Results 
- Age Distribution:
   - Most MVP winners are between 25 and 28 years old—often considered their prime.
- Career Longevity:
   - MVP awards typically come in a player's mid-20s, although some, like Steve Nash (31), have won later.
- Notable Age:
   - Youngest MVP: Derrick Rose at 22 (2010-11 season).
   - Oldest MVP: Steve Nash at 31 (2005-06 season).

[![Dashboard 1](https://github.com/user-attachments/assets/9be8dcd1-f41d-44b5-92e0-bf0713827dcd)](https://public.tableau.com/views/MVPAges/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
___
# Overall Conclusion and Actions:
- Scoring Alone Isn't Enough: While MVPs often score between 25-30 PPG, playmaking and efficience are important for winning the award. Basketball teams should focus on developing all-around players.
- Team Success Drives MVP Wins: MVPs typically come from teams with a 0.700+ win percentage whihc shows the importance of team performance. Organizations should focus on building cohesive, high-performing teams to elevate individual MVP potential.
- Rebounding and Playmaking Matters: MVPs like Garnett, Westbrook, and Nash demonstrate the value of versatile skills—rebounding and playmaking—alongside scoring. Future players should emphasize these all-around skills.
- Age Is Not a Barrier: Most MVPs are in their mid-20s, but players like Steve Nash show that players can still perform at an MVP level later in their careers. Teams should focus on maximizing prime years and extending career longevity.
___
# Future Improvements  
- Continue the analysis to include historical MVP data prior to the year 2000 comparing trends across different eras and identifying how changes in the league’s rules and playstyle have influenced MVP outcomes.
- Incorporate machine learning techniques to predict MVP outcomes based on factors like player efficiency, team success, and other key metrics.
   
