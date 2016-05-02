

CREATE TABLE `player_positions` (
  `position_name` varchar(30) NOT NULL PRIMARY KEY
);

insert into player_positions(position_name) values ('Point_Guard'), ('Shooting_Guard'), ('Small_Forward'), ('Power_Forward'), ('Center');



CREATE TABLE `teams` (
  `team_name` varchar(30) NOT NULL PRIMARY KEY
);

insert into teams (team_name) values ('Warriors'), ('Lakers'), ('Cavaliers'), ('Thunder');



CREATE TABLE `players` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `position_name` varchar(30),
  `team_name` varchar(30),
  foreign key(position_name) references player_positions(position_name),
  foreign key(team_name) references teams(team_name)
);

insert into players(first_name, last_name, position_name, team_name) values ('Stephen', 'Curry', 'Point_Guard', 'Warriors');
insert into players(first_name, last_name, position_name, team_name) values ('Klay', 'Thompson', 'Point_Guard', 'Warriors');
insert into players(first_name, last_name, position_name, team_name) values ('Draymond', 'Green', 'Point_Guard', 'Warriors');



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

/*player_id, points, assists, rebounds, steals, turnovers, fg%, 3pt%*/
insert into statistics() values (1, 30.1, 6.7, 5.4, 2.1, 3.3, 0.54, 0.45);
insert into statistics() values (2, 22.1, 6.7, 3.8, 0.8, 1.7, 0.47, 0.42);
insert into statistics() values (3, 14, 7.4, 9.5, 1.5, 3.2, 0.49, 0.38);

/*retrieve player name and their statistics*/
SELECT players.first_name, players.last_name, statistics.points, statistics.assists, statistics.rebounds from players, statistics where players.player_id = statistics.player_id




/*create user table */
create table users(user_id int not null auto_increment primary key, first_name varchar(15), last_name varchar(15), birthday datetime, email varchar(320) unique, password varchar(30));

insert into users(first_name, last_name, email, password) values ('kevin', 'yan', 'kevinyan@gmail.com', '1'); 



/*create player_list table (the customized table for each user) */
create table user_playerlist(user_id int, player_id int, 
foreign key(user_id) references users(user_id), 
foreign key (player_id) references players(player_id));

insert into user_playerlist() values (1,1);
insert into user_playerlist() values (1,2);

/* query to get the user_id from the user */
select user_id from users where email ='kevinyan@gmail.com'

/* get player_id */
SELECT players.player_id from players, teams
where players.first_name = 'stephen' and players.last_name = 'curry' and teams.team_name = 'warriors';

/* query to get customize players from each user. the last where clause should be customized */
SELECT players.first_name, players.last_name, statistics.points, statistics.assists, statistics.rebounds 
from players, user_playerlist, statistics 
where players.player_id = statistics.player_id  and user_playerlist.player_id = players.player_id and user_playerlist.user_id = 1 ;






