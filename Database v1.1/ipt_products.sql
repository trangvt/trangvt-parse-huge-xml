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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'RecordReference',
  `a002` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT 'root - NotificationType',
  `a194` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'root - RecordSourceType',
  `x314` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail - ProductComposition',
  `b012` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail - ProductForm\nv2.1: root - ProductForm',
  `b057` varchar(4) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail - CollectionType',
  `b058` longtext CHARACTER SET utf8 COMMENT 'v3.0: descriptivedetail - EditionStatement\nJSON - XHTML is enabled',
  `b083` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - CountryOfPublication',
  `b394` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - PublishingStatus',
  `x512` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->copyrightstatement - CopyrightType',
  `b089` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->salesrights - SalesRightsType',
  `x450` longtext CHARACTER SET utf8 COMMENT 'v3.0: publishingdetail->salesrights->territory - RegionsIncluded',
  `b061` int(6) DEFAULT NULL COMMENT 'v2.0: NumberOfPages\n',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `a001_UNIQUE` (`a001`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'9780471049234','03','01','00','00','1','Volume 4','01',NULL,NULL,NULL,'WORLD',0,NULL,NULL),(2,'9780471374817','03','01','00','00','1','Volume 38','01',NULL,NULL,NULL,'WORLD',0,NULL,NULL),(3,'9780471815242','03','01','00','00','1','Volume 14','01',NULL,NULL,NULL,'WORLD',0,NULL,NULL);
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

-- Dump completed on 2018-08-10 19:21:39
