-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hhh_test_db
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_main` varchar(255) NOT NULL,
  `event_sub` varchar(255) DEFAULT NULL,
  `event_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Endurance Rides (25-100miles)','100 mi',75.00),(2,'Endurance Rides (25-100miles)','75 mi',75.00),(3,'Endurance Rides (25-100miles)','100 K',75.00),(4,'Endurance Rides (25-100miles)','50 mi',75.00),(5,'Endurance Rides (25-100miles)','25 mi',75.00),(6,'Wee-Chi-Tah MTB Races','Cat 1 ( 23 mi)',75.00),(7,'Wee-Chi-Tah MTB Races','Cat 2 (16mi)',75.00),(8,'Wee-Chi-Tah MTB Races','Novice (11.5mi)',75.00),(9,'Wee-Chi-Tah MTB Races','Beginner (11.5mi)',75.00),(10,'Wee-Chi-Tah MTB Races','Junior (9-18 yr old  11.5mi)',75.00),(11,'Wee-Chi-Tah Trail Run','Short 10K (6.2mi)',75.00),(12,'Wee-Chi-Tah Trail Run','Long 12 mi (19.3K)',75.00),(13,'Grava del Fuego','Sasquatch (42mi)',75.00),(14,'Grava del Fuego','Party Loop (27mi)',75.00),(15,'10 K Adult','none',50.00),(16,'10 K Child','none',0.00);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-14 13:14:38
