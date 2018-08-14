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
-- Table structure for table `discountcodeds`
--

DROP TABLE IF EXISTS `discountcodeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountcodeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `j363` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCodeType\nv2.1: supplydetail>price>discountcoded DiscountCodeType',
  `j378` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCodeTypeName\nv2.1: supplydetail>price>discountcoded DiscountCodeTypeName',
  `j364` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCode\nv2.1: supplydetail>price>discountcoded DiscountCode',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountcodeds`
--

LOCK TABLES `discountcodeds` WRITE;
/*!40000 ALTER TABLE `discountcodeds` DISABLE KEYS */;
INSERT INTO `discountcodeds` VALUES (1,'02','','P','2018-08-14 18:58:59','2018-08-14 18:58:59'),(2,'02','','DP','2018-08-14 18:58:59','2018-08-14 18:58:59');
/*!40000 ALTER TABLE `discountcodeds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-14 19:04:00
