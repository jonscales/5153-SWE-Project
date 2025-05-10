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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alice','Johnson','alice@example.com'),(2,'Bob','Smith','bob@example.com'),(3,'Charlie','Brown','charlie@example.com'),(4,'John','Doe','john.doe@example.com'),(5,'Jane','Smith','jane.smith@example.com'),(6,'Michael','Johnson','michael.johnson@example.com'),(7,'Emily','Davis','emily.davis@example.com'),(8,'Chris','Brown','chris.brown@example.com'),(9,'Anna','Taylor','anna.taylor@example.com'),(10,'David','Clark','david.clark@example.com'),(11,'Laura','Walker','laura.walker@example.com'),(12,'Peter','Hall','peter.hall@example.com'),(13,'Linda','Adams','linda.adams@example.com'),(14,'Tom','Evans','tom.evans@example.com'),(15,'Sophia','White','sophia.white@example.com'),(16,'Jack','Lewis','jack.lewis@example.com'),(17,'Amelia','Young','amelia.young@example.com'),(18,'Oscar','Scott','oscar.scott@example.com'),(19,'Ella','Green','ella.green@example.com'),(20,'James','Hill','james.hill@example.com'),(21,'Mia','Harris','mia.harris@example.com'),(22,'Henry','Martin','henry.martin@example.com'),(23,'Emily','Turner','emily.turner@example.com'),(24,'cooper','test','test@gmail.com'),(25,'Tommy','Test','Ttest@gmail.com'),(26,'Michael','Young','Myoung@yahoo.com'),(27,'Trevor','Shawn','tsawn@msu.edu'),(28,'Adam','Justin','a.justin@race.com'),(29,'Cooper','Jeffery','CoopJeff@meta.com'),(30,'Matthew','West','m.west@yahoo.com'),(31,'Carol','Friddle','Carol.Friddle@outlook.com'),(32,'Cooper','Jeffery','CoopJeff@gmail.com'),(33,'\" \"','\" \"','\" \"'),(34,'Travis','Griffen','T.griff@gmail.com'),(35,'\" \"','\" \"','Makayla'),(36,'Makayla','Shermer','Makayla.Shermer@gmail.com'),(37,'Jackson','Hardt','Jackson.H@gmail.com'),(38,'George','Parker','George.Parker@yahoo.com'),(39,'George','Sampson','George.Sampson@gmail.com'),(40,'Jake','Pittman','JackPitt@hotmail.com'),(41,'Jake','Hamlet','Jack.Hamlet@hotmail.com'),(42,'Keith','Hamlet','Keith.Hamlet@hotmail.com'),(43,'Tom','Shenk','TomS@gmail.com'),(44,'Tommy','Shenk','TommyS@gmail.com'),(45,'Tryston','James','Tryston.James@gmail.com'),(46,'Trevor','James','Trevor.James@gmail.com'),(47,'jon','lkasjdf','asdfa2@ASDF.KASD'),(48,'Manny','Miller','mm@gmail.com'),(49,'jon','scales','jon@scales.com'),(51,'Garrett','Turner','G.Turner@gmail.com'),(52,'test','for','cooper@gmail.com'),(53,'Frank','Wolf','Fwolf@yahoo.com'),(54,'jon','asdf','aasd@sasdf.com'),(55,'William','Jacks','Will.Jacks@hotmail.com'),(56,'Cy','Hoff','Cy.Hoff@rocketmail.com'),(58,'Gary','Blagg','GaryB@gmail.com'),(60,'Griffen','John','Griff.John@gmail.com'),(61,'Cooper','Jackson','Coopdog@gmail.com'),(62,'Sampson','LaShae','Strongman@gmail.com'),(64,'Jessica','Donn','Jess.Donn@gmail.com'),(65,'Gage','Mason','Gage.M132@gmail.com'),(66,'Mike','Mason','Mike.Mason@gmail.com'),(67,'Frank','Thomas','FrankAT67@aol.com'),(68,'Jimmy','Dean','Jim.Dean01@gmail.com'),(69,'Mia','Moore','Mmmoore@gmail.com'),(70,'Mia','Murphy ','Murphy18473@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
