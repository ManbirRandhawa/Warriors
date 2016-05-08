-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2016 at 09:00 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40101 DROP DATABASE IF EXISTS `Warriors` */;
--
-- Database: `Warriors`
--

-- --------------------------------------------------------

CREATE DATABASE `Warriors`;

USE `Warriors`;

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  `team_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `first_name`, `last_name`, `position_name`, `team_name`) VALUES
(1, 'Stephen', 'Curry', 'Point_Guard', 'Warriors'),
(2, 'Klay', 'Thompson', 'Shooting_Guard', 'Warriors'),
(3, 'Draymond', 'Green', 'Power_Forward', 'Warriors'),
(4, 'Leandro', 'Barbosa', 'Shooting_Guard', 'Warriors'),
(5, 'Harrison', 'Barnes', 'Small_Forward', 'Warriors'),
(6, 'Andrew', 'Bogut', 'Center', 'Warriors'),
(7, 'Ian', 'Clark', 'Point_Guard', 'Warriors'),
(8, 'Festus', 'Ezeli', 'Center', 'Warriors'),
(9, 'Andre', 'Iguodala', 'Power_Forward', 'Warriors'),
(10, 'Shaun', 'Livingston', 'Shooting_Guard', 'Warriors'),
(11, 'James', 'McAdoo', 'Small_Forward', 'Warriors'),
(12, 'Brandon', 'Rush', 'Power_Forward', 'Warriors'),
(13, 'Marreese', 'Speights', 'Small_Forward', 'Warriors'),
(14, 'Anderson', 'Varejao', 'Small_Forward', 'Warriors'),
(15, 'Matthew', 'Dellavedova', 'Shooting_Guard', 'Cavaliers'),
(16, 'Channing', 'Frye', 'Small_Forward', 'Cavaliers'),
(17, 'Kyrie', 'Irving', 'Shooting_Guard', 'Cavaliers'),
(18, 'LeBron', 'James', 'Power_Forward', 'Cavaliers'),
(19, 'Richard', 'Jefferson', 'Power_Forward', 'Cavaliers'),
(20, 'Dahntay', 'Jones', 'Shooting_Guard', 'Cavaliers'),
(21, 'James', 'Jones', 'Small_Forward', 'Cavaliers'),
(22, 'Kevin', 'Love', 'Small_Forward', 'Cavaliers'),
(23, 'Jordan', 'McRae', 'Point_Guard', 'Cavaliers'),
(24, 'Timofey', 'Mozgov', 'Center', 'Cavaliers'),
(25, 'Iman', 'Shumpert', 'Shooting_Guard', 'Cavaliers'),
(26, 'JR', 'Smith', 'Point_Guard', 'Cavaliers'),
(27, 'Tristan', 'Thompson', 'Center', 'Cavaliers'),
(28, 'Mo', 'Williams', 'Shooting_Guard', 'Cavaliers'),
(29, 'Brandon', 'Bass', 'Small_Forward', 'Lakers'),
(30, 'Tarik', 'Black', 'Center', 'Lakers'),
(31, 'Anthony', 'Brown', 'Small_Forward', 'Lakers'),
(32, 'Kobe', 'Bryant', 'Point_Guard', 'Lakers'),
(33, 'Jordon', 'Clarkson', 'Shooting_Guard', 'Lakers'),
(34, 'Roy', 'Hibbert', 'Center', 'Lakers'),
(35, 'Marcelo', 'Huertas', 'Shooting_Guard', 'Lakers'),
(36, 'Larry', 'Nance', 'Power_Forward', 'Lakers'),
(37, 'Ryan', 'Kelly', 'Power_Forward', 'Lakers'),
(38, 'MettaWorld', 'Peace', 'Small_Forward', 'Lakers'),
(39, 'Julius', 'Randle', 'Small_Forward', 'Lakers'),
(40, 'DAngelo', 'Russell', 'Shooting_Guard', 'Lakers'),
(41, 'Robert', 'Sacre', 'Center', 'Lakers'),
(42, 'Lou', 'Williams', 'Point_Guard', 'Lakers'),
(43, 'Steven', 'Adams', 'Center', 'Thunder'),
(44, 'Nick', 'Collison', 'Small_Forward', 'Thunder'),
(45, 'Kevin', 'Durant', 'Power_Forward', 'Thunder'),
(46, 'Randy', 'Foye', 'Point_Guard', 'Thunder'),
(47, 'Josh', 'Huestis', 'Small_Forward', 'Thunder'),
(48, 'Serge', 'Ibaka', 'Power_Forward', 'Thunder'),
(49, 'Enes', 'Kanter', 'Center', 'Thunder'),
(50, 'Nazr', 'Mohammed', 'Center', 'Thunder'),
(51, 'Anthony', 'Marrow', 'Point_Guard', 'Thunder'),
(52, 'Cameron', 'Payne', 'Shooting_Guard', 'Thunder'),
(53, 'Andre', 'Roberson', 'Shooting_Guard', 'Thunder'),
(54, 'Kyle', 'Singler', 'Power_Forward', 'Thunder'),
(55, 'Dion', 'Waiters', 'Point_Guard', 'Thunder'),
(56, 'Russell', 'Westbrook', 'Shooting_Guard', 'Thunder');

-- --------------------------------------------------------

--
-- Table structure for table `player_positions`
--

CREATE TABLE `player_positions` (
  `position_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_positions`
--

INSERT INTO `player_positions` (`position_name`) VALUES
('Center'),
('Point_Guard'),
('Power_Forward'),
('Shooting_Guard'),
('Small_Forward');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `player_id` int(11) NOT NULL,
  `points` decimal(3,1) DEFAULT NULL,
  `assists` decimal(3,1) DEFAULT NULL,
  `rebounds` decimal(3,1) DEFAULT NULL,
  `steals` decimal(2,1) DEFAULT NULL,
  `turnovers` decimal(2,1) DEFAULT NULL,
  `fgpercent` decimal(3,2) DEFAULT NULL,
  `three_pt_percent` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`player_id`, `points`, `assists`, `rebounds`, `steals`, `turnovers`, `fgpercent`, `three_pt_percent`) VALUES
(1, '30.1', '6.7', '5.4', '2.4', '3.3', '0.50', '0.45'),
(2, '22.1', '2.1', '3.8', '0.8', '1.7', '0.47', '0.43'),
(3, '14.0', '7.4', '9.5', '1.5', '3.2', '0.49', '0.39'),
(4, '6.3', '0.7', '1.4', '0.3', '0.7', '0.58', '0.42'),
(5, '9.3', '1.3', '5.1', '0.7', '1.0', '0.36', '0.26'),
(6, '5.4', '1.4', '7.0', '0.9', '0.7', '0.70', '0.00'),
(7, '5.0', '1.1', '1.1', '0.7', '0.3', '0.54', '0.33'),
(8, '4.5', '0.5', '3.8', '0.0', '1.0', '0.57', '0.00'),
(9, '10.9', '4.3', '3.4', '1.0', '0.7', '0.57', '0.53'),
(10, '13.1', '4.9', '3.7', '1.0', '1.1', '0.53', '0.00'),
(11, '0.3', '0.3', '1.0', '0.8', '0.3', '0.00', '0.00'),
(12, '3.6', '0.2', '1.2', '0.0', '0.2', '0.50', '0.36'),
(13, '8.6', '0.7', '2.4', '0.0', '1.3', '0.45', '0.29'),
(14, '1.3', '0.8', '1.8', '0.3', '0.0', '0.33', '0.00'),
(15, '7.0', '4.3', '1.0', '0.2', '0.3', '0.44', '0.36'),
(16, '4.6', '0.4', '2.0', '0.4', '0.2', '0.53', '0.38'),
(17, '25.0', '5.5', '2.0', '1.2', '1.5', '0.47', '0.52'),
(18, '23.8', '6.8', '7.8', '2.5', '3.2', '0.51', '0.35'),
(19, '4.8', '1.0', '2.2', '0.0', '0.3', '0.58', '0.54'),
(20, '1.7', '0.0', '0.3', '0.3', '0.0', '0.67', '0.50'),
(21, '0.0', '0.0', '0.5', '0.0', '0.5', '0.00', '0.00'),
(22, '17.2', '1.7', '12.0', '0.5', '1.0', '0.36', '0.42'),
(23, '5.0', '0.0', '1.0', '0.0', '0.0', '1.00', '1.00'),
(24, '0.0', '0.3', '0.3', '0.0', '0.5', '0.00', '0.00'),
(25, '3.2', '1.2', '3.0', '0.3', '0.2', '0.44', '0.38'),
(26, '14.8', '1.7', '4.2', '1.0', '0.2', '0.49', '0.53'),
(27, '4.7', '1.0', '7.2', '0.3', '0.5', '0.46', '0.00'),
(28, '2.5', '0.0', '0.5', '0.5', '0.0', '0.40', '0.25'),
(29, '7.2', '1.1', '4.3', '0.5', '0.6', '0.55', '0.00'),
(30, '3.4', '0.4', '4.0', '0.4', '0.6', '0.55', '0.00'),
(31, '4.0', '0.7', '2.4', '0.5', '0.5', '0.31', '0.29'),
(32, '17.6', '2.8', '3.7', '0.9', '2.0', '0.36', '0.29'),
(33, '15.5', '2.4', '4.0', '1.1', '1.7', '0.43', '0.35'),
(34, '5.9', '1.2', '4.9', '0.4', '0.9', '0.44', '0.00'),
(35, '4.5', '3.4', '1.7', '0.5', '1.5', '0.42', '0.26'),
(36, '5.5', '0.7', '5.0', '0.9', '0.7', '0.53', '0.10'),
(37, '4.2', '0.6', '3.4', '0.4', '0.5', '0.37', '0.14'),
(38, '5.0', '0.8', '2.5', '0.6', '0.4', '0.31', '0.31'),
(39, '11.3', '1.8', '10.2', '0.7', '1.8', '0.43', '0.28'),
(40, '13.2', '3.3', '3.4', '1.2', '2.5', '0.43', '0.35'),
(41, '3.5', '0.6', '2.9', '0.2', '0.5', '0.41', '0.00'),
(42, '15.3', '2.5', '2.6', '0.9', '1.6', '0.41', '0.34'),
(43, '9.6', '0.7', '9.3', '0.4', '1.0', '0.64', '0.00'),
(44, '0.8', '0.7', '1.3', '1.3', '0.2', '0.50', '0.00'),
(45, '24.9', '3.7', '6.7', '0.3', '3.3', '0.40', '0.27'),
(46, '2.7', '1.5', '2.3', '0.0', '1.0', '0.26', '0.33'),
(47, '1.5', '0.0', '1.5', '0.0', '0.0', '0.33', '0.50'),
(48, '13.4', '0.4', '5.4', '1.3', '0.1', '0.59', '0.54'),
(49, '13.4', '0.4', '0.3', '0.3', '1.1', '0.66', '0.16'),
(50, '1.0', '0.0', '1.0', '0.0', '0.5', '1.00', '0.00'),
(51, '2.9', '0.0', '0.1', '0.3', '0.3', '0.46', '0.38'),
(52, '2.0', '1.5', '0.3', '0.3', '0.8', '0.25', '0.40'),
(53, '2.7', '0.4', '4.0', '1.3', '0.6', '0.35', '0.10'),
(54, '2.0', '0.0', '1.3', '0.0', '0.0', '0.40', '0.67'),
(55, '9.9', '1.7', '2.6', '0.7', '1.6', '0.44', '0.38'),
(56, '24.7', '10.7', '6.4', '1.7', '3.6', '0.43', '0.32');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_name`) VALUES
('Cavaliers'),
('Lakers'),
('Thunder'),
('Warriors');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `birthday`, `email`, `password`) VALUES
(3, 'Kevin', 'Yan', NULL, 'kevinyan215@gmail.com', 'Password1!');

-- --------------------------------------------------------

--
-- Table structure for table `user_playerlist`
--

CREATE TABLE `user_playerlist` (
  `user_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_playerlist`
--

INSERT INTO `user_playerlist` (`user_id`, `player_id`) VALUES
(NULL, NULL),
(3, NULL),
(3, 1),
(3, 18),
(3, 45),
(3, 32),
(3, 17),
(3, 3),
(3, 52);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `position_name` (`position_name`),
  ADD KEY `team_name` (`team_name`);

--
-- Indexes for table `player_positions`
--
ALTER TABLE `player_positions`
  ADD PRIMARY KEY (`position_name`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_playerlist`
--
ALTER TABLE `user_playerlist`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `player_id` (`player_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`position_name`) REFERENCES `player_positions` (`position_name`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `teams` (`team_name`);

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_playerlist`
--
ALTER TABLE `user_playerlist`
  ADD CONSTRAINT `user_playerlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_playerlist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
