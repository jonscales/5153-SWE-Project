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
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `booth_location` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'bikemart','Bikes & Gear, Clothing','1','https://www.bikemart.com/','https://storage.googleapis.com/hhh_vendors_logos/BikeMartLogo.png'),(2,'gutr','Clothing','3','https://www.sweatgutr.com/','https://storage.googleapis.com/hhh_vendors_logos/GUTR_logo_3d.png'),(3,'kustom','Bikes & Gear, Memorabilia','10','https://kustomventures.com/','https://storage.googleapis.com/hhh_vendors_logos/KV_Logo_400x200_93a40984-3982-4d5d-b873-0fdc9ba591e2_410x.webp'),(4,'clif','Nutrition','2','https://www.clifbar.com/','https://storage.googleapis.com/hhh_vendors_logos/clifbar-logo-PuSQQGwo.png'),(5,'hh100','Clothing, Memorabilia','16','https://store.hh100.org/','https://storage.googleapis.com/hhh_vendors_logos/hh100-logo.jpg'),(6,'oakley','Clothing','7','https://www.oakley.com/en-us','https://storage.googleapis.com/hhh_vendors_logos/oakley.png'),(7,'picklejuice','Nutrition','8','https://picklepower.com/','https://storage.googleapis.com/hhh_vendors_logos/picklejuice.png'),(8,'sunskisports','Bikes & Gear, Clothing','6','https://www.sunandski.com/','https://storage.googleapis.com/hhh_vendors_logos/sunskisportslogo.png'),(9,'thebikestop','Bikes & Gear, Clothing','4','https://www.thebikestoponline.com/','https://storage.googleapis.com/hhh_vendors_logos/thebikestoplogoblack.png');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
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
