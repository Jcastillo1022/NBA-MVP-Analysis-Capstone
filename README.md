# NBA-MVP-Analysis-Capstone
Google Data Analytics Capstone Project

Introduction:

This was my Case Study Project from The Google Data Analytics Capstone Project. 

This project analyzizes key factors that contribute to a player winning the NBA MVP (Most Valuable Player) award. The analysis explores the relationship between individual player performance (points, assists, rebounds, efficiency) and team performance (wins, win percentage, scoring) from the year 2000 to 2023. The goal is to identify the major predictors of MVP wins and understand how they correlate with team success and playoff performance.

Business Question

What are the key factors that contribute to a player winning the NBA MVP, and how do these factors correlate with team performance and standings from the Year 2000, including performance in the playoffs?

Technologies Used

Excel: Used for initial data cleaning, preprocessing, and manual adjustments before loading into SQL.
SQL (PostgreSQL): Used for data extraction, transformation, and querying MVP and team performance data.
Tableau: Used for visualizing MVP trends, team performance, and statistical insights.

Data Sources

The data for this project was extracted from Basketball-Reference.com 
The main datasets used in this analysis include:
MVP Data: Player performance statistics for MVP winners.
NBA Champions: NBA Team Champions
NBA Team Performance Data: Team stats, including wins, losses, and scoring etc.
NBA Playoff Summary: Player and team statistics for postseason performance 

Data Processing
Data Extraction:

Data was pulled from Basketball-Reference for the MVPs,team performance and playoff summary from 2000 onward.
Data Cleaning:

Team names were standardized by removing any asterisks that indicated playoff teams, ensuring consistency across tables.
The NBA season was added to the team performance table to match the corresponding MVP season.

Data Transformation:

Four tables were created in PostgreSQL to store the MVP, team performance, and playoff data.
Data was further cleaned and transformed for easier analysis and comparison in Tableau.

Analyis and Visuals

Question1. Explore how points per game are related to MVP wins.  
 
Most MVPs scored between 25-30 PPG. Few MVPs scored below 20 PPG. The highest-scoring MVPs (30+ PPG) are not rare but not the majority either. PPG is an important factor—MVPs tend to be strong scorers, but they don’t always need to lead the league in scoring. While high scoring helps, it’s not the only factor (e.g., Steve Nash won MVP with around 15-18 PPG). 

2. Analysis of MVP and Team Performance Data and Categorizing MVPs into High-Scoring vs. All-Around

   1. MVPs Usually Come from High-Win Teams
      Highest W%: 2015-16 Curry (0.890, 73-9 Warriors).
      Exception: Westbrook (2016-17, 0.573 W%) – A rare outlier due to his triple-double season. 

   2. Scoring Matters, But Isn’t Everything
      Typical PPG Range: 25-30 (e.g., Curry 30.1, Giannis 29.5, Durant 32).
      Exception: Nash (2004-05, 15.5 PPG) – Won through elite playmaking and team success. 

   3. Efficiency (FG%) Varies by Play Style
      High FG% MVPs: Shaq (0.574), Giannis (0.578), Duncan (0.513) – Dominant big men.
      Lower FG% MVPs: Westbrook (0.425), Iverson (0.420) – High-volume scorers. 
 
   4. High-Scoring Teams Often Produce MVPs
     High PPG MVPs: Harden (2017-18, 112.4 PPG Rockets), Curry (2015-16, 114.9 PPG Warriors).
     Exceptions: Duncan (2002-03, 95.8 PPG Spurs), Iverson (2000-01, 94.7 PPG 76ers). 

   5. Big Men Dominate Rebounding MVPs
      Top Rebounders: Garnett (13.9 RPG), Shaq (13.6 RPG), Duncan (12.9 RPG). 

   6. Elite Playmakers Stand Out in Assists
      Top Assist MVPs: Nash (11.5 APG), Westbrook (10.4 APG), Harden (8.8 APG). 

  7. The Ultimate All-Around MVPs
     Triple-Double MVP: Westbrook (2016-17, 10.7 RPG, 10.4 APG).
     Balanced MVPs: LeBron (2012-13, 7.2 RPG, 7.3 APG), Jokic (2021-22, 13.8 RPG, 7.9 APG).

Overall:
MVP voters prioritize team success over raw stats. Most MVPs come from 0.700+ W% teams, highlighting the emphasis on winning. While elite individual performances can stand out, history shows that MVPs are usually the best players on top-tier teams. Scoring, efficiency, and all-around play matter, but winning remains the strongest MVP predictor. 
