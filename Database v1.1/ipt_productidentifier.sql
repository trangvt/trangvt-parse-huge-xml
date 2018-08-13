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
-- Table structure for table `productidentifier`
--

DROP TABLE IF EXISTS `productidentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productidentifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b221` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - ProductIDType\nv2.1: productidentifier - ProductIDType',
  `b244` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - IDValue\nv2.1: productidentifier - IDValue',
  `b246` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v2.1: productidentifier - Barcode',
  `product_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productidentifier`
--

LOCK TABLES `productidentifier` WRITE;
/*!40000 ALTER TABLE `productidentifier` DISABLE KEYS */;
INSERT INTO `productidentifier` VALUES (1,'03','9780471049234','',1,'2018-08-10 15:46:57','2018-08-10 15:46:57'),(2,'15','9780471049234','',1,'2018-08-10 15:46:57','2018-08-10 15:46:57'),(3,'03','9780471374817','',2,'2018-08-10 15:46:57','2018-08-10 15:46:57'),(4,'15','9780471374817','',2,'2018-08-10 15:46:57','2018-08-10 15:46:57'),(5,'03','9780471815242','',3,'2018-08-10 15:46:57','2018-08-10 15:46:57'),(6,'15','9780471815242','',3,'2018-08-10 15:46:57','2018-08-10 15:46:57');
/*!40000 ALTER TABLE `productidentifier` ENABLE KEYS */;
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
