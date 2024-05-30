-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: ContactManager
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Contacts`
--

DROP TABLE IF EXISTS `Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contacts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Phone` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `UserID` int NOT NULL DEFAULT '0',
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
INSERT INTO `Contacts` VALUES (1,'Rick','Leinecker','(717) 550-1675','felew83539@rencr.com',0,'2024-05-25 01:13:47'),(2,'Sam','Hill','(206) 342-8631','hills@gmail.com',0,'2024-05-25 01:13:47'),(3,'Rick','Leinecker','(828) 604-0970','rleinecker@yahoo.com',0,'2024-05-25 01:13:47'),(4,'Sam','Hill','(430) 352-3473','kwest@hotmail.com',0,'2024-05-25 01:13:47'),(5,'John','Doe','123-456-7890','john_doe@example.com',5,'2024-05-28 19:03:22'),(6,'John','Doe','123-456-7890','john_doe@example.com',1,'2024-05-29 12:30:23'),(7,'s','C','1231231234','s@ucf.edu',0,'2024-05-29 13:00:08'),(8,'lamp','mcgee','3958374627','lmcgee@gmail.com',0,'2024-05-29 13:00:52'),(9,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:01:25'),(10,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:01:31'),(11,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:01:56'),(12,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:01:59'),(13,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:02:13'),(14,'Gage','N','1234567890','gagenotar@gmail.com',0,'2024-05-29 13:02:15'),(15,'A','B','1234567890','C',0,'2024-05-29 13:25:15'),(16,'A','B','1234567890','C',0,'2024-05-29 13:29:34'),(17,'A','B','0123456789','C',0,'2024-05-29 13:48:01'),(18,'bradley ','cooper','3847362514','dbcooper@gmail.com',0,'2024-05-29 18:30:28'),(19,'S','C','1231231234','s@ucf.edu',0,'2024-05-29 18:37:54'),(20,'J','M','1231231233','jm@ucf.edu',0,'2024-05-29 18:38:58'),(21,'S','C','1231231234','s@ucf.edu',0,'2024-05-29 18:44:05'),(22,'s','s','1231231234','s@ucf.edu',0,'2024-05-29 19:42:15'),(23,'A','B','0123456789','C',0,'2024-05-29 23:53:47'),(24,'A','B','1231231234','C',0,'2024-05-30 00:21:21'),(25,'A','B','1231231234','C',0,'2024-05-30 00:29:53'),(26,'jeremy','trainor','4958372537','jtrainor@gmail.com',0,'2024-05-30 00:54:09'),(27,'jeremy','trainor','4958372537','jtrainor@gmail.com',0,'2024-05-30 00:54:29'),(28,'A','B','1231231234','C',0,'2024-05-30 00:57:52'),(29,'A','B','1231231234','C',0,'2024-05-30 01:26:49'),(30,'A','B','1231231234','C',0,'2024-05-30 01:26:55'),(31,'A','B','1231231234','C',0,'2024-05-30 01:26:59'),(32,'add','person','3948765364','addperson@gmail.com',0,'2024-05-30 02:31:37'),(33,'add','addition','3958472098','addadd@gmail.com',0,'2024-05-30 02:32:24'),(34,'add','dad','1234567891','addad@gmail.com',0,'2024-05-30 02:44:05'),(35,'girl','stop','2098763642','girlstop@mail.ru',0,'2024-05-30 02:46:03'),(36,'girl','no','3987654321','girlno@hotmail.com',0,'2024-05-30 02:55:23'),(37,'please','stop','1236547685','pstop@aol.com',0,'2024-05-30 03:23:44'),(38,'s','c','1231231234','s@ucf.edu',0,'2024-05-30 03:26:05'),(39,'please','stop','1236547685','pstop@aol.com',0,'2024-05-30 04:00:29'),(40,'please','stop','1236547685','pstop@aol.com',0,'2024-05-30 04:00:39'),(41,'Jane','Austen','(374)-487-3049','derbershire@gmail.com',0,'2024-05-30 04:20:50'),(42,'Jane','Austen','(374)-487-3049','derbershire@gmail.com',0,'2024-05-30 04:29:04'),(43,'Jane','Bennett','3985747357','jbennet@gmail.com',0,'2024-05-30 04:29:38'),(45,'Elizabeth','Bennett','9685747353','ebennet@gmail.com',0,'2024-05-30 04:40:25'),(46,'Elizabeth','Bennett','9685747353','ebennet@gmail.com',0,'2024-05-30 04:44:51'),(47,'Catherine','Bennett','3948371236','cbennet@gmail.com',0,'2024-05-30 04:57:30'),(48,'Catherine','Bennett','3948371236','cbennet@gmail.com',0,'2024-05-30 04:58:42'),(49,'Lydia','Bennett','3948371239','lbennet@gmail.com',0,'2024-05-30 05:09:18'),(50,'Mrs','Bennett','3948371239','lbennet@gmail.com',0,'2024-05-30 05:18:27'),(51,'Mr','Bennett','3948756384','mbennet@gmail.com',0,'2024-05-30 05:34:06'),(52,'s','c','2399860677','sergiocontrer@icloud.com',0,'2024-05-30 11:58:33'),(53,'Jason','Devito','7724866211','jasondevito1029@gmail.com',0,'2024-05-30 12:01:38'),(54,'Jason','Devito','7724866211','jasondevito1029@gmail.com',0,'2024-05-30 12:01:48'),(55,'John','doe','7723332333','johdndoe@gmail',0,'2024-05-30 12:02:16'),(56,'s','c','2399860677','sergio@ucf.edu',0,'2024-05-30 12:05:59'),(57,'s','c','2399860677','sergio@ucf.edu',0,'2024-05-30 12:07:16'),(58,'serg','co','2399860677','sergio@ucf.edu',0,'2024-05-30 12:07:55'),(59,'Mary','Bennet','3948765984','mbennet@gmail.com',0,'2024-05-30 12:23:11'),(60,'s','c','2399860677','sergiocontrer@icloud.com',0,'2024-05-30 12:27:20'),(61,'ser','c','2399860677','sergiocontrer@icloud.com',0,'2024-05-30 12:28:18'),(62,'ser','c','2399860677','sergiocontrer@icloud.com',0,'2024-05-30 12:31:29'),(63,'s','c','2399860677','sergiocontrer@icloud.com',0,'2024-05-30 12:32:14'),(64,'s','c','2399860677','sergio@ucf.edu',0,'2024-05-30 12:33:50'),(65,'s','c','2399860677','sergio@ucf.edu',0,'2024-05-30 12:34:01'),(66,'Johnny','Appleseed','123 123 1234','jseed@gmail.com',1,'2024-05-30 14:06:35'),(67,'Johnny','Appleseed','123 123 1234','jseed@gmail.com',1,'2024-05-30 14:11:12'),(68,'Johnny','Appleseed','123 123 1234','jseed@gmail.com',1,'2024-05-30 14:13:14'),(69,'Johnny','Appleseed','123 123 1234','jseed@gmail.com',1,'2024-05-30 14:57:06');
/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateLastLoggedIn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `Login` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'2024-05-26 13:37:56','2024-05-26 13:37:56','Rick','Leinecker','RickL','COP4331'),(2,'2024-05-26 14:05:18','2024-05-26 14:05:18','Sam','Hill','SamH','Test'),(3,'2024-05-26 14:05:18','2024-05-26 14:05:18','Rick','Leinecker','RickL','5832a71366768098cceb7095efb774f2'),(4,'2024-05-26 14:05:18','2024-05-26 14:05:18','Sam','Hill','SamH','0cbc6611f5540bd0809a388dc95a615b'),(5,'2024-05-27 14:44:32','2024-05-27 14:44:32','Olga','Ivashyna','oivashyna','a253e402039b148ac2a0e690cb7bc1e6'),(6,'2024-05-27 20:20:20','2024-05-27 20:20:20','Gage','Notargiacomo','gagenotar','0c659afc0fa76012618a7d5a5a64639b'),(7,'2024-05-27 22:31:37','2024-05-27 22:31:37','JaSON','dEVITO','HJASDJDJ','9bd3dc22d943cec2f688ac1105240abc'),(8,'2024-05-27 23:11:34','2024-05-27 23:11:34','Jason','Devito','jason1029','5a076b247c4086a53d558b3fe38821bd'),(9,'2024-05-28 19:07:25','2024-05-28 19:07:25','John','Doe','john_doe','password123'),(10,'2024-05-29 11:46:35','2024-05-29 11:46:35','L','S','lpf','e6b8e5098d1621bebf53a21591b69985'),(11,'2024-05-29 12:23:52','2024-05-29 12:23:52','Sergio','Contrera','lpf','3bffa4ebdf4874e506c2b12405796aa5'),(12,'2024-05-29 12:57:23','2024-05-29 12:57:23','s','c','sc','d54185b71f614c30a396ac4bc44d3269'),(13,'2024-05-29 16:18:41','2024-05-29 16:18:41','Jason','Devito','jason1029','1616d50b5c0ef605305f10a2b1b47826'),(14,'2024-05-29 16:57:00','2024-05-29 16:57:00','John','Doe','john_doe','password123'),(15,'2024-05-29 18:37:37','2024-05-29 18:37:37','ss','cc','sccc','d54185b71f614c30a396ac4bc44d3269'),(16,'2024-05-29 19:41:55','2024-05-29 19:41:55','s','c','lpf','202cb962ac59075b964b07152d234b70'),(17,'2024-05-30 02:57:00','2024-05-30 02:57:00','John','Doe','john_doe','newpass'),(18,'2024-05-30 03:12:14','2024-05-30 03:12:14','Test','Test','Testy','3a253ec561547aca7e3cadf1e271736c'),(19,'2024-05-30 03:25:45','2024-05-30 03:25:45','S','C','lpf','3bffa4ebdf4874e506c2b12405796aa5'),(20,'2024-05-30 03:57:12','2024-05-30 03:57:12','John','Doe','john_doe','password123'),(21,'2024-05-30 04:04:15','2024-05-30 04:04:15','serg','c','serg','827ccb0eea8a706c4c34a16891f84e7b'),(22,'2024-05-30 04:59:38','2024-05-30 04:59:38','John','Doe','john_doe','password123'),(23,'2024-05-30 05:02:46','2024-05-30 05:02:46','John','Doe','john_doe','password23'),(24,'2024-05-30 12:06:35','2024-05-30 12:06:35','John','Doe','john_doe','password123'),(25,'2024-05-30 12:23:15','2024-05-30 12:23:15','s','c','abc','202cb962ac59075b964b07152d234b70'),(26,'2024-05-30 12:40:56','2024-05-30 12:40:56','Jason','Devito','jason1029','472d46cb829018f9dbd65fb8479a49bb'),(27,'2024-05-30 12:55:53','2024-05-30 12:55:53','John','Doe','john_doe','password123'),(28,'2024-05-30 12:56:28','2024-05-30 12:56:28','John','Doe','john_doe','password123'),(29,'2024-05-30 13:48:43','2024-05-30 13:48:43','Sergio','Contreras','sc','202cb962ac59075b964b07152d234b70'),(30,'2024-05-30 14:10:20','2024-05-30 14:10:20','John','Doe','john_doe','password123'),(31,'2024-05-30 14:20:13','2024-05-30 14:20:13','jake','statefarm','jakefromstatefarm','57fb78ec095fe6e736c13d3177e6ce08'),(32,'2024-05-30 14:27:57','2024-05-30 14:27:57','John','Doe','john_doe','password123'),(33,'2024-05-30 14:37:20','2024-05-30 14:37:20','John','Doe','john_doe','password123'),(34,'2024-05-30 15:23:21','2024-05-30 15:23:21','James','Baldwin','jballin','423ac084531624ec9694acd4a5c278ab'),(35,'2024-05-30 15:44:42','2024-05-30 15:44:42','John','Smith','jsmith','5832a71366768098cceb7095efb774f2');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 15:50:48
