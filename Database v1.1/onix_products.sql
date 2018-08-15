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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'RecordReference',
  `a002` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT 'NotificationType',
  `a199` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'v3.0: DeletionText\n',
  `a194` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'RecordSourceType',
  `a197` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: RecordSourceName',
  `b083` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - CountryOfPublication',
  `b394` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - PublishingStatus',
  `x512` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->copyrightstatement - CopyrightType',
  `b089` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->salesrights - SalesRightsType',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`a001`),
  UNIQUE KEY `a001_UNIQUE` (`a001`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('123','03','','','',NULL,NULL,NULL,NULL,'2018-08-15 09:39:43','2018-08-15 09:39:43'),('9780470018071','03','eng','','',NULL,NULL,NULL,NULL,'2018-08-15 09:39:43','2018-08-15 09:39:43'),('9780470018095','03','','','',NULL,NULL,NULL,NULL,'2018-08-15 09:39:43','2018-08-15 09:39:43'),('9780470018224','03','','','',NULL,NULL,NULL,NULL,'2018-08-15 09:39:43','2018-08-15 09:39:43');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
