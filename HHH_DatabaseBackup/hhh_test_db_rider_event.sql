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
-- Table structure for table `rider_event`
--

DROP TABLE IF EXISTS `rider_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rider_event` (
  `rider_id` int NOT NULL,
  `event_id` int NOT NULL,
  `bib_number` int DEFAULT NULL,
  `has_paid` tinyint DEFAULT '0',
  PRIMARY KEY (`rider_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `rider_event_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `rider` (`rider_id`),
  CONSTRAINT `rider_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider_event`
--

LOCK TABLES `rider_event` WRITE;
/*!40000 ALTER TABLE `rider_event` DISABLE KEYS */;
INSERT INTO `rider_event` VALUES (6,1,1234,1),(7,2,7777,1),(9,1,11553,1),(10,1,1111,1),(11,2,115432,1),(12,2,257532,1),(13,3,56325,1),(14,1,NULL,0),(15,2,NULL,0),(16,3,NULL,0),(17,4,NULL,0),(18,5,NULL,0),(19,6,NULL,0),(20,7,NULL,0),(21,8,NULL,0),(22,9,NULL,0),(23,1,NULL,0),(24,2,NULL,0),(25,3,NULL,0),(26,4,NULL,0),(27,5,NULL,0),(28,6,NULL,0),(29,1,NULL,0),(30,13,NULL,0),(31,14,NULL,0),(32,13,NULL,0),(33,13,NULL,0),(34,14,NULL,0),(35,11,NULL,0),(36,12,NULL,0),(37,1,NULL,0),(38,15,NULL,0),(39,15,NULL,0),(40,11,NULL,0),(41,12,NULL,0),(42,7,NULL,0),(43,8,NULL,0),(44,12,NULL,0),(45,12,NULL,0),(46,14,NULL,0),(47,8,NULL,0),(48,7,NULL,0),(49,9,NULL,0),(50,6,10001,1),(51,10,NULL,0),(52,1,NULL,0),(53,5,NULL,0),(54,3,NULL,0),(55,2,NULL,0),(56,13,NULL,0),(57,5,NULL,0),(58,15,NULL,0),(59,15,NULL,0),(60,1,NULL,0),(61,16,NULL,0),(62,5,NULL,0),(63,15,NULL,0),(64,15,NULL,0),(65,16,NULL,0),(66,15,NULL,0),(67,8,NULL,0),(68,14,NULL,0),(69,14,NULL,0);
/*!40000 ALTER TABLE `rider_event` ENABLE KEYS */;
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
