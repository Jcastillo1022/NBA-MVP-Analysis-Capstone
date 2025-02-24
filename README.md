# NBA-MVP-Analysis-Capstone
# Google Data Analytics Capstone Project
___
# Introduction:

This was my Case Study Project from The Google Data Analytics Capstone Project. I love basketball and love watching statistics on TV, which is why I choose this as my analysis.
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
- MVP Data: Player performance statistics for MVP winners.
- NBA Champions: NBA Team Champions
- NBA Team Performance Data: Team stats, including wins, losses, and scoring etc.
- NBA Playoff Summary: Player and team statistics for postseason performance 
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
