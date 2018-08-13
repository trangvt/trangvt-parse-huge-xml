-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: ipt
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x425` tinyint(4) DEFAULT NULL COMMENT 'v3.0: descriptivedetail->subject - MainSubject',
  `b067` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT 'v3.0: descriptivedetail->subject - SubjectSchemeIdentifier',
  `b068` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail>subject - SubjectSchemeVersion',
  `b069` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->subject - SubjectCode',
  `b070` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->subject - SubjectHeadingText',
  `b171` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->subject - SubjectSchemeName',
  `product_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,1,'10','2016','SCI013050','','',1,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(2,1,'26','2.0','1654','','',1,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(3,1,'23','','CH81','Methods - Synthesis & Techniques','Wiley Subject Code',1,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(4,1,'24','','CH81','Methods - Synthesis & Techniques ','Wiley Online Library Subject Code',1,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(5,1,'10','2016','SCI013040','','',2,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(6,1,'26','2.0','1654','','',2,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(7,1,'23','','CH80','Organic Chemistry','Wiley Subject Code',2,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(8,1,'24','','CH80','Organic Chemistry ','Wiley Online Library Subject Code',2,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(9,1,'10','2016','SCI013050','','',3,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(10,1,'26','2.0','1655','','',3,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(11,1,'23','','CH90','Physical Chemistry','Wiley Subject Code',3,'2018-08-10 16:02:33','2018-08-10 16:02:33'),(12,1,'24','','CH90','Physical Chemistry ','Wiley Online Library Subject Code',3,'2018-08-10 16:02:33','2018-08-10 16:02:33');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-10 19:21:39
