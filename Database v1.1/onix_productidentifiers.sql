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
-- Table structure for table `productidentifiers`
--

DROP TABLE IF EXISTS `productidentifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productidentifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b221` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - ProductIDType\nv2.1: productidentifier - ProductIDType',
  `b233` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b244` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - IDValue\nv2.1: productidentifier - IDValue',
  `b246` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v2.1: productidentifier - Barcode',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productidentifiers`
--

LOCK TABLES `productidentifiers` WRITE;
/*!40000 ALTER TABLE `productidentifiers` DISABLE KEYS */;
INSERT INTO `productidentifiers` VALUES (1,'22',NULL,'productidentifier - b244',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(2,'44','This is first b233 in product part','x',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(3,'89','This is second b233 in product part','t',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(4,'15',NULL,'9780470018071',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(5,'15',NULL,'9780470028667',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(6,'15',NULL,'9780470028650',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(7,'15',NULL,'9780470018095',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(8,'15',NULL,'9780470018101',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06'),(9,'15',NULL,'9780470018224',NULL,'2018-08-15 17:13:06','2018-08-15 17:13:06');
/*!40000 ALTER TABLE `productidentifiers` ENABLE KEYS */;
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
