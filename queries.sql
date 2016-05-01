

CREATE TABLE `player_positions` (
  `position_name` varchar(30) NOT NULL PRIMARY KEY
);

CREATE TABLE `teams` (
  `team_name` varchar(30) NOT NULL PRIMARY KEY
);

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL AUTO INCREMENT PRIMARY KEY,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `position_name` varchar(30),
  `team_name` varchar(30),
  foreign key(position_name) references player_positions(position_name),
  foreign key(team_name) references teams(team_name)
);


CREATE TABLE `statistics` (
  `player_id` int(11) NOT NULL,
  `points` decimal(3,1) DEFAULT NULL,
  `assists` decimal(3,1) DEFAULT NULL,
  `rebounds` decimal(3,1) DEFAULT NULL,
  `steals` decimal(2,1) DEFAULT NULL,
  `turnovers` decimal(2,1) DEFAULT NULL,
  `fgpercent` decimal (3,2) DEFAULT NULL,
  `three_pt_percent` decimal (3,2) DEFAULT NULL,
  foreign key(player_id) references players(player_id)
);

insert into teams (team_name) values ('Warriors'), ('Lakers'), ('Cavaliers'), ('Thunder');

insert into player_positions(position_name) values ('Point_Guard'), ('Shooting_Guard'), ('Small_Forward'), ('Power_Forward'), ('Center');

insert into players(first_name, last_name, position_name, team_name) values ('Stephen', 'Curry', 'Point_Guard', 'Warriors')

insert into statistics() values (1, 30.1, 6.7, 5.4, 2.1, 3.3, 0.54, 0.45);


