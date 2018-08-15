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
-- Table structure for table `productparts`
--

DROP TABLE IF EXISTS `productparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productparts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a001` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x457` tinyint(4) DEFAULT NULL,
  `b012` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b333` longtext COLLATE utf8_unicode_ci,
  `b225` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b014` longtext COLLATE utf8_unicode_ci,
  `b385` longtext CHARACTER SET utf8,
  `x322` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x323` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x316` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productparts`
--

LOCK TABLES `productparts` WRITE;
/*!40000 ALTER TABLE `productparts` DISABLE KEYS */;
INSERT INTO `productparts` VALUES (1,'123',0,'BB','{}','','{}','{}','3','','','2018-08-15 16:32:51','2018-08-15 16:32:51'),(2,'123',0,'BB','{}','','{}','{}','3','','','2018-08-15 16:52:02','2018-08-15 16:52:02'),(3,'123',0,'BB','{}','','{}','{}','3','','','2018-08-15 16:52:02','2018-08-15 16:52:02'),(4,'123',0,'BB','{}','','{}','{}','3','','','2018-08-15 16:53:31','2018-08-15 16:53:31'),(5,'123',0,'BB','{}','','{}','{}','3','','','2018-08-15 16:53:31','2018-08-15 16:53:31');
/*!40000 ALTER TABLE `productparts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 19:15:37
