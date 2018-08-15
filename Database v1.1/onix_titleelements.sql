-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: onix
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
-- Table structure for table `titleelements`
--

DROP TABLE IF EXISTS `titleelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titleelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b034` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x409` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x410` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b020` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b203` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b030` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x501` tinyint(4) DEFAULT NULL,
  `b031` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b029` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titleelements`
--

LOCK TABLES `titleelements` WRITE;
/*!40000 ALTER TABLE `titleelements` DISABLE KEYS */;
INSERT INTO `titleelements` VALUES (1,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-15 18:29:22','2018-08-15 18:29:22'),(2,'123','12','12 titleelement 410','1991','12 titledetail titleelement 203','12 titleelement 30',1,'12 TitleWithoutPrefix','12 Subtitle','2018-08-15 18:29:22','2018-08-15 18:29:22');
/*!40000 ALTER TABLE `titleelements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 19:15:36
