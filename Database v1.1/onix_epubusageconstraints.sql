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
-- Table structure for table `epubusageconstraints`
--

DROP TABLE IF EXISTS `epubusageconstraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epubusageconstraints` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x318` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x319` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epubusagelimit` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epubusageconstraints`
--

LOCK TABLES `epubusageconstraints` WRITE;
/*!40000 ALTER TABLE `epubusageconstraints` DISABLE KEYS */;
INSERT INTO `epubusageconstraints` VALUES ('9780470018071','45','67','{\"x320\":\"ccccccc\",\"x321\":\"45\"}','2018-08-14 16:39:22','2018-08-14 16:39:22'),('123','11','22','{\"x320\":\"vvvvvvvv\",\"x321\":\"56\"}','2018-08-15 10:15:37','2018-08-15 10:15:37'),('9780470018224','05','01','{}','2018-08-15 10:21:56','2018-08-15 10:21:56'),('9780470018224','03','02','{\"x320\":\"10\",\"x321\":\"05\"}','2018-08-15 10:21:56','2018-08-15 10:21:56'),('9780470018224','06','02','{\"x320\":\"1\",\"x321\":\"10\"}','2018-08-15 10:21:56','2018-08-15 10:21:56');
/*!40000 ALTER TABLE `epubusageconstraints` ENABLE KEYS */;
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
