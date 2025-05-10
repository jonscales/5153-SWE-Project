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
-- Table structure for table `rider`
--

DROP TABLE IF EXISTS `rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rider` (
  `rider_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `gender` enum('Male','Female','M','F','NA') DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state_country` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `emg_cont_name` varchar(255) DEFAULT NULL,
  `emg_cont_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rider_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rider_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider`
--

LOCK TABLES `rider` WRITE;
/*!40000 ALTER TABLE `rider` DISABLE KEYS */;
INSERT INTO `rider` VALUES (6,1,'Female','63','New York','USA','555-1234','John Johnson','555-5678'),(7,2,'Male','64','Los Angeles','USA','555-2345','Sarah Smith','555-6789'),(9,4,'Male','61','Austin','Texas, USA','123-456-7890','Jane Doe','987-654-3210'),(10,5,'Female','42','San Francisco','California, USA','234-567-8901','John Smith','876-543-2109'),(11,6,'Male','61','New York','New York, USA','345-678-9012','Sarah Johnson','765-432-1098'),(12,7,'Female','60','Los Angeles','California, USA','456-789-0123','David Davis','654-321-0987'),(13,8,'Male','45','Houston','Illinois, USA','567-890-1234','Michael Brown','543-210-9876'),(14,9,'Female','29','Dallas','Texas, USA','555-1111','John Taylor','555-2222'),(15,10,'Male','45','Phoenix','Arizona, USA','555-3333','Sarah Clark','555-4444'),(16,11,'Female','69','Chicago','Illinois, USA','555-5555','David Walker','555-6666'),(17,12,'Male','34','Miami','Florida, USA','555-7777','Laura Hall','555-8888'),(18,13,'Female','52','Seattle','Washington, USA','555-9999','Peter Adams','555-0000'),(19,14,'Male','37','Denver','Colorado, USA','555-1212','Sophia Evans','555-2323'),(20,15,'Female','63','Portland','Oregon, USA','555-3434','Tom White','555-4545'),(21,16,'Male','31','Atlanta','Georgia, USA','555-5656','Jack Lewis','555-6767'),(22,17,'Female','52','Boston','Massachusetts, USA','555-7878','Amelia Young','555-8989'),(23,18,'Male','44','Nashville','Tennessee, USA','555-9090','Oscar Scott','555-0101'),(24,19,'Female','47','San Diego','California, USA','555-1213','Ella Green','555-3434'),(25,20,'Male','33','Las Vegas','Nevada, USA','555-4545','James Hill','555-5656'),(26,21,'Female','61','San Jose','California, USA','555-6767','Mia Harris','555-7878'),(27,22,'Male','30','Orlando','Florida, USA','555-8989','Henry Martin','555-9090'),(28,23,'Female','55','Austin','Texas, USA','555-0101','Emily Turner','555-1212'),(29,32,'Male','62','Graham','76389','940-1233-5432','Jimmy','Parker'),(30,37,'Male','23','Wichita Falls','38269','9405555555','Jimmy Franklin','9401267106'),(31,38,'Male','69','Gainsville','66303','(940) 636-0268','Sally Parker','(940) 555-2815'),(32,39,'Male','51','Gainsville','66303','(940) 228-9014','Mark Sampson','(940) 178-4229'),(33,44,'Male','28','Windthorst','02719','(940) 000-5555','Sally Shenk','(940) 111-0345'),(34,44,'Male','24','Windthorst','02719','(940) 000-5555','Sally Shenk','(940) 111-0345'),(35,45,'Male','19','Archer CIty','92919','(940) 624-0184','Mikah James','(940) 624-1111'),(36,46,'Male','55','Archer City','76399','(940) 884-1954','Tina James','(940) 129-5822'),(37,28,'Male','46','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(38,28,'Male','46','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(39,28,'Male','22','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(40,28,'Male','59','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(41,28,'Male','54','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(42,48,'Male',NULL,'Tyler','76362','(940) 631-1044','Mikah Miller','(940) 631-3456'),(43,48,'Male',NULL,'Tyler','76399','(940) 631-5777','Mikah Miller','(940) 631-9911'),(44,28,'NA',NULL,'Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(45,28,'NA','21','Holiday','66311','940-631-2788','Alice Justin','940-631-2222'),(46,51,'Male','99','Austin','67104','(944) 339-9110','Gary Turner','(944) 148-1927'),(47,51,'Male','32','Auston','58205','(940) 193-7521','Jannett Turner','(940) 185-2865'),(48,51,'Male','32','Auston','58205','(940) 193-7521','Jannett Turner','(940) 185-2865'),(49,51,'Male','32','Auston','58205','(940) 193-7521','Jannett Turner','(940) 185-2865'),(50,53,'Male','48','Windthorst','76389','(940) 631-3847','John Wolf','(940) 184-7524'),(51,53,'Male','48','Windthorst','76389','(940) 631-3847','John Wolf','(940) 184-7524'),(52,53,'Male','48','Windthorst','76389','(940) 631-3847','John Wolf','(940) 184-7524'),(53,53,'Male','48','Windthorst','76389','(940) 631-3847','John Wolf','(940) 184-7524'),(54,53,'Male','48','Windthorst','76389','(940) 631-3847','John Wolf','(940) 184-7524'),(55,55,'Male','33','Windthorst','76389','(940) 631-2857','Wonda Wolf','(940) 136-9453'),(56,56,'Male','26','Olney','67314','(940) 542-9826','Patsy Hoff','(940) 542-9165'),(57,56,'Female','26','Olney','67314','(940) 542-9826','Patsy Hoff','(940) 542-9165'),(58,56,'Female','26','Scotland','63774','(940) 599-1873','Jane Hoff','(803) 582-8473'),(59,58,'NA','41','Tyler','28347','(940) 291-9635','Gina Blagg','(940) 777-1632'),(60,58,'Male','41','Tyler','28347','(940) 291-9635','Gina Blagg','(940) 777-1632'),(61,58,'Male','13','Tyler','28347','(940) 291-9635','Gina Blagg','(940) 777-1632'),(62,60,'Male','40','Lubbock','28355','(940) 101-0101','Tommy John','(940) 777-8989'),(63,61,'Male','22','Dallas','67321','(940) 295-3585','Kenzi Frank','(940) 194-0371'),(64,65,'Male','31','Jackson','73101','(940) 447-7103','Jin Mason','(940) 447-7104'),(65,65,'Male','13','Jackson','73101','(940) 447-7103','Jin Mason','(940) 447-7104'),(66,67,'Male','24','Windthorst','76389','(565) 658-8564','Bella Thomas','(940) 613-4584'),(67,68,'Male','22','Archer City','76340','(940) 255-0555','Jessica Dean','(940) 255-5550'),(68,68,'Male','22','Archer City','76340','(940) 255-0555','Jessica Dean','(940) 255-5550'),(69,68,'Male','22','Archer City','76340','(940) 255-0555','Jessica Dean','(940) 255-5550');
/*!40000 ALTER TABLE `rider` ENABLE KEYS */;
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
