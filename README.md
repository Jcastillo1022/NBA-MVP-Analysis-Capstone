# NBA-MVP-Analysis-Capstone
# Google Data Analytics Capstone Project
___
# Introduction:

This was my Case Study Project from The Google Data Analytics Capstone Project. 

This project analyzizes key factors that contribute to a player winning the NBA MVP (Most Valuable Player) award. The analysis explores the relationship between individual player performance (points, assists, rebounds, efficiency) and team performance (wins, win percentage, scoring) from the year 2000 to 2023. The goal is to identify the major predictors of MVP wins and understand how they correlate with team success and playoff performance.
___
# Business Question

What are the key factors that contribute to a player winning the NBA MVP, and how do these factors correlate with team performance and standings from the Year 2000, including performance in the playoffs?
___
# Technologies Used

Excel: Used for initial data cleaning, preprocessing, and manual adjustments before loading into SQL.
SQL (PostgreSQL): Used for data extraction, transformation, and querying MVP and team performance data.
Tableau: Used for visualizing MVP trends, team performance, and statistical insights.
___
# Data Sources

The data for this project was extracted from Basketball-Reference.com 
The main datasets used in this analysis include:
MVP Data: Player performance statistics for MVP winners.
NBA Champions: NBA Team Champions
NBA Team Performance Data: Team stats, including wins, losses, and scoring etc.
NBA Playoff Summary: Player and team statistics for postseason performance 
___
# Data Extraction:

Data was pulled from Basketball-Reference for the MVPs,team performance and playoff summary from 2000 onward.
# Data Cleaning:

Team names were standardized by removing any asterisks that indicated playoff teams, ensuring consistency across tables.
The NBA season was added to the team performance table to match the corresponding MVP season.
___
# Data Transformation:

Four tables were created in PostgreSQL to store the MVP, team performance, and playoff data.
Data was further cleaned and transformed for easier analysis and comparison in Tableau.
___
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
  - Few MVPs scored below 20 PPG.
- Insight:
   - While high scoring is important, it isn’t the sole factor.
  For example, Steve Nash won MVP with around 15-18 PPG, thanks to his playmaking and overall efficiency. 

![image](https://github.com/user-attachments/assets/57910e28-37b1-41bf-aaa6-880f6c3cd000)

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
   - Most MVPs come from teams with a win percentage above 0.700.
   - Example: Curry (2015-16) led the 73-9 Warriors (W% = 0.890), while Westbrook (2016-17) is an outlier with a W% of 0.573.
- Scoring and Efficiency:
   - Typical MVPs score between 25-30 PPG (e.g., Curry 30.1, Giannis 29.5, Durant 32).
   - MVPs with very low PPG, like Nash (15.5 PPG), compensated with elite playmaking.
- Field Goal Percentage Variations:
   - High FG% MVPs: Shaq (0.574), Giannis (0.578), Duncan (0.513) – usually dominant big men.
   - Lower FG% MVPs: Westbrook (0.425), Iverson (0.420) – typically high-volume scorers.
- Rebounding & Playmaking:
   - Top Rebounders: Garnett (13.9 RPG), Shaq (13.6 RPG), Duncan (12.9 RPG).
   - Top Assist Leaders: Nash (11.5 APG), Westbrook (10.4 APG), Harden (8.8 APG).
- All-Around Performance:
   - Triple-Double MVP: Westbrook (2016-17)
   - Balanced MVPs: LeBron (2012-13) and Jokic (2021-22)

![image](https://github.com/user-attachments/assets/c904462b-5134-4a4b-bae4-31dc642c9653)

![image](https://github.com/user-attachments/assets/cb5b3746-61ce-4262-b0d0-6718085fa848)

![image](https://github.com/user-attachments/assets/5c0b5fb7-2af6-43d7-abb9-e396bf950082)

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
   - Only 5 out of 24 MVPs (~20.8%) won the championship in the same season.
- Back-to-Back MVPs:
   - Players like Jokić, Giannis, LeBron, and Nash won consecutive MVPs but didn’t win a title in those seasons.
- Frequent MVPs, Few Titles:
   - Despite being a 4x MVP, LeBron won the championship in only two seasons.
   - Tim Duncan and Shaq are the only big men to win both MVP and the championship in the same season.
- Modern Trends:
   - The last MVP to win a championship in the same season was Curry in 2015; since then, no MVP has replicated this feat.. 

  ![image](https://github.com/user-attachments/assets/9c303e93-a316-4b13-b46d-f88bef57e2de)
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

 ![image](https://github.com/user-attachments/assets/a814274a-9ffa-4219-9565-746b8247c6fd)

# Overall Conclusion:

