CREATE TABLE playoff_summary (
team VARCHAR(50),
age NUMERIC,
wins INT,
losses INT,
win_loss_pct FLOAT,
playoff_wins INT,
playoff_losses INT,
offensive_rating FLOAT,
defensive_rating FLOAT,
net_rating FLOAT,
pace FLOAT, 
free_throw_rate FLOAT,
three_point_attempt_rate FLOAT, 
true_shooting FLOAT,
season VARCHAR(10), 
PRIMARY KEY (team,season)
);