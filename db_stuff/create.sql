-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: Warriors
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `player_positions`
--

DROP TABLE IF EXISTS `player_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_positions` (
  `position_name` varchar(30) NOT NULL,
  PRIMARY KEY (`position_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_positions`
--

LOCK TABLES `player_positions` WRITE;
/*!40000 ALTER TABLE `player_positions` DISABLE KEYS */;
INSERT INTO `player_positions` VALUES ('Center'),('Point_Guard'),('Power_Forward'),('Shooting_Guard'),('Small_Forward');
/*!40000 ALTER TABLE `player_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  `team_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `position_name` (`position_name`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`position_name`) REFERENCES `player_positions` (`position_name`),
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `teams` (`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Stephen','Curry','Point_Guard','Warriors'),(2,'Klay','Thompson','Shooting_Guard','Warriors'),(3,'Draymond','Green','Power_Forward','Warriors'),(4,'Leandro','Barbosa','Shooting_Guard','Warriors'),(5,'Harrison','Barnes','Small_Forward','Warriors'),(6,'Andrew','Bogut','Center','Warriors'),(7,'Ian','Clark','Point_Guard','Warriors'),(8,'Festus','Ezeli','Center','Warriors'),(9,'Andre','Iguodala','Power_Forward','Warriors'),(10,'Shaun','Livingston','Shooting_Guard','Warriors'),(11,'James','McAdoo','Small_Forward','Warriors'),(12,'Brandon','Rush','Power_Forward','Warriors'),(13,'Marreese','Speights','Small_Forward','Warriors'),(14,'Anderson','Varejao','Small_Forward','Warriors'),(15,'Matthew','Dellavedova','Shooting_Guard','Cavaliers'),(16,'Channing','Frye','Small_Forward','Cavaliers'),(17,'Kyrie','Irving','Shooting_Guard','Cavaliers'),(18,'LeBron','James','Power_Forward','Cavaliers'),(19,'Richard','Jefferson','Power_Forward','Cavaliers'),(20,'Dahntay','Jones','Shooting_Guard','Cavaliers'),(21,'James','Jones','Small_Forward','Cavaliers'),(22,'Kevin','Love','Small_Forward','Cavaliers'),(23,'Jordan','McRae','Point_Guard','Cavaliers'),(24,'Timofey','Mozgov','Center','Cavaliers'),(25,'Iman','Shumpert','Shooting_Guard','Cavaliers'),(26,'JR','Smith','Point_Guard','Cavaliers'),(27,'Tristan','Thompson','Center','Cavaliers'),(28,'Mo','Williams','Shooting_Guard','Cavaliers'),(29,'Brandon','Bass','Small_Forward','Lakers'),(30,'Tarik','Black','Center','Lakers'),(31,'Anthony','Brown','Small_Forward','Lakers'),(32,'Kobe','Bryant','Point_Guard','Lakers'),(33,'Jordon','Clarkson','Shooting_Guard','Lakers'),(34,'Roy','Hibbert','Center','Lakers'),(35,'Marcelo','Huertas','Shooting_Guard','Lakers'),(36,'Larry','Nance','Power_Forward','Lakers'),(37,'Ryan','Kelly','Power_Forward','Lakers'),(38,'MettaWorld','Peace','Small_Forward','Lakers'),(39,'Julius','Randle','Small_Forward','Lakers'),(40,'DAngelo','Russell','Shooting_Guard','Lakers'),(41,'Robert','Sacre','Center','Lakers'),(42,'Lou','Williams','Point_Guard','Lakers'),(43,'Steven','Adams','Center','Thunder'),(44,'Nick','Collison','Small_Forward','Thunder'),(45,'Kevin','Durant','Power_Forward','Thunder'),(46,'Randy','Foye','Point_Guard','Thunder'),(47,'Josh','Huestis','Small_Forward','Thunder'),(48,'Serge','Ibaka','Power_Forward','Thunder'),(49,'Enes','Kanter','Center','Thunder'),(50,'Nazr','Mohammed','Center','Thunder'),(51,'Anthony','Marrow','Point_Guard','Thunder'),(52,'Cameron','Payne','Shooting_Guard','Thunder'),(53,'Andre','Roberson','Shooting_Guard','Thunder'),(54,'Kyle','Singler','Power_Forward','Thunder'),(55,'Dion','Waiters','Point_Guard','Thunder'),(56,'Russell','Westbrook','Shooting_Guard','Thunder');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `points` decimal(3,1) DEFAULT NULL,
  `assists` decimal(3,1) DEFAULT NULL,
  `rebounds` decimal(3,1) DEFAULT NULL,
  `steals` decimal(2,1) DEFAULT NULL,
  `turnovers` decimal(2,1) DEFAULT NULL,
  `fgpercent` decimal(3,2) DEFAULT NULL,
  `three_pt_percent` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,30.1,6.7,5.4,2.4,3.3,0.50,0.45),(2,22.1,2.1,3.8,0.8,1.7,0.47,0.43),(3,14.0,7.4,9.5,1.5,3.2,0.49,0.39),(4,6.3,0.7,1.4,0.3,0.7,0.58,0.42),(5,9.3,1.3,5.1,0.7,1.0,0.36,0.26),(6,5.4,1.4,7.0,0.9,0.7,0.70,0.00),(7,5.0,1.1,1.1,0.7,0.3,0.54,0.33),(8,4.5,0.5,3.8,0.0,1.0,0.57,0.00),(9,10.9,4.3,3.4,1.0,0.7,0.57,0.53),(10,13.1,4.9,3.7,1.0,1.1,0.53,0.00),(11,0.3,0.3,1.0,0.8,0.3,0.00,0.00),(12,3.6,0.2,1.2,0.0,0.2,0.50,0.36),(13,8.6,0.7,2.4,0.0,1.3,0.45,0.29),(14,1.3,0.8,1.8,0.3,0.0,0.33,0.00),(15,7.0,4.3,1.0,0.2,0.3,0.44,0.36),(16,4.6,0.4,2.0,0.4,0.2,0.53,0.38),(17,25.0,5.5,2.0,1.2,1.5,0.47,0.52),(18,23.8,6.8,7.8,2.5,3.2,0.51,0.35),(19,4.8,1.0,2.2,0.0,0.3,0.58,0.54),(20,1.7,0.0,0.3,0.3,0.0,0.67,0.50),(21,0.0,0.0,0.5,0.0,0.5,0.00,0.00),(22,17.2,1.7,12.0,0.5,1.0,0.36,0.42),(23,5.0,0.0,1.0,0.0,0.0,1.00,1.00),(24,0.0,0.3,0.3,0.0,0.5,0.00,0.00),(25,3.2,1.2,3.0,0.3,0.2,0.44,0.38),(26,14.8,1.7,4.2,1.0,0.2,0.49,0.53),(27,4.7,1.0,7.2,0.3,0.5,0.46,0.00),(28,2.5,0.0,0.5,0.5,0.0,0.40,0.25),(29,7.2,1.1,4.3,0.5,0.6,0.55,0.00),(30,3.4,0.4,4.0,0.4,0.6,0.55,0.00),(31,4.0,0.7,2.4,0.5,0.5,0.31,0.29),(32,17.6,2.8,3.7,0.9,2.0,0.36,0.29),(33,15.5,2.4,4.0,1.1,1.7,0.43,0.35),(34,5.9,1.2,4.9,0.4,0.9,0.44,0.00),(35,4.5,3.4,1.7,0.5,1.5,0.42,0.26),(36,5.5,0.7,5.0,0.9,0.7,0.53,0.10),(37,4.2,0.6,3.4,0.4,0.5,0.37,0.14),(38,5.0,0.8,2.5,0.6,0.4,0.31,0.31),(39,11.3,1.8,10.2,0.7,1.8,0.43,0.28),(40,13.2,3.3,3.4,1.2,2.5,0.43,0.35),(41,3.5,0.6,2.9,0.2,0.5,0.41,0.00),(42,15.3,2.5,2.6,0.9,1.6,0.41,0.34),(43,9.6,0.7,9.3,0.4,1.0,0.64,0.00),(44,0.8,0.7,1.3,1.3,0.2,0.50,0.00),(45,24.9,3.7,6.7,0.3,3.3,0.40,0.27),(46,2.7,1.5,2.3,0.0,1.0,0.26,0.33),(47,1.5,0.0,1.5,0.0,0.0,0.33,0.50),(48,13.4,0.4,5.4,1.3,0.1,0.59,0.54),(49,13.4,0.4,0.3,0.3,1.1,0.66,0.16),(50,1.0,0.0,1.0,0.0,0.5,1.00,0.00),(51,2.9,0.0,0.1,0.3,0.3,0.46,0.38),(52,2.0,1.5,0.3,0.3,0.8,0.25,0.40),(53,2.7,0.4,4.0,1.3,0.6,0.35,0.10),(54,2.0,0.0,1.3,0.0,0.0,0.40,0.67),(55,9.9,1.7,2.6,0.7,1.6,0.44,0.38),(56,24.7,10.7,6.4,1.7,3.6,0.43,0.32);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_name` varchar(30) NOT NULL,
  PRIMARY KEY (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Cavaliers'),('Lakers'),('Thunder'),('Warriors');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_playerlist`
--

DROP TABLE IF EXISTS `user_playerlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_playerlist` (
  `user_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `user_playerlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_playerlist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_playerlist`
--

LOCK TABLES `user_playerlist` WRITE;
/*!40000 ALTER TABLE `user_playerlist` DISABLE KEYS */;
INSERT INTO `user_playerlist` VALUES (1,NULL),(1,1);
/*!40000 ALTER TABLE `user_playerlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kevin','yan',NULL,'kevinyan@gmail.com','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 21:48:21
