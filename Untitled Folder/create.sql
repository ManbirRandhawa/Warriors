-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2016 at 12:44 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Warriors`
--

-- --------------------------------------------------------

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
(1, 'Stephen', 'Curry', 'Point_Guard', 'Warriors');

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
(1, '30.1', '6.7', '5.4', '2.1', '3.3', '0.54', '0.45');

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
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
