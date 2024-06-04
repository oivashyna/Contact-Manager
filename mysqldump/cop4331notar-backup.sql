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
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateLastLoggedIn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FirstName` varchar(50) NOT NULL DEFAULT '',
  `LastName` varchar(50) NOT NULL DEFAULT '',
  `PhoneNumber` varchar(50) NOT NULL DEFAULT '',
  `EmailAddress` varchar(50) NOT NULL DEFAULT '',
  `UserID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
INSERT INTO `Contacts` VALUES (1,'2024-06-02 22:19:35','2024-06-02 22:19:35','James','Bond','007-658-2510','jbond007@gmail.com',1),(2,'2024-06-02 22:19:35','2024-06-02 22:19:35','Mary Jane','Watson','168-943-5217','mjLovesPete@gmail.com',1),(3,'2024-06-02 22:19:35','2024-06-02 22:19:35','Tony','Stark','597-546-8210','iAmIronMan@gmail.com',2),(4,'2024-06-02 22:19:35','2024-06-02 22:19:35','Bruce','Wayne','873-549-6218','imBatMan@gmail.com',2),(9,'2024-06-03 00:05:54','2024-06-03 00:05:54','Sage','Jacobs','123-123-1234','email@gmail.com',1),(14,'2024-06-03 05:21:49','2024-06-03 05:21:49','Adam','Warlock','489-658-2541','beRash@email.com',1),(15,'2024-06-03 05:22:33','2024-06-03 05:22:33','Peter','Porker','658-983-2405','hammyp@gmail.com',1),(20,'2024-06-03 06:20:01','2024-06-03 06:20:01','Jerry','Slime','984-587-6570','ripmyboi@gmail.com',5),(21,'2024-06-03 06:31:30','2024-06-03 06:31:30','James','Bond','007-983-2514','jbond007@gmail.com',5),(22,'2024-06-03 06:32:00','2024-06-03 06:32:00','Adam','Warlock','948-657-0021','dontberash@yahoo.com',5),(26,'2024-06-03 17:11:55','2024-06-03 17:11:55','Jane','Bennett','576-293-8475','jbennett@gmail.com',6),(28,'2024-06-03 21:54:12','2024-06-03 21:54:12','George','Washington','123-123-1234','america@gmail.com',3),(29,'2024-06-03 22:13:56','2024-06-03 22:13:56','Peter','Parker','111-111-1111','spiderman@gmail.com',3),(30,'2024-06-03 22:14:26','2024-06-03 22:14:26','Mickey','Mouse','555-888-5555','disney@gmail.com',3),(31,'2024-06-04 01:01:42','2024-06-04 01:01:42','Thing','One','548-653-0001','thing1@email.com',5),(32,'2024-06-04 01:02:17','2024-06-04 01:02:17','Thing','Two','548-653-0002','thing2@email.com',5),(33,'2024-06-04 01:02:39','2024-06-04 01:02:39','Test','Dummy','123-123-1234','imNotDumb@yahoo.com',5),(34,'2024-06-04 01:03:43','2024-06-04 01:03:43','The','Thing','259-983-2014','whatIsThat@gmail.com',5),(37,'2024-06-04 02:32:57','2024-06-04 02:32:57','Lightning','McQueen','736-625-0095','kachow95@gmail.com',15),(39,'2024-06-04 16:14:54','2024-06-04 16:14:54','Gage','Notargiacomo','123-123-1234','email@gmail.com',1),(40,'2024-06-04 16:18:11','2024-06-04 16:18:11','Gage','Notargiacomo','123-123-1234','email@gmail.com',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'2024-06-02 22:19:22','2024-06-02 22:19:22','Rick','Leinecker','RickL','COP4331'),(2,'2024-06-02 22:19:22','2024-06-02 22:19:22','Sam','Hill','SamH','Test'),(3,'2024-06-02 22:19:22','2024-06-02 22:19:22','Rick','Leinecker','RickL','5832a71366768098cceb7095efb774f2'),(4,'2024-06-02 22:19:25','2024-06-02 22:19:25','Sam','Hill','SamH','0cbc6611f5540bd0809a388dc95a615b'),(5,'2024-06-03 00:45:13','2024-06-03 00:45:13','Gage','Notargiacomo','gagenotar','0c659afc0fa76012618a7d5a5a64639b'),(6,'2024-06-03 02:11:23','2024-06-03 02:11:23','Olga','Ivashyna','oivashyna','a253e402039b148ac2a0e690cb7bc1e6'),(7,'2024-06-03 03:02:08','2024-06-03 03:02:08','laura','Devito','wdwe','2467d3744600858cc9026d5ac6005305'),(8,'2024-06-03 03:05:15','2024-06-03 03:05:15','Marty','McFly','mmcfly','0b4e77db3051b9a972c47907659ce4a1'),(9,'2024-06-03 03:06:15','2024-06-03 03:06:15','James','bond','bond','d524876bbfa7103d5c34e16ab571c277'),(10,'2024-06-03 03:15:53','2024-06-03 03:15:53','Adam','Sandler','SandlerRocks','5f4dcc3b5aa765d61d8327deb882cf99'),(11,'2024-06-03 23:59:34','2024-06-03 23:59:34','','','','219d5a6fb8a63bf97769b9154d8018a1'),(12,'2024-06-03 23:59:48','2024-06-03 23:59:48','Mary','Bartlinski','mbart','1ebc61ff59edc24357ae2c9fbfe9626c'),(13,'2024-06-04 00:00:07','2024-06-04 00:00:07','mickey','mouse','mm','f240a4a08ef4d49a9b643168779d8491'),(14,'2024-06-04 00:02:16','2024-06-04 00:02:16','chucky','cheese','mouse','40203abe6e81ed98cbc97cdd6ec4f144'),(15,'2024-06-04 02:30:40','2024-06-04 02:30:40','Lady','Faith','faith777','48850da0b244e84a2f7adacc7842b042');
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

-- Dump completed on 2024-06-04 16:18:16
